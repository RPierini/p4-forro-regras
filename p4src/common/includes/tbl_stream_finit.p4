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
        i1_cipher(); //Cipher and continue
    }
    size = 1; 
    default_action = i1_init;
}

table tbl_stream_ig2_finit {
    key = {
        hdr.ethernet.src_addr: exact;
        hdr.stream_control.control_flags: exact; //number of blocks to cipher for specified device and cipher
    }
    actions = {
        i2_send(); //Remove control headers and send
        i2_recirculate(); //Default: Recirculate packet to cipher next block
    }
    size = 192; //Number of source devices
    default_action = i2_recirculate();
}