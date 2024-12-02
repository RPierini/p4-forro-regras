action i0_qr4() {
   hdr.qr4_d.v = hdr.qr4_d.v + hdr.qr4_e.v;
}

action i1_qr4() {
   hdr.qr4_c.v = hdr.qr4_c.v ^ hdr.qr4_d.v;
}

action i2_qr4() {
   hdr.qr4_b.v = hdr.qr4_b.v + hdr.qr4_c.v;
}

action i3_qr4() {
   hdr.qr4_b.v = hdr.qr4_b.v[21:0] ++ hdr.qr4_b.v[31:22];
}

action i4_qr4() {
   hdr.qr4_a.v = hdr.qr4_a.v + hdr.qr4_b.v;
}

action i5_qr4() {
   hdr.qr4_e.v = hdr.qr4_e.v ^ hdr.qr4_a.v;
}

action i6_qr4() {
   hdr.qr4_d.v = hdr.qr4_d.v + hdr.qr4_e.v;
}

action i7_qr4() {
   hdr.qr4_d.v = hdr.qr4_d.v[4:0] ++ hdr.qr4_d.v[31:5];
}

action i8_qr4() {
   hdr.qr4_c.v = hdr.qr4_c.v + hdr.qr4_d.v;
}

action i9_qr4() {
   hdr.qr4_b.v = hdr.qr4_b.v ^ hdr.qr4_c.v;
}

action i10_qr4() {
   hdr.qr4_a.v = hdr.qr4_a.v + hdr.qr4_b.v;
}

action i11_qr4() {
   hdr.qr4_a.v = hdr.qr4_a.v[23:0] ++ hdr.qr4_a.v[31:24];

   hdr.stream_round.round = hdr.stream_round.round + 1;
   ig_tm_md.ucast_egress_port=68;
}