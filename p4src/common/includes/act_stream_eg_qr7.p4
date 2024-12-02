action e0_qr7() {
   hdr.qr_d.v = hdr.qr_d.v + hdr.qr_e.v;
}

action e1_qr7() {
   hdr.qr_c.v = hdr.qr_c.v ^ hdr.qr_d.v;
}

action e2_qr7() {
   hdr.qr_b.v = hdr.qr_b.v + hdr.qr_c.v;
}

action e3_qr7() {
   hdr.qr_b.v = hdr.qr_b.v[21:0] ++ hdr.qr_b.v[31:22];
}

action e4_qr7() {
   hdr.qr_a.v = hdr.qr_a.v + hdr.qr_b.v;
}

action e5_qr7() {
   hdr.qr_e.v = hdr.qr_e.v ^ hdr.qr_a.v;
}

action e6_qr7() {
   hdr.qr_d.v = hdr.qr_d.v + hdr.qr_e.v;
}

action e7_qr7() {
   hdr.qr_d.v = hdr.qr_d.v[4:0] ++ hdr.qr_d.v[31:5];
}

action e8_qr7() {
   hdr.qr_c.v = hdr.qr_c.v + hdr.qr_d.v;
}

action e9_qr7() {
   hdr.qr_b.v = hdr.qr_b.v ^ hdr.qr_c.v;
}

action e10_qr7() {
   hdr.qr_a.v = hdr.qr_a.v + hdr.qr_b.v;
}

action e11_qr7() {
   hdr.qr_a.v = hdr.qr_a.v[23:0] ++ hdr.qr_a.v[31:24];
   hdr.stream_round.round = hdr.stream_round.round + 1;
}

action e11_qr7_fin() {
   hdr.qr_a.v = hdr.qr_a.v[23:0] ++ hdr.qr_a.v[31:24];

   hdr.stream_round.round = hdr.stream_round.round + 128;
}