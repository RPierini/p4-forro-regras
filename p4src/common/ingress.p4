/* -*- P4_16 -*- */

/*************************************************************************
 **************  I N G R E S S   P R O C E S S I N G   *******************
 *************************************************************************/

    /***********************  H E A D E R S  ************************/

struct my_ingress_headers_t {
    ethernet_h              ethernet;
    stream_nonce_t          stream_nonce;
    stream_round_t          stream_round;
    stream_state_t          stream_state;
    stream_cipher_t         stream_cipher;
    stream_payload_t        stream_payload;
}

    /******  G L O B A L   I N G R E S S   M E T A D A T A  *********/

struct my_ingress_metadata_t {
    hashword_t  key0;
    hashword_t  key1;
    hashword_t  key2;
    hashword_t  key3;
    hashword_t  key4;
    hashword_t  key5;
    hashword_t  key6;
    hashword_t  key7;
    bit<1>      fin;
}

    /***********************  P A R S E R  **************************/
    #include "ig_parser.p4"

    /***************** M A T C H - A C T I O N  *********************/

control Ingress(
    /* User */
    inout my_ingress_headers_t                       hdr,
    inout my_ingress_metadata_t                      meta,
    /* Intrinsic */
    in    ingress_intrinsic_metadata_t               ig_intr_md,
    in    ingress_intrinsic_metadata_from_parser_t   ig_prsr_md,
    inout ingress_intrinsic_metadata_for_deparser_t  ig_dprsr_md,
    inout ingress_intrinsic_metadata_for_tm_t        ig_tm_md)
{

    Hash<bit<32>>(HashAlgorithm_t.IDENTITY) copy32_0;
    Hash<bit<32>>(HashAlgorithm_t.IDENTITY) copy32_1;
    #include "includes/act_utils.p4"
    #include "includes/act_stream_ig_finit.p4"
    #include "includes/act_stream_ig_qr0.p4"
    #include "includes/act_stream_ig_qr2.p4"
    #include "includes/act_stream_ig_qr4.p4"
    #include "includes/act_stream_ig_qr6.p4"
    #include "includes/tbl_stream_ig.p4"

    apply {
        if (!hdr.stream_round.isValid() || meta.fin == 1) {
            tbl_stream_ig0_finit.apply();
            tbl_stream_ig1_finit.apply();
            tbl_stream_ig2_finit.apply();
            tbl_stream_ig3_finit.apply();
            tbl_stream_ig4_finit.apply();
        } else {
            tbl_stream_ig0.apply();
            tbl_stream_ig1.apply();
            tbl_stream_ig2.apply();
            tbl_stream_ig3.apply();
            tbl_stream_ig4.apply();
            tbl_stream_ig5.apply();
            tbl_stream_ig6.apply();
            tbl_stream_ig7.apply();
            tbl_stream_ig8.apply();
            tbl_stream_ig9.apply();
            tbl_stream_ig10.apply();
            tbl_stream_ig11.apply();
        }
    }
}


    /*********************  D E P A R S E R  ************************/

control IngressDeparser(packet_out pkt,
    /* User */
    inout my_ingress_headers_t                       hdr,
    in    my_ingress_metadata_t                      meta,
    /* Intrinsic */
    in    ingress_intrinsic_metadata_for_deparser_t  ig_dprsr_md)
{
    apply {
        pkt.emit(hdr);
    }
}

