header stream_nonce_t {
    hashword_t  n0;
    hashword_t  n1;
}

header stream_round_t {
    bit<8>  round;
}

// each hashword from the state vector
header vector_t {
    hashword_t v;
}

header line_t {
    hashword_t a;
    hashword_t b;
    hashword_t c;
    hashword_t d;
    hashword_t e;
}

// Rotated as QR0's expected input order (columns in lines) 
header stream_cipher_t {
    hashword_t  s0_v0;
    hashword_t  s0_v4;
    hashword_t  s0_v8;
    hashword_t  s0_v12;
    hashword_t  s0_t3;
    hashword_t  s1_v0;
    hashword_t  s1_v4;
    hashword_t  s1_v8;
    hashword_t  s1_v12;
    hashword_t  s1_t3;
    hashword_t  s0_v1;
    hashword_t  s0_v5;
    hashword_t  s0_v9;
    hashword_t  s0_v13;
    hashword_t  s0_t0;
    hashword_t  s1_v1;
    hashword_t  s1_v5;
    hashword_t  s1_v9;
    hashword_t  s1_v13;
    hashword_t  s1_t0;
    hashword_t  s0_v2;
    hashword_t  s0_v6;
    hashword_t  s0_v10;
    hashword_t  s0_v14;
    hashword_t  s0_t1;
    hashword_t  s1_v2;
    hashword_t  s1_v6;
    hashword_t  s1_v10;
    hashword_t  s1_v14;
    hashword_t  s1_t1;
    hashword_t  s0_v3;
    hashword_t  s0_v7;
    hashword_t  s0_v11;
    hashword_t  s0_v15;
    hashword_t  s0_t2;
    hashword_t  s1_v3;
    hashword_t  s1_v7;
    hashword_t  s1_v11;
    hashword_t  s1_v15;
    hashword_t  s1_t2;
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