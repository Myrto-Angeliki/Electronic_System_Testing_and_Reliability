onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label CLK /TRCUTtb/CLK
add wave -noupdate -label SE /TRCUTtb/SE
add wave -noupdate -label SI /TRCUTtb/SI
add wave -noupdate -label SO -radix binary /TRCUTtb/SO
add wave -noupdate -label DATA_IN /TRCUTtb/DATA_IN
add wave -noupdate -label DATA_IN_previous /TRCUTtb/DATA_IN_previous
add wave -noupdate -label expected_outs /TRCUTtb/expected_outs
add wave -noupdate -label actual_outs /TRCUTtb/actual_outs
add wave -noupdate -label isExpected -radix binary /TRCUTtb/isExpected
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {450000 ps} 0} {{Cursor 2} {8850000 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {9450 ns}
