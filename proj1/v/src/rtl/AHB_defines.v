
/* AHB-Lite encodings */

/* Transfer types (htrans) */
`define IDLE          2'h0
`define BUSY          2'h1
`define NONSEQ        2'h2
`define SEQ           2'h3

/* Transfer sizes (hsize) */
`define BYTE          3'h0
`define HALF_WORD     3'h1
`define WORD          3'h2
`define DOUBLE_WORD   3'h3
`define FOUR_WORD     3'h4
`define EIGHT_WORD    3'h5
`define BYTE_512      3'h6
`define BYTE_1024     3'h7

/* Burst types (hburst) */
`define SINGLE        3'h0
`define INCR          3'h1
`define WRAP4         3'h2
`define INCR4         3'h3
`define WRAP8         3'h4
`define INCR8         3'h5
`define WRAP16        3'h6
`define INCR16        3'h7

`define READ          1'h0
`define WRITE         1'h1


