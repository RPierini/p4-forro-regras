#!/usr/bin/python3

import sys
print(sys.version)

rounds = 8
nonces = [0x0] * 2
keys = [0x0] * 8

CHACHA_CONST = [0x61707865, 0x3320646e, 0x79622d32, 0x6b206574]

def ROL(x, w):
    x &= 0xffffffff
    return ((x << w) | (x >> (32 - w))) & 0xffffffff
    
def QR(state, a, b, c, d):
    state[a] += state[b]
    state[a] &= 0xffffffff
    # print(f"state 1A: ", hex(state[a]))
    state[d] ^= state[a]
    # print(f"state 1D: ", hex(state[d]))
    state[d] = ROL(state[d], 16)
    # print(f"state 1D-L: ", hex(state[d]))
    
    state[c] += state[d]
    state[c] &= 0xffffffff
    # print(f"state 1C: ", hex(state[c]))
    state[b] ^= state[c]
    # print(f"state 1B: ", hex(state[b]))
    state[b] = ROL(state[b], 12)
    # print(f"state 1B-L: ", hex(state[b]))
    
    state[a] += state[b]
    state[a] &= 0xffffffff
    # print(f"state 2A: ", hex(state[a]))
    state[d] ^= state[a]
    # print(f"state 2D: ", hex(state[d]))
    state[d] = ROL(state[d], 8)
    # print(f"state 2D-L: ", hex(state[d]))
    
    state[c] += state[d]
    state[c] &= 0xffffffff
    # print(f"state 2C: ", hex(state[c]))
    state[b] ^= state[c]
    # print(f"state 2B: ", hex(state[b]))
    state[b] = ROL(state[b], 7)
    # print(f"state 2B-L: ", hex(state[b]))
    
def chacha20_pad(keys, nonces, position, rounds=20):
    state = [0 for i in range(16)]
    state[:4] = CHACHA_CONST
    state[4:12] = keys
    state[12] = position
    state[13] = 0
    state[14:] = nonces
    
    istate = list(state)
    for i in range(1, rounds + 1):
        if i % 2 == 1:
            for num in state:
                print(hex(num))
            QR(state, 0, 4, 8, 12)
            QR(state, 1, 5, 9, 13)
            QR(state, 2, 6, 10, 14)
            QR(state, 3, 7, 11, 15)
            print("---", i, " inicial:")
        else:
            for num in state:
                print(hex(num))
            QR(state, 0, 5, 10, 15)
            QR(state, 1, 6, 11, 12)
            QR(state, 2, 7, 8, 13)
            QR(state, 3, 4, 9, 14)         
            print("---", i, " inicial:")

    print("---pre-fin---")
    for num in state:
        print(hex(num))
   
    for i in range(len(state)):
        state[i] += istate[i]
        state[i] &= 0xffffffff

    print("---pos-fin---")
    for num in state:
        print(hex(num))
    exit()   
    return state

chacha20_pad(keys, nonces, 0, rounds)
