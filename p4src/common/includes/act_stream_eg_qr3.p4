action e0_qr3() {
   hdr.stream_state.v15 = hdr.stream_state.v15 + hdr.stream_state.v2;
}

action e1_qr3() {
   hdr.stream_state.v11 = hdr.stream_state.v11 ^ hdr.stream_state.v15;
}

action e2_qr3() {
   hdr.stream_state.v7 = hdr.stream_state.v7 + hdr.stream_state.v11;
}

action e3_qr3() {
   hdr.stream_state.v7 = hdr.stream_state.v7[21:0] ++ hdr.stream_state.v7[31:22];
}

action e4_qr3() {
   hdr.stream_state.v3 = hdr.stream_state.v3 + hdr.stream_state.v7;
}

action e5_qr3() {
   hdr.stream_state.v2 = hdr.stream_state.v2 ^ hdr.stream_state.v3;
}

action e6_qr3() {
   hdr.stream_state.v15 = hdr.stream_state.v15 + hdr.stream_state.v2;
}

action e7_qr3() {
   hdr.stream_state.v15 = hdr.stream_state.v15[4:0] ++ hdr.stream_state.v15[31:5];
}

action e8_qr3() {
   hdr.stream_state.v11 = hdr.stream_state.v11 + hdr.stream_state.v15;
}

action e9_qr3() {
   hdr.stream_state.v7 = hdr.stream_state.v7 ^ hdr.stream_state.v11;
}

action e10_qr3() {
   hdr.stream_state.v3 = hdr.stream_state.v3 + hdr.stream_state.v7;
}

action e11_qr3() {
   hdr.stream_state.v3 = hdr.stream_state.v3[23:0] ++ hdr.stream_state.v3[31:24];

   hdr.stream_round.round = hdr.stream_round.round + 1;
}