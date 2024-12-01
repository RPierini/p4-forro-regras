table tbl_stream_eg0 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        e0_qr1;
        e0_qr3;
        e0_qr5;
        e0_qr7;
    }
    size = 128;
    default_action = e0_qr1;
}

table tbl_stream_eg1 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        e1_qr1;
        e1_qr3;
        e1_qr5;
        e1_qr7;
    }
    size = 128;
    default_action = e1_qr1;
}

table tbl_stream_eg2 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        e2_qr1;
        e2_qr3;
        e2_qr5;
        e2_qr7;
    }
    size = 128;
    default_action = e2_qr1;
}

table tbl_stream_eg3 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        e3_qr1;
        e3_qr3;
        e3_qr5;
        e3_qr7;
    }
    size = 128;
    default_action = e3_qr1;
}

table tbl_stream_eg4 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        e4_qr1;
        e4_qr3;
        e4_qr5;
        e4_qr7;
    }
    size = 128;
    default_action = e4_qr1;
}

table tbl_stream_eg5 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        e5_qr1;
        e5_qr3;
        e5_qr5;
        e5_qr7;
    }
    size = 128;
    default_action = e5_qr1;
}

table tbl_stream_eg6 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        e6_qr1;
        e6_qr3;
        e6_qr5;
        e6_qr7;
    }
    size = 128;
    default_action = e6_qr1;
}

table tbl_stream_eg7 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        e7_qr1;
        e7_qr3;
        e7_qr5;
        e7_qr7;
    }
    size = 128;
    default_action = e7_qr1;
}

table tbl_stream_eg8 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        e8_qr1;
        e8_qr3;
        e8_qr5;
        e8_qr7;
    }
    size = 128;
    default_action = e8_qr1;
}

table tbl_stream_eg9 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        e9_qr1;
        e9_qr3;
        e9_qr5;
        e9_qr7;
    }
    size = 128;
    default_action = e9_qr1;
}

table tbl_stream_eg10 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        e10_qr1;
        e10_qr3;
        e10_qr5;
        e10_qr7;
    }
    size = 128;
    default_action = e10_qr1;
}

table tbl_stream_eg11 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        e11_qr1;
        e11_qr3;
        e11_qr5;
        e11_qr7;
        e11_qr7_fin;
    }
    size = 128;
    default_action = e11_qr1;
}