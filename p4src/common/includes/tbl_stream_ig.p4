table tbl_stream_ig0 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i0_qr0;
        i0_qr2;
        i0_qr4;
        i0_qr6;
        drop;
    }
    size = 128;
    default_action = drop;
}

table tbl_stream_ig1 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i1_qr0;
        i1_qr2;
        i1_qr4;
        i1_qr6;
    }
    size = 128;
    default_action = i1_qr0;
}

table tbl_stream_ig2 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i2_qr0;
        i2_qr2;
        i2_qr4;
        i2_qr6;
    }
    size = 128;
    default_action = i2_qr0;
}

table tbl_stream_ig3 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i3_qr0;
        i3_qr2;
        i3_qr4;
        i3_qr6;
    }
    size = 128;
    default_action = i3_qr0;
}

table tbl_stream_ig4 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i4_qr0;
        i4_qr2;
        i4_qr4;
        i4_qr6;
    }
    size = 128;
    default_action = i4_qr0;
}

table tbl_stream_ig5 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i5_qr0;
        i5_qr2;
        i5_qr4;
        i5_qr6;
    }
    size = 128;
    default_action = i5_qr0;
}

table tbl_stream_ig6 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i6_qr0;
        i6_qr2;
        i6_qr4;
        i6_qr6;
    }
    size = 128;
    default_action = i6_qr0;
}

table tbl_stream_ig7 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i7_qr0;
        i7_qr2;
        i7_qr4;
        i7_qr6;
    }
    size = 128;
    default_action = i7_qr0;
}

table tbl_stream_ig8 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i8_qr0;
        i8_qr2;
        i8_qr4;
        i8_qr6;
    }
    size = 128;
    default_action = i8_qr0;
}

table tbl_stream_ig9 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i9_qr0;
        i9_qr2;
        i9_qr4;
        i9_qr6;
    }
    size = 128;
    default_action = i9_qr0;
}

table tbl_stream_ig10 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i10_qr0;
        i10_qr2;
        i10_qr4;
        i10_qr6;
    }
    size = 128;
    default_action = i10_qr0;
}

table tbl_stream_ig11 {
    key = {
        hdr.stream_round.round: exact;
    }
    actions = {
        i11_qr0;
        i11_qr2;
        i11_qr4;
        i11_qr6;
    }
    size = 128;
    default_action = i11_qr0;
}

table tbl_stream_ig0_finit {
    key = {
        hdr.stream_round.isValid(): exact; // If it's not valid, then init the headers
    }
    actions = {
        i0_init;
        NoAction;
    }
    size = 1;
    default_action = i0_init; //Default: 0
}

table tbl_stream_ig1_finit {
    key = {
        hdr.ethernet.src_addr:   exact;
        hdr.ethernet.ether_type: exact; //Only "Finit" headers: ABCD or ABCF
    }
    actions = {
        i1_add_1st_key_row_forro;
        i1_add_1st_key_row_chacha;
        drop;
    }
    size = 384; //Number of src devices * number of stream ciphers
    default_action = drop;
}

table tbl_stream_ig2_finit {
    key = {
        hdr.ethernet.src_addr:   exact;
    }
    actions = {
        i2_add_2nd_key_row;
        drop;
    }
    size = 192; //Number of source devices
    default_action = drop;
}

table tbl_stream_ig3_finit {
    key = {
        hdr.ethernet.ether_type:   exact; //Only "Finit" headers: ABCD or ABCF
    }
    actions = {
        i3_add_constant_nonce_forro;
        i3_add_constant_nonce_chacha;
        drop;
    }
    size = 2; //Number of stream ciphers
    default_action = drop;
}

table tbl_stream_ig4_finit {
    key = {
        meta.fin: exact; //To decide if encrypt/decrypt or start calculations
    }
    actions = {
        i4_cipher();
        i4_recirculate; //Default: Skip cipher and start calculations
    }
    size = 1; 
    default_action = i4_recirculate;
}