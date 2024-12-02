action i0_add_values_chacha(
   hashword_t key0, hashword_t key1, hashword_t key2, hashword_t key3,
   hashword_t key4, hashword_t key5, hashword_t key6, hashword_t key7
) {
   hdr.stream_cipher.v0 = hdr.stream_cipher.v0 + CHACHA_C0;
   hdr.stream_cipher.v1 = hdr.stream_cipher.v1 + CHACHA_C1;
   hdr.stream_cipher.v2 = hdr.stream_cipher.v2 + CHACHA_C2;
   hdr.stream_cipher.v3 = hdr.stream_cipher.v3 + CHACHA_C3;
   hdr.stream_cipher.v4 = hdr.stream_cipher.v4 + key0;
   hdr.stream_cipher.v5 = hdr.stream_cipher.v5 + key1;
   hdr.stream_cipher.v6 = hdr.stream_cipher.v6 + key2;
   hdr.stream_cipher.v7 = hdr.stream_cipher.v7 + key3;
   hdr.stream_cipher.v8 = hdr.stream_cipher.v8 + key4;
   hdr.stream_cipher.v9 = hdr.stream_cipher.v9 + key5;
   hdr.stream_cipher.v10 = hdr.stream_cipher.v10 + key6;
   hdr.stream_cipher.v11 = hdr.stream_cipher.v11 + key7;
   // t0, t1
   hdr.stream_cipher.v14 = hdr.stream_cipher.v14 + hdr.stream_nonce.n0;
   hdr.stream_cipher.v15 = hdr.stream_cipher.v15 + hdr.stream_nonce.n1;
}

action i0_add_values_forro(
   hashword_t key0, hashword_t key1, hashword_t key2, hashword_t key3,
   hashword_t key4, hashword_t key5, hashword_t key6, hashword_t key7
) {
   // Inserting the values as if it was the end of a QR7 (so it's swapped "odd to even" on QR0's parser)
   hdr.stream_cipher.v0 = hdr.stream_cipher.v0 + key0; //v0 = k0
   hdr.stream_cipher.v4 = hdr.stream_cipher.v4 + key1; //v1 = k1
   hdr.stream_cipher.v8 = hdr.stream_cipher.v8 + key2; //v2 = k2
   hdr.stream_cipher.v12 = hdr.stream_cipher.v12 + key3; //v3 = k3
   hdr.stream_cipher.v13 = hdr.stream_cipher.v13 + 0x0; //v4 = t0
   hdr.stream_cipher.v1 = hdr.stream_cipher.v1 + 0x0; //v5 = t1
   hdr.stream_cipher.v5 = hdr.stream_cipher.v5 + FORRO_C0; // v6 = C0
   hdr.stream_cipher.v9 = hdr.stream_cipher.v9 + FORRO_C1; //v7 = C1
   hdr.stream_cipher.v10 = hdr.stream_cipher.v10 + key4; //v8 = k4
   hdr.stream_cipher.v14 = hdr.stream_cipher.v14 + key5; //v9 = k5
   hdr.stream_cipher.v2 = hdr.stream_cipher.v2 + key6; //v10 = k6
   hdr.stream_cipher.v6 = hdr.stream_cipher.v6 + key7; // v11 = k7
   hdr.stream_cipher.v7 = hdr.stream_cipher.v7 + hdr.stream_nonce.n0; // v12 = n0
   hdr.stream_cipher.v11 = hdr.stream_cipher.v11 + hdr.stream_nonce.n1; //v13 = n1
   hdr.stream_cipher.v15 = hdr.stream_cipher.v15 + FORRO_C2; //v14 = C2
   hdr.stream_cipher.v3 = hdr.stream_cipher.v3 + FORRO_C3; //v15 = C3
}

action i1_cipher () {
   hdr.stream_payload.v0 = hdr.stream_payload.v0 ^ hdr.stream_cipher.v0;
   hdr.stream_payload.v1 = hdr.stream_payload.v1 ^ hdr.stream_cipher.v1;
   hdr.stream_payload.v2 = hdr.stream_payload.v2 ^ hdr.stream_cipher.v2;
   hdr.stream_payload.v3 = hdr.stream_payload.v3 ^ hdr.stream_cipher.v3;
   hdr.stream_payload.v4 = hdr.stream_payload.v4 ^ hdr.stream_cipher.v4;
   hdr.stream_payload.v5 = hdr.stream_payload.v5 ^ hdr.stream_cipher.v5;
   hdr.stream_payload.v6 = hdr.stream_payload.v6 ^ hdr.stream_cipher.v6;
   hdr.stream_payload.v7 = hdr.stream_payload.v7 ^ hdr.stream_cipher.v7;
   hdr.stream_payload.v8 = hdr.stream_payload.v8 ^ hdr.stream_cipher.v8;
   hdr.stream_payload.v9 = hdr.stream_payload.v9 ^ hdr.stream_cipher.v9;
   hdr.stream_payload.v10 = hdr.stream_payload.v10 ^ hdr.stream_cipher.v10;
   hdr.stream_payload.v11 = hdr.stream_payload.v11 ^ hdr.stream_cipher.v11;
   hdr.stream_payload.v12 = hdr.stream_payload.v12 ^ hdr.stream_cipher.v12;
   hdr.stream_payload.v13 = hdr.stream_payload.v13 ^ hdr.stream_cipher.v13;
   hdr.stream_payload.v14 = hdr.stream_payload.v14 ^ hdr.stream_cipher.v14;
   hdr.stream_payload.v15 = hdr.stream_payload.v15 ^ hdr.stream_cipher.v15;

   // Definindo porta de saida e pulando Egress
   ig_tm_md.ucast_egress_port = 0x1;
   ig_tm_md.bypass_egress = 0x1;

   // Limpando cabeçalhos de round e estado para saida
   hdr.stream_round.setInvalid();
   hdr.stream_cipher.setInvalid();
   exit;
}

action i1_init() {
   hdr.stream_round.setValid();
   hdr.stream_cipher.setValid();

   hdr.ethernet.ether_type = ether_type_t.STREAM_CALC;

   ig_tm_md.ucast_egress_port=68;
   ig_tm_md.bypass_egress = 0x1;
   exit;
}