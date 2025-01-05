action i0_add_values_forro(
   hashword_t key0, hashword_t key1, hashword_t key2, hashword_t key3,
   hashword_t key4, hashword_t key5, hashword_t key6, hashword_t key7
) {
   // Loading round control and state matrix headers (if not extracted at Parser)
   hdr.stream_control.setValid();
   hdr.stream_round.setValid();

   //Setting state matrices valid (if not extracted at Parser)
   hdr.s0_finit_line0.setValid();
   hdr.s0_finit_line1.setValid();
   hdr.s0_finit_line2.setValid();
   hdr.s0_finit_line3.setValid();

   // Setting stream_cipher control flag to Forro
   hdr.stream_control.control_flags[7:7] = 0x1; // has round header
   hdr.stream_control.control_flags[6:5] = cipher_type_t.FORRO;

   //State Matrix 0
   hdr.s0_finit_line0.a = hdr.s0_finit_line0.a + key0; //v0 = k0
   hdr.s0_finit_line2.a = hdr.s0_finit_line2.a + key1; //v1 = k1
   hdr.s0_finit_line3.a = hdr.s0_finit_line3.a + key2; //v2 = k2
   hdr.s0_finit_line1.a = hdr.s0_finit_line1.a + key3; //v3 = k3
   hdr.s0_finit_line0.b = hdr.s0_finit_line0.b + copy32_0.get((bit<32>)hdr.stream_control.control_flags[4:0]); //v4 = t0
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
}

action i1_init() {
   // Changing ethertype and sending to Egress to process QR0
   hdr.ethernet.ether_type = ether_type_t.STREAM_CALC;

   // Defining recirculation port
   ig_tm_md.ucast_egress_port=68+128;
   exit;
}

action i1_cipher() {
   hdr.stream_payload_b0.v0  = hdr.stream_payload_b0.v0  ^ hdr.s0_finit_line0.a;
   hdr.stream_payload_b0.v4  = hdr.stream_payload_b0.v4  ^ hdr.s0_finit_line0.b;
   hdr.stream_payload_b0.v8  = hdr.stream_payload_b0.v8  ^ hdr.s0_finit_line0.c;
   hdr.stream_payload_b0.v12 = hdr.stream_payload_b0.v12 ^ hdr.s0_finit_line0.d;
   hdr.stream_payload_b0.v3  = hdr.stream_payload_b0.v3  ^ hdr.s0_finit_line1.a;
   hdr.stream_payload_b0.v7  = hdr.stream_payload_b0.v7  ^ hdr.s0_finit_line1.b;
   hdr.stream_payload_b0.v11 = hdr.stream_payload_b0.v11 ^ hdr.s0_finit_line1.c;
   hdr.stream_payload_b0.v15 = hdr.stream_payload_b0.v15 ^ hdr.s0_finit_line1.d;
   hdr.stream_payload_b0.v1  = hdr.stream_payload_b0.v1  ^ hdr.s0_finit_line2.a;   
   hdr.stream_payload_b0.v5  = hdr.stream_payload_b0.v5  ^ hdr.s0_finit_line2.b;
   hdr.stream_payload_b0.v9  = hdr.stream_payload_b0.v9  ^ hdr.s0_finit_line2.c;
   hdr.stream_payload_b0.v13 = hdr.stream_payload_b0.v13 ^ hdr.s0_finit_line2.d;
   hdr.stream_payload_b0.v2  = hdr.stream_payload_b0.v2  ^ hdr.s0_finit_line3.a;
   hdr.stream_payload_b0.v6  = hdr.stream_payload_b0.v6  ^ hdr.s0_finit_line3.b;
   hdr.stream_payload_b0.v10 = hdr.stream_payload_b0.v10 ^ hdr.s0_finit_line3.c;
   hdr.stream_payload_b0.v14 = hdr.stream_payload_b0.v14 ^ hdr.s0_finit_line3.d;
   
   hdr.s0_finit_line0.setInvalid();
   hdr.s0_finit_line1.setInvalid();
   hdr.s0_finit_line2.setInvalid();
   hdr.s0_finit_line3.setInvalid();

   // Cleaning round control headers to send to the network or process next state
   hdr.stream_round.setInvalid();
   hdr.stream_control.control_flags[7:7] = 0x0; // doesn't have round header

   // Skipping egress Pipeline
   ig_tm_md.bypass_egress = 0x1;
}

action i2_send(bit<9> port) {
   hdr.stream_control.setInvalid();
   
   // Sending out through specified port
   ig_tm_md.ucast_egress_port = port;

   // Setting header back to INIT for next switch
   hdr.ethernet.ether_type = ether_type_t.STREAM_INIT;

   exit;
}

action i2_recirculate() {
   // Adding 1 to the block counter and recirculating
   hdr.stream_control.control_flags = hdr.stream_control.control_flags + 1;

   ig_tm_md.ucast_egress_port = 68;

   exit;
}