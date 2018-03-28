from serial import *


port_name = 'COM35'
port_baudrate = 1000000


def decode_message(line):
    ls = line[1:].strip()
    s = ls.split(b'.')
    tstm = int(s[0], 16)
    typ = 'A' if len(s[1])==3 else 'B'
    id = int(s[1], 16)
    dlen = len(s[2])//2
    data = []
    for i in range(dlen):
        data.append(int(s[2][i*2:i*2+2], 16))
    return tstm, typ, id, dlen, data


def message_content_note(mtype, id, data):
    if mtype == 'B':
        return "CAN Bootloader"
    if id==0x80:
        return "Synchronization"
    return ''

with Serial(port_name, port_baudrate, timeout=0.1) as port:
    while True:
        #try:
        if True:
            message = decode_message(port.readline())
            note = message_content_note(message[1], message[2], message[4])
            print(message, note)
        #except:
        #    pass