state parse_stream_nonce {
    pkt.extract(hdr.stream_nonce);
    transition select(hdr.ethernet.ether_type) {
        ether_type_t.FORRO_CALC:    parse_stream_round;
        ether_type_t.CHACHA_CALC:   parse_stream_round;
        default: accept;
    }
}

state parse_stream_round {
    pkt.extract(hdr.stream_round);
    meta.fin = hdr.stream_round.round[7:7];
    transition select(meta.fin) {
        1: parse_stream_cipher_payload;
        default: parse_stream_state;
    }
}

state parse_stream_state {
    pkt.extract(hdr.stream_state);
    transition accept;
}

state parse_stream_cipher_payload {
    pkt.extract(hdr.stream_cipher);
    pkt.extract(hdr.stream_payload);
    transition accept;
}