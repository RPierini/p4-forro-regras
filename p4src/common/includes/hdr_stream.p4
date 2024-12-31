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