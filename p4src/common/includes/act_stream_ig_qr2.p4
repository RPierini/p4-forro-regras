action i0_qr2() {
   hdr.stream_state.v14 = hdr.stream_state.v14 + hdr.stream_state.v1;
}

action i1_qr2() {
   hdr.stream_state.v10 = hdr.stream_state.v10 ^ hdr.stream_state.v14;
}

action i2_qr2() {
   hdr.stream_state.v6 = hdr.stream_state.v6 + hdr.stream_state.v10;
}

action i3_qr2() {
   hdr.stream_state.v6 = hdr.stream_state.v6[21:0] ++ hdr.stream_state.v6[31:22];
}

action i4_qr2() {
   hdr.stream_state.v2 = hdr.stream_state.v2 + hdr.stream_state.v6;
}

action i5_qr2() {
   hdr.stream_state.v1 = hdr.stream_state.v1 ^ hdr.stream_state.v2;
}

action i6_qr2() {
   hdr.stream_state.v14 = hdr.stream_state.v14 + hdr.stream_state.v1;
}

action i7_qr2() {
   hdr.stream_state.v14 = hdr.stream_state.v14[4:0] ++ hdr.stream_state.v14[31:5];
}

action i8_qr2() {
   hdr.stream_state.v10 = hdr.stream_state.v10 + hdr.stream_state.v14;
}

action i9_qr2() {
   hdr.stream_state.v6 = hdr.stream_state.v6 ^ hdr.stream_state.v10;
}

action i10_qr2() {
   hdr.stream_state.v2 = hdr.stream_state.v2 + hdr.stream_state.v6;
}

action i11_qr2() {
   hdr.stream_state.v2 = hdr.stream_state.v2[23:0] ++ hdr.stream_state.v2[31:24];

   hdr.stream_round.round = hdr.stream_round.round + 1;
   ig_tm_md.ucast_egress_port=68+128;
}