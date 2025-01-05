/* -*- P4_16 -*- */

/*************************************************************************
 **************  I N G R E S S   P R O C E S S I N G   *******************
 *************************************************************************/

    /***********************  H E A D E R S  ************************/

struct my_ingress_headers_t {
    ethernet_h              ethernet;

    // Control headers
    stream_control_t        stream_control;
    stream_round_t          stream_round;
    stream_nonce_t          stream_nonce;

    // QR 1 or 5 (simple line reorder)
    line_t      s0_qr15_line3;
    line_t      s0_qr15_line0;
    line_t      s0_qr15_line2;
    line_t      s0_qr15_line1;

    // QR 3 - reorder Lines to Columns
    vector_t    s0_qr3_v0;
    vector_t    s0_qr3_v5;
    vector_t    s0_qr3_v10;
    vector_t    s0_qr3_d;

    vector_t    s0_qr3_a;
    vector_t    s0_qr3_v4;
    vector_t    s0_qr3_v9;
    vector_t    s0_qr3_v14;

    vector_t    s0_qr3_v1;
    vector_t    s0_qr3_v6;
    vector_t    s0_qr3_c;
    vector_t    s0_qr3_v12;

    vector_t    s0_qr3_e;
    vector_t    s0_qr3_b;
    vector_t    s0_qr3_v8;
    vector_t    s0_qr3_v13;
    

    // QR 7 - reorder Columns to Lines
    vector_t    s0_qr7_v0;
    vector_t    s0_qr7_b;
    vector_t    s0_qr7_v8;
    vector_t    s0_qr7_v12;

    vector_t    s0_qr7_a;
    vector_t    s0_qr7_v7;
    vector_t    s0_qr7_v11;
    vector_t    s0_qr7_v15;

    vector_t    s0_qr7_v1;
    vector_t    s0_qr7_v5;
    vector_t    s0_qr7_c;
    vector_t    s0_qr7_v13;

    vector_t    s0_qr7_e;
    vector_t    s0_qr7_v6;
    vector_t    s0_qr7_v10;
    vector_t    s0_qr7_d;

    // Init/Fin and Payloads.
    line_t      s0_finit_line0;
    line_t      s0_finit_line1;
    line_t      s0_finit_line2;
    line_t      s0_finit_line3;

    stream_payload_t        stream_payload_b1;
    stream_payload_t        stream_payload_b0;
}

    /******  G L O B A L   I N G R E S S   M E T A D A T A  *********/

struct my_ingress_metadata_t {
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
    #include "includes/act_utils.p4"
    #include "includes/act_stream_ig_finit.p4"
    #include "includes/act_stream_ig_qr3.p4"
    #include "includes/act_stream_ig_qr7.p4"
    #include "includes/act_stream_ig_qr15.p4"
    #include "includes/tbl_stream_ig.p4"
    #include "includes/tbl_stream_finit.p4"

    apply {
        if (!hdr.stream_round.isValid() || hdr.stream_round.round[7:7] == 1) {
            tbl_stream_ig0_finit.apply();
            tbl_stream_ig1_finit.apply();
            tbl_stream_ig2_finit.apply();
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

