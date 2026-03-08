onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label CLK /TRCUTwithLFSRtb/CLK
add wave -noupdate -label SE /TRCUTwithLFSRtb/SE
add wave -noupdate -label SI /TRCUTwithLFSRtb/TRCUTwithLFSR_inst/TRCUTinst/SI
add wave -noupdate -label SO /TRCUTwithLFSRtb/SO
add wave -noupdate -label DATA_IN /TRCUTwithLFSRtb/DATA_IN
add wave -noupdate -label expected_outs /TRCUTwithLFSRtb/expected_outs
add wave -noupdate -label actual_outs /TRCUTwithLFSRtb/actual_outs
add wave -noupdate -label isExpected /TRCUTwithLFSRtb/isExpected
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6560 ps} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {0 ps} {6909 ps}
