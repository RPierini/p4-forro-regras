table tbl_stream_ig0_finit {
    key = {
        hdr.ethernet.src_addr:   exact;
    }
    actions = {
        i0_add_values_chacha;
        i0_add_values_forro;
        drop;
    }
    size = 192; //Number of source devices
    default_action = drop;
}

table tbl_stream_ig1_finit {
    key = {
        meta.fin: exact; //To decide if encrypt/decrypt or start calculations
    }
    actions = {
        i1_init(); //Default: Skip cipher and start calculations
        i1_cipher();
    }
    size = 1; 
    default_action = i1_init;
}