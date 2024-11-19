wvResizeWindow -win $_nWave1 8 31 892 139
wvResizeWindow -win $_nWave1 0 23 1536 793
wvSetPosition -win $_nWave1 {("G1" 0)}
wvResizeWindow -win $_nWave1 0 23 1536 793
wvOpenFile -win $_nWave1 {/home/B103040009_HDL/HW1/post_sim/6adder.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/post_sim_tb"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/post_sim_tb/EXPECTED_ANS\[32:0\]} \
{/post_sim_tb/CO_S_STRUCTURE\[32:0\]} \
{/post_sim_tb/Q_STRUCTURE\[32:0\]} \
{/post_sim_tb/CO_S_DATAFLOW\[32:0\]} \
{/post_sim_tb/Q_DATAFLOW\[32:0\]} \
{/post_sim_tb/CO_S_BEHAVIORAL\[32:0\]} \
{/post_sim_tb/Q_BEHAVIORAL\[32:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/post_sim_tb/EXPECTED_ANS\[32:0\]} \
{/post_sim_tb/CO_S_STRUCTURE\[32:0\]} \
{/post_sim_tb/Q_STRUCTURE\[32:0\]} \
{/post_sim_tb/CO_S_DATAFLOW\[32:0\]} \
{/post_sim_tb/Q_DATAFLOW\[32:0\]} \
{/post_sim_tb/CO_S_BEHAVIORAL\[32:0\]} \
{/post_sim_tb/Q_BEHAVIORAL\[32:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 6 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 6 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 5 6 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 4 5 6 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 3 4 5 6 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 )} 
wvSetRadix -win $_nWave1 -format UDec
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvResizeWindow -win $_nWave1 0 23 1536 793
wvZoomOut -win $_nWave1
wvExit
