action i0_qr7() {
   hdr.s0_qr7_d.v = hdr.s0_qr7_d.v + hdr.s0_qr7_e.v;
}

action i1_qr7() {
   hdr.s0_qr7_c.v = hdr.s0_qr7_c.v ^ hdr.s0_qr7_d.v;
}

action i2_qr7() {
   hdr.s0_qr7_b.v = hdr.s0_qr7_b.v + hdr.s0_qr7_c.v;
}

action i3_qr7() {
   hdr.s0_qr7_b.v = hdr.s0_qr7_b.v[21:0] ++ hdr.s0_qr7_b.v[31:22];
}

action i4_qr7() {
   hdr.s0_qr7_a.v = hdr.s0_qr7_a.v + hdr.s0_qr7_b.v;
}

action i5_qr7() {
   hdr.s0_qr7_e.v = hdr.s0_qr7_e.v ^ hdr.s0_qr7_a.v;
}

action i6_qr7() {
   hdr.s0_qr7_d.v = hdr.s0_qr7_d.v + hdr.s0_qr7_e.v;
}

action i7_qr7() {
   hdr.s0_qr7_d.v = hdr.s0_qr7_d.v[4:0] ++ hdr.s0_qr7_d.v[31:5];
}

action i8_qr7() {
   hdr.s0_qr7_c.v = hdr.s0_qr7_c.v + hdr.s0_qr7_d.v;
}

action i9_qr7() {
   hdr.s0_qr7_b.v = hdr.s0_qr7_b.v ^ hdr.s0_qr7_c.v;
}

action i10_qr7() {
   hdr.s0_qr7_a.v = hdr.s0_qr7_a.v + hdr.s0_qr7_b.v;
}

// Uses second recirculation port (QRs 3 and 7)
action i11_qr7() {
   hdr.s0_qr7_a.v = hdr.s0_qr7_a.v[23:0] ++ hdr.s0_qr7_a.v[31:24];
   hdr.s0_qr7_v2.v = hdr.s0_qr7_e.v;
   hdr.s0_qr7_a.v = hdr.s0_qr7_t3.v;

   hdr.stream_round.round = hdr.stream_round.round + 1;
   ig_tm_md.ucast_egress_port=68+128;
}