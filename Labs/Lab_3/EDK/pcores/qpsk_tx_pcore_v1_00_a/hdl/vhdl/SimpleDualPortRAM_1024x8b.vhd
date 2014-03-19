-- -------------------------------------------------------------
-- 
-- File Name: C:\GIT\Chilipepper_Labs\Labs\Lab_3\MATLAB\codegen\qpsk_tx\hdlsrc\SimpleDualPortRAM_1024x8b.vhd
-- Created: 2014-03-19 13:38:14
-- 
-- Generated by MATLAB 8.3, MATLAB Coder 2.6 and HDL Coder 3.4
-- 
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SimpleDualPortRAM_1024x8b
-- Source Path: qpsk_tx_fixpt/tx_fifo_ram/SimpleDualPortRAM_1024x8b
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SimpleDualPortRAM_1024x8b IS
  PORT( clk                               :   IN    std_logic;
        enb                               :   IN    std_logic;
        wr_din                            :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        wr_addr                           :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
        wr_en                             :   IN    std_logic;  -- ufix1
        rd_addr                           :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
        rd_dout                           :   OUT   std_logic_vector(7 DOWNTO 0)  -- ufix8
        );
END SimpleDualPortRAM_1024x8b;


ARCHITECTURE rtl OF SimpleDualPortRAM_1024x8b IS

  -- Local Type Definitions
  CONSTANT AddrWidth : INTEGER := 10;
  CONSTANT DataWidth : INTEGER := 8;
  TYPE ram_type IS ARRAY (2**AddrWidth - 1 DOWNTO 0) of std_logic_vector(DataWidth - 1 DOWNTO 0);

  -- Signals
  SIGNAL ram                              : ram_type := (OTHERS => (OTHERS => '0'));
  SIGNAL data_int                         : std_logic_vector(DataWidth - 1 DOWNTO 0) := (OTHERS => '0');
  SIGNAL wr_addr_unsigned                 : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL rd_addr_unsigned                 : unsigned(9 DOWNTO 0);  -- ufix10

BEGIN
  wr_addr_unsigned <= unsigned(wr_addr);

  rd_addr_unsigned <= unsigned(rd_addr);

  SimpleDualPortRAM_1024x8b_process: PROCESS (clk)
  BEGIN
    IF clk'event AND clk = '1' THEN
      IF enb = '1' THEN
        IF wr_en = '1' THEN
          ram(to_integer(wr_addr_unsigned)) <= wr_din;
        END IF;
        data_int <= ram(to_integer(rd_addr_unsigned));
      END IF;
    END IF;
  END PROCESS SimpleDualPortRAM_1024x8b_process;

  rd_dout <= data_int;

END rtl;

