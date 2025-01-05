/* -*- P4_16 -*- */

/*************************************************************************
 ************* C O N S T A N T S    A N D   T Y P E S  *******************
**************************************************************************/
typedef bit<48> mac_addr_t;

enum bit<16> ether_type_t {
    IPV4 = 0x0800,
    ARP  = 0x0806,
    TPID = 0x8100,
    IPV6 = 0x86DD,
    MPLS = 0x8847,
    STREAM_CALC = 0xABCC,
    STREAM_INIT = 0xABCD,
}

enum bit<2> cipher_type_t {
    UNDEFINED = 0x0,
    CHACHA = 0x1,
    FORRO = 0x2,
    XOTE = 0x3,
}