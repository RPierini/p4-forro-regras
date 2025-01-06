table tbl_stream_ig0 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i0_qr_chacha;
        drop;
    }
    size = 64;
    default_action = drop;
}

table tbl_stream_ig1 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i1_qr_chacha;
    }
    size = 64;
    default_action = i1_qr_chacha;
}

table tbl_stream_ig2 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i2_qr_chacha;
    }
    size = 64;
    default_action = i2_qr_chacha;
}

table tbl_stream_ig3 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i3_qr_chacha;
    }
    size = 64;
    default_action = i3_qr_chacha;
}

table tbl_stream_ig4 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i4_qr_chacha;
    }
    size = 64;
    default_action = i4_qr_chacha;
}

table tbl_stream_ig5 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i5_qr_chacha;
    }
    size = 64;
    default_action = i5_qr_chacha;
}

table tbl_stream_ig6 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i6_qr_chacha;
    }
    size = 64;
    default_action = i6_qr_chacha;
}

table tbl_stream_ig7 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i7_qr_chacha;
    }
    size = 64;
    default_action = i7_qr_chacha;
}

table tbl_stream_ig8 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i8_qr_chacha;
    }
    size = 64;
    default_action = i8_qr_chacha;
}

table tbl_stream_ig9 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i9_qr_chacha;
    }
    size = 64;
    default_action = i9_qr_chacha;
}

table tbl_stream_ig10 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i10_qr_chacha;
    }
    size = 64;
    default_action = i10_qr_chacha;
}

table tbl_stream_ig11 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i11_qr_chacha;
        i11_qr_chacha_fin;
    }
    size = 64;
    default_action = i11_qr_chacha(68);
}