parser IngressParser(packet_in        pkt,
    /* User */
    out my_ingress_headers_t          hdr,
    out my_ingress_metadata_t         meta,
    /* Intrinsic */
    out ingress_intrinsic_metadata_t  ig_intr_md)
{
    #include "includes/prs_stream_ig.p4"

    /* This is a mandatory state, required by Tofino Architecture */
    state start {
        pkt.extract(ig_intr_md);
        pkt.advance(PORT_METADATA_SIZE);
        transition parse_init_metadata;
    }

    state parse_init_metadata {
        meta.key0 = 0x0;
        meta.key1 = 0x0;
        meta.key2 = 0x0;
        meta.key3 = 0x0;
        meta.key4 = 0x0;
        meta.key5 = 0x0;
        meta.key6 = 0x0;
        meta.key7 = 0x0;
        meta.fin = 0x0;
        transition parse_ethernet;
    }

    state parse_ethernet {
        pkt.extract(hdr.ethernet);
        transition select(hdr.ethernet.ether_type) {
            ether_type_t.FORRO_FINIT:   parse_stream_nonce;
            ether_type_t.CHACHA_FINIT:  parse_stream_nonce;
            ether_type_t.FORRO_CALC:    parse_stream_nonce;
            ether_type_t.CHACHA_CALC:   parse_stream_nonce;
            default: accept;
        }
    }
}