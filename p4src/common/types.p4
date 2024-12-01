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
    FORRO_CALC = 0xABCC,
    FORRO_FINIT = 0xABCD,
    CHACHA_CALC = 0xABCE,
    CHACHA_FINIT = 0xABCF
}