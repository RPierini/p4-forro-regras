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
        meta.fin: exact; //To decide if encrypt/decrypt or start calculations
    }
    actions = {
        i1_init(); //Default: Skip cipher and start calculations
        i1_cipher_two_block();
    }
    size = 1; 
    default_action = i1_init;
}

table tbl_stream_ig2_finit {
    key = {
        meta.fin: exact; //To decide if encrypt/decrypt or start calculations
    }
    actions = { //Default: Skip cipher and start calculations
        i2_cipher_two_block();
    }
    size = 1; 
    default_action = i2_cipher_two_block;
}

table tbl_stream_ig3_finit {
    key = {
        meta.fin: exact; //To decide if encrypt/decrypt or start calculations
    }
    actions = { //Default: Skip cipher and start calculations
        i3_cipher_two_block();
    }
    size = 1; 
    default_action = i3_cipher_two_block;
}

table tbl_stream_ig4_finit {
    key = {
        meta.fin: exact; //To decide if encrypt/decrypt or start calculations
    }
    actions = { //Default: Skip cipher and start calculations
        i4_cipher_two_block();
    }
    size = 1; 
    default_action = i4_cipher_two_block;
}

table tbl_stream_ig5_finit {
    key = {
        meta.fin: exact; //To decide if encrypt/decrypt or start calculations
    }
    actions = { //Default: Skip cipher and start calculations
        i5_cipher_two_block();
    }
    size = 1; 
    default_action = i5_cipher_two_block;
}

table tbl_stream_ig6_finit {
    key = {
        meta.fin: exact; //To decide if encrypt/decrypt or start calculations
    }
    actions = { //Default: Skip cipher and start calculations
        i6_cipher_two_block();
    }
    size = 1; 
    default_action = i6_cipher_two_block;
}

table tbl_stream_ig7_finit {
    key = {
        meta.fin: exact; //To decide if encrypt/decrypt or start calculations
    }
    actions = { //Default: Skip cipher and start calculations
        i7_cipher_two_block();
    }
    size = 1; 
    default_action = i7_cipher_two_block;
}

table tbl_stream_ig8_finit {
    key = {
        meta.fin: exact; //To decide if encrypt/decrypt or start calculations
    }
    actions = { //Default: Skip cipher and start calculations
        i8_cipher_two_block();
    }
    size = 1; 
    default_action = i8_cipher_two_block;
}

table tbl_stream_ig9_finit {
    key = {
        meta.fin: exact; //To decide if encrypt/decrypt or start calculations
    }
    actions = { //Default: Skip cipher and start calculations
        i9_cipher_two_block();
    }
    size = 1; 
    default_action = i9_cipher_two_block;
}