state parse_stream_round_nonce {
    pkt.extract(hdr.stream_round);
    pkt.extract(hdr.stream_nonce);
    // meta.fin = hdr.stream_round.round[7:7];
    // meta.relative_qr = (bit<3>)hdr.stream_round.round;
    // transition select(meta.fin, meta.relative_qr) {
    transition select(hdr.stream_round.round[7:7], hdr.stream_round.round[2:0]) {
        (0, 1): parse_qr15;
        (0, 3): parse_qr3;
        (0, 5): parse_qr15;
        (0, 7): parse_qr7;
        (1, 7): parse_stream_first_cipher; // finalization
        default: accept;
    }
}

state parse_stream_nonce {
    pkt.extract(hdr.stream_nonce);
    transition accept;
}

state parse_qr15 {
    pkt.extract(hdr.s0_qr15_line0);
    pkt.extract(hdr.s1_qr15_line0);
    pkt.extract(hdr.s0_qr15_line1);
    pkt.extract(hdr.s1_qr15_line1);
    pkt.extract(hdr.s0_qr15_line2);
    pkt.extract(hdr.s1_qr15_line2);
    pkt.extract(hdr.s0_qr15_line3);
    pkt.extract(hdr.s1_qr15_line3);
    transition accept;
}

state parse_qr3 {
    pkt.extract(hdr.s0_qr3_a); //v3
    pkt.extract(hdr.s0_qr3_b); //v7
    pkt.extract(hdr.s0_qr3_c); //v11
    pkt.extract(hdr.s0_qr3_d); //v15
    pkt.extract(hdr.s1_qr3_a); //v3
    pkt.extract(hdr.s1_qr3_b); //v7
    pkt.extract(hdr.s1_qr3_c); //v11
    pkt.extract(hdr.s1_qr3_d); //v15

    pkt.extract(hdr.s0_qr3_e); //v2
    pkt.extract(hdr.s0_qr3_v6);
    pkt.extract(hdr.s0_qr3_v10);
    pkt.extract(hdr.s0_qr3_v14);
    pkt.extract(hdr.s1_qr3_e); //v2
    pkt.extract(hdr.s1_qr3_v6);
    pkt.extract(hdr.s1_qr3_v10);
    pkt.extract(hdr.s1_qr3_v14);
    
    pkt.extract(hdr.s0_qr3_v1);
    pkt.extract(hdr.s0_qr3_v5);
    pkt.extract(hdr.s0_qr3_v9);
    pkt.extract(hdr.s0_qr3_v13);
    pkt.extract(hdr.s1_qr3_v1);
    pkt.extract(hdr.s1_qr3_v5);
    pkt.extract(hdr.s1_qr3_v9);
    pkt.extract(hdr.s1_qr3_v13);

    pkt.extract(hdr.s0_qr3_v0);
    pkt.extract(hdr.s0_qr3_v4);
    pkt.extract(hdr.s0_qr3_v8);
    pkt.extract(hdr.s0_qr3_v12);
    pkt.extract(hdr.s1_qr3_v0);
    pkt.extract(hdr.s1_qr3_v4);
    pkt.extract(hdr.s1_qr3_v8);
    pkt.extract(hdr.s1_qr3_v12);

    transition accept;
}

state parse_qr7 {
    pkt.extract(hdr.s0_qr7_a); //v3
    pkt.extract(hdr.s0_qr7_b); //v4
    pkt.extract(hdr.s0_qr7_c); //v9
    pkt.extract(hdr.s0_qr7_d); //v14
    pkt.extract(hdr.s1_qr7_a); //v3
    pkt.extract(hdr.s1_qr7_b); //v4
    pkt.extract(hdr.s1_qr7_c); //v9
    pkt.extract(hdr.s1_qr7_d); //v14

    pkt.extract(hdr.s0_qr7_e); //v2
    pkt.extract(hdr.s0_qr7_v7);
    pkt.extract(hdr.s0_qr7_v8);
    pkt.extract(hdr.s0_qr7_v13);
    pkt.extract(hdr.s1_qr7_e); //v2
    pkt.extract(hdr.s1_qr7_v7);
    pkt.extract(hdr.s1_qr7_v8);
    pkt.extract(hdr.s1_qr7_v13);

    pkt.extract(hdr.s0_qr7_v1);
    pkt.extract(hdr.s0_qr7_v6);
    pkt.extract(hdr.s0_qr7_v11);
    pkt.extract(hdr.s0_qr7_v12);
    pkt.extract(hdr.s1_qr7_v1);
    pkt.extract(hdr.s1_qr7_v6);
    pkt.extract(hdr.s1_qr7_v11);
    pkt.extract(hdr.s1_qr7_v12);

    pkt.extract(hdr.s0_qr7_v0);
    pkt.extract(hdr.s0_qr7_v5);
    pkt.extract(hdr.s0_qr7_v10);
    pkt.extract(hdr.s0_qr7_v15);
    pkt.extract(hdr.s1_qr7_v0);
    pkt.extract(hdr.s1_qr7_v5);
    pkt.extract(hdr.s1_qr7_v10);
    pkt.extract(hdr.s1_qr7_v15);

    transition accept;
}

state parse_stream_first_cipher {
    pkt.extract(hdr.s0_finit_line0);
    pkt.extract(hdr.s1_finit_line0);
    pkt.extract(hdr.s0_finit_line1);
    pkt.extract(hdr.s1_finit_line1);
    pkt.extract(hdr.s0_finit_line2);
    pkt.extract(hdr.s1_finit_line2);
    pkt.extract(hdr.s0_finit_line3);
    pkt.extract(hdr.s1_finit_line3);
    pkt.extract(hdr.stream_payload_b0);
    pkt.extract(hdr.stream_payload_b1);
    transition accept;
}

state parse_stream_second_cipher {
    pkt.extract(hdr.stream_round);
    pkt.extract(hdr.stream_nonce);
    pkt.extract(hdr.s1_finit_line0);
    pkt.extract(hdr.s1_finit_line1);
    pkt.extract(hdr.s1_finit_line2);
    pkt.extract(hdr.s1_finit_line3);
    pkt.extract(hdr.stream_payload_b0);
    pkt.extract(hdr.stream_payload_b1);
    transition accept;
}
