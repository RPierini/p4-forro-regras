action e0_qr() {
   hdr.s0_line0.d = hdr.s0_line0.d + hdr.s0_line1.a;
   hdr.s1_line0.d = hdr.s1_line0.d + hdr.s1_line1.a;
}

action e1_qr() {
   hdr.s0_line0.c = hdr.s0_line0.c ^ hdr.s0_line0.d;
   hdr.s1_line0.c = hdr.s1_line0.c ^ hdr.s1_line0.d;
}

action e2_qr() {
   hdr.s0_line0.b = hdr.s0_line0.b + hdr.s0_line0.c;
   hdr.s1_line0.b = hdr.s1_line0.b + hdr.s1_line0.c;
}

action e3_qr() {
   hdr.s0_line0.b = hdr.s0_line0.b[21:0] ++ hdr.s0_line0.b[31:22];
   hdr.s1_line0.b = hdr.s1_line0.b[21:0] ++ hdr.s1_line0.b[31:22];
}

action e4_qr() {
   hdr.s0_line0.a = hdr.s0_line0.a + hdr.s0_line0.b;
   hdr.s1_line0.a = hdr.s1_line0.a + hdr.s1_line0.b;
}

action e5_qr() {
   hdr.s0_line1.a = hdr.s0_line1.a ^ hdr.s0_line0.a;
   hdr.s1_line1.a = hdr.s1_line1.a ^ hdr.s1_line0.a;
}

action e6_qr() {
   hdr.s0_line0.d = hdr.s0_line0.d + hdr.s0_line1.a;
   hdr.s1_line0.d = hdr.s1_line0.d + hdr.s1_line1.a;
}

action e7_qr() {
   hdr.s0_line0.d = hdr.s0_line0.d[4:0] ++ hdr.s0_line0.d[31:5];
   hdr.s1_line0.d = hdr.s1_line0.d[4:0] ++ hdr.s1_line0.d[31:5];
}

action e8_qr() {
   hdr.s0_line0.c = hdr.s0_line0.c + hdr.s0_line0.d;
   hdr.s1_line0.c = hdr.s1_line0.c + hdr.s1_line0.d;
}

action e9_qr() {
   hdr.s0_line0.b = hdr.s0_line0.b ^ hdr.s0_line0.c;
   hdr.s1_line0.b = hdr.s1_line0.b ^ hdr.s1_line0.c;
}

action e10_qr() {
   hdr.s0_line0.a = hdr.s0_line0.a + hdr.s0_line0.b;
   hdr.s1_line0.a = hdr.s1_line0.a + hdr.s1_line0.b;
}

action e11_qr() {
   hdr.s0_line0.a = hdr.s0_line0.a[23:0] ++ hdr.s0_line0.a[31:24];
   hdr.s1_line0.a = hdr.s1_line0.a[23:0] ++ hdr.s1_line0.a[31:24];

   hdr.stream_round.round = hdr.stream_round.round + 1;
}