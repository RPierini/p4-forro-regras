state parse_stream_round_nonce_state {
    pkt.extract(hdr.stream_control);
    pkt.extract(hdr.stream_round);
    pkt.extract(hdr.stream_nonce);
    pkt.extract(hdr.s0_line0);
    pkt.extract(hdr.s0_line1);
    pkt.extract(hdr.s0_line2);
    transition accept;
}