action i0_qr6() {
   hdr.stream_state.v13 = hdr.stream_state.v13 + hdr.stream_state.v1;
}

action i1_qr6() {
   hdr.stream_state.v8 = hdr.stream_state.v8 ^ hdr.stream_state.v13;
}

action i2_qr6() {
   hdr.stream_state.v7 = hdr.stream_state.v7 + hdr.stream_state.v8;
}

action i3_qr6() {
   hdr.stream_state.v7 = hdr.stream_state.v7[21:0] ++ hdr.stream_state.v7[31:22];
}

action i4_qr6() {
   hdr.stream_state.v2 = hdr.stream_state.v2 + hdr.stream_state.v7;
}

action i5_qr6() {
   hdr.stream_state.v1 = hdr.stream_state.v1 ^ hdr.stream_state.v2;
}

action i6_qr6() {
   hdr.stream_state.v13 = hdr.stream_state.v13 + hdr.stream_state.v1;
}

action i7_qr6() {
   hdr.stream_state.v13 = hdr.stream_state.v13[4:0] ++ hdr.stream_state.v13[31:5];
}

action i8_qr6() {
   hdr.stream_state.v8 = hdr.stream_state.v8 + hdr.stream_state.v13;
}

action i9_qr6() {
   hdr.stream_state.v7 = hdr.stream_state.v7 ^ hdr.stream_state.v8;
}

action i10_qr6() {
   hdr.stream_state.v2 = hdr.stream_state.v2 + hdr.stream_state.v7;
}

action i11_qr6() {
   hdr.stream_state.v2 = hdr.stream_state.v2[23:0] ++ hdr.stream_state.v2[31:24];
   hdr.stream_round.round = hdr.stream_round.round + 1;
   ig_tm_md.ucast_egress_port=68+128;
}