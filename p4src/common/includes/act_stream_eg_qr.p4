action e0_qr_chacha() {
   hdr.s0_line0.a = hdr.s0_line0.a + hdr.s0_line0.b;
   hdr.s0_line1.a = hdr.s0_line1.a + hdr.s0_line1.b;
   hdr.s0_line2.a = hdr.s0_line2.a + hdr.s0_line2.b;
   hdr.s0_line3.a = hdr.s0_line3.a + hdr.s0_line3.b;
}

action e1_qr_chacha() {
   hdr.s0_line0.d = hdr.s0_line0.d ^ hdr.s0_line0.a;
   hdr.s0_line1.d = hdr.s0_line1.d ^ hdr.s0_line1.a;
   hdr.s0_line2.d = hdr.s0_line2.d ^ hdr.s0_line2.a;
   hdr.s0_line3.d = hdr.s0_line3.d ^ hdr.s0_line3.a;
}

action e2_qr_chacha() {
   hdr.s0_line0.d = hdr.s0_line0.d[15:0] ++ hdr.s0_line0.d[31:16];
   hdr.s0_line1.d = hdr.s0_line1.d[15:0] ++ hdr.s0_line1.d[31:16];
   hdr.s0_line2.d = hdr.s0_line2.d[15:0] ++ hdr.s0_line2.d[31:16];
   hdr.s0_line3.d = hdr.s0_line3.d[15:0] ++ hdr.s0_line3.d[31:16];
}

action e3_qr_chacha() {
   hdr.s0_line0.c = hdr.s0_line0.c + hdr.s0_line0.d;
   hdr.s0_line1.c = hdr.s0_line1.c + hdr.s0_line1.d;
   hdr.s0_line2.c = hdr.s0_line2.c + hdr.s0_line2.d;
   hdr.s0_line3.c = hdr.s0_line3.c + hdr.s0_line3.d;
}

action e4_qr_chacha() {
   hdr.s0_line0.b = hdr.s0_line0.b ^ hdr.s0_line0.c;
   hdr.s0_line1.b = hdr.s0_line1.b ^ hdr.s0_line1.c;
   hdr.s0_line2.b = hdr.s0_line2.b ^ hdr.s0_line2.c;
   hdr.s0_line3.b = hdr.s0_line3.b ^ hdr.s0_line3.c;
}

action e5_qr_chacha() {
   hdr.s0_line0.b = hdr.s0_line0.b[19:0] ++ hdr.s0_line0.b[31:20];
   hdr.s0_line1.b = hdr.s0_line1.b[19:0] ++ hdr.s0_line1.b[31:20];
   hdr.s0_line2.b = hdr.s0_line2.b[19:0] ++ hdr.s0_line2.b[31:20];
   hdr.s0_line3.b = hdr.s0_line3.b[19:0] ++ hdr.s0_line3.b[31:20];
}

action e6_qr_chacha() {
   hdr.s0_line0.a = hdr.s0_line0.a + hdr.s0_line0.b;
   hdr.s0_line1.a = hdr.s0_line1.a + hdr.s0_line1.b;
   hdr.s0_line2.a = hdr.s0_line2.a + hdr.s0_line2.b;
   hdr.s0_line3.a = hdr.s0_line3.a + hdr.s0_line3.b;
}

action e7_qr_chacha() {
   hdr.s0_line0.d = hdr.s0_line0.d ^ hdr.s0_line0.a;
   hdr.s0_line1.d = hdr.s0_line1.d ^ hdr.s0_line1.a;
   hdr.s0_line2.d = hdr.s0_line2.d ^ hdr.s0_line2.a;
   hdr.s0_line3.d = hdr.s0_line3.d ^ hdr.s0_line3.a;
}

action e8_qr_chacha() {
   hdr.s0_line0.d = hdr.s0_line0.d[23:0] ++ hdr.s0_line0.d[31:24];
   hdr.s0_line1.d = hdr.s0_line1.d[23:0] ++ hdr.s0_line1.d[31:24];
   hdr.s0_line2.d = hdr.s0_line2.d[23:0] ++ hdr.s0_line2.d[31:24];
   hdr.s0_line3.d = hdr.s0_line3.d[23:0] ++ hdr.s0_line3.d[31:24];
}

action e9_qr_chacha() {
   hdr.s0_line0.c = hdr.s0_line0.c + hdr.s0_line0.d;
   hdr.s0_line1.c = hdr.s0_line1.c + hdr.s0_line1.d;
   hdr.s0_line2.c = hdr.s0_line2.c + hdr.s0_line2.d;
   hdr.s0_line3.c = hdr.s0_line3.c + hdr.s0_line3.d;
}

action e10_qr_chacha() {
   hdr.s0_line0.b = hdr.s0_line0.b ^ hdr.s0_line0.c;
   hdr.s0_line1.b = hdr.s0_line1.b ^ hdr.s0_line1.c;
   hdr.s0_line2.b = hdr.s0_line2.b ^ hdr.s0_line2.c;
   hdr.s0_line3.b = hdr.s0_line3.b ^ hdr.s0_line3.c;
}

action e11_qr_chacha() {
   hdr.s0_line0.b = hdr.s0_line0.b[24:0] ++ hdr.s0_line0.b[31:25];
   hdr.s0_line1.b = hdr.s0_line1.b[24:0] ++ hdr.s0_line1.b[31:25];
   hdr.s0_line2.b = hdr.s0_line2.b[24:0] ++ hdr.s0_line2.b[31:25];
   hdr.s0_line3.b = hdr.s0_line3.b[24:0] ++ hdr.s0_line3.b[31:25];

   hdr.stream_round.round = hdr.stream_round.round + 1;
}