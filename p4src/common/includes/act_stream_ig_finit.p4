action i0_add_values_forro(
   hashword_t key0, hashword_t key1, hashword_t key2, hashword_t key3,
   hashword_t key4, hashword_t key5, hashword_t key6, hashword_t key7
) {
   // Inserting the values as if it was the end of a QR7 (so it's swapped "odd to even" on QR0's parser)
   hdr.stream_cipher_s0.v0  = hdr.stream_cipher_s0.v0  + key0; //v0 = k0
   hdr.stream_cipher_s0.v1  = hdr.stream_cipher_s0.v1  + key1; //v1 = k1
   hdr.stream_cipher_s0.v2  = hdr.stream_cipher_s0.v2  + key2; //v2 = k2
   hdr.stream_cipher_s0.v3  = hdr.stream_cipher_s0.v3  + key3; //v3 = k3
   hdr.stream_cipher_s0.t3  = key3; //holder for QR0's E, starts with Key3 value
   hdr.stream_cipher_s0.v4  = hdr.stream_cipher_s0.v4  + 0x0; //v4 = t0
   hdr.stream_cipher_s0.v5  = hdr.stream_cipher_s0.v5  + 0x0; //v5 = t1
   hdr.stream_cipher_s0.v6  = hdr.stream_cipher_s0.v6  + FORRO_C0; // v6 = C0
   hdr.stream_cipher_s0.v7  = hdr.stream_cipher_s0.v7  + FORRO_C1; //v7 = C1
   hdr.stream_cipher_s0.v8  = hdr.stream_cipher_s0.v8  + key4; //v8 = k4
   hdr.stream_cipher_s0.v9  = hdr.stream_cipher_s0.v9  + key5; //v9 = k5
   hdr.stream_cipher_s0.v10 = hdr.stream_cipher_s0.v10 + key6; //v10 = k6
   hdr.stream_cipher_s0.v11 = hdr.stream_cipher_s0.v11 + key7; // v11 = k7
   hdr.stream_cipher_s0.v12 = hdr.stream_cipher_s0.v12 + hdr.stream_nonce.n0; // v12 = n0
   hdr.stream_cipher_s0.v13 = hdr.stream_cipher_s0.v13 + hdr.stream_nonce.n1; //v13 = n1
   hdr.stream_cipher_s0.v14 = hdr.stream_cipher_s0.v14 + FORRO_C2; //v14 = C2
   hdr.stream_cipher_s0.v15 = hdr.stream_cipher_s0.v15 + FORRO_C3; //v15 = C3

   // hdr.stream_cipher_s1.v0  = hdr.stream_cipher_s1.v0 + key0; //v0 = k0
   // hdr.stream_cipher_s1.v4  = hdr.stream_cipher_s1.v4 + key1; //v1 = k1
   // hdr.stream_cipher_s1.v8  = hdr.stream_cipher_s1.v8 + key2; //v2 = k2
   // hdr.stream_cipher_s1.v12 = hdr.stream_cipher_s1.v12 + key3; //v3 = k3
   // hdr.stream_cipher_s1.v13 = hdr.stream_cipher_s1.v13 + 0x0; //v4 = t0
   // hdr.stream_cipher_s1.v1  = hdr.stream_cipher_s1.v1 + 0x0; //v5 = t1
   // hdr.stream_cipher_s1.v5  = hdr.stream_cipher_s1.v5 + FORRO_C0; // v6 = C0
   // hdr.stream_cipher_s1.v9  = hdr.stream_cipher_s1.v9 + FORRO_C1; //v7 = C1
   // hdr.stream_cipher_s1.v10 = hdr.stream_cipher_s1.v10 + key4; //v8 = k4
   // hdr.stream_cipher_s1.v14 = hdr.stream_cipher_s1.v14 + key5; //v9 = k5
   // hdr.stream_cipher_s1.v2  = hdr.stream_cipher_s1.v2 + key6; //v10 = k6
   // hdr.stream_cipher_s1.v6  = hdr.stream_cipher_s1.v6 + key7; // v11 = k7
   // hdr.stream_cipher_s1.v7  = hdr.stream_cipher_s1.v7 + hdr.stream_nonce.n0; // v12 = n0
   // hdr.stream_cipher_s1.v11 = hdr.stream_cipher_s1.v11 + hdr.stream_nonce.n1; //v13 = n1
   // hdr.stream_cipher_s1.v15 = hdr.stream_cipher_s1.v15 + FORRO_C2; //v14 = C2
   // hdr.stream_cipher_s1.v3  = hdr.stream_cipher_s1.v3 + FORRO_C3; //v15 = C3
}

action i1_cipher () {
   // Inserting the values as if it was the end of a QR7 (so it's swapped "odd to even")
   hdr.stream_payload_b0.v0  = hdr.stream_payload_b0.v0  ^ hdr.stream_cipher_s0.v0;
   hdr.stream_payload_b0.v1  = hdr.stream_payload_b0.v1  ^ hdr.stream_cipher_s0.v1;
   hdr.stream_payload_b0.v2  = hdr.stream_payload_b0.v2  ^ hdr.stream_cipher_s0.v2;
   hdr.stream_payload_b0.v3  = hdr.stream_payload_b0.v3  ^ hdr.stream_cipher_s0.v3;
   hdr.stream_payload_b0.v4  = hdr.stream_payload_b0.v4  ^ hdr.stream_cipher_s0.v4;
   hdr.stream_payload_b0.v5  = hdr.stream_payload_b0.v5  ^ hdr.stream_cipher_s0.v5;
   hdr.stream_payload_b0.v6  = hdr.stream_payload_b0.v6  ^ hdr.stream_cipher_s0.v6;
   hdr.stream_payload_b0.v7  = hdr.stream_payload_b0.v7  ^ hdr.stream_cipher_s0.v7;
   hdr.stream_payload_b0.v8  = hdr.stream_payload_b0.v8  ^ hdr.stream_cipher_s0.v8;
   hdr.stream_payload_b0.v9  = hdr.stream_payload_b0.v9  ^ hdr.stream_cipher_s0.v9;
   hdr.stream_payload_b0.v10 = hdr.stream_payload_b0.v10 ^ hdr.stream_cipher_s0.v10;
   hdr.stream_payload_b0.v11 = hdr.stream_payload_b0.v11 ^ hdr.stream_cipher_s0.v11;
   hdr.stream_payload_b0.v12 = hdr.stream_payload_b0.v12 ^ hdr.stream_cipher_s0.v12;
   hdr.stream_payload_b0.v13 = hdr.stream_payload_b0.v13 ^ hdr.stream_cipher_s0.v13;
   hdr.stream_payload_b0.v14 = hdr.stream_payload_b0.v14 ^ hdr.stream_cipher_s0.v14;
   hdr.stream_payload_b0.v15 = hdr.stream_payload_b0.v15 ^ hdr.stream_cipher_s0.v15;

   // hdr.stream_payload_b1.v0  = hdr.stream_payload_b1.v0  ^ hdr.stream_cipher_s1.v0;
   // hdr.stream_payload_b1.v1  = hdr.stream_payload_b1.v1  ^ hdr.stream_cipher_s1.v4;
   // hdr.stream_payload_b1.v2  = hdr.stream_payload_b1.v2  ^ hdr.stream_cipher_s1.v8;
   // hdr.stream_payload_b1.v3  = hdr.stream_payload_b1.v3  ^ hdr.stream_cipher_s1.v12;
   // hdr.stream_payload_b1.v4  = hdr.stream_payload_b1.v4  ^ hdr.stream_cipher_s1.v13;
   // hdr.stream_payload_b1.v5  = hdr.stream_payload_b1.v5  ^ hdr.stream_cipher_s1.v1;
   // hdr.stream_payload_b1.v6  = hdr.stream_payload_b1.v6  ^ hdr.stream_cipher_s1.v5;
   // hdr.stream_payload_b1.v7  = hdr.stream_payload_b1.v7  ^ hdr.stream_cipher_s1.v9;
   // hdr.stream_payload_b1.v8  = hdr.stream_payload_b1.v8  ^ hdr.stream_cipher_s1.v10;
   // hdr.stream_payload_b1.v9  = hdr.stream_payload_b1.v9  ^ hdr.stream_cipher_s1.v14;
   // hdr.stream_payload_b1.v10 = hdr.stream_payload_b1.v10 ^ hdr.stream_cipher_s1.v2;
   // hdr.stream_payload_b1.v11 = hdr.stream_payload_b1.v11 ^ hdr.stream_cipher_s1.v6;
   // hdr.stream_payload_b1.v12 = hdr.stream_payload_b1.v12 ^ hdr.stream_cipher_s1.v7;
   // hdr.stream_payload_b1.v13 = hdr.stream_payload_b1.v13 ^ hdr.stream_cipher_s1.v11;
   // hdr.stream_payload_b1.v14 = hdr.stream_payload_b1.v14 ^ hdr.stream_cipher_s1.v15;
   // hdr.stream_payload_b1.v15 = hdr.stream_payload_b1.v15 ^ hdr.stream_cipher_s1.v3;

   // Definindo porta de saida e pulando Egress
   ig_tm_md.ucast_egress_port = 0x1;
   ig_tm_md.bypass_egress = 0x1;

   // Limpando cabeçalhos de round e estado para saida
   hdr.stream_round.setInvalid();
   hdr.stream_cipher_s0.setInvalid();
   exit;
}

action i1_init() {
   hdr.stream_round.setValid();
   hdr.stream_cipher_s0.setValid();
   // hdr.stream_cipher_s1.setValid();

   hdr.ethernet.ether_type = ether_type_t.STREAM_CALC;

   ig_tm_md.ucast_egress_port=68+128;
   // ig_tm_md.bypass_egress = 0x1;
   exit;
}