-------------------------------------------------------------------------------
-- system_stub.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity system_stub is
  port (
    processing_system7_0_MIO : inout std_logic_vector(53 downto 0);
    processing_system7_0_PS_SRSTB_pin : in std_logic;
    processing_system7_0_PS_CLK_pin : in std_logic;
    processing_system7_0_PS_PORB_pin : in std_logic;
    processing_system7_0_DDR_Clk : inout std_logic;
    processing_system7_0_DDR_Clk_n : inout std_logic;
    processing_system7_0_DDR_CKE : inout std_logic;
    processing_system7_0_DDR_CS_n : inout std_logic;
    processing_system7_0_DDR_RAS_n : inout std_logic;
    processing_system7_0_DDR_CAS_n : inout std_logic;
    processing_system7_0_DDR_WEB_pin : out std_logic;
    processing_system7_0_DDR_BankAddr : inout std_logic_vector(2 downto 0);
    processing_system7_0_DDR_Addr : inout std_logic_vector(14 downto 0);
    processing_system7_0_DDR_ODT : inout std_logic;
    processing_system7_0_DDR_DRSTB : inout std_logic;
    processing_system7_0_DDR_DQ : inout std_logic_vector(31 downto 0);
    processing_system7_0_DDR_DM : inout std_logic_vector(3 downto 0);
    processing_system7_0_DDR_DQS : inout std_logic_vector(3 downto 0);
    processing_system7_0_DDR_DQS_n : inout std_logic_vector(3 downto 0);
    processing_system7_0_DDR_VRN : inout std_logic;
    processing_system7_0_DDR_VRP : inout std_logic;
    clock_generator_0_LOCKED_pin : out std_logic;
    clock_generator_0_pll_pin : in std_logic;
    adc_driver_axiw_0_rx_iq_sel_pin : in std_logic;
    adc_driver_axiw_0_rxd_pin : in std_logic_vector(11 downto 0);
    adc_driver_axiw_0_blinky_adc_driver_pin : out std_logic;
    mcu_axiw_0_init_done_pin : in std_logic;
    mcu_axiw_0_mcu_reset_pin : out std_logic;
    mcu_axiw_0_pa_en_pin : out std_logic;
    mcu_axiw_0_blinky_mcu_pin : out std_logic;
    mcu_axiw_0_tx_en_pin : out std_logic;
    mcu_axiw_0_tr_sw_pin : out std_logic;
    clock_generator_0_rx_clk_pin : out std_logic;
    mcu_axiw_0_rx_en_pin : out std_logic;
    axi_gpio_0_GPIO_IO_pin : inout std_logic;
    axi_gpio_0_GPIO2_IO_pin : inout std_logic;
    axi_uartlite_0_RX_pin : in std_logic;
    axi_uartlite_0_TX_pin : out std_logic
  );
end system_stub;

architecture STRUCTURE of system_stub is

  component system is
    port (
      processing_system7_0_MIO : inout std_logic_vector(53 downto 0);
      processing_system7_0_PS_SRSTB_pin : in std_logic;
      processing_system7_0_PS_CLK_pin : in std_logic;
      processing_system7_0_PS_PORB_pin : in std_logic;
      processing_system7_0_DDR_Clk : inout std_logic;
      processing_system7_0_DDR_Clk_n : inout std_logic;
      processing_system7_0_DDR_CKE : inout std_logic;
      processing_system7_0_DDR_CS_n : inout std_logic;
      processing_system7_0_DDR_RAS_n : inout std_logic;
      processing_system7_0_DDR_CAS_n : inout std_logic;
      processing_system7_0_DDR_WEB_pin : out std_logic;
      processing_system7_0_DDR_BankAddr : inout std_logic_vector(2 downto 0);
      processing_system7_0_DDR_Addr : inout std_logic_vector(14 downto 0);
      processing_system7_0_DDR_ODT : inout std_logic;
      processing_system7_0_DDR_DRSTB : inout std_logic;
      processing_system7_0_DDR_DQ : inout std_logic_vector(31 downto 0);
      processing_system7_0_DDR_DM : inout std_logic_vector(3 downto 0);
      processing_system7_0_DDR_DQS : inout std_logic_vector(3 downto 0);
      processing_system7_0_DDR_DQS_n : inout std_logic_vector(3 downto 0);
      processing_system7_0_DDR_VRN : inout std_logic;
      processing_system7_0_DDR_VRP : inout std_logic;
      clock_generator_0_LOCKED_pin : out std_logic;
      clock_generator_0_pll_pin : in std_logic;
      adc_driver_axiw_0_rx_iq_sel_pin : in std_logic;
      adc_driver_axiw_0_rxd_pin : in std_logic_vector(11 downto 0);
      adc_driver_axiw_0_blinky_adc_driver_pin : out std_logic;
      mcu_axiw_0_init_done_pin : in std_logic;
      mcu_axiw_0_mcu_reset_pin : out std_logic;
      mcu_axiw_0_pa_en_pin : out std_logic;
      mcu_axiw_0_blinky_mcu_pin : out std_logic;
      mcu_axiw_0_tx_en_pin : out std_logic;
      mcu_axiw_0_tr_sw_pin : out std_logic;
      clock_generator_0_rx_clk_pin : out std_logic;
      mcu_axiw_0_rx_en_pin : out std_logic;
      axi_gpio_0_GPIO_IO_pin : inout std_logic;
      axi_gpio_0_GPIO2_IO_pin : inout std_logic;
      axi_uartlite_0_RX_pin : in std_logic;
      axi_uartlite_0_TX_pin : out std_logic
    );
  end component;

  attribute BOX_TYPE : STRING;
  attribute BOX_TYPE of system : component is "user_black_box";

begin

  system_i : system
    port map (
      processing_system7_0_MIO => processing_system7_0_MIO,
      processing_system7_0_PS_SRSTB_pin => processing_system7_0_PS_SRSTB_pin,
      processing_system7_0_PS_CLK_pin => processing_system7_0_PS_CLK_pin,
      processing_system7_0_PS_PORB_pin => processing_system7_0_PS_PORB_pin,
      processing_system7_0_DDR_Clk => processing_system7_0_DDR_Clk,
      processing_system7_0_DDR_Clk_n => processing_system7_0_DDR_Clk_n,
      processing_system7_0_DDR_CKE => processing_system7_0_DDR_CKE,
      processing_system7_0_DDR_CS_n => processing_system7_0_DDR_CS_n,
      processing_system7_0_DDR_RAS_n => processing_system7_0_DDR_RAS_n,
      processing_system7_0_DDR_CAS_n => processing_system7_0_DDR_CAS_n,
      processing_system7_0_DDR_WEB_pin => processing_system7_0_DDR_WEB_pin,
      processing_system7_0_DDR_BankAddr => processing_system7_0_DDR_BankAddr,
      processing_system7_0_DDR_Addr => processing_system7_0_DDR_Addr,
      processing_system7_0_DDR_ODT => processing_system7_0_DDR_ODT,
      processing_system7_0_DDR_DRSTB => processing_system7_0_DDR_DRSTB,
      processing_system7_0_DDR_DQ => processing_system7_0_DDR_DQ,
      processing_system7_0_DDR_DM => processing_system7_0_DDR_DM,
      processing_system7_0_DDR_DQS => processing_system7_0_DDR_DQS,
      processing_system7_0_DDR_DQS_n => processing_system7_0_DDR_DQS_n,
      processing_system7_0_DDR_VRN => processing_system7_0_DDR_VRN,
      processing_system7_0_DDR_VRP => processing_system7_0_DDR_VRP,
      clock_generator_0_LOCKED_pin => clock_generator_0_LOCKED_pin,
      clock_generator_0_pll_pin => clock_generator_0_pll_pin,
      adc_driver_axiw_0_rx_iq_sel_pin => adc_driver_axiw_0_rx_iq_sel_pin,
      adc_driver_axiw_0_rxd_pin => adc_driver_axiw_0_rxd_pin,
      adc_driver_axiw_0_blinky_adc_driver_pin => adc_driver_axiw_0_blinky_adc_driver_pin,
      mcu_axiw_0_init_done_pin => mcu_axiw_0_init_done_pin,
      mcu_axiw_0_mcu_reset_pin => mcu_axiw_0_mcu_reset_pin,
      mcu_axiw_0_pa_en_pin => mcu_axiw_0_pa_en_pin,
      mcu_axiw_0_blinky_mcu_pin => mcu_axiw_0_blinky_mcu_pin,
      mcu_axiw_0_tx_en_pin => mcu_axiw_0_tx_en_pin,
      mcu_axiw_0_tr_sw_pin => mcu_axiw_0_tr_sw_pin,
      clock_generator_0_rx_clk_pin => clock_generator_0_rx_clk_pin,
      mcu_axiw_0_rx_en_pin => mcu_axiw_0_rx_en_pin,
      axi_gpio_0_GPIO_IO_pin => axi_gpio_0_GPIO_IO_pin,
      axi_gpio_0_GPIO2_IO_pin => axi_gpio_0_GPIO2_IO_pin,
      axi_uartlite_0_RX_pin => axi_uartlite_0_RX_pin,
      axi_uartlite_0_TX_pin => axi_uartlite_0_TX_pin
    );

end architecture STRUCTURE;

