action i0_qr_chacha() {
   hdr.qr_chacha_v3.v = hdr.qr_chacha_v3.v + hdr.qr_chacha_v4.v;
   hdr.qr_chacha_v2.v = hdr.qr_chacha_v2.v + hdr.qr_chacha_v7.v;
   hdr.qr_chacha_v1.v = hdr.qr_chacha_v1.v + hdr.qr_chacha_v6.v;
   hdr.qr_chacha_v0.v = hdr.qr_chacha_v0.v + hdr.qr_chacha_v5.v;
}

action i1_qr_chacha() {
   hdr.qr_chacha_v14.v = hdr.qr_chacha_v14.v ^ hdr.qr_chacha_v3.v;
   hdr.qr_chacha_v13.v = hdr.qr_chacha_v13.v ^ hdr.qr_chacha_v2.v;
   hdr.qr_chacha_v12.v = hdr.qr_chacha_v12.v ^ hdr.qr_chacha_v1.v;
   hdr.qr_chacha_v15.v = hdr.qr_chacha_v15.v ^ hdr.qr_chacha_v0.v;
}

action i2_qr_chacha() {
   hdr.qr_chacha_v14.v = hdr.qr_chacha_v14.v[15:0] ++ hdr.qr_chacha_v14.v[31:16];
   hdr.qr_chacha_v13.v = hdr.qr_chacha_v13.v[15:0] ++ hdr.qr_chacha_v13.v[31:16];
   hdr.qr_chacha_v12.v = hdr.qr_chacha_v12.v[15:0] ++ hdr.qr_chacha_v12.v[31:16];
   hdr.qr_chacha_v15.v = hdr.qr_chacha_v15.v[15:0] ++ hdr.qr_chacha_v15.v[31:16];
}

action i3_qr_chacha() {
   hdr.qr_chacha_v9.v = hdr.qr_chacha_v9.v + hdr.qr_chacha_v14.v;
   hdr.qr_chacha_v8.v = hdr.qr_chacha_v8.v + hdr.qr_chacha_v13.v;
   hdr.qr_chacha_v11.v = hdr.qr_chacha_v11.v + hdr.qr_chacha_v12.v;
   hdr.qr_chacha_v10.v = hdr.qr_chacha_v10.v + hdr.qr_chacha_v15.v;
}

action i4_qr_chacha() {
   hdr.qr_chacha_v4.v = hdr.qr_chacha_v4.v ^ hdr.qr_chacha_v9.v;
   hdr.qr_chacha_v7.v = hdr.qr_chacha_v7.v ^ hdr.qr_chacha_v8.v;
   hdr.qr_chacha_v6.v = hdr.qr_chacha_v6.v ^ hdr.qr_chacha_v11.v;
   hdr.qr_chacha_v5.v = hdr.qr_chacha_v5.v ^ hdr.qr_chacha_v10.v;
}

action i5_qr_chacha() {
   hdr.qr_chacha_v4.v = hdr.qr_chacha_v4.v[19:0] ++ hdr.qr_chacha_v4.v[31:20];
   hdr.qr_chacha_v7.v = hdr.qr_chacha_v7.v[19:0] ++ hdr.qr_chacha_v7.v[31:20];
   hdr.qr_chacha_v6.v = hdr.qr_chacha_v6.v[19:0] ++ hdr.qr_chacha_v6.v[31:20];
   hdr.qr_chacha_v5.v = hdr.qr_chacha_v5.v[19:0] ++ hdr.qr_chacha_v5.v[31:20];
}

action i6_qr_chacha() {
   hdr.qr_chacha_v3.v = hdr.qr_chacha_v3.v + hdr.qr_chacha_v4.v;
   hdr.qr_chacha_v2.v = hdr.qr_chacha_v2.v + hdr.qr_chacha_v7.v;
   hdr.qr_chacha_v1.v = hdr.qr_chacha_v1.v + hdr.qr_chacha_v6.v;
   hdr.qr_chacha_v0.v = hdr.qr_chacha_v0.v + hdr.qr_chacha_v5.v;
}

action i7_qr_chacha() {
   hdr.qr_chacha_v14.v = hdr.qr_chacha_v14.v ^ hdr.qr_chacha_v3.v;
   hdr.qr_chacha_v13.v = hdr.qr_chacha_v13.v ^ hdr.qr_chacha_v2.v;
   hdr.qr_chacha_v12.v = hdr.qr_chacha_v12.v ^ hdr.qr_chacha_v1.v;
   hdr.qr_chacha_v15.v = hdr.qr_chacha_v15.v ^ hdr.qr_chacha_v0.v;
}

action i8_qr_chacha() {
   hdr.qr_chacha_v14.v = hdr.qr_chacha_v14.v[23:0] ++ hdr.qr_chacha_v14.v[31:24];
   hdr.qr_chacha_v13.v = hdr.qr_chacha_v13.v[23:0] ++ hdr.qr_chacha_v13.v[31:24];
   hdr.qr_chacha_v12.v = hdr.qr_chacha_v12.v[23:0] ++ hdr.qr_chacha_v12.v[31:24];
   hdr.qr_chacha_v15.v = hdr.qr_chacha_v15.v[23:0] ++ hdr.qr_chacha_v15.v[31:24];
}

action i9_qr_chacha() {
   hdr.qr_chacha_v9.v = hdr.qr_chacha_v9.v + hdr.qr_chacha_v14.v;
   hdr.qr_chacha_v8.v = hdr.qr_chacha_v8.v + hdr.qr_chacha_v13.v;
   hdr.qr_chacha_v11.v = hdr.qr_chacha_v11.v + hdr.qr_chacha_v12.v;
   hdr.qr_chacha_v10.v = hdr.qr_chacha_v10.v + hdr.qr_chacha_v15.v;
}

action i10_qr_chacha() {
   hdr.qr_chacha_v4.v = hdr.qr_chacha_v4.v ^ hdr.qr_chacha_v9.v;
   hdr.qr_chacha_v7.v = hdr.qr_chacha_v7.v ^ hdr.qr_chacha_v8.v;
   hdr.qr_chacha_v6.v = hdr.qr_chacha_v6.v ^ hdr.qr_chacha_v11.v;
   hdr.qr_chacha_v5.v = hdr.qr_chacha_v5.v ^ hdr.qr_chacha_v10.v;
}

// Recirculates
action i11_qr_chacha() {
   hdr.qr_chacha_v4.v = hdr.qr_chacha_v4.v[24:0] ++ hdr.qr_chacha_v4.v[31:25];
   hdr.qr_chacha_v7.v = hdr.qr_chacha_v7.v[24:0] ++ hdr.qr_chacha_v7.v[31:25];
   hdr.qr_chacha_v6.v = hdr.qr_chacha_v6.v[24:0] ++ hdr.qr_chacha_v6.v[31:25];
   hdr.qr_chacha_v5.v = hdr.qr_chacha_v5.v[24:0] ++ hdr.qr_chacha_v5.v[31:25];

   hdr.stream_round.round = hdr.stream_round.round + 1;
   ig_tm_md.ucast_egress_port=68+128;
}

//Skips egress and set to finalization
action i11_qr_chacha_fin() {
   hdr.qr_chacha_v4.v = hdr.qr_chacha_v4.v[24:0] ++ hdr.qr_chacha_v4.v[31:25];
   hdr.qr_chacha_v7.v = hdr.qr_chacha_v7.v[24:0] ++ hdr.qr_chacha_v7.v[31:25];
   hdr.qr_chacha_v6.v = hdr.qr_chacha_v6.v[24:0] ++ hdr.qr_chacha_v6.v[31:25];
   hdr.qr_chacha_v5.v = hdr.qr_chacha_v5.v[24:0] ++ hdr.qr_chacha_v5.v[31:25];

   ig_tm_md.bypass_egress = 0x1;

   hdr.stream_round.round = hdr.stream_round.round + 128;
   ig_tm_md.ucast_egress_port=68+128;
}