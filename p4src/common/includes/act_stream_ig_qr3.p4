action i0_qr3_chacha() {
   hdr.s0_qr3_a.v = hdr.s0_qr3_a.v + hdr.s0_qr3_b.v;
   hdr.s0_qr3_e.v = hdr.s0_qr3_e.v + hdr.s0_qr3_v6.v;
   hdr.s0_qr3_v1.v = hdr.s0_qr3_v1.v + hdr.s0_qr3_v5.v;
   hdr.s0_qr3_v0.v = hdr.s0_qr3_v0.v + hdr.s0_qr3_v4.v;
}

action i1_qr3_chacha() {
   hdr.s0_qr3_d.v = hdr.s0_qr3_d.v ^ hdr.s0_qr3_a.v;
   hdr.s0_qr3_v14.v = hdr.s0_qr3_v14.v ^ hdr.s0_qr3_e.v;
   hdr.s0_qr3_v13.v = hdr.s0_qr3_v13.v ^ hdr.s0_qr3_v1.v;
   hdr.s0_qr3_v12.v = hdr.s0_qr3_v12.v ^ hdr.s0_qr3_v0.v;
}

action i2_qr3_chacha() {
   hdr.s0_qr3_d.v = hdr.s0_qr3_d.v[15:0] ++ hdr.s0_qr3_d.v[31:16];
   hdr.s0_qr3_v14.v = hdr.s0_qr3_v14.v[15:0] ++ hdr.s0_qr3_v14.v[31:16];
   hdr.s0_qr3_v13.v = hdr.s0_qr3_v13.v[15:0] ++ hdr.s0_qr3_v13.v[31:16];
   hdr.s0_qr3_v12.v = hdr.s0_qr3_v12.v[15:0] ++ hdr.s0_qr3_v12.v[31:16];
}

action i3_qr3_chacha() {
   hdr.s0_qr3_c.v = hdr.s0_qr3_c.v + hdr.s0_qr3_d.v;
   hdr.s0_qr3_v10.v = hdr.s0_qr3_v10.v + hdr.s0_qr3_v14.v;
   hdr.s0_qr3_v9.v = hdr.s0_qr3_v9.v + hdr.s0_qr3_v13.v;
   hdr.s0_qr3_v8.v = hdr.s0_qr3_v8.v + hdr.s0_qr3_v12.v;
}

action i4_qr3_chacha() {
   hdr.s0_qr3_b.v = hdr.s0_qr3_b.v ^ hdr.s0_qr3_c.v;
   hdr.s0_qr3_v6.v = hdr.s0_qr3_v6.v ^ hdr.s0_qr3_v10.v;
   hdr.s0_qr3_v5.v = hdr.s0_qr3_v5.v ^ hdr.s0_qr3_v9.v;
   hdr.s0_qr3_v4.v = hdr.s0_qr3_v4.v ^ hdr.s0_qr3_v8.v;
}

action i5_qr3_chacha() {
   hdr.s0_qr3_b.v = hdr.s0_qr3_b.v[19:0] ++ hdr.s0_qr3_b.v[31:20];
   hdr.s0_qr3_v6.v = hdr.s0_qr3_v6.v[19:0] ++ hdr.s0_qr3_v6.v[31:20];
   hdr.s0_qr3_v5.v = hdr.s0_qr3_v5.v[19:0] ++ hdr.s0_qr3_v5.v[31:20];
   hdr.s0_qr3_v4.v = hdr.s0_qr3_v4.v[19:0] ++ hdr.s0_qr3_v4.v[31:20];
}

action i6_qr3_chacha() {
   hdr.s0_qr3_a.v = hdr.s0_qr3_a.v + hdr.s0_qr3_b.v;
   hdr.s0_qr3_e.v = hdr.s0_qr3_e.v + hdr.s0_qr3_v6.v;
   hdr.s0_qr3_v1.v = hdr.s0_qr3_v1.v + hdr.s0_qr3_v5.v;
   hdr.s0_qr3_v0.v = hdr.s0_qr3_v0.v + hdr.s0_qr3_v4.v;
}

action i7_qr3_chacha() {
   hdr.s0_qr3_d.v = hdr.s0_qr3_d.v ^ hdr.s0_qr3_a.v;
   hdr.s0_qr3_v14.v = hdr.s0_qr3_v14.v ^ hdr.s0_qr3_e.v;
   hdr.s0_qr3_v13.v = hdr.s0_qr3_v13.v ^ hdr.s0_qr3_v1.v;
   hdr.s0_qr3_v12.v = hdr.s0_qr3_v12.v ^ hdr.s0_qr3_v0.v;
}

action i8_qr3_chacha() {
   hdr.s0_qr3_d.v = hdr.s0_qr3_d.v[23:0] ++ hdr.s0_qr3_d.v[31:24];
   hdr.s0_qr3_v14.v = hdr.s0_qr3_v14.v[23:0] ++ hdr.s0_qr3_v14.v[31:24];
   hdr.s0_qr3_v13.v = hdr.s0_qr3_v13.v[23:0] ++ hdr.s0_qr3_v13.v[31:24];
   hdr.s0_qr3_v12.v = hdr.s0_qr3_v12.v[23:0] ++ hdr.s0_qr3_v12.v[31:24];
}

action i9_qr3_chacha() {
   hdr.s0_qr3_c.v = hdr.s0_qr3_c.v + hdr.s0_qr3_d.v;
   hdr.s0_qr3_v10.v = hdr.s0_qr3_v10.v + hdr.s0_qr3_v14.v;
   hdr.s0_qr3_v9.v = hdr.s0_qr3_v9.v + hdr.s0_qr3_v13.v;
   hdr.s0_qr3_v8.v = hdr.s0_qr3_v8.v + hdr.s0_qr3_v12.v;
}

action i10_qr3_chacha() {
   hdr.s0_qr3_b.v = hdr.s0_qr3_b.v ^ hdr.s0_qr3_c.v;
   hdr.s0_qr3_v6.v = hdr.s0_qr3_v6.v ^ hdr.s0_qr3_v10.v;
   hdr.s0_qr3_v5.v = hdr.s0_qr3_v5.v ^ hdr.s0_qr3_v9.v;
   hdr.s0_qr3_v4.v = hdr.s0_qr3_v4.v ^ hdr.s0_qr3_v8.v;
}

// Uses first recirculation port (QRs 3 and 7)
action i11_qr3_chacha() {
   hdr.s0_qr3_b.v = hdr.s0_qr3_b.v[24:0] ++ hdr.s0_qr3_b.v[31:25];
   hdr.s0_qr3_v6.v = hdr.s0_qr3_v6.v[24:0] ++ hdr.s0_qr3_v6.v[31:25];
   hdr.s0_qr3_v5.v = hdr.s0_qr3_v5.v[24:0] ++ hdr.s0_qr3_v5.v[31:25];
   hdr.s0_qr3_v4.v = hdr.s0_qr3_v4.v[24:0] ++ hdr.s0_qr3_v4.v[31:25];

   hdr.stream_round.round = hdr.stream_round.round + 1;
   ig_tm_md.ucast_egress_port=68+128;
}