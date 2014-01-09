-- -------------------------------------------------------------
-- 
-- File Name: C:\GIT\QPSK_Pcore\Labs\Lab_8\MATLAB\codegen\dc_offset_correction\hdlsrc\dc_offset_pcore_addr_decoder.vhd
-- Created: 2013-12-31 17:34:21
-- 
-- Generated by MATLAB 8.3, MATLAB Coder 2.6 and HDL Coder 3.4
-- 
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: dc_offset_pcore_addr_decoder
-- Source Path: dc_offset_pcore/dc_offset_pcore_axi_lite/dc_offset_pcore_addr_decoder
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY dc_offset_pcore_addr_decoder IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        data_write                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        addr_sel                          :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14
        wr_enb                            :   IN    std_logic;  -- ufix1
        rd_enb                            :   IN    std_logic;  -- ufix1
        read_rssi_out                     :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix24
        read_rssi_en_out                  :   IN    std_logic;  -- ufix1
        read_dir_out                      :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        read_dir_en_out                   :   IN    std_logic;  -- ufix1
        data_read                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_axi_enable                  :   OUT   std_logic;  -- ufix1
        write_gain_en_in                  :   OUT   std_logic;  -- ufix1
        write_rssi_low_goal_in            :   OUT   std_logic_vector(23 DOWNTO 0);  -- ufix24
        write_rssi_high_goal_in           :   OUT   std_logic_vector(23 DOWNTO 0);  -- ufix24
        write_rx_en_in                    :   OUT   std_logic  -- ufix1
        );
END dc_offset_pcore_addr_decoder;


ARCHITECTURE rtl OF dc_offset_pcore_addr_decoder IS

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL addr_sel_unsigned                : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL decode_sel_rssi_out              : std_logic;  -- ufix1
  SIGNAL read_rssi_out_unsigned           : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL const_1                          : std_logic;  -- ufix1
  SIGNAL read_dir_out_unsigned            : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL decode_sel_dir_en_out            : std_logic;  -- ufix1
  SIGNAL decode_sel_dir_out               : std_logic;  -- ufix1
  SIGNAL decode_sel_rssi_en_out           : std_logic;  -- ufix1
  SIGNAL const_z                          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_rssi_out                : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL data_in_rssi_out                 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_rssi_out               : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_rssi_en_out             : std_logic;  -- ufix1
  SIGNAL data_in_rssi_en_out              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_rssi_en_out            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_dir_out                 : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL data_in_dir_out                  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_dir_out                : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_dir_en_out              : std_logic;  -- ufix1
  SIGNAL data_in_dir_en_out               : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_dir_en_out             : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL data_write_unsigned              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL data_in_axi_enable               : std_logic;  -- ufix1
  SIGNAL decode_sel_axi_enable            : std_logic;  -- ufix1
  SIGNAL reg_enb_axi_enable               : std_logic;  -- ufix1
  SIGNAL write_reg_axi_enable             : std_logic;  -- ufix1
  SIGNAL data_in_gain_en_in               : std_logic;  -- ufix1
  SIGNAL decode_sel_gain_en_in            : std_logic;  -- ufix1
  SIGNAL reg_enb_gain_en_in               : std_logic;  -- ufix1
  SIGNAL write_reg_gain_en_in             : std_logic;  -- ufix1
  SIGNAL data_in_rssi_low_goal_in         : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL decode_sel_rssi_low_goal_in      : std_logic;  -- ufix1
  SIGNAL reg_enb_rssi_low_goal_in         : std_logic;  -- ufix1
  SIGNAL write_reg_rssi_low_goal_in       : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL data_in_rssi_high_goal_in        : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL decode_sel_rssi_high_goal_in     : std_logic;  -- ufix1
  SIGNAL reg_enb_rssi_high_goal_in        : std_logic;  -- ufix1
  SIGNAL write_reg_rssi_high_goal_in      : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL data_in_rx_en_in                 : std_logic;  -- ufix1
  SIGNAL decode_sel_rx_en_in              : std_logic;  -- ufix1
  SIGNAL reg_enb_rx_en_in                 : std_logic;  -- ufix1
  SIGNAL write_reg_rx_en_in               : std_logic;  -- ufix1

BEGIN
  addr_sel_unsigned <= unsigned(addr_sel);

  
  decode_sel_rssi_out <= '1' WHEN addr_sel_unsigned = 68 ELSE
      '0';

  read_rssi_out_unsigned <= unsigned(read_rssi_out);

  const_1 <= '1';

  enb <= const_1;

  read_dir_out_unsigned <= unsigned(read_dir_out);

  
  decode_sel_dir_en_out <= '1' WHEN addr_sel_unsigned = 71 ELSE
      '0';

  
  decode_sel_dir_out <= '1' WHEN addr_sel_unsigned = 70 ELSE
      '0';

  
  decode_sel_rssi_en_out <= '1' WHEN addr_sel_unsigned = 69 ELSE
      '0';

  const_z <= (OTHERS => 'Z');


  reg_rssi_out_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      read_reg_rssi_out <= to_unsigned(16#000000#, 24);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        read_reg_rssi_out <= read_rssi_out_unsigned;
      END IF;
    END IF;
  END PROCESS reg_rssi_out_process;


  data_in_rssi_out <= resize(read_reg_rssi_out, 32);

  
  decode_rd_rssi_out <= const_z WHEN decode_sel_rssi_out = '0' ELSE
      data_in_rssi_out;

  reg_rssi_en_out_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      read_reg_rssi_en_out <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        read_reg_rssi_en_out <= read_rssi_en_out;
      END IF;
    END IF;
  END PROCESS reg_rssi_en_out_process;


  data_in_rssi_en_out <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & read_reg_rssi_en_out;

  
  decode_rd_rssi_en_out <= decode_rd_rssi_out WHEN decode_sel_rssi_en_out = '0' ELSE
      data_in_rssi_en_out;

  reg_dir_out_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      read_reg_dir_out <= to_unsigned(2#00#, 2);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        read_reg_dir_out <= read_dir_out_unsigned;
      END IF;
    END IF;
  END PROCESS reg_dir_out_process;


  data_in_dir_out <= resize(read_reg_dir_out, 32);

  
  decode_rd_dir_out <= decode_rd_rssi_en_out WHEN decode_sel_dir_out = '0' ELSE
      data_in_dir_out;

  reg_dir_en_out_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      read_reg_dir_en_out <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        read_reg_dir_en_out <= read_dir_en_out;
      END IF;
    END IF;
  END PROCESS reg_dir_en_out_process;


  data_in_dir_en_out <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & read_reg_dir_en_out;

  
  decode_rd_dir_en_out <= decode_rd_dir_out WHEN decode_sel_dir_en_out = '0' ELSE
      data_in_dir_en_out;

  data_read <= std_logic_vector(decode_rd_dir_en_out);

  data_write_unsigned <= unsigned(data_write);

  data_in_axi_enable <= data_write_unsigned(0);

  
  decode_sel_axi_enable <= '1' WHEN addr_sel_unsigned = 1 ELSE
      '0';

  reg_enb_axi_enable <= decode_sel_axi_enable AND wr_enb;

  reg_axi_enable_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      write_reg_axi_enable <= '1';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_axi_enable = '1' THEN
        write_reg_axi_enable <= data_in_axi_enable;
      END IF;
    END IF;
  END PROCESS reg_axi_enable_process;


  write_axi_enable <= write_reg_axi_enable;

  data_in_gain_en_in <= data_write_unsigned(0);

  
  decode_sel_gain_en_in <= '1' WHEN addr_sel_unsigned = 64 ELSE
      '0';

  reg_enb_gain_en_in <= decode_sel_gain_en_in AND wr_enb;

  reg_gain_en_in_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      write_reg_gain_en_in <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_gain_en_in = '1' THEN
        write_reg_gain_en_in <= data_in_gain_en_in;
      END IF;
    END IF;
  END PROCESS reg_gain_en_in_process;


  write_gain_en_in <= write_reg_gain_en_in;

  data_in_rssi_low_goal_in <= data_write_unsigned(23 DOWNTO 0);

  
  decode_sel_rssi_low_goal_in <= '1' WHEN addr_sel_unsigned = 65 ELSE
      '0';

  reg_enb_rssi_low_goal_in <= decode_sel_rssi_low_goal_in AND wr_enb;

  reg_rssi_low_goal_in_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      write_reg_rssi_low_goal_in <= to_unsigned(16#000000#, 24);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_rssi_low_goal_in = '1' THEN
        write_reg_rssi_low_goal_in <= data_in_rssi_low_goal_in;
      END IF;
    END IF;
  END PROCESS reg_rssi_low_goal_in_process;


  write_rssi_low_goal_in <= std_logic_vector(write_reg_rssi_low_goal_in);

  data_in_rssi_high_goal_in <= data_write_unsigned(23 DOWNTO 0);

  
  decode_sel_rssi_high_goal_in <= '1' WHEN addr_sel_unsigned = 66 ELSE
      '0';

  reg_enb_rssi_high_goal_in <= decode_sel_rssi_high_goal_in AND wr_enb;

  reg_rssi_high_goal_in_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      write_reg_rssi_high_goal_in <= to_unsigned(16#000000#, 24);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_rssi_high_goal_in = '1' THEN
        write_reg_rssi_high_goal_in <= data_in_rssi_high_goal_in;
      END IF;
    END IF;
  END PROCESS reg_rssi_high_goal_in_process;


  write_rssi_high_goal_in <= std_logic_vector(write_reg_rssi_high_goal_in);

  data_in_rx_en_in <= data_write_unsigned(0);

  
  decode_sel_rx_en_in <= '1' WHEN addr_sel_unsigned = 67 ELSE
      '0';

  reg_enb_rx_en_in <= decode_sel_rx_en_in AND wr_enb;

  reg_rx_en_in_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      write_reg_rx_en_in <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_rx_en_in = '1' THEN
        write_reg_rx_en_in <= data_in_rx_en_in;
      END IF;
    END IF;
  END PROCESS reg_rx_en_in_process;


  write_rx_en_in <= write_reg_rx_en_in;

END rtl;

