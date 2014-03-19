-- -------------------------------------------------------------
-- 
-- File Name: C:\GIT\Chilipepper_Labs\Labs\Lab_3\MATLAB\codegen\qpsk_tx\hdlsrc\qpsk_tx_pcore_addr_decoder.vhd
-- Created: 2014-03-19 13:38:16
-- 
-- Generated by MATLAB 8.3, MATLAB Coder 2.6 and HDL Coder 3.4
-- 
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: qpsk_tx_pcore_addr_decoder
-- Source Path: qpsk_tx_pcore/qpsk_tx_pcore_axi_lite/qpsk_tx_pcore_addr_decoder
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY qpsk_tx_pcore_addr_decoder IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        data_write                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        addr_sel                          :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14
        wr_enb                            :   IN    std_logic;  -- ufix1
        rd_enb                            :   IN    std_logic;  -- ufix1
        read_tx_done_out                  :   IN    std_logic;  -- ufix1
        data_read                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_axi_enable                  :   OUT   std_logic;  -- ufix1
        write_clear_fifo_in               :   OUT   std_logic;  -- ufix1
        write_tx_en_in                    :   OUT   std_logic  -- ufix1
        );
END qpsk_tx_pcore_addr_decoder;


ARCHITECTURE rtl OF qpsk_tx_pcore_addr_decoder IS

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL addr_sel_unsigned                : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL decode_sel_tx_done_out           : std_logic;  -- ufix1
  SIGNAL const_1                          : std_logic;  -- ufix1
  SIGNAL const_z                          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_tx_done_out             : std_logic;  -- ufix1
  SIGNAL data_in_tx_done_out              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_tx_done_out            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL data_write_unsigned              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL data_in_axi_enable               : std_logic;  -- ufix1
  SIGNAL decode_sel_axi_enable            : std_logic;  -- ufix1
  SIGNAL reg_enb_axi_enable               : std_logic;  -- ufix1
  SIGNAL write_reg_axi_enable             : std_logic;  -- ufix1
  SIGNAL data_in_clear_fifo_in            : std_logic;  -- ufix1
  SIGNAL decode_sel_clear_fifo_in         : std_logic;  -- ufix1
  SIGNAL reg_enb_clear_fifo_in            : std_logic;  -- ufix1
  SIGNAL write_reg_clear_fifo_in          : std_logic;  -- ufix1
  SIGNAL data_in_tx_en_in                 : std_logic;  -- ufix1
  SIGNAL decode_sel_tx_en_in              : std_logic;  -- ufix1
  SIGNAL reg_enb_tx_en_in                 : std_logic;  -- ufix1
  SIGNAL write_reg_tx_en_in               : std_logic;  -- ufix1

BEGIN
  addr_sel_unsigned <= unsigned(addr_sel);

  
  decode_sel_tx_done_out <= '1' WHEN addr_sel_unsigned = 66 ELSE
      '0';

  const_1 <= '1';

  enb <= const_1;

  const_z <= (OTHERS => 'Z');


  reg_tx_done_out_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      read_reg_tx_done_out <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        read_reg_tx_done_out <= read_tx_done_out;
      END IF;
    END IF;
  END PROCESS reg_tx_done_out_process;


  data_in_tx_done_out <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & read_reg_tx_done_out;

  
  decode_rd_tx_done_out <= const_z WHEN decode_sel_tx_done_out = '0' ELSE
      data_in_tx_done_out;

  data_read <= std_logic_vector(decode_rd_tx_done_out);

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

  data_in_clear_fifo_in <= data_write_unsigned(0);

  
  decode_sel_clear_fifo_in <= '1' WHEN addr_sel_unsigned = 64 ELSE
      '0';

  reg_enb_clear_fifo_in <= decode_sel_clear_fifo_in AND wr_enb;

  reg_clear_fifo_in_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      write_reg_clear_fifo_in <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_clear_fifo_in = '1' THEN
        write_reg_clear_fifo_in <= data_in_clear_fifo_in;
      END IF;
    END IF;
  END PROCESS reg_clear_fifo_in_process;


  write_clear_fifo_in <= write_reg_clear_fifo_in;

  data_in_tx_en_in <= data_write_unsigned(0);

  
  decode_sel_tx_en_in <= '1' WHEN addr_sel_unsigned = 65 ELSE
      '0';

  reg_enb_tx_en_in <= decode_sel_tx_en_in AND wr_enb;

  reg_tx_en_in_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      write_reg_tx_en_in <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_tx_en_in = '1' THEN
        write_reg_tx_en_in <= data_in_tx_en_in;
      END IF;
    END IF;
  END PROCESS reg_tx_en_in_process;


  write_tx_en_in <= write_reg_tx_en_in;

END rtl;

