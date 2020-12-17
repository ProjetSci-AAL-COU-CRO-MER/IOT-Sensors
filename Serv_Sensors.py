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


HOST           = "0.0.0.0"
UDP_PORT       = 10001
FILENAME        = "values.txt"
LAST_VALUE      = ""

class ThreadedUDPRequestHandler(socketserver.BaseRequestHandler):

    def handle(self):
        data = self.request[0].strip()
        #data = data.decode("utf-8")
        socket = self.request[1]
        current_thread = threading.current_thread()
        print("{}: client: {}, wrote: {}".format(current_thread.name, self.client_address, data.decode("utf-8")))
        if data != "":
                sendUARTMessage(data) # Send message through UART



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
    ser.write(msg)
    print("Message <" + msg.decode("utf-8") + "> sent to micro-controller." )


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
                byte_message = bytes("Hello, World!", "utf-8")
                opened_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
                while ser.isOpen() : 
                        time.sleep(1)
                        opened_socket.sendto(byte_message, ("127.0.0.1", 10001))
                        print ("Message envoyé")
        except (KeyboardInterrupt, SystemExit):
                server.shutdown()
                server.server_close()
                ser.close()
                exit()
