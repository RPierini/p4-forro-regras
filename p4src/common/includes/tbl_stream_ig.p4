table tbl_stream_ig0 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i0_qr15;
        i0_qr3;
        i0_qr7;
        drop;
    }
    size = 1;
    default_action = drop;
}

table tbl_stream_ig1 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i1_qr15;
        i1_qr3;
        i1_qr7;
    }
    size = 1;
    default_action = i1_qr15;
}

table tbl_stream_ig2 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i2_qr15;
        i2_qr3;
        i2_qr7;
    }
    size = 1;
    default_action = i2_qr15;
}

table tbl_stream_ig3 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i3_qr15;
        i3_qr3;
        i3_qr7;
    }
    size = 1;
    default_action = i3_qr15;
}

table tbl_stream_ig4 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i4_qr15;
        i4_qr3;
        i4_qr7;
    }
    size = 1;
    default_action = i4_qr15;
}

table tbl_stream_ig5 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i5_qr15;
        i5_qr3;
        i5_qr7;
    }
    size = 1;
    default_action = i5_qr15;
}

table tbl_stream_ig6 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i6_qr15;
        i6_qr3;
        i6_qr7;
    }
    size = 1;
    default_action = i6_qr15;
}

table tbl_stream_ig7 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i7_qr15;
        i7_qr3;
        i7_qr7;
    }
    size = 1;
    default_action = i7_qr15;
}

table tbl_stream_ig8 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i8_qr15;
        i8_qr3;
        i8_qr7;
    }
    size = 1;
    default_action = i8_qr15;
}

table tbl_stream_ig9 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i9_qr15;
        i9_qr3;
        i9_qr7;
    }
    size = 1;
    default_action = i9_qr15;
}

table tbl_stream_ig10 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i10_qr15;
        i10_qr3;
        i10_qr7;
    }
    size = 1;
    default_action = i10_qr15;
}

table tbl_stream_ig11 {
    key = {
        hdr.stream_round.round[0:0]: exact;
    }
    actions = {
        i11_qr15;
        i11_qr3;
        i11_qr7;
    }
    size = 1;
    default_action = i11_qr15;
}