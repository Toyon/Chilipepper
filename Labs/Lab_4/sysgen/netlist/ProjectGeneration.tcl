#
# Created by System Generator     Wed Dec 12 11:19:05 2012
#
# Note: This file is produced automatically, and will be overwritten the next
# time you press "Generate" in System Generator.
#

namespace eval ::xilinx::dsptool::iseproject::param {
    set SynthStrategyName {XST Defaults*}
    set ImplStrategyName {ISE Defaults*}
    set Compilation {Export as a pcore to EDK}
    set Project {adc_driver_cw}
    set Family {Zynq}
    set Device {xc7z020}
    set Package {clg484}
    set Speed {-1}
    set HDLLanguage {vhdl}
    set SynthesisTool {XST}
    set Simulator {Modelsim-SE}
    set ReadCores {False}
    set MapEffortLevel {High}
    set ParEffortLevel {High}
    set Frequency {100}
    set NewXSTParser {1}
    set ProjectFiles {
        {{adc_driver_cw.vhd} -view All}
        {{adc_driver.vhd} -view All}
        {{adc_driver_cw.ucf}}
        {{adc_driver_cw.xdc}}
        {{C:\QPSK_Projects\project_2\sysgen\adc_driver.slx}}
    }
    set TopLevelModule {adc_driver_cw}
    set SynthesisConstraintsFile {adc_driver_cw.xcf}
    set ImplementationStopView {Structural}
    set ProjectGenerator {SysgenDSP}
}
    source SgIseProject.tcl
    ::xilinx::dsptool::iseproject::create
