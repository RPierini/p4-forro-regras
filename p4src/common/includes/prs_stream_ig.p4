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
    transition select(meta.fin, meta.relative_qr) {
        (0, 0): parse_qr_odd_to_even;
        (0, 2): parse_qr;
        (0, 4): parse_qr_even_to_odd;
        (0, 6): parse_qr;
        (1, 7): parse_stream_cipher_payload; // finalization
        default: accept;
    }
}

state parse_qr_odd_to_even {
    pkt.extract(hdr.qr0_a);
    pkt.extract(hdr.qr0_x0);
    pkt.extract(hdr.qr0_x1);
    pkt.extract(hdr.qr0_x2);
    pkt.extract(hdr.qr0_x3);
    pkt.extract(hdr.qr0_x4);
    pkt.extract(hdr.qr0_x5);
    pkt.extract(hdr.qr0_d);
    pkt.extract(hdr.qr0_x6);
    pkt.extract(hdr.qr0_x7);
    pkt.extract(hdr.qr0_c);
    pkt.extract(hdr.qr0_x8);
    pkt.extract(hdr.qr0_e);
    pkt.extract(hdr.qr0_b);
    pkt.extract(hdr.qr0_x9);
    pkt.extract(hdr.qr0_x10);
    transition accept;
}

state parse_qr {
    pkt.extract(hdr.qr26_a);
    pkt.extract(hdr.qr26_b);
    pkt.extract(hdr.qr26_c);
    pkt.extract(hdr.qr26_d);
    pkt.extract(hdr.temp1); //temporary 256bits hold for rotating
    pkt.extract(hdr.qr26_e);
    pkt.extract(hdr.temp2); //temporary 96bits hold for rotating
    transition accept;
}

state parse_qr_even_to_odd {
    pkt.extract(hdr.qr4_a);
    pkt.extract(hdr.qr4_x0);
    pkt.extract(hdr.qr4_x1);
    pkt.extract(hdr.qr4_x2);
    pkt.extract(hdr.qr4_x3);
    pkt.extract(hdr.qr4_b);
    pkt.extract(hdr.qr4_x4);
    pkt.extract(hdr.qr4_x5);
    pkt.extract(hdr.qr4_x6);
    pkt.extract(hdr.qr4_x7);
    pkt.extract(hdr.qr4_c);
    pkt.extract(hdr.qr4_x8);
    pkt.extract(hdr.qr4_e);
    pkt.extract(hdr.qr4_x9);
    pkt.extract(hdr.qr4_x10);
    pkt.extract(hdr.qr4_d);
    transition accept;
}

state parse_stream_cipher_payload {
    pkt.extract(hdr.stream_cipher);
    pkt.extract(hdr.stream_payload);
    transition accept;
}