action i0_qr7_chacha() {
   hdr.s0_qr7_a.v = hdr.s0_qr7_a.v + hdr.s0_qr7_b.v;
   hdr.s0_qr7_e.v = hdr.s0_qr7_e.v + hdr.s0_qr7_v7.v;
   hdr.s0_qr7_v1.v = hdr.s0_qr7_v1.v + hdr.s0_qr7_v6.v;
   hdr.s0_qr7_v0.v = hdr.s0_qr7_v0.v + hdr.s0_qr7_v5.v;
}

action i1_qr7_chacha() {
   hdr.s0_qr7_d.v = hdr.s0_qr7_d.v ^ hdr.s0_qr7_a.v;
   hdr.s0_qr7_v13.v = hdr.s0_qr7_v13.v ^ hdr.s0_qr7_e.v;
   hdr.s0_qr7_v12.v = hdr.s0_qr7_v12.v ^ hdr.s0_qr7_v1.v;
   hdr.s0_qr7_v15.v = hdr.s0_qr7_v15.v ^ hdr.s0_qr7_v0.v;
}

action i2_qr7_chacha() {
   hdr.s0_qr7_d.v = hdr.s0_qr7_d.v[15:0] ++ hdr.s0_qr7_d.v[31:16];
   hdr.s0_qr7_v13.v = hdr.s0_qr7_v13.v[15:0] ++ hdr.s0_qr7_v13.v[31:16];
   hdr.s0_qr7_v12.v = hdr.s0_qr7_v12.v[15:0] ++ hdr.s0_qr7_v12.v[31:16];
   hdr.s0_qr7_v15.v = hdr.s0_qr7_v15.v[15:0] ++ hdr.s0_qr7_v15.v[31:16];
}

action i3_qr7_chacha() {
   hdr.s0_qr7_c.v = hdr.s0_qr7_c.v + hdr.s0_qr7_d.v;
   hdr.s0_qr7_v8.v = hdr.s0_qr7_v8.v + hdr.s0_qr7_v13.v;
   hdr.s0_qr7_v11.v = hdr.s0_qr7_v11.v + hdr.s0_qr7_v12.v;
   hdr.s0_qr7_v10.v = hdr.s0_qr7_v10.v + hdr.s0_qr7_v15.v;
}

action i4_qr7_chacha() {
   hdr.s0_qr7_b.v = hdr.s0_qr7_b.v ^ hdr.s0_qr7_c.v;
   hdr.s0_qr7_v7.v = hdr.s0_qr7_v7.v ^ hdr.s0_qr7_v8.v;
   hdr.s0_qr7_v6.v = hdr.s0_qr7_v6.v ^ hdr.s0_qr7_v11.v;
   hdr.s0_qr7_v5.v = hdr.s0_qr7_v5.v ^ hdr.s0_qr7_v10.v;
}

action i5_qr7_chacha() {
   hdr.s0_qr7_b.v = hdr.s0_qr7_b.v[19:0] ++ hdr.s0_qr7_b.v[31:20];
   hdr.s0_qr7_v7.v = hdr.s0_qr7_v7.v[19:0] ++ hdr.s0_qr7_v7.v[31:20];
   hdr.s0_qr7_v6.v = hdr.s0_qr7_v6.v[19:0] ++ hdr.s0_qr7_v6.v[31:20];
   hdr.s0_qr7_v5.v = hdr.s0_qr7_v5.v[19:0] ++ hdr.s0_qr7_v5.v[31:20];
}

action i6_qr7_chacha() {
   hdr.s0_qr7_a.v = hdr.s0_qr7_a.v + hdr.s0_qr7_b.v;
   hdr.s0_qr7_e.v = hdr.s0_qr7_e.v + hdr.s0_qr7_v7.v;
   hdr.s0_qr7_v1.v = hdr.s0_qr7_v1.v + hdr.s0_qr7_v6.v;
   hdr.s0_qr7_v0.v = hdr.s0_qr7_v0.v + hdr.s0_qr7_v5.v;
}

action i7_qr7_chacha() {
   hdr.s0_qr7_d.v = hdr.s0_qr7_d.v ^ hdr.s0_qr7_a.v;
   hdr.s0_qr7_v13.v = hdr.s0_qr7_v13.v ^ hdr.s0_qr7_e.v;
   hdr.s0_qr7_v12.v = hdr.s0_qr7_v12.v ^ hdr.s0_qr7_v1.v;
   hdr.s0_qr7_v15.v = hdr.s0_qr7_v15.v ^ hdr.s0_qr7_v0.v;
}

action i8_qr7_chacha() {
   hdr.s0_qr7_d.v = hdr.s0_qr7_d.v[23:0] ++ hdr.s0_qr7_d.v[31:24];
   hdr.s0_qr7_v13.v = hdr.s0_qr7_v13.v[23:0] ++ hdr.s0_qr7_v13.v[31:24];
   hdr.s0_qr7_v12.v = hdr.s0_qr7_v12.v[23:0] ++ hdr.s0_qr7_v12.v[31:24];
   hdr.s0_qr7_v15.v = hdr.s0_qr7_v15.v[23:0] ++ hdr.s0_qr7_v15.v[31:24];
}

action i9_qr7_chacha() {
   hdr.s0_qr7_c.v = hdr.s0_qr7_c.v + hdr.s0_qr7_d.v;
   hdr.s0_qr7_v8.v = hdr.s0_qr7_v8.v + hdr.s0_qr7_v13.v;
   hdr.s0_qr7_v11.v = hdr.s0_qr7_v11.v + hdr.s0_qr7_v12.v;
   hdr.s0_qr7_v10.v = hdr.s0_qr7_v10.v + hdr.s0_qr7_v15.v;
}

action i10_qr7_chacha() {
   hdr.s0_qr7_b.v = hdr.s0_qr7_b.v ^ hdr.s0_qr7_c.v;
   hdr.s0_qr7_v7.v = hdr.s0_qr7_v7.v ^ hdr.s0_qr7_v8.v;
   hdr.s0_qr7_v6.v = hdr.s0_qr7_v6.v ^ hdr.s0_qr7_v11.v;
   hdr.s0_qr7_v5.v = hdr.s0_qr7_v5.v ^ hdr.s0_qr7_v10.v;
}

// Uses first recirculation port (QRs 3 and 7)
action i11_qr7_chacha() {
   hdr.s0_qr7_b.v = hdr.s0_qr7_b.v[24:0] ++ hdr.s0_qr7_b.v[31:25];
   hdr.s0_qr7_v7.v = hdr.s0_qr7_v7.v[24:0] ++ hdr.s0_qr7_v7.v[31:25];
   hdr.s0_qr7_v6.v = hdr.s0_qr7_v6.v[24:0] ++ hdr.s0_qr7_v6.v[31:25];
   hdr.s0_qr7_v5.v = hdr.s0_qr7_v5.v[24:0] ++ hdr.s0_qr7_v5.v[31:25];

   ig_tm_md.bypass_egress = 0x1;

   hdr.stream_round.round = hdr.stream_round.round + 128;
   ig_tm_md.ucast_egress_port=68+128;
}

//Skips egress and set to finalization
action i11_qr7_chacha_fin() {
   hdr.s0_qr7_b.v = hdr.s0_qr7_b.v[24:0] ++ hdr.s0_qr7_b.v[31:25];
   hdr.s0_qr7_v7.v = hdr.s0_qr7_v7.v[24:0] ++ hdr.s0_qr7_v7.v[31:25];
   hdr.s0_qr7_v6.v = hdr.s0_qr7_v6.v[24:0] ++ hdr.s0_qr7_v6.v[31:25];
   hdr.s0_qr7_v5.v = hdr.s0_qr7_v5.v[24:0] ++ hdr.s0_qr7_v5.v[31:25];

   ig_tm_md.bypass_egress = 0x1;

   hdr.stream_round.round = hdr.stream_round.round + 128;
   ig_tm_md.ucast_egress_port=68+128;
}