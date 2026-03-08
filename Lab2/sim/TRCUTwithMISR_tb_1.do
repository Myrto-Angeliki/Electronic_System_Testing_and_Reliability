onerror {resume}
quietly virtual function -install /TRCUTwithMISRtb -env /TRCUTwithMISRtb { @(negedge CLK)} virtual_000001
quietly WaveActivateNextPane {} 0
add wave -noupdate -label CLK /TRCUTwithMISRtb/CLK
add wave -noupdate -label CTRL /TRCUTwithMISRtb/CTRL
add wave -noupdate -label SE /TRCUTwithMISRtb/SE
add wave -noupdate -label sign /TRCUTwithMISRtb/sign_tb
add wave -noupdate -label actual_outs /TRCUTwithMISRtb/actual_outs
add wave -noupdate -label correct_signature -radix unsigned /TRCUTwithMISRtb/correct_signature
add wave -noupdate -label clk_counter /TRCUTwithMISRtb/clk_counter
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7200 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 132
configure wave -valuecolwidth 49
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {7560 ps}
