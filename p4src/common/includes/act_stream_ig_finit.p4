action i0_add_values_forro(
   hashword_t key0, hashword_t key1, hashword_t key2, hashword_t key3,
   hashword_t key4, hashword_t key5, hashword_t key6, hashword_t key7
) {
   // Loading round control and state matrix headers (if not extracted at Parser)
   hdr.stream_round.setValid();

   //Setting state matrices valid
   hdr.s0_finit_line0.setValid();
   hdr.s1_finit_line0.setValid();
   hdr.s0_finit_line1.setValid();
   hdr.s1_finit_line1.setValid();
   hdr.s0_finit_line2.setValid();
   hdr.s1_finit_line2.setValid();
   hdr.s0_finit_line3.setValid();
   hdr.s1_finit_line3.setValid();

   //State Matrix 0
   hdr.s0_finit_line0.a = hdr.s0_finit_line0.a + key0; //v0 = k0
   hdr.s0_finit_line2.a = hdr.s0_finit_line2.a + key1; //v1 = k1
   hdr.s0_finit_line3.a = hdr.s0_finit_line3.a + key2; //v2 = k2
   hdr.s0_finit_line1.a = hdr.s0_finit_line1.a + key3; //v3 = k3
   hdr.s0_finit_line0.b = hdr.s0_finit_line0.b + 0x0; //v4 = t0
   hdr.s0_finit_line2.b = hdr.s0_finit_line2.b + 0x0; //v5 = t1
   hdr.s0_finit_line3.b = hdr.s0_finit_line3.b + FORRO_C0; // v6 = C0
   hdr.s0_finit_line1.b = hdr.s0_finit_line1.b + FORRO_C1; //v7 = C1
   hdr.s0_finit_line0.c = hdr.s0_finit_line0.c + key4; //v8 = k4
   hdr.s0_finit_line2.c = hdr.s0_finit_line2.c + key5; //v9 = k5
   hdr.s0_finit_line3.c = hdr.s0_finit_line3.c + key6; //v10 = k6
   hdr.s0_finit_line1.c = hdr.s0_finit_line1.c + key7; // v11 = k7
   hdr.s0_finit_line0.d = hdr.s0_finit_line0.d + hdr.stream_nonce.n0; // v12 = n0
   hdr.s0_finit_line2.d = hdr.s0_finit_line2.d + hdr.stream_nonce.n1; //v13 = n1
   hdr.s0_finit_line3.d = hdr.s0_finit_line3.d + FORRO_C2; //v14 = C2
   hdr.s0_finit_line1.d = hdr.s0_finit_line1.d + FORRO_C3; //v15 = C3

   //State Matrix 1
   hdr.s1_finit_line0.a = hdr.s1_finit_line0.a + key0; //v0 = k0
   hdr.s1_finit_line2.a = hdr.s1_finit_line2.a + key1; //v1 = k1
   hdr.s1_finit_line3.a = hdr.s1_finit_line3.a + key2; //v2 = k2
   hdr.s1_finit_line1.a = hdr.s1_finit_line1.a + key3; //v3 = k3
   hdr.s1_finit_line0.b = hdr.s1_finit_line0.b + 0x1; //v4 = t0
   hdr.s1_finit_line2.b = hdr.s1_finit_line2.b + 0x0; //v5 = t1
   hdr.s1_finit_line3.b = hdr.s1_finit_line3.b + FORRO_C0; // v6 = C0
   hdr.s1_finit_line1.b = hdr.s1_finit_line1.b + FORRO_C1; //v7 = C1
   hdr.s1_finit_line0.c = hdr.s1_finit_line0.c + key4; //v8 = k4
   hdr.s1_finit_line2.c = hdr.s1_finit_line2.c + key5; //v9 = k5
   hdr.s1_finit_line3.c = hdr.s1_finit_line3.c + key6; //v10 = k6
   hdr.s1_finit_line1.c = hdr.s1_finit_line1.c + key7; // v11 = k7
   hdr.s1_finit_line0.d = hdr.s1_finit_line0.d + hdr.stream_nonce.n0; // v12 = n0
   hdr.s1_finit_line2.d = hdr.s1_finit_line2.d + hdr.stream_nonce.n1; //v13 = n1
   hdr.s1_finit_line3.d = hdr.s1_finit_line3.d + FORRO_C2; //v14 = C2
   hdr.s1_finit_line1.d = hdr.s1_finit_line1.d + FORRO_C3; //v15 = C3
}

action i1_cipher_two_block () {
   // hdr.stream_payload_b0.v0  = hdr.stream_payload_b0.v0  ^ hdr.s0_finit_line0.a;
   // hdr.stream_payload_b0.v1  = hdr.stream_payload_b0.v1  ^ hdr.s0_finit_line1.a;
   // hdr.stream_payload_b1.v0  = hdr.stream_payload_b1.v0  ^ hdr.s1_finit_line0.a;
   // hdr.stream_payload_b1.v1  = hdr.stream_payload_b1.v1  ^ hdr.s1_finit_line1.a;   

   //DEBUG
   // Setting header back to INIT for next switch
   hdr.ethernet.ether_type = ether_type_t.STREAM_INIT;

   // Setting Egress port and skipping egress Pipeline
   ig_tm_md.ucast_egress_port = 0x1;
   ig_tm_md.bypass_egress = 0x1;
}

action i1_init() {
   // Changing ethertype and sending to Egress to process QR0
   hdr.ethernet.ether_type = ether_type_t.STREAM_CALC;

   // Defining recirculation port
   ig_tm_md.ucast_egress_port=68+128;
   exit;
}

action i2_cipher_two_block () {
   hdr.stream_payload_b0.v2  = hdr.stream_payload_b0.v2  ^ hdr.s0_finit_line2.a;
   hdr.stream_payload_b0.v3  = hdr.stream_payload_b0.v3  ^ hdr.s0_finit_line3.a;
   hdr.stream_payload_b1.v2  = hdr.stream_payload_b1.v2  ^ hdr.s1_finit_line2.a;
   hdr.stream_payload_b1.v3  = hdr.stream_payload_b1.v3  ^ hdr.s1_finit_line3.a;
}

action i3_cipher_two_block () {
   hdr.stream_payload_b0.v4  = hdr.stream_payload_b0.v4  ^ hdr.s0_finit_line0.b;
   hdr.stream_payload_b0.v5  = hdr.stream_payload_b0.v5  ^ hdr.s0_finit_line1.b;
   hdr.stream_payload_b1.v4  = hdr.stream_payload_b1.v4  ^ hdr.s1_finit_line0.b;
   hdr.stream_payload_b1.v5  = hdr.stream_payload_b1.v5  ^ hdr.s1_finit_line1.b;
}

action i4_cipher_two_block () {
   hdr.stream_payload_b0.v6  = hdr.stream_payload_b0.v6  ^ hdr.s0_finit_line2.b;
   hdr.stream_payload_b0.v7  = hdr.stream_payload_b0.v7  ^ hdr.s0_finit_line3.b;
   hdr.stream_payload_b1.v6  = hdr.stream_payload_b1.v6  ^ hdr.s1_finit_line2.b;
   hdr.stream_payload_b1.v7  = hdr.stream_payload_b1.v7  ^ hdr.s1_finit_line3.b;
}

action i5_cipher_two_block () {
   hdr.stream_payload_b0.v8  = hdr.stream_payload_b0.v8  ^ hdr.s0_finit_line0.c;
   hdr.stream_payload_b0.v9  = hdr.stream_payload_b0.v9  ^ hdr.s0_finit_line1.c;
   hdr.stream_payload_b1.v8  = hdr.stream_payload_b1.v8  ^ hdr.s1_finit_line0.c;
   hdr.stream_payload_b1.v9  = hdr.stream_payload_b1.v9  ^ hdr.s1_finit_line1.c;
}

action i6_cipher_two_block () {
   hdr.stream_payload_b0.v10 = hdr.stream_payload_b0.v10 ^ hdr.s0_finit_line2.c;
   hdr.stream_payload_b0.v11 = hdr.stream_payload_b0.v11 ^ hdr.s0_finit_line3.c;
   hdr.stream_payload_b1.v10 = hdr.stream_payload_b1.v10 ^ hdr.s1_finit_line2.c;
   hdr.stream_payload_b1.v11 = hdr.stream_payload_b1.v11 ^ hdr.s1_finit_line3.c;
}

action i7_cipher_two_block () {
   hdr.stream_payload_b0.v12 = hdr.stream_payload_b0.v12 ^ hdr.s0_finit_line0.d;
   hdr.stream_payload_b0.v13 = hdr.stream_payload_b0.v13 ^ hdr.s0_finit_line1.d;
   hdr.stream_payload_b1.v12 = hdr.stream_payload_b1.v12 ^ hdr.s1_finit_line0.d;
   hdr.stream_payload_b1.v13 = hdr.stream_payload_b1.v13 ^ hdr.s1_finit_line1.d;
}

action i8_cipher_two_block () {
   hdr.stream_payload_b0.v14 = hdr.stream_payload_b0.v14 ^ hdr.s0_finit_line2.d;
   hdr.stream_payload_b0.v15 = hdr.stream_payload_b0.v15 ^ hdr.s0_finit_line3.d;
   hdr.stream_payload_b1.v14 = hdr.stream_payload_b1.v14 ^ hdr.s1_finit_line2.d;
   hdr.stream_payload_b1.v15 = hdr.stream_payload_b1.v15 ^ hdr.s1_finit_line3.d;
}

action i9_cipher_two_block () {   
   // Setting header back to INIT for next switch
   hdr.ethernet.ether_type = ether_type_t.STREAM_INIT;

   // Setting Egress port and skipping egress Pipeline
   ig_tm_md.ucast_egress_port = 0x1;
   ig_tm_md.bypass_egress = 0x1;

   // Cleaning state and round control headers to send to the network
   hdr.stream_round.setInvalid();
   hdr.s0_finit_line0.setInvalid();
   hdr.s1_finit_line0.setInvalid();
   hdr.s0_finit_line1.setInvalid();
   hdr.s1_finit_line1.setInvalid();
   hdr.s0_finit_line2.setInvalid();
   hdr.s1_finit_line2.setInvalid();
   hdr.s0_finit_line3.setInvalid();
   hdr.s1_finit_line3.setInvalid();
   exit;
}