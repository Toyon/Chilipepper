
open(PIDFILE, '> pidfile.txt') || die 'Couldn\'t write process ID to file.';
print PIDFILE "$$\n";
close(PIDFILE);

eval {
  # Call script(s).
  my $instrs;
  my $results = [];
$ENV{'SYSGEN'} = 'C:/Xilinx/14.4/ISE_DS/ISE/sysgen';
  use Sg;
  $instrs = {
    'HDLCodeGenStatus' => 0.0,
    'HDL_PATH' => 'C:/GIT/Chilipepper/Labs/Lab_4/sysgen',
    'Impl_file' => 'ISE Defaults',
    'Impl_file_sgadvanced' => '',
    'Synth_file' => 'XST Defaults',
    'Synth_file_sgadvanced' => '',
    'TEMP' => 'C:/Users/rcagley/AppData/Local/Temp',
    'TMP' => 'C:/Users/rcagley/AppData/Local/Temp',
    'Temp' => 'C:/Users/rcagley/AppData/Local/Temp',
    'Tmp' => 'C:/Users/rcagley/AppData/Local/Temp',
    'base_system_period_hardware' => 10.0,
    'base_system_period_simulink' => 1.0,
    'block_icon_display' => 'Default',
    'block_type' => 'sysgen',
    'block_version' => '',
    'ce_clr' => 0.0,
    'clock_domain' => 'default',
    'clock_loc' => '',
    'clock_wrapper' => 'Clock Enables',
    'clock_wrapper_sgadvanced' => '',
    'compilation' => 'Export as a pcore to EDK',
    'compilation_lut' => {
      'keys' => [
        'HDL Netlist',
        'Export as a pcore to EDK',
      ],
      'values' => [
        'target1',
        'target2',
      ],
    },
    'compilation_target' => 'Export as a pcore to EDK',
    'core_generation' => 1.0,
    'core_generation_sgadvanced' => '',
    'core_is_deployed' => 0.0,
    'coregen_core_generation_tmpdir' => 'C:/Users/rcagley/AppData/Local/Temp/sysgentmp-rcagley/cg_wk/c50853ab126d24e3b',
    'coregen_part_family' => 'zynq',
    'createTestbench' => 0,
    'create_interface_document' => 'off',
    'dbl_ovrd' => -1.0,
    'dbl_ovrd_sgadvanced' => '',
    'dcm_input_clock_period' => 10.0,
    'deprecated_control' => 'off',
    'deprecated_control_sgadvanced' => '',
    'design' => 'rx',
    'design_full_path' => 'C:\\GIT\\Chilipepper\\Labs\\Lab_4\\sysgen\\rx.slx',
    'device' => 'xc7z020-1clg484',
    'device_speed' => '-1',
    'directory' => 'C:/GIT/Chilipepper/Labs/Lab_4/sysgen/netlist',
    'dsp_cache_root_path' => 'C:/Users/rcagley/AppData/Local/Temp/sysgentmp-rcagley',
    'eval_field' => '0',
    'fileDeliveryDefaults' => [
      [
        '(?i)\\.vhd$',
        { 'fileName' => 'C:/GIT/Chilipepper/Labs/Lab_4/sysgen/netlist/sysgen/perl_results.vhd', },
      ],
      [
        '(?i)\\.v$',
        { 'fileName' => 'C:/GIT/Chilipepper/Labs/Lab_4/sysgen/netlist/sysgen/perl_results.v', },
      ],
    ],
    'force_scheduling' => 0.0,
    'fxdptinstalled' => 1.0,
    'generateUsing71FrontEnd' => 1,
    'generating_island_subsystem_handle' => 2078.0003662109375,
    'generating_subsystem_handle' => 2078.0003662109375,
    'generation_directory' => './netlist',
    'has_advanced_control' => '0',
    'hdlDir' => 'C:/Xilinx/14.4/ISE_DS/ISE/sysgen/hdl',
    'hdlKind' => 'vhdl',
    'hdl_path' => 'C:/GIT/Chilipepper/Labs/Lab_4/sysgen',
    'impl_file' => 'ISE Defaults*',
    'incr_netlist' => 'off',
    'incr_netlist_sgadvanced' => '',
    'infoedit' => ' System Generator',
    'isdeployed' => 0,
    'ise_version' => '14.4i',
    'master_sysgen_token_handle' => 2079.0003662109375,
    'matlab' => 'C:/Program Files/MATLAB/R2013a_prerelease',
    'matlab_fixedpoint' => 1.0,
    'mdlHandle' => 2078.0003662109375,
    'mdlPath' => 'C:/GIT/Chilipepper/Labs/Lab_4/sysgen/rx.mdl',
    'modelDiagnostics' => [
      {
        'count' => 82.0,
        'isMask' => 0.0,
        'type' => 'rx Total blocks',
      },
      {
        'count' => 25.0,
        'isMask' => 0.0,
        'type' => 'Constant',
      },
      {
        'count' => 2.0,
        'isMask' => 0.0,
        'type' => 'DiscretePulseGenerator',
      },
      {
        'count' => 40.0,
        'isMask' => 0.0,
        'type' => 'S-Function',
      },
      {
        'count' => 2.0,
        'isMask' => 0.0,
        'type' => 'SubSystem',
      },
      {
        'count' => 13.0,
        'isMask' => 0.0,
        'type' => 'Terminator',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'Xilinx ChipScope Block',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'Xilinx EDK Core Block',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'Xilinx EDK Processor Block',
      },
      {
        'count' => 27.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Gateway In Block',
      },
      {
        'count' => 11.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Gateway Out Block',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'Xilinx System Generator Block',
      },
    ],
    'model_globals_initialized' => 1.0,
    'model_path' => 'C:/GIT/Chilipepper/Labs/Lab_4/sysgen/rx.mdl',
    'myxilinx' => 'C:/Xilinx/14.4/ISE_DS/ISE',
    'ngc_files' => [ 'xlpersistentdff.ngc', ],
    'num_sim_cycles' => '10',
    'package' => 'clg484',
    'part' => 'xc7z020',
    'partFamily' => 'zynq',
    'port_data_types_enabled' => 0.0,
    'precompile_fcn' => 'xledkprecompile',
    'preserve_hierarchy' => 0.0,
    'proc_block_export_settings' => {
      'custom_bus_iface' => {
        'bus_iface' => [],
        'ports' => [],
      },
      'export_dir' => 'C:/GIT/Chilipepper/Labs/Lab_4/EDK',
      'is_development' => 1.0,
      'version' => 'v1_00_a',
    },
    'proc_block_info' => {
      'baseaddr' => '0x80000000',
      'bus_type' => 'AXI',
      'dual_clock' => 'on',
      'handle' => 2081.0003662109375,
      'memmap_info' => {
        'ABus_len' => 32.0,
        'DBus_len' => 32.0,
        'addrPref' => 524288.0,
        'addrPref_len' => 20.0,
        'bankAddr_len' => 2.0,
        'baseaddr' => 2.147483648E9,
        'fromfifos' => [],
        'fromfifos_size' => 0.0,
        'fromregs' => [],
        'fromregs_size' => 0.0,
        'linearAddr_len' => 8.0,
        'min_size' => '0x1000',
        'readback_toregs_size' => 0.0,
        'reg_readback' => 0.0,
        'shmems' => [],
        'shmems_size' => 0.0,
        'tofifos' => [],
        'tofifos_size' => 0.0,
        'toregs' => [],
        'toregs_size' => 0.0,
        'totalAddr_len' => 12.0,
      },
      'mode' => 'EDK pcore generation',
      'reg_readback' => 'off',
      'ret_absolute_addr' => 0,
    },
    'proj_type' => 'Project Navigator',
    'proj_type_sgadvanced' => '',
    'report_true_rates' => 0.0,
    'run_coregen' => 'off',
    'run_coregen_sgadvanced' => '',
    'sample_time_colors_enabled' => 0.0,
    'sampletimecolors' => 0.0,
    'settings_fcn' => 'xledksettings',
    'sg_blockgui_xml' => '',
    'sg_icon_stat' => '50,50,-1,-1,token,white,0,07734,right,,[ ],[ ]',
    'sg_list_contents' => '',
    'sg_mask_display' => 'fprintf(\'\',\'COMMENT: begin icon graphics\');
patch([0 50 50 0 0 ],[0 0 50 50 0 ],[1 1 1 ]);
patch([1.6375 16.81 27.31 37.81 48.31 27.31 12.1375 1.6375 ],[36.655 36.655 47.155 36.655 47.155 47.155 47.155 36.655 ],[0.933333 0.203922 0.141176 ]);
patch([12.1375 27.31 16.81 1.6375 12.1375 ],[26.155 26.155 36.655 36.655 26.155 ],[0.698039 0.0313725 0.219608 ]);
patch([1.6375 16.81 27.31 12.1375 1.6375 ],[15.655 15.655 26.155 26.155 15.655 ],[0.933333 0.203922 0.141176 ]);
patch([12.1375 48.31 37.81 27.31 16.81 1.6375 12.1375 ],[5.155 5.155 15.655 5.155 15.655 15.655 5.155 ],[0.698039 0.0313725 0.219608 ]);
fprintf(\'\',\'COMMENT: end icon graphics\');
fprintf(\'\',\'COMMENT: begin icon text\');
fprintf(\'\',\'COMMENT: end icon text\');',
    'sg_version' => '',
    'sggui_pos' => '-1,-1,-1,-1',
    'simulation_island_subsystem_handle' => 2078.0003662109375,
    'simulink_accelerator_running' => 0.0,
    'simulink_debugger_running' => 0.0,
    'simulink_period' => 1.0,
    'speed' => '-1',
    'synth_file' => 'XST Defaults*',
    'synthesisTool' => 'XST',
    'synthesis_language' => 'vhdl',
    'synthesis_tool' => 'XST',
    'synthesis_tool_sgadvanced' => '',
    'sysclk_period' => 10.0,
    'sysgen' => 'C:/Xilinx/14.4/ISE_DS/ISE/sysgen',
    'sysgenRoot' => 'C:/Xilinx/14.4/ISE_DS/ISE/sysgen',
    'sysgenTokenSettings' => {
      'Impl_file' => 'ISE Defaults',
      'Impl_file_sgadvanced' => '',
      'Synth_file' => 'XST Defaults',
      'Synth_file_sgadvanced' => '',
      'base_system_period_hardware' => 10.0,
      'base_system_period_simulink' => 1.0,
      'block_icon_display' => 'Default',
      'block_type' => 'sysgen',
      'block_version' => '',
      'ce_clr' => 0.0,
      'clock_loc' => '',
      'clock_wrapper' => 'Clock Enables',
      'clock_wrapper_sgadvanced' => '',
      'compilation' => 'Export as a pcore to EDK',
      'compilation_lut' => {
        'keys' => [
          'HDL Netlist',
          'Export as a pcore to EDK',
        ],
        'values' => [
          'target1',
          'target2',
        ],
      },
      'core_generation' => 1.0,
      'core_generation_sgadvanced' => '',
      'coregen_part_family' => 'zynq',
      'create_interface_document' => 'off',
      'dbl_ovrd' => -1.0,
      'dbl_ovrd_sgadvanced' => '',
      'dcm_input_clock_period' => 10.0,
      'deprecated_control' => 'off',
      'deprecated_control_sgadvanced' => '',
      'directory' => './netlist',
      'eval_field' => '0',
      'has_advanced_control' => '0',
      'impl_file' => 'ISE Defaults*',
      'incr_netlist' => 'off',
      'incr_netlist_sgadvanced' => '',
      'infoedit' => ' System Generator',
      'master_sysgen_token_handle' => 2079.0003662109375,
      'package' => 'clg484',
      'part' => 'xc7z020',
      'precompile_fcn' => 'xledkprecompile',
      'preserve_hierarchy' => 0.0,
      'proj_type' => 'Project Navigator',
      'proj_type_sgadvanced' => '',
      'run_coregen' => 'off',
      'run_coregen_sgadvanced' => '',
      'settings_fcn' => 'xledksettings',
      'sg_blockgui_xml' => '',
      'sg_icon_stat' => '50,50,-1,-1,token,white,0,07734,right,,[ ],[ ]',
      'sg_list_contents' => '',
      'sg_mask_display' => 'fprintf(\'\',\'COMMENT: begin icon graphics\');
patch([0 50 50 0 0 ],[0 0 50 50 0 ],[1 1 1 ]);
patch([1.6375 16.81 27.31 37.81 48.31 27.31 12.1375 1.6375 ],[36.655 36.655 47.155 36.655 47.155 47.155 47.155 36.655 ],[0.933333 0.203922 0.141176 ]);
patch([12.1375 27.31 16.81 1.6375 12.1375 ],[26.155 26.155 36.655 36.655 26.155 ],[0.698039 0.0313725 0.219608 ]);
patch([1.6375 16.81 27.31 12.1375 1.6375 ],[15.655 15.655 26.155 26.155 15.655 ],[0.933333 0.203922 0.141176 ]);
patch([12.1375 48.31 37.81 27.31 16.81 1.6375 12.1375 ],[5.155 5.155 15.655 5.155 15.655 15.655 5.155 ],[0.698039 0.0313725 0.219608 ]);
fprintf(\'\',\'COMMENT: end icon graphics\');
fprintf(\'\',\'COMMENT: begin icon text\');
fprintf(\'\',\'COMMENT: end icon text\');',
      'sggui_pos' => '-1,-1,-1,-1',
      'simulation_island_subsystem_handle' => 2078.0003662109375,
      'simulink_period' => 1.0,
      'speed' => '-1',
      'synth_file' => 'XST Defaults*',
      'synthesis_language' => 'vhdl',
      'synthesis_tool' => 'XST',
      'synthesis_tool_sgadvanced' => '',
      'sysclk_period' => 10.0,
      'testbench' => 0,
      'testbench_sgadvanced' => '',
      'trim_vbits' => 1.0,
      'trim_vbits_sgadvanced' => '',
      'update_fcn' => 'xledkupdatefn',
      'version' => '9.2.01',
      'xilinx_device' => 'xc7z020-1clg484',
      'xilinxfamily' => 'zynq',
      'xledksettingsdata' => {
        'customBusInterfaceValue' => [],
        'export' => 1.0,
        'exportdir' => 'C:\\GIT\\Chilipepper\\Labs\\Lab_4\\EDK\\system.xmp',
        'exportdirpath' => 'C:\\GIT\\Chilipepper\\Labs\\Lab_4\\EDK',
        'hw_compatibility' => 'a',
        'hw_compatibility_slider' => 97.0,
        'isDevelopment' => 1.0,
        'maj_slider' => 1.0,
        'major' => 1.0,
        'minor' => 0.0,
        'minor_slider' => 0.0,
        'selectiontag' => 'export',
        'useCustomBusInterface' => 0.0,
      },
    },
    'sysgen_Root' => 'C:/Xilinx/14.4/ISE_DS/ISE/sysgen',
    'systemClockPeriod' => 10.0,
    'tempdir' => 'C:/Users/rcagley/AppData/Local/Temp',
    'testbench' => 0,
    'testbench_sgadvanced' => '',
    'tmpDir' => 'C:/GIT/Chilipepper/Labs/Lab_4/sysgen/netlist/sysgen',
    'trim_vbits' => 1.0,
    'trim_vbits_sgadvanced' => '',
    'update_fcn' => 'xledkupdatefn',
    'use_strict_names' => 1,
    'user_tips_enabled' => 0.0,
    'usertemp' => 'C:/Users/rcagley/AppData/Local/Temp/sysgentmp-rcagley',
    'using71Netlister' => 1,
    'verilog_files' => [
      'conv_pkg.v',
      'synth_reg.v',
      'synth_reg_w_init.v',
      'convert_type.v',
    ],
    'version' => '9.2.01',
    'vhdl_files' => [
      'conv_pkg.vhd',
      'synth_reg.vhd',
      'synth_reg_w_init.vhd',
    ],
    'vsimtime' => '385.000000 ns',
    'xilinx' => 'C:/Xilinx/14.4/ISE_DS/ISE',
    'xilinx_device' => 'xc7z020-1clg484',
    'xilinx_family' => 'zynq',
    'xilinx_package' => 'clg484',
    'xilinx_part' => 'xc7z020',
    'xilinxdevice' => 'xc7z020-1clg484',
    'xilinxfamily' => 'zynq',
    'xilinxpart' => 'xc7z020',
    'xledksettingsdata' => {
      'customBusInterfaceValue' => [],
      'export' => 1.0,
      'exportdir' => 'C:\\GIT\\Chilipepper\\Labs\\Lab_4\\EDK\\system.xmp',
      'exportdirpath' => 'C:\\GIT\\Chilipepper\\Labs\\Lab_4\\EDK',
      'hw_compatibility' => 'a',
      'hw_compatibility_slider' => 97.0,
      'isDevelopment' => 1.0,
      'maj_slider' => 1.0,
      'major' => 1.0,
      'minor' => 0.0,
      'minor_slider' => 0.0,
      'selectiontag' => 'export',
      'useCustomBusInterface' => 0.0,
    },
  };
  push(@$results, &Sg::setAttributes($instrs));
  use SgDeliverFile;
  $instrs = {
    'collaborationName' => 'conv_pkg.vhd',
    'sourceFile' => 'hdl/conv_pkg.vhd',
    'templateKeyValues' => {},
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'collaborationName' => 'synth_reg.vhd',
    'sourceFile' => 'hdl/synth_reg.vhd',
    'templateKeyValues' => {},
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'collaborationName' => 'synth_reg_w_init.vhd',
    'sourceFile' => 'hdl/synth_reg_w_init.vhd',
    'templateKeyValues' => {},
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'collaborationName' => 'xlpersistentdff.ngc',
    'sourceFile' => 'hdl/xlpersistentdff.ngc',
    'templateKeyValues' => {},
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '0e7771db7e5d804154865a0ebd7e712f',
    'sourceFile' => 'hdl/xlfilecontent.vhd',
    'templateKeyValues' => { 'filecontent' => 'library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity axi_sgiface is
    generic (
        -- AXI specific.
        -- TODO: need to figure out a way to pass these generics from outside
        C_S_AXI_SUPPORT_BURST   : integer := 0;
        -- TODO: fix the internal ID width to 8
        C_S_AXI_ID_WIDTH        : integer := 8;
        C_S_AXI_DATA_WIDTH      : integer := 32;
        C_S_AXI_ADDR_WIDTH      : integer := 32;
        C_S_AXI_TOTAL_ADDR_LEN  : integer := 12;
        C_S_AXI_LINEAR_ADDR_LEN : integer := 8;
        C_S_AXI_BANK_ADDR_LEN   : integer := 2;
        C_S_AXI_AWLEN_WIDTH     : integer := 8;
        C_S_AXI_ARLEN_WIDTH     : integer := 8
    );
    port (
        -- General.
        AXI_AClk      : in  std_logic;
        AXI_AResetN    : in  std_logic;
        -- not used
        AXI_Ce        : in  std_logic;
  
        -- AXI Port.
        S_AXI_AWADDR  : in  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
        S_AXI_AWID    : in  std_logic_vector(C_S_AXI_ID_WIDTH-1 downto 0);
        S_AXI_AWLEN   : in  std_logic_vector(C_S_AXI_AWLEN_WIDTH-1 downto 0);
        S_AXI_AWSIZE  : in  std_logic_vector(2 downto 0);
        S_AXI_AWBURST : in  std_logic_vector(1 downto 0);
        S_AXI_AWLOCK  : in  std_logic_vector(1 downto 0);
        S_AXI_AWCACHE : in  std_logic_vector(3 downto 0);
        S_AXI_AWPROT  : in  std_logic_vector(2 downto 0);
        S_AXI_AWVALID : in  std_logic;
        S_AXI_AWREADY : out std_logic;
        
        S_AXI_WLAST   : in  std_logic;
        S_AXI_WDATA   : in  std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
        S_AXI_WSTRB   : in  std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
        S_AXI_WVALID  : in  std_logic;
        S_AXI_WREADY  : out std_logic;
        
        S_AXI_BRESP   : out std_logic_vector(1 downto 0);
        S_AXI_BID     : out std_logic_vector(C_S_AXI_ID_WIDTH-1 downto 0);
        S_AXI_BVALID  : out std_logic;
        S_AXI_BREADY  : in  std_logic;
        
        S_AXI_ARADDR  : in  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
        S_AXI_ARID    : in  std_logic_vector(C_S_AXI_ID_WIDTH-1 downto 0);
        S_AXI_ARLEN   : in  std_logic_vector(C_S_AXI_ARLEN_WIDTH-1 downto 0);
        S_AXI_ARSIZE  : in  std_logic_vector(2 downto 0);
        S_AXI_ARBURST : in  std_logic_vector(1 downto 0);
        S_AXI_ARLOCK  : in  std_logic_vector(1 downto 0);
        S_AXI_ARCACHE : in  std_logic_vector(3 downto 0);
        S_AXI_ARPROT  : in  std_logic_vector(2 downto 0);
        S_AXI_ARVALID : in  std_logic;
        S_AXI_ARREADY : out std_logic;
        
        -- \'From Register\'
        -- \'To Register\'
        -- \'From FIFO\'
        -- \'To FIFO\'
        -- \'Shared Memory\'

        S_AXI_RLAST   : out std_logic;
        S_AXI_RID     : out std_logic_vector(C_S_AXI_ID_WIDTH-1 downto 0);
        S_AXI_RDATA   : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
        S_AXI_RRESP   : out std_logic_vector(1 downto 0);
        S_AXI_RVALID  : out std_logic;
        S_AXI_RREADY  : in  std_logic
    );
end entity axi_sgiface;

architecture IMP of axi_sgiface is

-- Internal signals for write channel.
signal S_AXI_BVALID_i       : std_logic;
signal S_AXI_BID_i          : std_logic_vector(C_S_AXI_ID_WIDTH-1 downto 0);
signal S_AXI_WREADY_i       : std_logic;
  
-- Internal signals for read channels.
signal S_AXI_ARLEN_i        : std_logic_vector(C_S_AXI_ARLEN_WIDTH-1 downto 0);
signal S_AXI_RLAST_i        : std_logic;
signal S_AXI_RREADY_i       : std_logic;
signal S_AXI_RVALID_i       : std_logic;
signal S_AXI_RDATA_i        : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
signal S_AXI_RID_i          : std_logic_vector(C_S_AXI_ID_WIDTH-1 downto 0);

-- for read channel
signal read_bank_addr_i     : std_logic_vector(C_S_AXI_BANK_ADDR_LEN-1 downto 0);
signal read_linear_addr_i   : std_logic_vector(C_S_AXI_LINEAR_ADDR_LEN-1 downto 0);
-- for write channel
signal write_bank_addr_i    : std_logic_vector(C_S_AXI_BANK_ADDR_LEN-1 downto 0);
signal write_linear_addr_i  : std_logic_vector(C_S_AXI_LINEAR_ADDR_LEN-1 downto 0);

signal reg_bank_out_i       : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
signal fifo_bank_out_i      : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
signal shmem_bank_out_i     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    
-- \'From Register\'
-- \'To Register\'
-- \'From FIFO\'
-- \'To FIFO\'
-- \'Shared Memory\'

type t_read_state is (IDLE, READ_PREP, READ_DATA);
signal read_state : t_read_state;

type t_write_state is (IDLE, WRITE_DATA, WRITE_RESPONSE);
signal write_state : t_write_state;

type t_memmap_state is (READ, WRITE);
signal memmap_state : t_memmap_state;

constant C_READ_PREP_DELAY : std_logic_vector(1 downto 0) := "11";

signal read_prep_counter : std_logic_vector(1 downto 0);
signal read_addr_counter : std_logic_vector(C_S_AXI_ARLEN_WIDTH-1 downto 0);
signal read_data_counter : std_logic_vector(C_S_AXI_ARLEN_WIDTH-1 downto 0);

-- enable of shared BRAMs
signal s_shram_en : std_logic;

signal write_addr_valid : std_logic;
signal write_ready : std_logic;

-- \'re\' of From/To FIFOs
signal s_fifo_re : std_logic;
-- \'we\' of To FIFOs
signal s_fifo_we : std_logic;

begin

-- enable for \'Shared Memory\' blocks

-- conversion to match with the data bus width
-- \'From Register\'
-- \'To Register\'
-- \'From FIFO\'
-- \'To FIFO\'
-- \'Shared Memory\'

ReadWriteSelect: process(memmap_state) is begin
    if (memmap_state = READ) then
    else
    end if;
end process ReadWriteSelect;

-----------------------------------------------------------------------------
-- address for \'Shared Memory\'
-----------------------------------------------------------------------------
SharedMemory_Addr_ResetN : process(AXI_AClk) is begin
    if (AXI_AClk\'event and AXI_AClk = \'1\') then
        if (AXI_AResetN = \'0\') then
            memmap_state <= READ;
        else
            if (S_AXI_AWVALID = \'1\') then
                -- write operation
                memmap_state <= WRITE;
            elsif (S_AXI_ARVALID = \'1\') then
                -- read operation
                memmap_state <= READ;
            end if;
        end if;
    end if;
end process SharedMemory_Addr_ResetN;

-----------------------------------------------------------------------------
-- WRITE Command Control
-----------------------------------------------------------------------------
S_AXI_BID     <= S_AXI_BID_i;
S_AXI_BVALID  <= S_AXI_BVALID_i;
S_AXI_WREADY  <= S_AXI_WREADY_i;
-- No error checking
S_AXI_BRESP  <= (others=>\'0\');

PROC_AWREADY_ACK: process(read_state, write_state, S_AXI_ARVALID, S_AXI_AWVALID) is begin
    if (write_state = IDLE and S_AXI_AWVALID = \'1\' and read_state = IDLE) then
        S_AXI_AWREADY <= S_AXI_AWVALID;
    else
        S_AXI_AWREADY <= \'0\';
    end if;
end process PROC_AWREADY_ACK;

Cmd_Decode_Write: process(AXI_AClk) is begin
    if (AXI_AClk\'event and AXI_AClk = \'1\') then
        if (AXI_AResetN = \'0\') then
            write_addr_valid    <= \'0\';
            write_ready         <= \'0\';
            s_fifo_we           <= \'0\';
            S_AXI_BVALID_i      <= \'0\';
            S_AXI_BID_i         <= (others => \'0\');
            write_bank_addr_i   <= (others => \'0\');
            write_linear_addr_i <= (others => \'0\');
        else
            if (write_state = IDLE) then
                if (S_AXI_AWVALID = \'1\' and read_state = IDLE) then
                    -- reflect awid
                    S_AXI_BID_i <= S_AXI_AWID;

                    -- latch bank and linear addresses
                    write_bank_addr_i   <= S_AXI_AWADDR(C_S_AXI_TOTAL_ADDR_LEN-1 downto C_S_AXI_LINEAR_ADDR_LEN+2);
                    write_linear_addr_i <= S_AXI_AWADDR(C_S_AXI_LINEAR_ADDR_LEN+1 downto 2);
                    write_addr_valid <= \'1\';
                    s_fifo_we <= \'1\';

                    -- write state transition
                    write_state <= WRITE_DATA;
                end if;
            elsif (write_state = WRITE_DATA) then
                write_ready <= \'1\';
                s_fifo_we <= \'0\';
                write_addr_valid <= S_AXI_WVALID;
                
                if (S_AXI_WVALID = \'1\' and write_ready = \'1\') then
                    write_linear_addr_i <= Std_Logic_Vector(unsigned(write_linear_addr_i) + 1);
                end if;

                if (S_AXI_WLAST = \'1\' and write_ready = \'1\') then
                    -- start responding through B channel upon the last write data sample
                    S_AXI_BVALID_i <= \'1\';
                    -- write data is over
                    write_addr_valid <= \'0\';
                    write_ready <= \'0\';
                    -- write state transition
                    write_state <= WRITE_RESPONSE;
                end if;
            elsif (write_state = WRITE_RESPONSE) then

                if (S_AXI_BREADY = \'1\') then
                    -- write respond is over
                    S_AXI_BVALID_i <= \'0\';
                    S_AXI_BID_i <= (others => \'0\');

                    -- write state transition
                    write_state <= IDLE;
                end if;
            end if;
        end if;
    end if;
end process Cmd_Decode_Write;

Write_Linear_Addr_Decode : process(AXI_AClk) is 

begin
    if (AXI_AClk\'event and AXI_AClk = \'1\') then
        if (AXI_AResetN = \'0\') then
            -- \'To Register\'
            -- \'To FIFO\'
            -- \'Shared Memory\'
        else
            -- default assignments

        
        
        
        end if;
    end if;
end process Write_Linear_Addr_Decode;
 
-----------------------------------------------------------------------------
-- READ Control
-----------------------------------------------------------------------------

S_AXI_RDATA  <= S_AXI_RDATA_i;
S_AXI_RVALID  <= S_AXI_RVALID_i;
S_AXI_RLAST   <= S_AXI_RLAST_i;
S_AXI_RID     <= S_AXI_RID_i;
-- TODO: no error checking
S_AXI_RRESP <= (others=>\'0\');

PROC_ARREADY_ACK: process(read_state, S_AXI_ARVALID, write_state, S_AXI_AWVALID) is begin
    -- Note: WRITE has higher priority than READ
    if (read_state = IDLE and S_AXI_ARVALID = \'1\' and write_state = IDLE and S_AXI_AWVALID /= \'1\') then
        S_AXI_ARREADY <= S_AXI_ARVALID;
    else
        S_AXI_ARREADY <= \'0\';
    end if;
end process PROC_ARREADY_ACK;

S_AXI_WREADY_i <= write_ready;

Process_Sideband: process(write_state, read_state) is begin
    if (read_state = READ_PREP) then
        s_shram_en <= \'1\';
    elsif (read_state = READ_DATA) then
        s_shram_en <= S_AXI_RREADY;
    elsif (write_state = WRITE_DATA) then
        s_shram_en <= S_AXI_WVALID;
    else
        s_shram_en <= \'0\';
    end if;
end process Process_Sideband;

Cmd_Decode_Read: process(AXI_AClk) is begin
    if (AXI_AClk\'event and AXI_AClk = \'1\') then
        if (AXI_AResetN = \'0\') then
            S_AXI_RVALID_i <= \'0\';
            read_bank_addr_i    <= (others => \'0\');
            read_linear_addr_i  <= (others => \'0\');
            S_AXI_ARLEN_i       <= (others => \'0\');
            S_AXI_RLAST_i       <= \'0\';
            S_AXI_RID_i         <= (others => \'0\');
            read_state          <= IDLE;
            read_prep_counter   <= (others => \'0\');
            read_addr_counter   <= (others => \'0\');
            read_data_counter   <= (others => \'0\');
        else
            -- default assignments
            s_fifo_re <= \'0\';

            if (read_state = IDLE) then
                -- Note WRITE has higher priority than READ
                if (S_AXI_ARVALID = \'1\' and write_state = IDLE and S_AXI_AWVALID /= \'1\') then
                    -- extract bank and linear addresses
                    read_bank_addr_i    <= S_AXI_ARADDR(C_S_AXI_TOTAL_ADDR_LEN-1 downto C_S_AXI_LINEAR_ADDR_LEN+2);
                    read_linear_addr_i  <= S_AXI_ARADDR(C_S_AXI_LINEAR_ADDR_LEN+1 downto 2);
                    s_fifo_re <= \'1\';

                    -- reflect arid
                    S_AXI_RID_i <= S_AXI_ARID;

                    -- load read liner address and data counter
                    read_addr_counter <= S_AXI_ARLEN;
                    read_data_counter <= S_AXI_ARLEN;

                    -- load read preparation counter
                    read_prep_counter <= C_READ_PREP_DELAY;
                    -- read state transition
                    read_state <= READ_PREP;
                end if;
            elsif (read_state = READ_PREP) then
                if (unsigned(read_prep_counter) = 0) then
                    if (unsigned(read_data_counter) = 0) then
                        -- tag the last data generated by the slave
                        S_AXI_RLAST_i <= \'1\';
                    end if;
                    -- valid data appears
                    S_AXI_RVALID_i <= \'1\';
                    -- read state transition
                    read_state <= READ_DATA;
                else
                    -- decrease read preparation counter
                    read_prep_counter <= Std_Logic_Vector(unsigned(read_prep_counter) - 1);
                end if;

                if (unsigned(read_prep_counter) /= 3 and unsigned(read_addr_counter) /= 0) then
                    -- decrease address counter
                    read_addr_counter <= Std_Logic_Vector(unsigned(read_addr_counter) - 1);
                    -- increase linear address (no band crossing)
                    read_linear_addr_i <= Std_Logic_Vector(unsigned(read_linear_addr_i) + 1);
                end if;
            elsif (read_state = READ_DATA) then
                if (S_AXI_RREADY = \'1\') then
                    if (unsigned(read_data_counter) = 1) then
                        -- tag the last data generated by the slave
                        S_AXI_RLAST_i <= \'1\';
                    end if;

                    if (unsigned(read_data_counter) = 0) then
                        -- arid
                        S_AXI_RID_i <= (others => \'0\');
                        -- rlast
                        S_AXI_RLAST_i <= \'0\';
                        -- no more valid data
                        S_AXI_RVALID_i <= \'0\';
                        -- read state transition
                        read_state <= IDLE;
                    else
                        -- decrease read preparation counter
                        read_data_counter <= Std_Logic_Vector(unsigned(read_data_counter) - 1);

                        if (unsigned(read_addr_counter) /= 0) then
                            -- decrease address counter
                            read_addr_counter <= Std_Logic_Vector(unsigned(read_addr_counter) - 1);
                            -- increase linear address (no band crossing)
                            read_linear_addr_i <= Std_Logic_Vector(unsigned(read_linear_addr_i) + 1);
                        end if;
                    end if;
                end if;
            end if;

        end if;
    end if;
end process Cmd_Decode_Read;

Read_Linear_Addr_Decode : process(AXI_AClk) is begin
    if (AXI_AClk\'event and AXI_AClk = \'1\') then
        if (AXI_AResetN = \'0\') then
            reg_bank_out_i   <= (others => \'0\');
            fifo_bank_out_i  <= (others => \'0\');
            shmem_bank_out_i <= (others => \'0\');
            S_AXI_RDATA_i    <= (others => \'0\');
        else
            if (unsigned(read_bank_addr_i) = 2) then
                -- \'From Register\'

                S_AXI_RDATA_i <= reg_bank_out_i;
            elsif (unsigned(read_bank_addr_i) = 1) then
                -- \'From FIFO\'
                -- \'To FIFO\'

                S_AXI_RDATA_i <= fifo_bank_out_i;
            elsif (unsigned(read_bank_addr_i) = 0 and s_shram_en = \'1\') then
                -- \'Shared Memory\'

                S_AXI_RDATA_i <= shmem_bank_out_i;
            end if;
        end if;
    end if;
end process Read_Linear_Addr_Decode;

end architecture IMP;
', },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  use SgGenerateCores;
  $instrs = [
    'SELECT ICON_(ChipScope_Pro_-_Integrated_Controller) zynq Xilinx,_Inc. 1.06.a',
    '# 14.4_P.49',
    '# DEVICE zynq',
    '# VHDL',
    'CSET enable_jtag_bufg = false',
    'CSET example_design = false',
    'CSET number_control_ports = 1',
    'CSET use_ext_bscan = false',
    'CSET use_softbscan = false',
    'CSET use_unused_bscan = false',
    'CSET user_scan_chain = USER1',
    'CSET component_name = icon_1_06_a_a814991b9aa9824e',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = [
    'SELECT ILA_(ChipScope_Pro_-_Integrated_Logic_Analyzer) zynq Xilinx,_Inc. 1.05.a',
    '# 14.4_P.49',
    '# DEVICE zynq',
    '# VHDL',
    'CSET data_same_as_trigger = true',
    'CSET enable_storage_qualification = true',
    'CSET example_design = false',
    'CSET match_type_1 = basic',
    'CSET match_type_2 = basic',
    'CSET match_units_1 = 1',
    'CSET match_units_2 = 1',
    'CSET number_of_trigger_ports = 2',
    'CSET sample_data_depth = 8192',
    'CSET trigger_port_width_1 = 12',
    'CSET trigger_port_width_2 = 12',
    'CSET use_rpms = false',
    'CSET component_name = ila_1_05_a_e89dd420ec1efd2c',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'sourceFile' => 'hdl/xlchipscope.vhd',
    'templateKeyValues' => {
      'c_data_width' => '24',
      'data_is_trigger' => '1',
      'data_port_declaration' => '',
      'data_port_info' => '',
      'data_port_interface' => '',
      'entity_name' => 'xlchipscope',
      'icon_core_name' => 'icon_1_06_a_a814991b9aa9824e',
      'ila_core_name' => 'ila_1_05_a_e89dd420ec1efd2c',
      'num_data_ports' => '0',
      'num_trig_ports' => '2',
      'trig_port_declaration' => 'input[11:0] trig0;
input[11:0] trig1;
',
      'trig_port_info' => '	trig0 : in std_logic_vector(12-1 downto 0);
	trig1 : in std_logic_vector(12-1 downto 0);
',
      'trig_port_interface' => ' trig0, trig1,',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  local *wrapup = $Sg::{'wrapup'};
  push(@$results, &Sg::wrapup())   if (defined(&wrapup));
  local *wrapup = $SgDeliverFile::{'wrapup'};
  push(@$results, &SgDeliverFile::wrapup())   if (defined(&wrapup));
  local *wrapup = $SgGenerateCores::{'wrapup'};
  push(@$results, &SgGenerateCores::wrapup())   if (defined(&wrapup));
  use Carp qw(croak);
  $ENV{'SYSGEN'} = 'C:/Xilinx/14.4/ISE_DS/ISE/sysgen';
  open(RESULTS, '> C:/GIT/Chilipepper/Labs/Lab_4/sysgen/netlist/sysgen/script_results2477639778762126666') || 
    croak 'couldn\'t open C:/GIT/Chilipepper/Labs/Lab_4/sysgen/netlist/sysgen/script_results2477639778762126666';
  binmode(RESULTS);
  print RESULTS &Sg::toString($results) . "\n";
  close(RESULTS) || 
    croak 'trouble writing C:/GIT/Chilipepper/Labs/Lab_4/sysgen/netlist/sysgen/script_results2477639778762126666';
};

if ($@) {
  open(RESULTS, '> C:/GIT/Chilipepper/Labs/Lab_4/sysgen/netlist/sysgen/script_results2477639778762126666') || 
    croak 'couldn\'t open C:/GIT/Chilipepper/Labs/Lab_4/sysgen/netlist/sysgen/script_results2477639778762126666';
  binmode(RESULTS);
  print RESULTS $@ . "\n";
  close(RESULTS) || 
    croak 'trouble writing C:/GIT/Chilipepper/Labs/Lab_4/sysgen/netlist/sysgen/script_results2477639778762126666';
  exit(1);
}

exit(0);