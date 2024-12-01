header stream_nonce_t {
    hashword_t  n0;
    hashword_t  n1;
}

header stream_round_t {
    bit<8>  round;
}

// k = key, t = counter, c = constants, n = nonce
header stream_state_t {
    hashword_t  v0; //k0
    hashword_t  v1; //k1
    hashword_t  v2; //k2
    hashword_t  v3; //k3
    hashword_t  v4; //t0
    hashword_t  v5; //t1
    hashword_t  v6; //c0
    hashword_t  v7; //c1
    hashword_t  v8; //k4
    hashword_t  v9; //k5
    hashword_t  v10; //k6
    hashword_t  v11; //k7
    hashword_t  v12; //n0
    hashword_t  v13; //n1
    hashword_t  v14; //c2
    hashword_t  v15; //c3
}

header stream_cipher_t {
    hashword_t  v0;
    hashword_t  v1;
    hashword_t  v2;
    hashword_t  v3;
    hashword_t  v4;
    hashword_t  v5;
    hashword_t  v6;
    hashword_t  v7;
    hashword_t  v8;
    hashword_t  v9;
    hashword_t  v10;
    hashword_t  v11;
    hashword_t  v12;
    hashword_t  v13;
    hashword_t  v14;
    hashword_t  v15;
}

header stream_payload_t {
    hashword_t  v0;
    hashword_t  v1;
    hashword_t  v2;
    hashword_t  v3;
    hashword_t  v4;
    hashword_t  v5;
    hashword_t  v6;
    hashword_t  v7;
    hashword_t  v8;
    hashword_t  v9;
    hashword_t  v10;
    hashword_t  v11;
    hashword_t  v12;
    hashword_t  v13;
    hashword_t  v14;
    hashword_t  v15;
}