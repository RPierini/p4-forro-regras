action i0_qr15() {
   hdr.s0_qr15_line0.d = hdr.s0_qr15_line0.d + hdr.s0_qr15_line0.e;
}

action i1_qr15() {
   hdr.s0_qr15_line0.c = hdr.s0_qr15_line0.c ^ hdr.s0_qr15_line0.d;
}

action i2_qr15() {
   hdr.s0_qr15_line0.b = hdr.s0_qr15_line0.b + hdr.s0_qr15_line0.c;
}

action i3_qr15() {
   hdr.s0_qr15_line0.b = hdr.s0_qr15_line0.b[21:0] ++ hdr.s0_qr15_line0.b[31:22];
}

action i4_qr15() {
   hdr.s0_qr15_line0.a = hdr.s0_qr15_line0.a + hdr.s0_qr15_line0.b;
}

action i5_qr15() {
   hdr.s0_qr15_line0.e = hdr.s0_qr15_line0.e ^ hdr.s0_qr15_line0.a;
}

action i6_qr15() {
   hdr.s0_qr15_line0.d = hdr.s0_qr15_line0.d + hdr.s0_qr15_line0.e;
}

action i7_qr15() {
   hdr.s0_qr15_line0.d = hdr.s0_qr15_line0.d[4:0] ++ hdr.s0_qr15_line0.d[31:5];
}

action i8_qr15() {
   hdr.s0_qr15_line0.c = hdr.s0_qr15_line0.c + hdr.s0_qr15_line0.d;
}

action i9_qr15() {
   hdr.s0_qr15_line0.b = hdr.s0_qr15_line0.b ^ hdr.s0_qr15_line0.c;
}

action i10_qr15() {
   meta.s0_a = hdr.s0_qr15_line0.a + hdr.s0_qr15_line0.b;
}

// Uses first recirculation port (QRs 1 and 5)
action i11_qr15() {
   hdr.s0_qr15_line0.a = meta.s0_a[23:0] ++ meta.s0_a[31:24]; //rotating A

   //updating next QR's E with this QR's A value.
   hdr.s0_qr15_line2.e = meta.s0_a[23:0] ++ meta.s0_a[31:24]; //t1 = v1

   //updating next QR's A with this QR's E
   hdr.s0_qr15_line1.a = hdr.s0_qr15_line0.e; //v0 = t0

   //Updating last QR's A from last QR's E;
   hdr.s0_qr15_line3.a = hdr.s0_qr15_line1.e; //v3 = t3

   hdr.stream_round.round = hdr.stream_round.round + 1;
   ig_tm_md.ucast_egress_port=68;
}