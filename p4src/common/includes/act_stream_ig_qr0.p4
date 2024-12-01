action i0_qr0() {
   hdr.stream_state.v12 = hdr.stream_state.v12 + hdr.stream_state.v3;
}

action i1_qr0() {
   hdr.stream_state.v8 = hdr.stream_state.v8 ^ hdr.stream_state.v12;
}

action i2_qr0() {
   hdr.stream_state.v4 = hdr.stream_state.v4 + hdr.stream_state.v8;
}

action i3_qr0() {
   hdr.stream_state.v4 = hdr.stream_state.v4[21:0] ++ hdr.stream_state.v4[31:22];
}

action i4_qr0() {
   hdr.stream_state.v0 = hdr.stream_state.v0 + hdr.stream_state.v4;
}

action i5_qr0() {
   hdr.stream_state.v3 = hdr.stream_state.v3 ^ hdr.stream_state.v0;
}

action i6_qr0() {
   hdr.stream_state.v12 = hdr.stream_state.v12 + hdr.stream_state.v3;
}

action i7_qr0() {
   hdr.stream_state.v12 = hdr.stream_state.v12[4:0] ++ hdr.stream_state.v12[31:5];
}

action i8_qr0() {
   hdr.stream_state.v8 = hdr.stream_state.v8 + hdr.stream_state.v12;
}

action i9_qr0() {
   hdr.stream_state.v4 = hdr.stream_state.v4 ^ hdr.stream_state.v8;
}

action i10_qr0() {
   hdr.stream_state.v0 = hdr.stream_state.v0 + hdr.stream_state.v4;
}

action i11_qr0() {
   hdr.stream_state.v0 = hdr.stream_state.v0[23:0] ++ hdr.stream_state.v0[31:24];

   hdr.stream_round.round = hdr.stream_round.round + 1;
   ig_tm_md.ucast_egress_port=68;
}