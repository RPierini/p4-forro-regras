#!/usr/bin/env python3
import os
import sys

from scapy.all import (
    UDP,
    get_if_list,
    sniff,
    hexdump,
    bind_layers,
    Ether,
    IP
)

from forro_class import ForroState, ForroPayload

#Inverte o Endianess
def swap32(valor):
    chunks_invertidos = []
    for i in range(0, len(valor), 4):
        chunk = valor[i:i+4]
        chunk_invertido = chunk[::-1]
        chunks_invertidos.append(chunk_invertido)

    return b''.join(chunks_invertidos)

def get_if():
    ifs=get_if_list()
    iface=None
    for i in get_if_list():
        if "eth0" in i:
            iface=i
            break;
    if not iface:
        print("Cannot find eth0 interface")
        exit(1)
    return iface

def handle_pkt(pkt):
    #if (UDP in pkt and pkt[UDP].dport == 100) or (Ether in pkt and pkt[Ether].type == 0xABCD):
        print("got a packet")
        pkt.show()
        hexdump(pkt)
        print(swap32(pkt[ForroPayload].d0))
        sys.stdout.flush()


def main():
    # bind_layers(Ether, ForroState, type=0xabcd)
    bind_layers(Ether, ForroPayload, type=0xabcd)
    # bind_layers(ForroState, ForroQR)
    # bind_layers(ForroQR, IP)
    # bind_layers(ForroState, ForroPayload)
    ifaces = [i for i in os.listdir('/sys/class/net/') if 'eth' in i]
    iface = ifaces[0]
    print("sniffing on %s" % iface)
    sys.stdout.flush()
    sniff(iface = iface,
          prn = lambda x: handle_pkt(x))

if __name__ == '__main__':
    main()
