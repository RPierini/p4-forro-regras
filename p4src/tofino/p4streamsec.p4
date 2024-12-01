/* -*- P4_16 -*- */

#include <core.p4>
#include <tna.p4>

const PortId_t CPU_PORT = 64;

typedef bit<32>  hashword_t;
//consts Forro
const hashword_t FORRO_C0 = 0x746c6f76;
const hashword_t FORRO_C1 = 0x61616461;
const hashword_t FORRO_C2 = 0x72626173;
const hashword_t FORRO_C3 = 0x61636e61;

//consts ChaCha
const hashword_t CHACHA_C0 = 0x61707865;
const hashword_t CHACHA_C1 = 0x3320646e;
const hashword_t CHACHA_C2 = 0x79622d32;
const hashword_t CHACHA_C3 = 0x6b206574;


/*************************************************************************
 ************* A S S E M B L I N G   T H E   P R O G R A M ***************
 *************************************************************************/
#include "../common/types.p4"
#include "../common/headers.p4"
#include "../common/ingress.p4"
#include "../common/egress.p4"
#include "../common/package.p4"
