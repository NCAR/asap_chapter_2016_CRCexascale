X_LIMIT=15.93 # Do not touch this
FACTOR=1 # Do not touch this

set datafile separator ";";

# set term postscript eps solid color;
# set term pdfcairo solid color lw 2;
# set term png size 800,600;
#set term wxt size 800,600;

set multiplot title "Appl * Task * Thread * - Group_0 - Unresolved"

##############################
## Routines part 
##############################

samplecls(ret,r,g,t) = (r eq 'Unresolved' && g == 0  && t eq 'cl') ? ret : NaN;

set size 1,0.20;
set origin 0,0.75;

set bmargin 0; set lmargin 14; set rmargin 17;

set xlabel "ghost" tc rgbcolor "white";
set ylabel "ghost" tc rgbcolor "white";
#set y2label "Code line";
set label 'Code line' at screen 0.975, screen 0.8+(0.175/2) rotate by -90 center;
set label "bottom" at second 1.005, first 0;
set label "top"    at second 1.005, first 1;
set xrange [0:X_LIMIT*1./FACTOR];
set x2range [0:1];
set yrange [0:1];
set y2range [0:*] reverse;
set ytics tc rgbcolor "white" (0.001) format "%0.2f";
set y2tics 100 tc rgbcolor "white" format "0000";
unset xtics;
unset x2tics;

set obj rect from graph 0.000*FACTOR, graph 0 to graph 0.169*FACTOR, graph 1 fs transparent solid 0.33 noborder fc rgbcolor '#ff0000' behind # Routine: End 16.851%
set obj rect from graph 0.169*FACTOR, graph 0 to graph 1.000*FACTOR, graph 1 fs transparent solid 0.33 noborder fc rgbcolor '#00ff00' behind # Routine: __kmp_ge..d_id_reg [__kmp_get_global_thread_id_reg] 83.149%

# Summary for routine __kmp_ge..d_id_reg [__kmp_get_global_thread_id_reg] 83.149%

set label center "__kmp_ge..d_id_reg [__kmp_get_global_thread_id_reg]\n[253]" at second 0.584*FACTOR, graph 0.5 rotate by 90 tc rgbcolor 'black' front

plot "perfTest.codeblocks.fused.any.any.any.dump.csv" u ($4*FACTOR):(samplecls($5,strcol(2),$3,strcol(1))) with points axes x2y2 ti '' lc rgbcolor '#ff2090' pt 7 ps 0.5;

unset label; unset xlabel; unset x2label; unset ylabel; unset y2label;
unset xtics; unset x2tics; unset ytics; unset y2tics; set y2tics autofreq;
unset xrange; unset x2range; unset yrange; unset y2range;
unset tmargin; unset bmargin; unset lmargin; unset rmargin
unset label;
unset arrow;
unset obj;

set size 1,0.73;
set origin 0,0;
set tmargin 0; set lmargin 14; set rmargin 17;

set key bottom outside center horizontal samplen 1;
set x2range [0:1];
set yrange [0:3.5];
set y2range [0:6000];
#set x2tics nomirror format "%.02f";
set xlabel 'Time (ms)';
set xtics nomirror format "%.02f";
set xtics ( 0.0 , 1./5.*X_LIMIT, 2./5.*X_LIMIT, 3./5.*X_LIMIT, 4./5.*X_LIMIT, 5./5.*X_LIMIT, X_LIMIT/FACTOR);
set xrange [0:X_LIMIT*1./FACTOR];
set ylabel 'Counter ratio per instruction';
set y2label 'MIPS';
set ytics nomirror format "%g";
set y2tics nomirror format "%g";

# Breakpoints
# Unneeded phases separators, nb. breakpoints = 2

slope_PAPI_BR_INS(ret,c,r,g) = (c eq 'PAPI_BR_INS' && r eq 'Unresolved' && g == 0 ) ? ret : NaN;
ratio_PAPI_BR_INS(ret,c,r,g) = (c eq 'PAPI_BR_INS_per_ins' && r eq 'Unresolved' && g == 0 ) ? ret : NaN;
slope_PAPI_DP_OPS(ret,c,r,g) = (c eq 'PAPI_DP_OPS' && r eq 'Unresolved' && g == 0 ) ? ret : NaN;
ratio_PAPI_DP_OPS(ret,c,r,g) = (c eq 'PAPI_DP_OPS_per_ins' && r eq 'Unresolved' && g == 0 ) ? ret : NaN;
slope_PAPI_L1_DCM(ret,c,r,g) = (c eq 'PAPI_L1_DCM' && r eq 'Unresolved' && g == 0 ) ? ret : NaN;
ratio_PAPI_L1_DCM(ret,c,r,g) = (c eq 'PAPI_L1_DCM_per_ins' && r eq 'Unresolved' && g == 0 ) ? ret : NaN;
slope_PAPI_L2_DCM(ret,c,r,g) = (c eq 'PAPI_L2_DCM' && r eq 'Unresolved' && g == 0 ) ? ret : NaN;
ratio_PAPI_L2_DCM(ret,c,r,g) = (c eq 'PAPI_L2_DCM_per_ins' && r eq 'Unresolved' && g == 0 ) ? ret : NaN;
slope_PAPI_L3_TCM(ret,c,r,g) = (c eq 'PAPI_L3_TCM' && r eq 'Unresolved' && g == 0 ) ? ret : NaN;
ratio_PAPI_L3_TCM(ret,c,r,g) = (c eq 'PAPI_L3_TCM_per_ins' && r eq 'Unresolved' && g == 0 ) ? ret : NaN;
slope_PAPI_LD_INS(ret,c,r,g) = (c eq 'PAPI_LD_INS' && r eq 'Unresolved' && g == 0 ) ? ret : NaN;
ratio_PAPI_LD_INS(ret,c,r,g) = (c eq 'PAPI_LD_INS_per_ins' && r eq 'Unresolved' && g == 0 ) ? ret : NaN;
slope_PAPI_SR_INS(ret,c,r,g) = (c eq 'PAPI_SR_INS' && r eq 'Unresolved' && g == 0 ) ? ret : NaN;
ratio_PAPI_SR_INS(ret,c,r,g) = (c eq 'PAPI_SR_INS_per_ins' && r eq 'Unresolved' && g == 0 ) ? ret : NaN;
slope_PAPI_TLB_DM(ret,c,r,g) = (c eq 'PAPI_TLB_DM' && r eq 'Unresolved' && g == 0 ) ? ret : NaN;
ratio_PAPI_TLB_DM(ret,c,r,g) = (c eq 'PAPI_TLB_DM_per_ins' && r eq 'Unresolved' && g == 0 ) ? ret : NaN;
slope_PAPI_TOT_CYC(ret,c,r,g) = (c eq 'PAPI_TOT_CYC' && r eq 'Unresolved' && g == 0 ) ? ret : NaN;
ratio_PAPI_TOT_CYC(ret,c,r,g) = (c eq 'PAPI_TOT_CYC_per_ins' && r eq 'Unresolved' && g == 0 ) ? ret : NaN;
slope_PAPI_TOT_INS(ret,c,r,g) = (c eq 'PAPI_TOT_INS' && r eq 'Unresolved' && g == 0 ) ? ret : NaN;
slope_PAPI_VEC_DP(ret,c,r,g) = (c eq 'PAPI_VEC_DP' && r eq 'Unresolved' && g == 0 ) ? ret : NaN;
ratio_PAPI_VEC_DP(ret,c,r,g) = (c eq 'PAPI_VEC_DP_per_ins' && r eq 'Unresolved' && g == 0 ) ? ret : NaN;
slope_RESOURCE_STALLS(ret,c,r,g) = (c eq 'RESOURCE_STALLS' && r eq 'Unresolved' && g == 0 ) ? ret : NaN;
ratio_RESOURCE_STALLS(ret,c,r,g) = (c eq 'RESOURCE_STALLS_per_ins' && r eq 'Unresolved' && g == 0 ) ? ret : NaN;
slope_SIMD_FP_256_PACKED_DOUBLE(ret,c,r,g) = (c eq 'SIMD_FP_256:PACKED_DOUBLE' && r eq 'Unresolved' && g == 0 ) ? ret : NaN;
ratio_SIMD_FP_256_PACKED_DOUBLE(ret,c,r,g) = (c eq 'SIMD_FP_256:PACKED_DOUBLE_per_ins' && r eq 'Unresolved' && g == 0 ) ? ret : NaN;

plot \
'perfTest.codeblocks.fused.any.any.any.slope.csv' u ($4*FACTOR):(ratio_PAPI_BR_INS($5, strcol(3), strcol(1), $2)) ti 'PAPI_BR_INS/ins' axes x2y1 w lines lw 3,\
'perfTest.codeblocks.fused.any.any.any.slope.csv' u ($4*FACTOR):(ratio_PAPI_DP_OPS($5, strcol(3), strcol(1), $2)) ti 'PAPI_DP_OPS/ins' axes x2y1 w lines lw 3,\
'perfTest.codeblocks.fused.any.any.any.slope.csv' u ($4*FACTOR):(ratio_PAPI_L1_DCM($5, strcol(3), strcol(1), $2)) ti 'PAPI_L1_DCM/ins' axes x2y1 w lines lw 3,\
'perfTest.codeblocks.fused.any.any.any.slope.csv' u ($4*FACTOR):(ratio_PAPI_L2_DCM($5, strcol(3), strcol(1), $2)) ti 'PAPI_L2_DCM/ins' axes x2y1 w lines lw 3,\
'perfTest.codeblocks.fused.any.any.any.slope.csv' u ($4*FACTOR):(ratio_PAPI_L3_TCM($5, strcol(3), strcol(1), $2)) ti 'PAPI_L3_TCM/ins' axes x2y1 w lines lw 3,\
'perfTest.codeblocks.fused.any.any.any.slope.csv' u ($4*FACTOR):(ratio_PAPI_LD_INS($5, strcol(3), strcol(1), $2)) ti 'PAPI_LD_INS/ins' axes x2y1 w lines lw 3,\
'perfTest.codeblocks.fused.any.any.any.slope.csv' u ($4*FACTOR):(ratio_PAPI_SR_INS($5, strcol(3), strcol(1), $2)) ti 'PAPI_SR_INS/ins' axes x2y1 w lines lw 3,\
'perfTest.codeblocks.fused.any.any.any.slope.csv' u ($4*FACTOR):(ratio_PAPI_TLB_DM($5, strcol(3), strcol(1), $2)) ti 'PAPI_TLB_DM/ins' axes x2y1 w lines lw 3,\
'perfTest.codeblocks.fused.any.any.any.slope.csv' u ($4*FACTOR):(ratio_PAPI_TOT_CYC($5, strcol(3), strcol(1), $2)) ti 'PAPI_TOT_CYC/ins' axes x2y1 w lines lw 3,\
'perfTest.codeblocks.fused.any.any.any.slope.csv' u ($4*FACTOR):(slope_PAPI_TOT_INS($5, strcol(3), strcol(1), $2)) ti 'MIPS' axes x2y2 w lines lw 3,\
'perfTest.codeblocks.fused.any.any.any.slope.csv' u ($4*FACTOR):(ratio_PAPI_VEC_DP($5, strcol(3), strcol(1), $2)) ti 'PAPI_VEC_DP/ins' axes x2y1 w lines lw 3,\
'perfTest.codeblocks.fused.any.any.any.slope.csv' u ($4*FACTOR):(ratio_RESOURCE_STALLS($5, strcol(3), strcol(1), $2)) ti 'RESOURCE_STALLS/ins' axes x2y1 w lines lw 3,\
'perfTest.codeblocks.fused.any.any.any.slope.csv' u ($4*FACTOR):(ratio_SIMD_FP_256_PACKED_DOUBLE($5, strcol(3), strcol(1), $2)) ti 'SIMD_FP_256:PACKED_DOUBLE/ins' axes x2y1 w lines lw 3;

unset label;
unset arrow;

unset multiplot;
