-- -------------------------------------------------------------
-- 
-- File Name: C:\Users\D-Money\Desktop\Xilinx_stuff\GIT\Chilipepper_Labs\Labs\Lab_8\MATLAB\codegen\rx_fifo\hdlsrc\rx_fifo_pcore_addr_decoder.vhd
-- Created: 2014-05-18 18:30:51
-- 
-- Generated by MATLAB 8.3, MATLAB Coder 2.6 and HDL Coder 3.4
-- 
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_fifo_pcore_addr_decoder
-- Source Path: rx_fifo_pcore/rx_fifo_pcore_axi_lite/rx_fifo_pcore_addr_decoder
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY rx_fifo_pcore_addr_decoder IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        data_write                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        addr_sel                          :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14
        wr_enb                            :   IN    std_logic;  -- ufix1
        rd_enb                            :   IN    std_logic;  -- ufix1
        read_dout                         :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        read_bytes_available              :   IN    std_logic;  -- ufix1
        read_byte_ready                   :   IN    std_logic;  -- ufix1
        data_read                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_axi_enable                  :   OUT   std_logic;  -- ufix1
        write_get_byte                    :   OUT   std_logic  -- ufix1
        );
END rx_fifo_pcore_addr_decoder;


ARCHITECTURE rtl OF rx_fifo_pcore_addr_decoder IS

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL addr_sel_unsigned                : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL decode_sel_dout                  : std_logic;  -- ufix1
  SIGNAL const_z                          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_dout_unsigned               : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL const_1                          : std_logic;  -- ufix1
  SIGNAL decode_sel_byte_ready            : std_logic;  -- ufix1
  SIGNAL decode_sel_bytes_available       : std_logic;  -- ufix1
  SIGNAL read_reg_dout                    : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_dout                   : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_bytes_available         : std_logic;  -- ufix1
  SIGNAL data_in_bytes_available          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_bytes_available        : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_byte_ready              : std_logic;  -- ufix1
  SIGNAL data_in_byte_ready               : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_byte_ready             : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL data_write_unsigned              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL data_in_axi_enable               : std_logic;  -- ufix1
  SIGNAL decode_sel_axi_enable            : std_logic;  -- ufix1
  SIGNAL reg_enb_axi_enable               : std_logic;  -- ufix1
  SIGNAL write_reg_axi_enable             : std_logic;  -- ufix1
  SIGNAL data_in_get_byte                 : std_logic;  -- ufix1
  SIGNAL decode_sel_get_byte              : std_logic;  -- ufix1
  SIGNAL reg_enb_get_byte                 : std_logic;  -- ufix1
  SIGNAL write_reg_get_byte               : std_logic;  -- ufix1

BEGIN
  addr_sel_unsigned <= unsigned(addr_sel);

  
  decode_sel_dout <= '1' WHEN addr_sel_unsigned = 65 ELSE
      '0';

  const_z <= (OTHERS => 'Z');


  read_dout_unsigned <= unsigned(read_dout);

  const_1 <= '1';

  enb <= const_1;

  
  decode_sel_byte_ready <= '1' WHEN addr_sel_unsigned = 67 ELSE
      '0';

  
  decode_sel_bytes_available <= '1' WHEN addr_sel_unsigned = 66 ELSE
      '0';

  reg_dout_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      read_reg_dout <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        read_reg_dout <= read_dout_unsigned;
      END IF;
    END IF;
  END PROCESS reg_dout_process;


  
  decode_rd_dout <= const_z WHEN decode_sel_dout = '0' ELSE
      read_reg_dout;

  reg_bytes_available_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      read_reg_bytes_available <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        read_reg_bytes_available <= read_bytes_available;
      END IF;
    END IF;
  END PROCESS reg_bytes_available_process;


  data_in_bytes_available <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & read_reg_bytes_available;

  
  decode_rd_bytes_available <= decode_rd_dout WHEN decode_sel_bytes_available = '0' ELSE
      data_in_bytes_available;

  reg_byte_ready_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      read_reg_byte_ready <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        read_reg_byte_ready <= read_byte_ready;
      END IF;
    END IF;
  END PROCESS reg_byte_ready_process;


  data_in_byte_ready <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & read_reg_byte_ready;

  
  decode_rd_byte_ready <= decode_rd_bytes_available WHEN decode_sel_byte_ready = '0' ELSE
      data_in_byte_ready;

  data_read <= std_logic_vector(decode_rd_byte_ready);

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

  data_in_get_byte <= data_write_unsigned(0);

  
  decode_sel_get_byte <= '1' WHEN addr_sel_unsigned = 64 ELSE
      '0';

  reg_enb_get_byte <= decode_sel_get_byte AND wr_enb;

  reg_get_byte_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      write_reg_get_byte <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_get_byte = '1' THEN
        write_reg_get_byte <= data_in_get_byte;
      END IF;
    END IF;
  END PROCESS reg_get_byte_process;


  write_get_byte <= write_reg_get_byte;

END rtl;

