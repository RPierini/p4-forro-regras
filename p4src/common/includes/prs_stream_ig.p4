state parse_stream_control {
    pkt.extract(hdr.stream_control);
    transition select(hdr.stream_control.control_flags[7:7]) {
        1:       parse_stream_round_nonce; //has round header
        default: parse_stream_nonce;
    }
}

state parse_stream_round_nonce {
    pkt.extract(hdr.stream_round);
    pkt.extract(hdr.stream_nonce);
    transition select(hdr.stream_round.round[7:7], hdr.stream_control.control_flags[6:6]) {
        (0, 0): parse_qr_chacha; // ChaCha
        (1, 0): parse_stream_cipher; // ChaCha
        default: accept;
    }
}

state parse_stream_nonce {
    pkt.extract(hdr.stream_nonce);
    transition accept;
}

state parse_qr_chacha {
    pkt.extract(hdr.qr_chacha_v1);
    pkt.extract(hdr.qr_chacha_v5);
    pkt.extract(hdr.qr_chacha_v9);
    pkt.extract(hdr.qr_chacha_v13);

    pkt.extract(hdr.qr_chacha_v0);
    pkt.extract(hdr.qr_chacha_v4);
    pkt.extract(hdr.qr_chacha_v8);
    pkt.extract(hdr.qr_chacha_v12);
    
    pkt.extract(hdr.qr_chacha_v3);
    pkt.extract(hdr.qr_chacha_v7);
    pkt.extract(hdr.qr_chacha_v11);
    pkt.extract(hdr.qr_chacha_v15);

    pkt.extract(hdr.qr_chacha_v2);
    pkt.extract(hdr.qr_chacha_v6);
    pkt.extract(hdr.qr_chacha_v10);
    pkt.extract(hdr.qr_chacha_v14);
    transition accept;
}

state parse_stream_cipher {
    pkt.extract(hdr.s0_finit_line0);
    pkt.extract(hdr.s0_finit_line1);
    pkt.extract(hdr.s0_finit_line2);
    pkt.extract(hdr.s0_finit_line3);
    pkt.extract(hdr.stream_payload_b0);
    pkt.extract(hdr.stream_payload_b1);
    transition accept;
}
