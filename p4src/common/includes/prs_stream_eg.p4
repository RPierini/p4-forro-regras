state parse_stream_nonce_round_state {
    pkt.extract(hdr.stream_nonce);
    pkt.extract(hdr.stream_round);
    pkt.extract(hdr.qr_a);
    pkt.extract(hdr.qr_b);
    pkt.extract(hdr.qr_c);
    pkt.extract(hdr.qr_d);
    pkt.extract(hdr.temp1); //temporary 256bits hold for rotating
    pkt.extract(hdr.qr_e);
    pkt.extract(hdr.temp2); //temporary 96bits hold for rotating
    transition accept;
}