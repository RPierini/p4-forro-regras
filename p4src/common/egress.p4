/* -*- P4_16 -*- */

/*************************************************************************
 ****************  E G R E S S   P R O C E S S I N G   *******************
 *************************************************************************/

    /***********************  H E A D E R S  ************************/

struct my_egress_headers_t {
    ethernet_h              ethernet;
    stream_nonce_t          stream_nonce;
    stream_round_t          stream_round;
    line_t                  s0_line1;
    line_t                  s1_line1;
    line_t                  s0_line0;
    line_t                  s1_line0;
}

    /********  G L O B A L   E G R E S S   M E T A D A T A  *********/

struct my_egress_metadata_t {
    hashword_t  s0_line0_a; //used to update two elements of the state matrix in the same stage (e11_qr)
    hashword_t  s1_line0_a; //used to update two elements of the state matrix in the same stage (e11_qr)
}

    /***********************  P A R S E R  **************************/

   #include "eg_parser.p4"

    /***************** M A T C H - A C T I O N  *********************/

control Egress(
    /* User */
    inout my_egress_headers_t                          hdr,
    inout my_egress_metadata_t                         meta,
    /* Intrinsic */
    in    egress_intrinsic_metadata_t                  eg_intr_md,
    in    egress_intrinsic_metadata_from_parser_t      eg_prsr_md,
    inout egress_intrinsic_metadata_for_deparser_t     eg_dprsr_md,
    inout egress_intrinsic_metadata_for_output_port_t  eg_oport_md)
{

    // Hash<bit<32>>(HashAlgorithm_t.IDENTITY) copy32_0;
    #include "includes/act_stream_eg_qr.p4"
    #include "includes/tbl_stream_eg.p4"

    apply {
        tbl_stream_eg0.apply();
        tbl_stream_eg1.apply();
        tbl_stream_eg2.apply();
        tbl_stream_eg3.apply();
        tbl_stream_eg4.apply();
        tbl_stream_eg5.apply();
        tbl_stream_eg6.apply();
        tbl_stream_eg7.apply();
        tbl_stream_eg8.apply();
        tbl_stream_eg9.apply();
        tbl_stream_eg10.apply();
        tbl_stream_eg11.apply();
    }
}

    /*********************  D E P A R S E R  ************************/

control EgressDeparser(packet_out pkt,
    /* User */
    inout my_egress_headers_t                       hdr,
    in    my_egress_metadata_t                      meta,
    /* Intrinsic */
    in    egress_intrinsic_metadata_for_deparser_t  eg_dprsr_md)
{
    apply {
        pkt.emit(hdr);
    }
}

