action i0_qr0() {
   hdr.qr0_d.v = hdr.qr0_d.v + hdr.qr0_e.v;
}

action i1_qr0() {
   hdr.qr0_c.v = hdr.qr0_c.v ^ hdr.qr0_d.v;
}

action i2_qr0() {
   hdr.qr0_b.v = hdr.qr0_b.v + hdr.qr0_c.v;
}

action i3_qr0() {
   hdr.qr0_b.v = hdr.qr0_b.v[21:0] ++ hdr.qr0_b.v[31:22];
}

action i4_qr0() {
   hdr.qr0_a.v = hdr.qr0_a.v + hdr.qr0_b.v;
}

action i5_qr0() {
   hdr.qr0_e.v = hdr.qr0_e.v ^ hdr.qr0_a.v;
}

action i6_qr0() {
   hdr.qr0_d.v = hdr.qr0_d.v + hdr.qr0_e.v;
}

action i7_qr0() {
   hdr.qr0_d.v = hdr.qr0_d.v[4:0] ++ hdr.qr0_d.v[31:5];
}

action i8_qr0() {
   hdr.qr0_c.v = hdr.qr0_c.v + hdr.qr0_d.v;
}

action i9_qr0() {
   hdr.qr0_b.v = hdr.qr0_b.v ^ hdr.qr0_c.v;
}

action i10_qr0() {
   hdr.qr0_a.v = hdr.qr0_a.v + hdr.qr0_b.v;
}

action i11_qr0() {
   hdr.qr0_a.v = hdr.qr0_a.v[23:0] ++ hdr.qr0_a.v[31:24];

   hdr.stream_round.round = hdr.stream_round.round + 1;
   ig_tm_md.ucast_egress_port=68;
}