action i0_qr15_chacha() {
   hdr.s0_qr15_line0.a = hdr.s0_qr15_line0.a + hdr.s0_qr15_line0.b;
   hdr.s0_qr15_line1.a = hdr.s0_qr15_line1.a + hdr.s0_qr15_line1.b;
   hdr.s0_qr15_line2.a = hdr.s0_qr15_line2.a + hdr.s0_qr15_line2.b;
   hdr.s0_qr15_line3.a = hdr.s0_qr15_line3.a + hdr.s0_qr15_line3.b;
}

action i1_qr15_chacha() {
   hdr.s0_qr15_line0.d = hdr.s0_qr15_line0.d ^ hdr.s0_qr15_line0.a;
   hdr.s0_qr15_line1.d = hdr.s0_qr15_line1.d ^ hdr.s0_qr15_line1.a;
   hdr.s0_qr15_line2.d = hdr.s0_qr15_line2.d ^ hdr.s0_qr15_line2.a;
   hdr.s0_qr15_line3.d = hdr.s0_qr15_line3.d ^ hdr.s0_qr15_line3.a;
}

action i2_qr15_chacha() {
   hdr.s0_qr15_line0.d = hdr.s0_qr15_line0.d[15:0] ++ hdr.s0_qr15_line0.d[31:16];
   hdr.s0_qr15_line1.d = hdr.s0_qr15_line1.d[15:0] ++ hdr.s0_qr15_line1.d[31:16];
   hdr.s0_qr15_line2.d = hdr.s0_qr15_line2.d[15:0] ++ hdr.s0_qr15_line2.d[31:16];
   hdr.s0_qr15_line3.d = hdr.s0_qr15_line3.d[15:0] ++ hdr.s0_qr15_line3.d[31:16];
}

action i3_qr15_chacha() {
   hdr.s0_qr15_line0.c = hdr.s0_qr15_line0.c + hdr.s0_qr15_line0.d;
   hdr.s0_qr15_line1.c = hdr.s0_qr15_line1.c + hdr.s0_qr15_line1.d;
   hdr.s0_qr15_line2.c = hdr.s0_qr15_line2.c + hdr.s0_qr15_line2.d;
   hdr.s0_qr15_line3.c = hdr.s0_qr15_line3.c + hdr.s0_qr15_line3.d;
}

action i4_qr15_chacha() {
   hdr.s0_qr15_line0.b = hdr.s0_qr15_line0.b ^ hdr.s0_qr15_line0.c;
   hdr.s0_qr15_line1.b = hdr.s0_qr15_line1.b ^ hdr.s0_qr15_line1.c;
   hdr.s0_qr15_line2.b = hdr.s0_qr15_line2.b ^ hdr.s0_qr15_line2.c;
   hdr.s0_qr15_line3.b = hdr.s0_qr15_line3.b ^ hdr.s0_qr15_line3.c;
}

action i5_qr15_chacha() {
   hdr.s0_qr15_line0.b = hdr.s0_qr15_line0.b[19:0] ++ hdr.s0_qr15_line0.b[31:20];
   hdr.s0_qr15_line1.b = hdr.s0_qr15_line1.b[19:0] ++ hdr.s0_qr15_line1.b[31:20];
   hdr.s0_qr15_line2.b = hdr.s0_qr15_line2.b[19:0] ++ hdr.s0_qr15_line2.b[31:20];
   hdr.s0_qr15_line3.b = hdr.s0_qr15_line3.b[19:0] ++ hdr.s0_qr15_line3.b[31:20];
}

action i6_qr15_chacha() {
   hdr.s0_qr15_line0.a = hdr.s0_qr15_line0.a + hdr.s0_qr15_line0.b;
   hdr.s0_qr15_line1.a = hdr.s0_qr15_line1.a + hdr.s0_qr15_line1.b;
   hdr.s0_qr15_line2.a = hdr.s0_qr15_line2.a + hdr.s0_qr15_line2.b;
   hdr.s0_qr15_line3.a = hdr.s0_qr15_line3.a + hdr.s0_qr15_line3.b;
}

action i7_qr15_chacha() {
   hdr.s0_qr15_line0.d = hdr.s0_qr15_line0.d ^ hdr.s0_qr15_line0.a;
   hdr.s0_qr15_line1.d = hdr.s0_qr15_line1.d ^ hdr.s0_qr15_line1.a;
   hdr.s0_qr15_line2.d = hdr.s0_qr15_line2.d ^ hdr.s0_qr15_line2.a;
   hdr.s0_qr15_line3.d = hdr.s0_qr15_line3.d ^ hdr.s0_qr15_line3.a;
}

action i8_qr15_chacha() {
   hdr.s0_qr15_line0.d = hdr.s0_qr15_line0.d[23:0] ++ hdr.s0_qr15_line0.d[31:24];
   hdr.s0_qr15_line1.d = hdr.s0_qr15_line1.d[23:0] ++ hdr.s0_qr15_line1.d[31:24];
   hdr.s0_qr15_line2.d = hdr.s0_qr15_line2.d[23:0] ++ hdr.s0_qr15_line2.d[31:24];
   hdr.s0_qr15_line3.d = hdr.s0_qr15_line3.d[23:0] ++ hdr.s0_qr15_line3.d[31:24];
}

action i9_qr15_chacha() {
   hdr.s0_qr15_line0.c = hdr.s0_qr15_line0.c + hdr.s0_qr15_line0.d;
   hdr.s0_qr15_line1.c = hdr.s0_qr15_line1.c + hdr.s0_qr15_line1.d;
   hdr.s0_qr15_line2.c = hdr.s0_qr15_line2.c + hdr.s0_qr15_line2.d;
   hdr.s0_qr15_line3.c = hdr.s0_qr15_line3.c + hdr.s0_qr15_line3.d;
}

action i10_qr15_chacha() {
   hdr.s0_qr15_line0.b = hdr.s0_qr15_line0.b ^ hdr.s0_qr15_line0.c;
   hdr.s0_qr15_line1.b = hdr.s0_qr15_line1.b ^ hdr.s0_qr15_line1.c;
   hdr.s0_qr15_line2.b = hdr.s0_qr15_line2.b ^ hdr.s0_qr15_line2.c;
   hdr.s0_qr15_line3.b = hdr.s0_qr15_line3.b ^ hdr.s0_qr15_line3.c;
}

// Uses first recirculation port (QRs 1 and 5)
action i11_qr15_chacha() {
   hdr.s0_qr15_line0.b = hdr.s0_qr15_line0.b[24:0] ++ hdr.s0_qr15_line0.b[31:25];
   hdr.s0_qr15_line1.b = hdr.s0_qr15_line1.b[24:0] ++ hdr.s0_qr15_line1.b[31:25];
   hdr.s0_qr15_line2.b = hdr.s0_qr15_line2.b[24:0] ++ hdr.s0_qr15_line2.b[31:25];
   hdr.s0_qr15_line3.b = hdr.s0_qr15_line3.b[24:0] ++ hdr.s0_qr15_line3.b[31:25];

   hdr.stream_round.round = hdr.stream_round.round + 1;
   ig_tm_md.ucast_egress_port=68;
}