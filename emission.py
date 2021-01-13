import time
import argparse
import signal
import sys
import socket
import socketserver
import threading
import serial
import pymongo
import json
import multiprocessing as mp

# *****ENV VAR*****
key_code = 55
split_value = "/"
checksum_length = 2
# id pour envoi unicast
idMicrobit = "56"
# check is received right
waiting = "waiting"
notReceived = "notReceived"
wellReceived = "check"
finished = "end"
start = "start"
# value:"wellReceived","notReceived","finished","waiting"
HOST           = "0.0.0.0"
UDP_PORT       = 10001
FILENAME        = "values.txt"
LAST_VALUE      = ""
sem = mp.Lock()
# ****************


class ThreadedUDPRequestHandler(socketserver.BaseRequestHandler):

    def handle(self):
        data = self.request[0].strip()
        socket = self.request[1]
        current_thread = threading.current_thread()
        print("{}: client: {}, wrote: {}".format(current_thread.name, self.client_address, data.decode("utf-8")))
        if data != "":
                sendProtocole(data.decode("utf-8")) # Send message through UART
                print("DONE")
                sem.release()




class ThreadedUDPServer(socketserver.ThreadingMixIn, socketserver.UDPServer):
    pass


# send serial message 
SERIALPORT = "/dev/ttyACM0"
BAUDRATE = 115200
ser = serial.Serial()

def initUART():        
        ser.port=SERIALPORT
        ser.baudrate=BAUDRATE
        ser.bytesize = serial.EIGHTBITS #number of bits per bytes
        ser.parity = serial.PARITY_NONE #set parity check: no parity
        ser.stopbits = serial.STOPBITS_ONE #number of stop bitsdecode("utf-8")
        ser.timeout = None          #block read
        # ser.timeout = 0             #non-block read
        # ser.timeout = 2              #timeout block read
        ser.xonxoff = False     #disable software flow control
        ser.rtscts = False     #disable hardware (RTS/CTS) flow control
        ser.dsrdtr = False       #disable hardware (DSR/DTR) flow control
        #ser.writeTimeout = 0     #timeout for write
        print ('Starting Up Serial Monitor')
        try:
                ser.open()
        except serial.SerialException:
                print("Serial {} port not available".format(SERIALPORT))
                exit()



def sendUARTMessage(msg): 
    msg = msg+";"
    ser.write(msg.encode())
    print("Message <" + msg + "> sent to micro-controller." )

def spliceString(string_to_splice: str, length: int):
    index = 0
    splice_array = []
    while True:
        tmp_string = ""
        tmp_index = index + length
        while index < tmp_index:
            tmp_string += string_to_splice[index]
            if len(string_to_splice) == index+1:
                splice_array.append(tmp_string)
                return splice_array
            index += 1
        splice_array.append(tmp_string)


def calcul_checksum(string_to_check: str):
    check_sum = 0
    modulo = 1
    for i in range(checksum_length):
        modulo = modulo * 10
    for index in range(len(string_to_check)):
        check_sum = check_sum + ord(string_to_check[index])
        check_sum = check_sum % modulo
    return check_sum


def readSerial():
        data_str =""
        while(True):
                tmp = ser.read(1)
                tmp = tmp.decode("utf-8")
                if tmp == '\n':
                        return data_str
                elif tmp == " " or tmp == '\r':
                        pass
                else:
                        data_str = data_str + tmp

                        


def sendProtocole(string_to_send: str):
    array_string = spliceString(
        string_to_send, 18 - len(idMicrobit) - 2 - checksum_length)
    print(array_string)
    array_string.insert(0, start)
    array_string.append(finished)
    index = 0
    array_send = []
    while True:
        time.sleep(2)
        tmp = idMicrobit + split_value + \
            array_string[index] + split_value + \
            str(calcul_checksum(array_string[index]))
        array_send.append(tmp)
        sendUARTMessage(tmp)
        response = readSerial()
        check_received_value = response
        #print("response:",check_received_value)
        print("'"+check_received_value+"'")
        index += 1
        if check_received_value == wellReceived:
            pass
        elif check_received_value == notReceived:
            pass
        elif check_received_value == finished:
            print("finished protocole")
            break


# Main program logic follows:
if __name__ == '__main__':
        initUART()
        print ('Press Ctrl-C to quit.')

        server = ThreadedUDPServer((HOST, UDP_PORT), ThreadedUDPRequestHandler)
        server_thread = threading.Thread(target=server.serve_forever)
        server_thread.daemon = True

        try:
                server_thread.start()
                print("Server started at {} port {}".format(HOST, UDP_PORT))
                byte_message = bytes("coucou moi c est loris et toi ?", "utf-8")
                opened_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
                while ser.isOpen() : 
                        sem.acquire()
                        opened_socket.sendto(byte_message, ("127.0.0.1", 10001))
                        time.sleep(1)
        except (KeyboardInterrupt, SystemExit):
                server.shutdown()
                server.server_close()
                ser.close()
                exit()
