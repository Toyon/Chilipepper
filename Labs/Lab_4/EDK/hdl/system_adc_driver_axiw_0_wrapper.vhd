-------------------------------------------------------------------------------
-- system_adc_driver_axiw_0_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library adc_driver_axiw_v1_00_a;
use adc_driver_axiw_v1_00_a.all;

entity system_adc_driver_axiw_0_wrapper is
  port (
    axi_aresetn : in std_logic;
    sysgen_clk : in std_logic;
    rx_iq_sel : in std_logic;
    rxd : in std_logic_vector(0 to 11);
    s_axi_araddr : in std_logic_vector(0 to 31);
    s_axi_arburst : in std_logic_vector(0 to 1);
    s_axi_arcache : in std_logic_vector(0 to 3);
    s_axi_arid : in std_logic_vector(0 to 11);
    s_axi_arlen : in std_logic_vector(0 to 7);
    s_axi_arlock : in std_logic_vector(0 to 1);
    s_axi_arprot : in std_logic_vector(0 to 2);
    s_axi_arsize : in std_logic_vector(0 to 2);
    s_axi_arvalid : in std_logic;
    s_axi_awaddr : in std_logic_vector(0 to 31);
    s_axi_awburst : in std_logic_vector(0 to 1);
    s_axi_awcache : in std_logic_vector(0 to 3);
    s_axi_awid : in std_logic_vector(0 to 11);
    s_axi_awlen : in std_logic_vector(0 to 7);
    s_axi_awlock : in std_logic_vector(0 to 1);
    s_axi_awprot : in std_logic_vector(0 to 2);
    s_axi_awsize : in std_logic_vector(0 to 2);
    s_axi_awvalid : in std_logic;
    s_axi_bready : in std_logic;
    s_axi_rready : in std_logic;
    s_axi_wdata : in std_logic_vector(0 to 31);
    s_axi_wlast : in std_logic;
    s_axi_wstrb : in std_logic_vector(0 to 3);
    s_axi_wvalid : in std_logic;
    axi_aclk : in std_logic;
    blinky_adc_driver : out std_logic;
    rx_i : out std_logic_vector(0 to 11);
    rx_q : out std_logic_vector(0 to 11);
    s_axi_arready : out std_logic;
    s_axi_awready : out std_logic;
    s_axi_bid : out std_logic_vector(0 to 11);
    s_axi_bresp : out std_logic_vector(0 to 1);
    s_axi_bvalid : out std_logic;
    s_axi_rdata : out std_logic_vector(0 to 31);
    s_axi_rid : out std_logic_vector(0 to 11);
    s_axi_rlast : out std_logic;
    s_axi_rresp : out std_logic_vector(0 to 1);
    s_axi_rvalid : out std_logic;
    s_axi_wready : out std_logic
  );
end system_adc_driver_axiw_0_wrapper;

architecture STRUCTURE of system_adc_driver_axiw_0_wrapper is

  component adc_driver_axiw is
    generic (
      C_BASEADDR : std_logic_vector(31 downto 0);
      C_HIGHADDR : std_logic_vector(31 downto 0);
      C_S_AXI_ADDR_WIDTH : INTEGER;
      C_S_AXI_DATA_WIDTH : INTEGER;
      C_S_AXI_ID_WIDTH : INTEGER;
      C_S_AXI_SUPPORT_BURST : INTEGER
    );
    port (
      axi_aresetn : in std_logic;
      sysgen_clk : in std_logic;
      rx_iq_sel : in std_logic;
      rxd : in std_logic_vector(0 to (12-1));
      s_axi_araddr : in std_logic_vector(0 to (32-1));
      s_axi_arburst : in std_logic_vector(0 to (2-1));
      s_axi_arcache : in std_logic_vector(0 to (4-1));
      s_axi_arid : in std_logic_vector(0 to (C_S_AXI_ID_WIDTH-1));
      s_axi_arlen : in std_logic_vector(0 to (8-1));
      s_axi_arlock : in std_logic_vector(0 to (2-1));
      s_axi_arprot : in std_logic_vector(0 to (3-1));
      s_axi_arsize : in std_logic_vector(0 to (3-1));
      s_axi_arvalid : in std_logic;
      s_axi_awaddr : in std_logic_vector(0 to (32-1));
      s_axi_awburst : in std_logic_vector(0 to (2-1));
      s_axi_awcache : in std_logic_vector(0 to (4-1));
      s_axi_awid : in std_logic_vector(0 to (C_S_AXI_ID_WIDTH-1));
      s_axi_awlen : in std_logic_vector(0 to (8-1));
      s_axi_awlock : in std_logic_vector(0 to (2-1));
      s_axi_awprot : in std_logic_vector(0 to (3-1));
      s_axi_awsize : in std_logic_vector(0 to (3-1));
      s_axi_awvalid : in std_logic;
      s_axi_bready : in std_logic;
      s_axi_rready : in std_logic;
      s_axi_wdata : in std_logic_vector(0 to (32-1));
      s_axi_wlast : in std_logic;
      s_axi_wstrb : in std_logic_vector(0 to (4-1));
      s_axi_wvalid : in std_logic;
      axi_aclk : in std_logic;
      blinky_adc_driver : out std_logic;
      rx_i : out std_logic_vector(0 to (12-1));
      rx_q : out std_logic_vector(0 to (12-1));
      s_axi_arready : out std_logic;
      s_axi_awready : out std_logic;
      s_axi_bid : out std_logic_vector(0 to (C_S_AXI_ID_WIDTH-1));
      s_axi_bresp : out std_logic_vector(0 to (2-1));
      s_axi_bvalid : out std_logic;
      s_axi_rdata : out std_logic_vector(0 to (32-1));
      s_axi_rid : out std_logic_vector(0 to (C_S_AXI_ID_WIDTH-1));
      s_axi_rlast : out std_logic;
      s_axi_rresp : out std_logic_vector(0 to (2-1));
      s_axi_rvalid : out std_logic;
      s_axi_wready : out std_logic
    );
  end component;

begin

  adc_driver_axiw_0 : adc_driver_axiw
    generic map (
      C_BASEADDR => X"70e00000",
      C_HIGHADDR => X"70e0ffff",
      C_S_AXI_ADDR_WIDTH => 32,
      C_S_AXI_DATA_WIDTH => 32,
      C_S_AXI_ID_WIDTH => 12,
      C_S_AXI_SUPPORT_BURST => 0
    )
    port map (
      axi_aresetn => axi_aresetn,
      sysgen_clk => sysgen_clk,
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
      axi_aclk => axi_aclk,
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
      s_axi_wready => s_axi_wready
    );

end architecture STRUCTURE;

