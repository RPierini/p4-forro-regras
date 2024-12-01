state parse_stream_round {
    pkt.extract(hdr.stream_round);
    pkt.extract(hdr.stream_state);
    transition accept;
}