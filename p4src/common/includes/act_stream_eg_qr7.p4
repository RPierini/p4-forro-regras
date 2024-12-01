action e0_qr7() {
   hdr.stream_state.v14 = hdr.stream_state.v14 + hdr.stream_state.v2;
}

action e1_qr7() {
   hdr.stream_state.v9 = hdr.stream_state.v9 ^ hdr.stream_state.v14;
}

action e2_qr7() {
   hdr.stream_state.v4 = hdr.stream_state.v4 + hdr.stream_state.v9;
}

action e3_qr7() {
   hdr.stream_state.v4 = hdr.stream_state.v4[21:0] ++ hdr.stream_state.v4[31:22];
}

action e4_qr7() {
   hdr.stream_state.v3 = hdr.stream_state.v3 + hdr.stream_state.v4;
}

action e5_qr7() {
   hdr.stream_state.v2 = hdr.stream_state.v2 ^ hdr.stream_state.v3;
}

action e6_qr7() {
   hdr.stream_state.v14 = hdr.stream_state.v14 + hdr.stream_state.v2;
}

action e7_qr7() {
   hdr.stream_state.v14 = hdr.stream_state.v14[4:0] ++ hdr.stream_state.v14[31:5];
}

action e8_qr7() {
   hdr.stream_state.v9 = hdr.stream_state.v9 + hdr.stream_state.v14;
}

action e9_qr7() {
   hdr.stream_state.v4 = hdr.stream_state.v4 ^ hdr.stream_state.v9;
}

action e10_qr7() {
   hdr.stream_state.v3 = hdr.stream_state.v3 + hdr.stream_state.v4;
}

action e11_qr7() {
   hdr.stream_state.v3 = hdr.stream_state.v3[23:0] ++ hdr.stream_state.v3[31:24];
   hdr.stream_round.round = hdr.stream_round.round + 1;
}

action e11_qr7_fin() {
   hdr.stream_state.v3 = hdr.stream_state.v3[23:0] ++ hdr.stream_state.v3[31:24];

   hdr.stream_round.round = hdr.stream_round.round + 128;
}