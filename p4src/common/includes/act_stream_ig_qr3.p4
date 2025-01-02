action i0_qr3() {
   hdr.s0_qr3_d.v = hdr.s0_qr3_d.v + hdr.s0_qr3_e.v;
   hdr.s1_qr3_d.v = hdr.s1_qr3_d.v + hdr.s1_qr3_e.v;
}

action i1_qr3() {
   hdr.s0_qr3_c.v = hdr.s0_qr3_c.v ^ hdr.s0_qr3_d.v;
   hdr.s1_qr3_c.v = hdr.s1_qr3_c.v ^ hdr.s1_qr3_d.v;
}

action i2_qr3() {
   hdr.s0_qr3_b.v = hdr.s0_qr3_b.v + hdr.s0_qr3_c.v;
   hdr.s1_qr3_b.v = hdr.s1_qr3_b.v + hdr.s1_qr3_c.v;
}

action i3_qr3() {
   hdr.s0_qr3_b.v = hdr.s0_qr3_b.v[21:0] ++ hdr.s0_qr3_b.v[31:22];
   hdr.s1_qr3_b.v = hdr.s1_qr3_b.v[21:0] ++ hdr.s1_qr3_b.v[31:22];
}

action i4_qr3() {
   hdr.s0_qr3_a.v = hdr.s0_qr3_a.v + hdr.s0_qr3_b.v;
   hdr.s1_qr3_a.v = hdr.s1_qr3_a.v + hdr.s1_qr3_b.v;
}

action i5_qr3() {
   hdr.s0_qr3_e.v = hdr.s0_qr3_e.v ^ hdr.s0_qr3_a.v;
   hdr.s1_qr3_e.v = hdr.s1_qr3_e.v ^ hdr.s1_qr3_a.v;
}

action i6_qr3() {
   hdr.s0_qr3_d.v = hdr.s0_qr3_d.v + hdr.s0_qr3_e.v;
   hdr.s1_qr3_d.v = hdr.s1_qr3_d.v + hdr.s1_qr3_e.v;
}

action i7_qr3() {
   hdr.s0_qr3_d.v = hdr.s0_qr3_d.v[4:0] ++ hdr.s0_qr3_d.v[31:5];
   hdr.s1_qr3_d.v = hdr.s1_qr3_d.v[4:0] ++ hdr.s1_qr3_d.v[31:5];
}

action i8_qr3() {
   hdr.s0_qr3_c.v = hdr.s0_qr3_c.v + hdr.s0_qr3_d.v;
   hdr.s1_qr3_c.v = hdr.s1_qr3_c.v + hdr.s1_qr3_d.v;
}

action i9_qr3() {
   hdr.s0_qr3_b.v = hdr.s0_qr3_b.v ^ hdr.s0_qr3_c.v;
   hdr.s1_qr3_b.v = hdr.s1_qr3_b.v ^ hdr.s1_qr3_c.v;
}

action i10_qr3() {
   meta.s0_a = hdr.s0_qr3_a.v + hdr.s0_qr3_b.v;
   meta.s1_a = hdr.s1_qr3_a.v + hdr.s1_qr3_b.v;
}

// Uses second recirculation port (QRs 3 and 7)
action i11_qr3() {
   hdr.s0_qr3_a.v = meta.s0_a[23:0] ++ meta.s0_a[31:24];
   hdr.s1_qr3_a.v = meta.s1_a[23:0] ++ meta.s1_a[31:24];

   //updating next QR's E with this QR's A value.
   hdr.s0_qr3_t3.v = meta.s0_a[23:0] ++ meta.s0_a[31:24];
   hdr.s1_qr3_t3.v = meta.s1_a[23:0] ++ meta.s1_a[31:24];

   //Updating last QR's A from last QR's E;
   hdr.s0_qr3_v1.v = hdr.s0_qr3_t1.v;
   hdr.s1_qr3_v1.v = hdr.s1_qr3_t1.v;

   //updating next QR's A with this QR's E
   hdr.s0_qr3_v2.v = hdr.s0_qr3_e.v;
   hdr.s1_qr3_v2.v = hdr.s1_qr3_e.v;

   hdr.stream_round.round = hdr.stream_round.round + 1;
   ig_tm_md.ucast_egress_port=68+128;
}