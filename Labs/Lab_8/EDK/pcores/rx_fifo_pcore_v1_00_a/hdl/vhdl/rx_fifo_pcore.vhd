-- -------------------------------------------------------------
-- 
-- File Name: C:\GIT\pcore_Examples\Receiver_pcore_fifo\MATLAB\codegen\rx_fifo\hdlsrc\rx_fifo_pcore.vhd
-- Created: 2013-12-30 11:51:50
-- 
-- Generated by MATLAB 8.3, MATLAB Coder 2.6 and HDL Coder 3.4
-- 
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: -1
-- Target subsystem base rate: -1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_fifo_pcore
-- Source Path: rx_fifo_pcore
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY rx_fifo_pcore IS
  PORT( IPCORE_CLK                        :   IN    std_logic;  -- ufix1
        IPCORE_RESETN                     :   IN    std_logic;  -- ufix1
        reset_fifo                        :   IN    std_logic;  -- ufix1
        store_byte                        :   IN    std_logic;  -- ufix1
        byte_in                           :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        AXI_Lite_ACLK                     :   IN    std_logic;  -- ufix1
        AXI_Lite_ARESETN                  :   IN    std_logic;  -- ufix1
        AXI_Lite_AWADDR                   :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Lite_AWVALID                  :   IN    std_logic;  -- ufix1
        AXI_Lite_WDATA                    :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Lite_WSTRB                    :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        AXI_Lite_WVALID                   :   IN    std_logic;  -- ufix1
        AXI_Lite_BREADY                   :   IN    std_logic;  -- ufix1
        AXI_Lite_ARADDR                   :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Lite_ARVALID                  :   IN    std_logic;  -- ufix1
        AXI_Lite_RREADY                   :   IN    std_logic;  -- ufix1
        AXI_Lite_AWREADY                  :   OUT   std_logic;  -- ufix1
        AXI_Lite_WREADY                   :   OUT   std_logic;  -- ufix1
        AXI_Lite_BRESP                    :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI_Lite_BVALID                   :   OUT   std_logic;  -- ufix1
        AXI_Lite_ARREADY                  :   OUT   std_logic;  -- ufix1
        AXI_Lite_RDATA                    :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI_Lite_RRESP                    :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI_Lite_RVALID                   :   OUT   std_logic  -- ufix1
        );
END rx_fifo_pcore;


ARCHITECTURE rtl OF rx_fifo_pcore IS

  -- Component Declarations
  COMPONENT rx_fifo_pcore_dut
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset                           :   IN    std_logic;
          dut_enable                      :   IN    std_logic;  -- ufix1
          reset_fifo                      :   IN    std_logic;  -- ufix1
          store_byte                      :   IN    std_logic;  -- ufix1
          byte_in                         :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
          get_byte                        :   IN    std_logic;  -- ufix1
          ce_out                          :   OUT   std_logic;  -- ufix1
          dout                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          bytes_available                 :   OUT   std_logic;  -- ufix1
          byte_ready                      :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  COMPONENT rx_fifo_pcore_axi_lite
    PORT( reset                           :   IN    std_logic;
          AXI_Lite_ACLK                   :   IN    std_logic;  -- ufix1
          AXI_Lite_ARESETN                :   IN    std_logic;  -- ufix1
          AXI_Lite_AWADDR                 :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Lite_AWVALID                :   IN    std_logic;  -- ufix1
          AXI_Lite_WDATA                  :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Lite_WSTRB                  :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          AXI_Lite_WVALID                 :   IN    std_logic;  -- ufix1
          AXI_Lite_BREADY                 :   IN    std_logic;  -- ufix1
          AXI_Lite_ARADDR                 :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Lite_ARVALID                :   IN    std_logic;  -- ufix1
          AXI_Lite_RREADY                 :   IN    std_logic;  -- ufix1
          read_dout                       :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          read_bytes_available            :   IN    std_logic;  -- ufix1
          read_byte_ready                 :   IN    std_logic;  -- ufix1
          AXI_Lite_AWREADY                :   OUT   std_logic;  -- ufix1
          AXI_Lite_WREADY                 :   OUT   std_logic;  -- ufix1
          AXI_Lite_BRESP                  :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI_Lite_BVALID                 :   OUT   std_logic;  -- ufix1
          AXI_Lite_ARREADY                :   OUT   std_logic;  -- ufix1
          AXI_Lite_RDATA                  :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI_Lite_RRESP                  :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI_Lite_RVALID                 :   OUT   std_logic;  -- ufix1
          write_axi_enable                :   OUT   std_logic;  -- ufix1
          write_get_byte                  :   OUT   std_logic;  -- ufix1
          reset_internal                  :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : rx_fifo_pcore_dut
    USE ENTITY work.rx_fifo_pcore_dut(rtl);

  FOR ALL : rx_fifo_pcore_axi_lite
    USE ENTITY work.rx_fifo_pcore_axi_lite(rtl);

  -- Signals
  SIGNAL reset                            : std_logic;
  SIGNAL reset_cm                         : std_logic;  -- ufix1
  SIGNAL reset_internal                   : std_logic;  -- ufix1
  SIGNAL dut_enable                       : std_logic;  -- ufix1
  SIGNAL get_byte_sig                     : std_logic;  -- ufix1
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL dout_sig                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL bytes_available_sig              : std_logic;  -- ufix1
  SIGNAL byte_ready_sig                   : std_logic;  -- ufix1
  SIGNAL AXI_Lite_BRESP_tmp               : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL AXI_Lite_RDATA_tmp               : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI_Lite_RRESP_tmp               : std_logic_vector(1 DOWNTO 0);  -- ufix2

BEGIN
  u_rx_fifo_pcore_dut_inst : rx_fifo_pcore_dut
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset => reset,
              dut_enable => dut_enable,  -- ufix1
              reset_fifo => reset_fifo,  -- ufix1
              store_byte => store_byte,  -- ufix1
              byte_in => byte_in,  -- ufix8
              get_byte => get_byte_sig,  -- ufix1
              ce_out => ce_out_sig,  -- ufix1
              dout => dout_sig,  -- ufix32
              bytes_available => bytes_available_sig,  -- ufix1
              byte_ready => byte_ready_sig  -- ufix1
              );

  u_rx_fifo_pcore_axi_lite_inst : rx_fifo_pcore_axi_lite
    PORT MAP( reset => reset,
              AXI_Lite_ACLK => AXI_Lite_ACLK,  -- ufix1
              AXI_Lite_ARESETN => AXI_Lite_ARESETN,  -- ufix1
              AXI_Lite_AWADDR => AXI_Lite_AWADDR,  -- ufix32
              AXI_Lite_AWVALID => AXI_Lite_AWVALID,  -- ufix1
              AXI_Lite_WDATA => AXI_Lite_WDATA,  -- ufix32
              AXI_Lite_WSTRB => AXI_Lite_WSTRB,  -- ufix4
              AXI_Lite_WVALID => AXI_Lite_WVALID,  -- ufix1
              AXI_Lite_BREADY => AXI_Lite_BREADY,  -- ufix1
              AXI_Lite_ARADDR => AXI_Lite_ARADDR,  -- ufix32
              AXI_Lite_ARVALID => AXI_Lite_ARVALID,  -- ufix1
              AXI_Lite_RREADY => AXI_Lite_RREADY,  -- ufix1
              read_dout => dout_sig,  -- ufix32
              read_bytes_available => bytes_available_sig,  -- ufix1
              read_byte_ready => byte_ready_sig,  -- ufix1
              AXI_Lite_AWREADY => AXI_Lite_AWREADY,  -- ufix1
              AXI_Lite_WREADY => AXI_Lite_WREADY,  -- ufix1
              AXI_Lite_BRESP => AXI_Lite_BRESP_tmp,  -- ufix2
              AXI_Lite_BVALID => AXI_Lite_BVALID,  -- ufix1
              AXI_Lite_ARREADY => AXI_Lite_ARREADY,  -- ufix1
              AXI_Lite_RDATA => AXI_Lite_RDATA_tmp,  -- ufix32
              AXI_Lite_RRESP => AXI_Lite_RRESP_tmp,  -- ufix2
              AXI_Lite_RVALID => AXI_Lite_RVALID,  -- ufix1
              write_axi_enable => dut_enable,  -- ufix1
              write_get_byte => get_byte_sig,  -- ufix1
              reset_internal => reset_internal  -- ufix1
              );

  reset_cm <=  NOT IPCORE_RESETN;

  reset <= reset_cm OR reset_internal;

  AXI_Lite_BRESP <= AXI_Lite_BRESP_tmp;

  AXI_Lite_RDATA <= AXI_Lite_RDATA_tmp;

  AXI_Lite_RRESP <= AXI_Lite_RRESP_tmp;

END rtl;

