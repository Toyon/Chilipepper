----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Design Name: 
-- Module Name: 
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adc_driver_cw_stub is
    port (
      axi_aresetn: in std_logic; 
      ce: in std_logic := '1'; 
      clk: in std_logic; -- clock period = 10.0 ns (100.0 Mhz)
      rx_iq_sel: in std_logic; 
      rxd: in std_logic_vector(11 downto 0); 
      s_axi_araddr: in std_logic_vector(31 downto 0); 
      s_axi_arburst: in std_logic_vector(1 downto 0); 
      s_axi_arcache: in std_logic_vector(3 downto 0); 
      s_axi_arid: in std_logic_vector(7 downto 0); 
      s_axi_arlen: in std_logic_vector(7 downto 0); 
      s_axi_arlock: in std_logic_vector(1 downto 0); 
      s_axi_arprot: in std_logic_vector(2 downto 0); 
      s_axi_arsize: in std_logic_vector(2 downto 0); 
      s_axi_arvalid: in std_logic; 
      s_axi_awaddr: in std_logic_vector(31 downto 0); 
      s_axi_awburst: in std_logic_vector(1 downto 0); 
      s_axi_awcache: in std_logic_vector(3 downto 0); 
      s_axi_awid: in std_logic_vector(7 downto 0); 
      s_axi_awlen: in std_logic_vector(7 downto 0); 
      s_axi_awlock: in std_logic_vector(1 downto 0); 
      s_axi_awprot: in std_logic_vector(2 downto 0); 
      s_axi_awsize: in std_logic_vector(2 downto 0); 
      s_axi_awvalid: in std_logic; 
      s_axi_bready: in std_logic; 
      s_axi_rready: in std_logic; 
      s_axi_wdata: in std_logic_vector(31 downto 0); 
      s_axi_wlast: in std_logic; 
      s_axi_wstrb: in std_logic_vector(3 downto 0); 
      s_axi_wvalid: in std_logic; 
      xps_ce: in std_logic := '1'; 
      xps_clk: in std_logic; -- clock period = 10.0 ns (100.0 Mhz)
      blinky_adc_driver: out std_logic; 
      rx_i: out std_logic_vector(11 downto 0); 
      rx_q: out std_logic_vector(11 downto 0); 
      s_axi_arready: out std_logic; 
      s_axi_awready: out std_logic; 
      s_axi_bid: out std_logic_vector(7 downto 0); 
      s_axi_bresp: out std_logic_vector(1 downto 0); 
      s_axi_bvalid: out std_logic; 
      s_axi_rdata: out std_logic_vector(31 downto 0); 
      s_axi_rid: out std_logic_vector(7 downto 0); 
      s_axi_rlast: out std_logic; 
      s_axi_rresp: out std_logic_vector(1 downto 0); 
      s_axi_rvalid: out std_logic; 
      s_axi_wready: out std_logic
    );
end adc_driver_cw_stub;

architecture Behavioral of adc_driver_cw_stub is

  component adc_driver_cw
    port (
      axi_aresetn: in std_logic; 
      ce: in std_logic := '1'; 
      clk: in std_logic; -- clock period = 10.0 ns (100.0 Mhz)
      rx_iq_sel: in std_logic; 
      rxd: in std_logic_vector(11 downto 0); 
      s_axi_araddr: in std_logic_vector(31 downto 0); 
      s_axi_arburst: in std_logic_vector(1 downto 0); 
      s_axi_arcache: in std_logic_vector(3 downto 0); 
      s_axi_arid: in std_logic_vector(7 downto 0); 
      s_axi_arlen: in std_logic_vector(7 downto 0); 
      s_axi_arlock: in std_logic_vector(1 downto 0); 
      s_axi_arprot: in std_logic_vector(2 downto 0); 
      s_axi_arsize: in std_logic_vector(2 downto 0); 
      s_axi_arvalid: in std_logic; 
      s_axi_awaddr: in std_logic_vector(31 downto 0); 
      s_axi_awburst: in std_logic_vector(1 downto 0); 
      s_axi_awcache: in std_logic_vector(3 downto 0); 
      s_axi_awid: in std_logic_vector(7 downto 0); 
      s_axi_awlen: in std_logic_vector(7 downto 0); 
      s_axi_awlock: in std_logic_vector(1 downto 0); 
      s_axi_awprot: in std_logic_vector(2 downto 0); 
      s_axi_awsize: in std_logic_vector(2 downto 0); 
      s_axi_awvalid: in std_logic; 
      s_axi_bready: in std_logic; 
      s_axi_rready: in std_logic; 
      s_axi_wdata: in std_logic_vector(31 downto 0); 
      s_axi_wlast: in std_logic; 
      s_axi_wstrb: in std_logic_vector(3 downto 0); 
      s_axi_wvalid: in std_logic; 
      xps_ce: in std_logic := '1'; 
      xps_clk: in std_logic; -- clock period = 10.0 ns (100.0 Mhz)
      blinky_adc_driver: out std_logic; 
      rx_i: out std_logic_vector(11 downto 0); 
      rx_q: out std_logic_vector(11 downto 0); 
      s_axi_arready: out std_logic; 
      s_axi_awready: out std_logic; 
      s_axi_bid: out std_logic_vector(7 downto 0); 
      s_axi_bresp: out std_logic_vector(1 downto 0); 
      s_axi_bvalid: out std_logic; 
      s_axi_rdata: out std_logic_vector(31 downto 0); 
      s_axi_rid: out std_logic_vector(7 downto 0); 
      s_axi_rlast: out std_logic; 
      s_axi_rresp: out std_logic_vector(1 downto 0); 
      s_axi_rvalid: out std_logic; 
      s_axi_wready: out std_logic
    );
  end component;
begin

adc_driver_cw_i : adc_driver_cw
  port map (
    axi_aresetn => axi_aresetn,
    ce => ce,
    clk => clk,
    rx_iq_sel => rx_iq_sel,
    rxd => rxd,
    s_axi_araddr => s_axi_araddr,
    s_axi_arburst => s_axi_arburst,
    s_axi_arcache => s_axi_arcache,
    s_axi_arid => s_axi_arid,
    s_axi_arlen => s_axi_arlen,
    s_axi_arlock => s_axi_arlock,
    s_axi_arprot => s_axi_arprot,
    s_axi_arsize => s_axi_arsize,
    s_axi_arvalid => s_axi_arvalid,
    s_axi_awaddr => s_axi_awaddr,
    s_axi_awburst => s_axi_awburst,
    s_axi_awcache => s_axi_awcache,
    s_axi_awid => s_axi_awid,
    s_axi_awlen => s_axi_awlen,
    s_axi_awlock => s_axi_awlock,
    s_axi_awprot => s_axi_awprot,
    s_axi_awsize => s_axi_awsize,
    s_axi_awvalid => s_axi_awvalid,
    s_axi_bready => s_axi_bready,
    s_axi_rready => s_axi_rready,
    s_axi_wdata => s_axi_wdata,
    s_axi_wlast => s_axi_wlast,
    s_axi_wstrb => s_axi_wstrb,
    s_axi_wvalid => s_axi_wvalid,
    xps_ce => xps_ce,
    xps_clk => xps_clk,
    blinky_adc_driver => blinky_adc_driver,
    rx_i => rx_i,
    rx_q => rx_q,
    s_axi_arready => s_axi_arready,
    s_axi_awready => s_axi_awready,
    s_axi_bid => s_axi_bid,
    s_axi_bresp => s_axi_bresp,
    s_axi_bvalid => s_axi_bvalid,
    s_axi_rdata => s_axi_rdata,
    s_axi_rid => s_axi_rid,
    s_axi_rlast => s_axi_rlast,
    s_axi_rresp => s_axi_rresp,
    s_axi_rvalid => s_axi_rvalid,
    s_axi_wready => s_axi_wready);
end Behavioral;

