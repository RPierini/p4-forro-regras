header stream_nonce_t {
    hashword_t  n0;
    hashword_t  n1;
}

header stream_control_t {
    bit<8>  control_flags; //1b: has_round_header, 2b: stream_cipher (00: forro, 01: chacha, 10: xote, 11: chacha_2state), 5b: block_counter
}

header stream_round_t {
    bit<8>  round; //1b: fin, 7b: round counter
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
}

// Rotated as QR0's expected input order (columns in lines) 
header stream_cipher_t {
    hashword_t  s0_v0;
    hashword_t  s0_v4;
    hashword_t  s0_v8;
    hashword_t  s0_v12;

    hashword_t  s0_v3;
    hashword_t  s0_v7;
    hashword_t  s0_v11;
    hashword_t  s0_v15;

    hashword_t  s0_v1;
    hashword_t  s0_v5;
    hashword_t  s0_v9;
    hashword_t  s0_v13;

    hashword_t  s0_v2;
    hashword_t  s0_v6;
    hashword_t  s0_v10;
    hashword_t  s0_v14;
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