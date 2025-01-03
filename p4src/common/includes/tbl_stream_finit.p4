table tbl_stream_ig0_finit {
    key = {
        hdr.ethernet.src_addr:   exact;
    }
    actions = {
        i0_add_values_forro;
        drop;
    }
    size = 192; //Number of source devices
    default_action = drop;
}

table tbl_stream_ig1_finit {
    key = {
        hdr.stream_round.round[7:7]: exact;
    }
    actions = {
        i1_init(); //Default: Skip cipher and start calculations
        i1_cipher();
    }
    size = 1; 
    default_action = i1_init;
    entries = {
        (1): i1_cipher();
    }
}

table tbl_stream_ig2_finit {
    key = {
        hdr.stream_round.round[7:7]: exact;
    }
    actions = {
        i2_cipher();
    }
    size = 1; 
    default_action = i2_cipher;
    entries = {
        (1): i2_cipher();
    }
}

table tbl_stream_ig3_finit {
    key = {
        hdr.stream_round.round[7:7]: exact;
    }
    actions = {
        i3_cipher();
    }
    size = 1; 
    default_action = i3_cipher;
    entries = {
        (1): i3_cipher();
    }
}

table tbl_stream_ig4_finit {
    key = {
        hdr.stream_round.round[7:7]: exact;
    }
    actions = {
        i4_cipher();
    }
    size = 1; 
    default_action = i4_cipher;
    entries = {
        (1): i4_cipher();
    }
}

table tbl_stream_ig5_finit {
    key = {
        hdr.ethernet.ether_type: exact;
    }
    actions = {
        i5_cipher_recirculate_block();
        i5_cipher_send();
    }
    size = 2; 
    default_action = i5_cipher_recirculate_block();
    entries = {
        (ether_type_t.STREAM_CALC): i5_cipher_recirculate_block();
        (ether_type_t.STREAM_FIN): i5_cipher_send();
    }
}