state parse_stream_nonce {
    pkt.extract(hdr.stream_nonce);
    transition select(hdr.ethernet.ether_type) {
        ether_type_t.STREAM_CALC:   parse_stream_round;
        default: accept;
    }
}

state parse_stream_round {
    pkt.extract(hdr.stream_round);
    meta.fin = hdr.stream_round.round[7:7];
    meta.relative_qr = (bit<3>)hdr.stream_round.round;
    meta.recirculation = (bit<1>)hdr.stream_round.round[6:6]; //For recirculation
    transition select(meta.fin, meta.relative_qr) {
        (0, 1): parse_qr15;
        (0, 3): parse_qr3;
        (0, 5): parse_qr15;
        (0, 7): parse_qr7;
        (1, 7): parse_stream_cipher; // finalization
        default: accept;
    }
}

state parse_qr15 {
    //Extracting state 1
    pkt.extract(hdr.s0_qr15_line0);
    pkt.extract(hdr.s0_qr15_line1);
    pkt.extract(hdr.s0_qr15_line2);
    pkt.extract(hdr.s0_qr15_line3);
    transition accept;
}

state parse_qr3 {
    pkt.extract(hdr.s0_qr3_a); //v3
    pkt.extract(hdr.s0_qr3_b); //v7
    pkt.extract(hdr.s0_qr3_c); //v11
    pkt.extract(hdr.s0_qr3_d); //v15
    pkt.extract(hdr.s0_qr3_e); //t2
    pkt.extract(hdr.s0_qr3_v2);
    pkt.extract(hdr.s0_qr3_v6);
    pkt.extract(hdr.s0_qr3_v10);
    pkt.extract(hdr.s0_qr3_v14);
    pkt.extract(hdr.s0_qr3_t1);
    pkt.extract(hdr.s0_qr3_v0);
    pkt.extract(hdr.s0_qr3_v4);
    pkt.extract(hdr.s0_qr3_v8);
    pkt.extract(hdr.s0_qr3_v12);
    pkt.extract(hdr.s0_qr3_t3);
    pkt.extract(hdr.s0_qr3_v1);
    pkt.extract(hdr.s0_qr3_v5);
    pkt.extract(hdr.s0_qr3_v9);
    pkt.extract(hdr.s0_qr3_v13);
    pkt.extract(hdr.s0_qr3_t0);

    transition accept;
}

state parse_qr7 {
    pkt.extract(hdr.s0_qr7_a); //v3
    pkt.extract(hdr.s0_qr7_b); //v4
    pkt.extract(hdr.s0_qr7_c); //v9
    pkt.extract(hdr.s0_qr7_d); //v14
    pkt.extract(hdr.s0_qr7_e); //t2
    pkt.extract(hdr.s0_qr7_v2);
    pkt.extract(hdr.s0_qr7_v7);
    pkt.extract(hdr.s0_qr7_v8);
    pkt.extract(hdr.s0_qr7_v13);
    pkt.extract(hdr.s0_qr7_t1);
    pkt.extract(hdr.s0_qr7_v0);
    pkt.extract(hdr.s0_qr7_v5);
    pkt.extract(hdr.s0_qr7_v10);
    pkt.extract(hdr.s0_qr7_v15);
    pkt.extract(hdr.s0_qr7_t3);
    pkt.extract(hdr.s0_qr7_v1);
    pkt.extract(hdr.s0_qr7_v6);
    pkt.extract(hdr.s0_qr7_v11);
    pkt.extract(hdr.s0_qr7_v12);
    pkt.extract(hdr.s0_qr7_t0);

    transition accept;
}

state parse_stream_cipher {
    pkt.extract(hdr.stream_cipher_s0);
    // pkt.extract(hdr.stream_cipher_s1);
    transition parse_stream_payload;
}

state parse_stream_payload {
    pkt.extract(hdr.stream_payload_b0);
    // pkt.extract(hdr.stream_payload_b1);
    transition accept;
}
