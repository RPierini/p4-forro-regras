state parse_stream_nonce_round_state {
    pkt.extract(hdr.stream_round);
    pkt.extract(hdr.stream_nonce);
    pkt.extract(hdr.s0_line0);
    pkt.extract(hdr.s1_line0);
    pkt.extract(hdr.s0_line1);
    pkt.extract(hdr.s1_line1);
    pkt.extract(hdr.s0_line2);
    pkt.extract(hdr.s1_line2);
    transition accept;
}

state parse_stream_cipher_payload {
    pkt.extract(hdr.stream_nonce);
    pkt.extract(hdr.s0_finit_line0);
    pkt.extract(hdr.s0_finit_line1);
    pkt.extract(hdr.s0_finit_line2);
    pkt.extract(hdr.s0_payload_line0);
    pkt.extract(hdr.s0_payload_line1);
    pkt.extract(hdr.s0_payload_line2);
    transition accept;
}
