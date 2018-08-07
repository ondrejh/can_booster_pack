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
    from secret_decoder import message_content_note, message_filter

except ImportError:

    def message_content_note(mtype, id, data):
        # ----- fill your content resolving here ----
        if mtype == 'B':
            return "CAN message type B"
        else:
            return "CAN message type A"
        return ''

    def message_filter(mtype, id, data):
        return True


with Serial(port_name, port_baudrate, timeout=0.1) as port:
    while True:
        try:
        #if True:
            (tStamp, mType, mId, mLen, mData) = decode_message(port.readline())
            if message_filter(mType, mId, mData):
                note = message_content_note(mType, mId, mData)
                print('{:5d} {} {} '.format(tStamp, mType,
                                            ("     {:03X}" if mType == 'A' else "{:08X}").format(mId)), end='')
                dlen = len(mData)
                for i in range(8):
                    print(' {:02X}'.format(mData[i]) if i < dlen else '   ', end='')
                print('  {}'.format(note))
        except:
            pass