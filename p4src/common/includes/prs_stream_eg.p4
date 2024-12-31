state parse_stream_nonce_round_state {
    pkt.extract(hdr.stream_nonce);
    pkt.extract(hdr.stream_round);
    pkt.extract(hdr.s0_line0);
    pkt.extract(hdr.s0_line1);
    transition accept;
}