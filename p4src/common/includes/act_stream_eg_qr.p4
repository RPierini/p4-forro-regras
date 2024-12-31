action e0_qr() {
   hdr.s0_line0.d = hdr.s0_line0.d + hdr.s0_line0.e;
}

action e1_qr() {
   hdr.s0_line0.c = hdr.s0_line0.c ^ hdr.s0_line0.d;
}

action e2_qr() {
   hdr.s0_line0.b = hdr.s0_line0.b + hdr.s0_line0.c;
}

action e3_qr() {
   hdr.s0_line0.b = hdr.s0_line0.b[21:0] ++ hdr.s0_line0.b[31:22];
}

action e4_qr() {
   hdr.s0_line0.a = hdr.s0_line0.a + hdr.s0_line0.b;
}

action e5_qr() {
   hdr.s0_line0.e = hdr.s0_line0.e ^ hdr.s0_line0.a;
}

action e6_qr() {
   hdr.s0_line0.d = hdr.s0_line0.d + hdr.s0_line0.e;
}

action e7_qr() {
   hdr.s0_line0.d = hdr.s0_line0.d[4:0] ++ hdr.s0_line0.d[31:5];
}

action e8_qr() {
   hdr.s0_line0.c = hdr.s0_line0.c + hdr.s0_line0.d;
}

action e9_qr() {
   hdr.s0_line0.b = hdr.s0_line0.b ^ hdr.s0_line0.c;
}

action e10_qr() {
   meta.s0_line0_a = hdr.s0_line0.a + hdr.s0_line0.b;
}

action e11_qr() {
   hdr.s0_line0.a = meta.s0_line0_a[23:0] ++ meta.s0_line0_a[31:24];

   //updating E for next QR with current QR's A value.
   hdr.s0_line1.e = meta.s0_line0_a[23:0] ++ meta.s0_line0_a[31:24]; //qr0: t0 = v0; qr2: t2 = v2; qr4: t0 = v0; qr6: t3 = v3;

   hdr.stream_round.round = hdr.stream_round.round + 1;
}