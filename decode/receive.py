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

try:
    from secret_decoder import message_content_note
except ImportError:
    def message_content_note(mtype, id, data):
        if mtype == 'B':
            return "CAN message type B"
        else:
            return "CAN message type A"

with Serial(port_name, port_baudrate, timeout=0.1) as port:
    while True:
        #try:
        if True:
            message = decode_message(port.readline())
            note = message_content_note(message[1], message[2], message[4])
            print('{:5d} {} {} '.format(message[0], message[1],
                                        ("     {:03X}" if message[1] == 'A' else "{:08X}").format(message[2])), end='')
            dlen = len(message[4])
            for i in range(8):
                print(' {:02X}'.format(message[4][i]) if i<dlen else '   ', end='')
            print('  {}'.format(note))
        #except:
        #    pass