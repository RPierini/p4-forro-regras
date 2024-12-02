action i0_qr6() {
   hdr.qr26_d.v = hdr.qr26_d.v + hdr.qr26_e.v;
}

action i1_qr6() {
   hdr.qr26_c.v = hdr.qr26_c.v ^ hdr.qr26_d.v;
}

action i2_qr6() {
   hdr.qr26_b.v = hdr.qr26_b.v + hdr.qr26_c.v;
}

action i3_qr6() {
   hdr.qr26_b.v = hdr.qr26_b.v[21:0] ++ hdr.qr26_b.v[31:22];
}

action i4_qr6() {
   hdr.qr26_a.v = hdr.qr26_a.v + hdr.qr26_b.v;
}

action i5_qr6() {
   hdr.qr26_e.v = hdr.qr26_e.v ^ hdr.qr26_a.v;
}

action i6_qr6() {
   hdr.qr26_d.v = hdr.qr26_d.v + hdr.qr26_e.v;
}

action i7_qr6() {
   hdr.qr26_d.v = hdr.qr26_d.v[4:0] ++ hdr.qr26_d.v[31:5];
}

action i8_qr6() {
   hdr.qr26_c.v = hdr.qr26_c.v + hdr.qr26_d.v;
}

action i9_qr6() {
   hdr.qr26_b.v = hdr.qr26_b.v ^ hdr.qr26_c.v;
}

action i10_qr6() {
   hdr.qr26_a.v = hdr.qr26_a.v + hdr.qr26_b.v;
}

action i11_qr6() {
   hdr.qr26_a.v = hdr.qr26_a.v[23:0] ++ hdr.qr26_a.v[31:24];
   hdr.stream_round.round = hdr.stream_round.round + 1;
   ig_tm_md.ucast_egress_port=68+128;
}