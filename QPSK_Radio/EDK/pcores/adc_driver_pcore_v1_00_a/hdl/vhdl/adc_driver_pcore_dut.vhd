-- -------------------------------------------------------------
-- 
-- File Name: C:\GIT\QPSK_Pcore\Labs\Lab_2\MATLAB\codegen\adc_driver\hdlsrc\adc_driver_pcore_dut.vhd
-- Created: 2014-01-16 12:23:10
-- 
-- Generated by MATLAB 8.3, MATLAB Coder 2.6 and HDL Coder 3.4
-- 
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: adc_driver_pcore_dut
-- Source Path: adc_driver_pcore/adc_driver_pcore_dut
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY adc_driver_pcore_dut IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        dut_enable                        :   IN    std_logic;  -- ufix1
        rxd                               :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        rx_iq_sel                         :   IN    std_logic;  -- ufix1
        ce_out                            :   OUT   std_logic;  -- ufix1
        rx_i                              :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        rx_q                              :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        blinky                            :   OUT   std_logic  -- ufix1
        );
END adc_driver_pcore_dut;


ARCHITECTURE rtl OF adc_driver_pcore_dut IS

  -- Component Declarations
  COMPONENT adc_driver_fixpt
    PORT( clk                             :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          reset                           :   IN    std_logic;
          rxd                             :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
          rx_iq_sel                       :   IN    std_logic;  -- ufix1
          ce_out                          :   OUT   std_logic;  -- ufix1
          rx_i                            :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
          rx_q                            :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
          blinky                          :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : adc_driver_fixpt
    USE ENTITY work.adc_driver_fixpt(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL rx_iq_sel_sig                    : std_logic;  -- ufix1
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL rx_i_sig                         : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL rx_q_sig                         : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL blinky_sig                       : std_logic;  -- ufix1

BEGIN
  u_adc_driver_fixpt : adc_driver_fixpt
    PORT MAP( clk => clk,
              clk_enable => enb,
              reset => reset,
              rxd => rxd,  -- sfix12
              rx_iq_sel => rx_iq_sel_sig,  -- ufix1
              ce_out => ce_out_sig,  -- ufix1
              rx_i => rx_i_sig,  -- sfix12
              rx_q => rx_q_sig,  -- sfix12
              blinky => blinky_sig  -- ufix1
              );

  rx_iq_sel_sig <= rx_iq_sel;

  enb <= dut_enable;

  ce_out <= ce_out_sig;

  rx_i <= rx_i_sig;

  rx_q <= rx_q_sig;

  blinky <= blinky_sig;

END rtl;

