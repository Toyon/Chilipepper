--------------------------------------------------------------------------------
--    This file is owned and controlled by Xilinx and must be used solely     --
--    for design, simulation, implementation and creation of design files     --
--    limited to Xilinx devices or technologies. Use with non-Xilinx          --
--    devices or technologies is expressly prohibited and immediately         --
--    terminates your license.                                                --
--                                                                            --
--    XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" SOLELY    --
--    FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR XILINX DEVICES.  BY    --
--    PROVIDING THIS DESIGN, CODE, OR INFORMATION AS ONE POSSIBLE             --
--    IMPLEMENTATION OF THIS FEATURE, APPLICATION OR STANDARD, XILINX IS      --
--    MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION IS FREE FROM ANY      --
--    CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE FOR OBTAINING ANY       --
--    RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY       --
--    DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE   --
--    IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR          --
--    REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF         --
--    INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A   --
--    PARTICULAR PURPOSE.                                                     --
--                                                                            --
--    Xilinx products are not intended for use in life support appliances,    --
--    devices, or systems.  Use in such applications are expressly            --
--    prohibited.                                                             --
--                                                                            --
--    (c) Copyright 1995-2012 Xilinx, Inc.                                    --
--    All rights reserved.                                                    --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- You must compile the wrapper file cntr_11_0_8d5792a6ba24605d.vhd when simulating
-- the core, cntr_11_0_8d5792a6ba24605d. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "CORE Generator Help".

-- The synthesis directives "translate_off/translate_on" specified
-- below are supported by Xilinx, Mentor Graphics and Synplicity
-- synthesis tools. Ensure they are correct for your synthesis tool(s).

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- synthesis translate_off
LIBRARY XilinxCoreLib;
-- synthesis translate_on
ENTITY cntr_11_0_8d5792a6ba24605d IS
  PORT (
    clk : IN STD_LOGIC;
    ce : IN STD_LOGIC;
    sinit : IN STD_LOGIC;
    q : OUT STD_LOGIC_VECTOR(24 DOWNTO 0)
  );
END cntr_11_0_8d5792a6ba24605d;

ARCHITECTURE cntr_11_0_8d5792a6ba24605d_a OF cntr_11_0_8d5792a6ba24605d IS
-- synthesis translate_off
COMPONENT wrapped_cntr_11_0_8d5792a6ba24605d
  PORT (
    clk : IN STD_LOGIC;
    ce : IN STD_LOGIC;
    sinit : IN STD_LOGIC;
    q : OUT STD_LOGIC_VECTOR(24 DOWNTO 0)
  );
END COMPONENT;

-- Configuration specification
  FOR ALL : wrapped_cntr_11_0_8d5792a6ba24605d USE ENTITY XilinxCoreLib.c_counter_binary_v11_0(behavioral)
    GENERIC MAP (
      c_ainit_val => "0",
      c_ce_overrides_sync => 0,
      c_count_by => "1",
      c_count_mode => 0,
      c_count_to => "1",
      c_fb_latency => 0,
      c_has_ce => 1,
      c_has_load => 0,
      c_has_sclr => 0,
      c_has_sinit => 1,
      c_has_sset => 0,
      c_has_thresh0 => 0,
      c_implementation => 0,
      c_latency => 1,
      c_load_low => 0,
      c_restrict_count => 0,
      c_sclr_overrides_sset => 1,
      c_sinit_val => "0",
      c_thresh0_value => "1",
      c_verbosity => 0,
      c_width => 25,
      c_xdevicefamily => "zynq"
    );
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_cntr_11_0_8d5792a6ba24605d
  PORT MAP (
    clk => clk,
    ce => ce,
    sinit => sinit,
    q => q
  );
-- synthesis translate_on

END cntr_11_0_8d5792a6ba24605d_a;
-------------------------------------------------------------------------------
-- Copyright (c) 2012 Xilinx, Inc.
-- All Rights Reserved
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor     : Xilinx
-- \   \   \/     Version    : 14.2
--  \   \         Application: XILINX CORE Generator
--  /   /         Filename   : icon_1_06_a_69d945462da1db7c.vhd
-- /___/   /\     Timestamp  : Wed Oct 17 11:16:59 Pacific Daylight Time 2012
-- \   \  /  \
--  \___\/\___\
--
-- Design Name: VHDL Synthesis Wrapper
-------------------------------------------------------------------------------
-- This wrapper is used to integrate with Project Navigator and PlanAhead

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY icon_1_06_a_69d945462da1db7c IS
  port (
    CONTROL0: inout std_logic_vector(35 downto 0));
END icon_1_06_a_69d945462da1db7c;

ARCHITECTURE icon_1_06_a_69d945462da1db7c_a OF icon_1_06_a_69d945462da1db7c IS
BEGIN

END icon_1_06_a_69d945462da1db7c_a;
-------------------------------------------------------------------------------
-- Copyright (c) 2012 Xilinx, Inc.
-- All Rights Reserved
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor     : Xilinx
-- \   \   \/     Version    : 14.2
--  \   \         Application: XILINX CORE Generator
--  /   /         Filename   : ila_1_05_a_57bd433ceaa521ba.vhd
-- /___/   /\     Timestamp  : Wed Dec 19 10:03:04 Pacific Standard Time 2012
-- \   \  /  \
--  \___\/\___\
--
-- Design Name: VHDL Synthesis Wrapper
-------------------------------------------------------------------------------
-- This wrapper is used to integrate with Project Navigator and PlanAhead

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY ila_1_05_a_57bd433ceaa521ba IS
  port (
    CONTROL: inout std_logic_vector(35 downto 0);
    CLK: in std_logic;
    TRIG0: in std_logic_vector(0 to 0);
    TRIG1: in std_logic_vector(0 to 0);
    TRIG2: in std_logic_vector(0 to 0);
    TRIG3: in std_logic_vector(7 downto 0);
    TRIG4: in std_logic_vector(11 downto 0);
    TRIG5: in std_logic_vector(11 downto 0);
    TRIG6: in std_logic_vector(0 to 0);
    TRIG7: in std_logic_vector(0 to 0));
END ila_1_05_a_57bd433ceaa521ba;

ARCHITECTURE ila_1_05_a_57bd433ceaa521ba_a OF ila_1_05_a_57bd433ceaa521ba IS
BEGIN

END ila_1_05_a_57bd433ceaa521ba_a;

-------------------------------------------------------------------
-- System Generator version 14.2 VHDL source file.
--
-- Copyright(C) 2012 by Xilinx, Inc.  All rights reserved.  This
-- text/file contains proprietary, confidential information of Xilinx,
-- Inc., is distributed under license from Xilinx, Inc., and may be used,
-- copied and/or disclosed only pursuant to the terms of a valid license
-- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
-- this text/file solely for design, simulation, implementation and
-- creation of design files limited to Xilinx devices or technologies.
-- Use with non-Xilinx devices or technologies is expressly prohibited
-- and immediately terminates your license unless covered by a separate
-- agreement.
--
-- Xilinx is providing this design, code, or information "as is" solely
-- for use in developing programs and solutions for Xilinx devices.  By
-- providing this design, code, or information as one possible
-- implementation of this feature, application or standard, Xilinx is
-- making no representation that this implementation is free from any
-- claims of infringement.  You are responsible for obtaining any rights
-- you may require for your implementation.  Xilinx expressly disclaims
-- any warranty whatsoever with respect to the adequacy of the
-- implementation, including but not limited to warranties of
-- merchantability or fitness for a particular purpose.
--
-- Xilinx products are not intended for use in life support appliances,
-- devices, or systems.  Use in such applications is expressly prohibited.
--
-- Any modifications that are made to the source code are done at the user's
-- sole risk and will be unsupported.
--
-- This copyright and support notice must be retained as part of this
-- text at all times.  (c) Copyright 1995-2012 Xilinx, Inc.  All rights
-- reserved.
-------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
package conv_pkg is
    constant simulating : boolean := false
      -- synopsys translate_off
        or true
      -- synopsys translate_on
    ;
    constant xlUnsigned : integer := 1;
    constant xlSigned : integer := 2;
    constant xlFloat : integer := 3;
    constant xlWrap : integer := 1;
    constant xlSaturate : integer := 2;
    constant xlTruncate : integer := 1;
    constant xlRound : integer := 2;
    constant xlRoundBanker : integer := 3;
    constant xlAddMode : integer := 1;
    constant xlSubMode : integer := 2;
    attribute black_box : boolean;
    attribute syn_black_box : boolean;
    attribute fpga_dont_touch: string;
    attribute box_type :  string;
    attribute keep : string;
    attribute syn_keep : boolean;
    function std_logic_vector_to_unsigned(inp : std_logic_vector) return unsigned;
    function unsigned_to_std_logic_vector(inp : unsigned) return std_logic_vector;
    function std_logic_vector_to_signed(inp : std_logic_vector) return signed;
    function signed_to_std_logic_vector(inp : signed) return std_logic_vector;
    function unsigned_to_signed(inp : unsigned) return signed;
    function signed_to_unsigned(inp : signed) return unsigned;
    function pos(inp : std_logic_vector; arith : INTEGER) return boolean;
    function all_same(inp: std_logic_vector) return boolean;
    function all_zeros(inp: std_logic_vector) return boolean;
    function is_point_five(inp: std_logic_vector) return boolean;
    function all_ones(inp: std_logic_vector) return boolean;
    function convert_type (inp : std_logic_vector; old_width, old_bin_pt,
                           old_arith, new_width, new_bin_pt, new_arith,
                           quantization, overflow : INTEGER)
        return std_logic_vector;
    function cast (inp : std_logic_vector; old_bin_pt,
                   new_width, new_bin_pt, new_arith : INTEGER)
        return std_logic_vector;
    function shift_division_result(quotient, fraction: std_logic_vector;
                                   fraction_width, shift_value, shift_dir: INTEGER)
        return std_logic_vector;
    function shift_op (inp: std_logic_vector;
                       result_width, shift_value, shift_dir: INTEGER)
        return std_logic_vector;
    function vec_slice (inp : std_logic_vector; upper, lower : INTEGER)
        return std_logic_vector;
    function s2u_slice (inp : signed; upper, lower : INTEGER)
        return unsigned;
    function u2u_slice (inp : unsigned; upper, lower : INTEGER)
        return unsigned;
    function s2s_cast (inp : signed; old_bin_pt,
                   new_width, new_bin_pt : INTEGER)
        return signed;
    function u2s_cast (inp : unsigned; old_bin_pt,
                   new_width, new_bin_pt : INTEGER)
        return signed;
    function s2u_cast (inp : signed; old_bin_pt,
                   new_width, new_bin_pt : INTEGER)
        return unsigned;
    function u2u_cast (inp : unsigned; old_bin_pt,
                   new_width, new_bin_pt : INTEGER)
        return unsigned;
    function u2v_cast (inp : unsigned; old_bin_pt,
                   new_width, new_bin_pt : INTEGER)
        return std_logic_vector;
    function s2v_cast (inp : signed; old_bin_pt,
                   new_width, new_bin_pt : INTEGER)
        return std_logic_vector;
    function trunc (inp : std_logic_vector; old_width, old_bin_pt, old_arith,
                    new_width, new_bin_pt, new_arith : INTEGER)
        return std_logic_vector;
    function round_towards_inf (inp : std_logic_vector; old_width, old_bin_pt,
                                old_arith, new_width, new_bin_pt,
                                new_arith : INTEGER) return std_logic_vector;
    function round_towards_even (inp : std_logic_vector; old_width, old_bin_pt,
                                old_arith, new_width, new_bin_pt,
                                new_arith : INTEGER) return std_logic_vector;
    function max_signed(width : INTEGER) return std_logic_vector;
    function min_signed(width : INTEGER) return std_logic_vector;
    function saturation_arith(inp:  std_logic_vector;  old_width, old_bin_pt,
                              old_arith, new_width, new_bin_pt, new_arith
                              : INTEGER) return std_logic_vector;
    function wrap_arith(inp:  std_logic_vector;  old_width, old_bin_pt,
                        old_arith, new_width, new_bin_pt, new_arith : INTEGER)
                        return std_logic_vector;
    function fractional_bits(a_bin_pt, b_bin_pt: INTEGER) return INTEGER;
    function integer_bits(a_width, a_bin_pt, b_width, b_bin_pt: INTEGER)
        return INTEGER;
    function sign_ext(inp : std_logic_vector; new_width : INTEGER)
        return std_logic_vector;
    function zero_ext(inp : std_logic_vector; new_width : INTEGER)
        return std_logic_vector;
    function zero_ext(inp : std_logic; new_width : INTEGER)
        return std_logic_vector;
    function extend_MSB(inp : std_logic_vector; new_width, arith : INTEGER)
        return std_logic_vector;
    function align_input(inp : std_logic_vector; old_width, delta, new_arith,
                          new_width: INTEGER)
        return std_logic_vector;
    function pad_LSB(inp : std_logic_vector; new_width: integer)
        return std_logic_vector;
    function pad_LSB(inp : std_logic_vector; new_width, arith : integer)
        return std_logic_vector;
    function max(L, R: INTEGER) return INTEGER;
    function min(L, R: INTEGER) return INTEGER;
    function "="(left,right: STRING) return boolean;
    function boolean_to_signed (inp : boolean; width: integer)
        return signed;
    function boolean_to_unsigned (inp : boolean; width: integer)
        return unsigned;
    function boolean_to_vector (inp : boolean)
        return std_logic_vector;
    function std_logic_to_vector (inp : std_logic)
        return std_logic_vector;
    function integer_to_std_logic_vector (inp : integer;  width, arith : integer)
        return std_logic_vector;
    function std_logic_vector_to_integer (inp : std_logic_vector;  arith : integer)
        return integer;
    function std_logic_to_integer(constant inp : std_logic := '0')
        return integer;
    function bin_string_element_to_std_logic_vector (inp : string;  width, index : integer)
        return std_logic_vector;
    function bin_string_to_std_logic_vector (inp : string)
        return std_logic_vector;
    function hex_string_to_std_logic_vector (inp : string; width : integer)
        return std_logic_vector;
    function makeZeroBinStr (width : integer) return STRING;
    function and_reduce(inp: std_logic_vector) return std_logic;
    -- synopsys translate_off
    function is_binary_string_invalid (inp : string)
        return boolean;
    function is_binary_string_undefined (inp : string)
        return boolean;
    function is_XorU(inp : std_logic_vector)
        return boolean;
    function to_real(inp : std_logic_vector; bin_pt : integer; arith : integer)
        return real;
    function std_logic_to_real(inp : std_logic; bin_pt : integer; arith : integer)
        return real;
    function real_to_std_logic_vector (inp : real;  width, bin_pt, arith : integer)
        return std_logic_vector;
    function real_string_to_std_logic_vector (inp : string;  width, bin_pt, arith : integer)
        return std_logic_vector;
    constant display_precision : integer := 20;
    function real_to_string (inp : real) return string;
    function valid_bin_string(inp : string) return boolean;
    function std_logic_vector_to_bin_string(inp : std_logic_vector) return string;
    function std_logic_to_bin_string(inp : std_logic) return string;
    function std_logic_vector_to_bin_string_w_point(inp : std_logic_vector; bin_pt : integer)
        return string;
    function real_to_bin_string(inp : real;  width, bin_pt, arith : integer)
        return string;
    type stdlogic_to_char_t is array(std_logic) of character;
    constant to_char : stdlogic_to_char_t := (
        'U' => 'U',
        'X' => 'X',
        '0' => '0',
        '1' => '1',
        'Z' => 'Z',
        'W' => 'W',
        'L' => 'L',
        'H' => 'H',
        '-' => '-');
    -- synopsys translate_on
end conv_pkg;
package body conv_pkg is
    function std_logic_vector_to_unsigned(inp : std_logic_vector)
        return unsigned
    is
    begin
        return unsigned (inp);
    end;
    function unsigned_to_std_logic_vector(inp : unsigned)
        return std_logic_vector
    is
    begin
        return std_logic_vector(inp);
    end;
    function std_logic_vector_to_signed(inp : std_logic_vector)
        return signed
    is
    begin
        return  signed (inp);
    end;
    function signed_to_std_logic_vector(inp : signed)
        return std_logic_vector
    is
    begin
        return std_logic_vector(inp);
    end;
    function unsigned_to_signed (inp : unsigned)
        return signed
    is
    begin
        return signed(std_logic_vector(inp));
    end;
    function signed_to_unsigned (inp : signed)
        return unsigned
    is
    begin
        return unsigned(std_logic_vector(inp));
    end;
    function pos(inp : std_logic_vector; arith : INTEGER)
        return boolean
    is
        constant width : integer := inp'length;
        variable vec : std_logic_vector(width-1 downto 0);
    begin
        vec := inp;
        if arith = xlUnsigned then
            return true;
        else
            if vec(width-1) = '0' then
                return true;
            else
                return false;
            end if;
        end if;
        return true;
    end;
    function max_signed(width : INTEGER)
        return std_logic_vector
    is
        variable ones : std_logic_vector(width-2 downto 0);
        variable result : std_logic_vector(width-1 downto 0);
    begin
        ones := (others => '1');
        result(width-1) := '0';
        result(width-2 downto 0) := ones;
        return result;
    end;
    function min_signed(width : INTEGER)
        return std_logic_vector
    is
        variable zeros : std_logic_vector(width-2 downto 0);
        variable result : std_logic_vector(width-1 downto 0);
    begin
        zeros := (others => '0');
        result(width-1) := '1';
        result(width-2 downto 0) := zeros;
        return result;
    end;
    function and_reduce(inp: std_logic_vector) return std_logic
    is
        variable result: std_logic;
        constant width : integer := inp'length;
        variable vec : std_logic_vector(width-1 downto 0);
    begin
        vec := inp;
        result := vec(0);
        if width > 1 then
            for i in 1 to width-1 loop
                result := result and vec(i);
            end loop;
        end if;
        return result;
    end;
    function all_same(inp: std_logic_vector) return boolean
    is
        variable result: boolean;
        constant width : integer := inp'length;
        variable vec : std_logic_vector(width-1 downto 0);
    begin
        vec := inp;
        result := true;
        if width > 0 then
            for i in 1 to width-1 loop
                if vec(i) /= vec(0) then
                    result := false;
                end if;
            end loop;
        end if;
        return result;
    end;
    function all_zeros(inp: std_logic_vector)
        return boolean
    is
        constant width : integer := inp'length;
        variable vec : std_logic_vector(width-1 downto 0);
        variable zero : std_logic_vector(width-1 downto 0);
        variable result : boolean;
    begin
        zero := (others => '0');
        vec := inp;
        -- synopsys translate_off
        if (is_XorU(vec)) then
            return false;
        end if;
         -- synopsys translate_on
        if (std_logic_vector_to_unsigned(vec) = std_logic_vector_to_unsigned(zero)) then
            result := true;
        else
            result := false;
        end if;
        return result;
    end;
    function is_point_five(inp: std_logic_vector)
        return boolean
    is
        constant width : integer := inp'length;
        variable vec : std_logic_vector(width-1 downto 0);
        variable result : boolean;
    begin
        vec := inp;
        -- synopsys translate_off
        if (is_XorU(vec)) then
            return false;
        end if;
         -- synopsys translate_on
        if (width > 1) then
           if ((vec(width-1) = '1') and (all_zeros(vec(width-2 downto 0)) = true)) then
               result := true;
           else
               result := false;
           end if;
        else
           if (vec(width-1) = '1') then
               result := true;
           else
               result := false;
           end if;
        end if;
        return result;
    end;
    function all_ones(inp: std_logic_vector)
        return boolean
    is
        constant width : integer := inp'length;
        variable vec : std_logic_vector(width-1 downto 0);
        variable one : std_logic_vector(width-1 downto 0);
        variable result : boolean;
    begin
        one := (others => '1');
        vec := inp;
        -- synopsys translate_off
        if (is_XorU(vec)) then
            return false;
        end if;
         -- synopsys translate_on
        if (std_logic_vector_to_unsigned(vec) = std_logic_vector_to_unsigned(one)) then
            result := true;
        else
            result := false;
        end if;
        return result;
    end;
    function full_precision_num_width(quantization, overflow, old_width,
                                      old_bin_pt, old_arith,
                                      new_width, new_bin_pt, new_arith : INTEGER)
        return integer
    is
        variable result : integer;
    begin
        result := old_width + 2;
        return result;
    end;
    function quantized_num_width(quantization, overflow, old_width, old_bin_pt,
                                 old_arith, new_width, new_bin_pt, new_arith
                                 : INTEGER)
        return integer
    is
        variable right_of_dp, left_of_dp, result : integer;
    begin
        right_of_dp := max(new_bin_pt, old_bin_pt);
        left_of_dp := max((new_width - new_bin_pt), (old_width - old_bin_pt));
        result := (old_width + 2) + (new_bin_pt - old_bin_pt);
        return result;
    end;
    function convert_type (inp : std_logic_vector; old_width, old_bin_pt,
                           old_arith, new_width, new_bin_pt, new_arith,
                           quantization, overflow : INTEGER)
        return std_logic_vector
    is
        constant fp_width : integer :=
            full_precision_num_width(quantization, overflow, old_width,
                                     old_bin_pt, old_arith, new_width,
                                     new_bin_pt, new_arith);
        constant fp_bin_pt : integer := old_bin_pt;
        constant fp_arith : integer := old_arith;
        variable full_precision_result : std_logic_vector(fp_width-1 downto 0);
        constant q_width : integer :=
            quantized_num_width(quantization, overflow, old_width, old_bin_pt,
                                old_arith, new_width, new_bin_pt, new_arith);
        constant q_bin_pt : integer := new_bin_pt;
        constant q_arith : integer := old_arith;
        variable quantized_result : std_logic_vector(q_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
    begin
        result := (others => '0');
        full_precision_result := cast(inp, old_bin_pt, fp_width, fp_bin_pt,
                                      fp_arith);
        if (quantization = xlRound) then
            quantized_result := round_towards_inf(full_precision_result,
                                                  fp_width, fp_bin_pt,
                                                  fp_arith, q_width, q_bin_pt,
                                                  q_arith);
        elsif (quantization = xlRoundBanker) then
            quantized_result := round_towards_even(full_precision_result,
                                                  fp_width, fp_bin_pt,
                                                  fp_arith, q_width, q_bin_pt,
                                                  q_arith);
        else
            quantized_result := trunc(full_precision_result, fp_width, fp_bin_pt,
                                      fp_arith, q_width, q_bin_pt, q_arith);
        end if;
        if (overflow = xlSaturate) then
            result := saturation_arith(quantized_result, q_width, q_bin_pt,
                                       q_arith, new_width, new_bin_pt, new_arith);
        else
             result := wrap_arith(quantized_result, q_width, q_bin_pt, q_arith,
                                  new_width, new_bin_pt, new_arith);
        end if;
        return result;
    end;
    function cast (inp : std_logic_vector; old_bin_pt, new_width,
                   new_bin_pt, new_arith : INTEGER)
        return std_logic_vector
    is
        constant old_width : integer := inp'length;
        constant left_of_dp : integer := (new_width - new_bin_pt)
                                         - (old_width - old_bin_pt);
        constant right_of_dp : integer := (new_bin_pt - old_bin_pt);
        variable vec : std_logic_vector(old_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
        variable j   : integer;
    begin
        vec := inp;
        for i in new_width-1 downto 0 loop
            j := i - right_of_dp;
            if ( j > old_width-1) then
                if (new_arith = xlUnsigned) then
                    result(i) := '0';
                else
                    result(i) := vec(old_width-1);
                end if;
            elsif ( j >= 0) then
                result(i) := vec(j);
            else
                result(i) := '0';
            end if;
        end loop;
        return result;
    end;
    function shift_division_result(quotient, fraction: std_logic_vector;
                                   fraction_width, shift_value, shift_dir: INTEGER)
        return std_logic_vector
    is
        constant q_width : integer := quotient'length;
        constant f_width : integer := fraction'length;
        constant vec_MSB : integer := q_width+f_width-1;
        constant result_MSB : integer := q_width+fraction_width-1;
        constant result_LSB : integer := vec_MSB-result_MSB;
        variable vec : std_logic_vector(vec_MSB downto 0);
        variable result : std_logic_vector(result_MSB downto 0);
    begin
        vec := ( quotient & fraction );
        if shift_dir = 1 then
            for i in vec_MSB downto 0 loop
                if (i < shift_value) then
                     vec(i) := '0';
                else
                    vec(i) := vec(i-shift_value);
                end if;
            end loop;
        else
            for i in 0 to vec_MSB loop
                if (i > vec_MSB-shift_value) then
                    vec(i) := vec(vec_MSB);
                else
                    vec(i) := vec(i+shift_value);
                end if;
            end loop;
        end if;
        result := vec(vec_MSB downto result_LSB);
        return result;
    end;
    function shift_op (inp: std_logic_vector;
                       result_width, shift_value, shift_dir: INTEGER)
        return std_logic_vector
    is
        constant inp_width : integer := inp'length;
        constant vec_MSB : integer := inp_width-1;
        constant result_MSB : integer := result_width-1;
        constant result_LSB : integer := vec_MSB-result_MSB;
        variable vec : std_logic_vector(vec_MSB downto 0);
        variable result : std_logic_vector(result_MSB downto 0);
    begin
        vec := inp;
        if shift_dir = 1 then
            for i in vec_MSB downto 0 loop
                if (i < shift_value) then
                     vec(i) := '0';
                else
                    vec(i) := vec(i-shift_value);
                end if;
            end loop;
        else
            for i in 0 to vec_MSB loop
                if (i > vec_MSB-shift_value) then
                    vec(i) := vec(vec_MSB);
                else
                    vec(i) := vec(i+shift_value);
                end if;
            end loop;
        end if;
        result := vec(vec_MSB downto result_LSB);
        return result;
    end;
    function vec_slice (inp : std_logic_vector; upper, lower : INTEGER)
      return std_logic_vector
    is
    begin
        return inp(upper downto lower);
    end;
    function s2u_slice (inp : signed; upper, lower : INTEGER)
      return unsigned
    is
    begin
        return unsigned(vec_slice(std_logic_vector(inp), upper, lower));
    end;
    function u2u_slice (inp : unsigned; upper, lower : INTEGER)
      return unsigned
    is
    begin
        return unsigned(vec_slice(std_logic_vector(inp), upper, lower));
    end;
    function s2s_cast (inp : signed; old_bin_pt, new_width, new_bin_pt : INTEGER)
        return signed
    is
    begin
        return signed(cast(std_logic_vector(inp), old_bin_pt, new_width, new_bin_pt, xlSigned));
    end;
    function s2u_cast (inp : signed; old_bin_pt, new_width,
                   new_bin_pt : INTEGER)
        return unsigned
    is
    begin
        return unsigned(cast(std_logic_vector(inp), old_bin_pt, new_width, new_bin_pt, xlSigned));
    end;
    function u2s_cast (inp : unsigned; old_bin_pt, new_width,
                   new_bin_pt : INTEGER)
        return signed
    is
    begin
        return signed(cast(std_logic_vector(inp), old_bin_pt, new_width, new_bin_pt, xlUnsigned));
    end;
    function u2u_cast (inp : unsigned; old_bin_pt, new_width,
                   new_bin_pt : INTEGER)
        return unsigned
    is
    begin
        return unsigned(cast(std_logic_vector(inp), old_bin_pt, new_width, new_bin_pt, xlUnsigned));
    end;
    function u2v_cast (inp : unsigned; old_bin_pt, new_width,
                   new_bin_pt : INTEGER)
        return std_logic_vector
    is
    begin
        return cast(std_logic_vector(inp), old_bin_pt, new_width, new_bin_pt, xlUnsigned);
    end;
    function s2v_cast (inp : signed; old_bin_pt, new_width,
                   new_bin_pt : INTEGER)
        return std_logic_vector
    is
    begin
        return cast(std_logic_vector(inp), old_bin_pt, new_width, new_bin_pt, xlSigned);
    end;
    function boolean_to_signed (inp : boolean; width : integer)
        return signed
    is
        variable result : signed(width - 1 downto 0);
    begin
        result := (others => '0');
        if inp then
          result(0) := '1';
        else
          result(0) := '0';
        end if;
        return result;
    end;
    function boolean_to_unsigned (inp : boolean; width : integer)
        return unsigned
    is
        variable result : unsigned(width - 1 downto 0);
    begin
        result := (others => '0');
        if inp then
          result(0) := '1';
        else
          result(0) := '0';
        end if;
        return result;
    end;
    function boolean_to_vector (inp : boolean)
        return std_logic_vector
    is
        variable result : std_logic_vector(1 - 1 downto 0);
    begin
        result := (others => '0');
        if inp then
          result(0) := '1';
        else
          result(0) := '0';
        end if;
        return result;
    end;
    function std_logic_to_vector (inp : std_logic)
        return std_logic_vector
    is
        variable result : std_logic_vector(1 - 1 downto 0);
    begin
        result(0) := inp;
        return result;
    end;
    function trunc (inp : std_logic_vector; old_width, old_bin_pt, old_arith,
                                new_width, new_bin_pt, new_arith : INTEGER)
        return std_logic_vector
    is
        constant right_of_dp : integer := (old_bin_pt - new_bin_pt);
        variable vec : std_logic_vector(old_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
    begin
        vec := inp;
        if right_of_dp >= 0 then
            if new_arith = xlUnsigned then
                result := zero_ext(vec(old_width-1 downto right_of_dp), new_width);
            else
                result := sign_ext(vec(old_width-1 downto right_of_dp), new_width);
            end if;
        else
            if new_arith = xlUnsigned then
                result := zero_ext(pad_LSB(vec, old_width +
                                           abs(right_of_dp)), new_width);
            else
                result := sign_ext(pad_LSB(vec, old_width +
                                           abs(right_of_dp)), new_width);
            end if;
        end if;
        return result;
    end;
    function round_towards_inf (inp : std_logic_vector; old_width, old_bin_pt,
                                old_arith, new_width, new_bin_pt, new_arith
                                : INTEGER)
        return std_logic_vector
    is
        constant right_of_dp : integer := (old_bin_pt - new_bin_pt);
        constant expected_new_width : integer :=  old_width - right_of_dp  + 1;
        variable vec : std_logic_vector(old_width-1 downto 0);
        variable one_or_zero : std_logic_vector(new_width-1 downto 0);
        variable truncated_val : std_logic_vector(new_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
    begin
        vec := inp;
        if right_of_dp >= 0 then
            if new_arith = xlUnsigned then
                truncated_val := zero_ext(vec(old_width-1 downto right_of_dp),
                                          new_width);
            else
                truncated_val := sign_ext(vec(old_width-1 downto right_of_dp),
                                          new_width);
            end if;
        else
            if new_arith = xlUnsigned then
                truncated_val := zero_ext(pad_LSB(vec, old_width +
                                                  abs(right_of_dp)), new_width);
            else
                truncated_val := sign_ext(pad_LSB(vec, old_width +
                                                  abs(right_of_dp)), new_width);
            end if;
        end if;
        one_or_zero := (others => '0');
        if (new_arith = xlSigned) then
            if (vec(old_width-1) = '0') then
                one_or_zero(0) := '1';
            end if;
            if (right_of_dp >= 2) and (right_of_dp <= old_width) then
                if (all_zeros(vec(right_of_dp-2 downto 0)) = false) then
                    one_or_zero(0) := '1';
                end if;
            end if;
            if (right_of_dp >= 1) and (right_of_dp <= old_width) then
                if vec(right_of_dp-1) = '0' then
                    one_or_zero(0) := '0';
                end if;
            else
                one_or_zero(0) := '0';
            end if;
        else
            if (right_of_dp >= 1) and (right_of_dp <= old_width) then
                one_or_zero(0) :=  vec(right_of_dp-1);
            end if;
        end if;
        if new_arith = xlSigned then
            result := signed_to_std_logic_vector(std_logic_vector_to_signed(truncated_val) +
                                                 std_logic_vector_to_signed(one_or_zero));
        else
            result := unsigned_to_std_logic_vector(std_logic_vector_to_unsigned(truncated_val) +
                                                  std_logic_vector_to_unsigned(one_or_zero));
        end if;
        return result;
    end;
    function round_towards_even (inp : std_logic_vector; old_width, old_bin_pt,
                                old_arith, new_width, new_bin_pt, new_arith
                                : INTEGER)
        return std_logic_vector
    is
        constant right_of_dp : integer := (old_bin_pt - new_bin_pt);
        constant expected_new_width : integer :=  old_width - right_of_dp  + 1;
        variable vec : std_logic_vector(old_width-1 downto 0);
        variable one_or_zero : std_logic_vector(new_width-1 downto 0);
        variable truncated_val : std_logic_vector(new_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
    begin
        vec := inp;
        if right_of_dp >= 0 then
            if new_arith = xlUnsigned then
                truncated_val := zero_ext(vec(old_width-1 downto right_of_dp),
                                          new_width);
            else
                truncated_val := sign_ext(vec(old_width-1 downto right_of_dp),
                                          new_width);
            end if;
        else
            if new_arith = xlUnsigned then
                truncated_val := zero_ext(pad_LSB(vec, old_width +
                                                  abs(right_of_dp)), new_width);
            else
                truncated_val := sign_ext(pad_LSB(vec, old_width +
                                                  abs(right_of_dp)), new_width);
            end if;
        end if;
        one_or_zero := (others => '0');
        if (right_of_dp >= 1) and (right_of_dp <= old_width) then
            if (is_point_five(vec(right_of_dp-1 downto 0)) = false) then
                one_or_zero(0) :=  vec(right_of_dp-1);
            else
                one_or_zero(0) :=  vec(right_of_dp);
            end if;
        end if;
        if new_arith = xlSigned then
            result := signed_to_std_logic_vector(std_logic_vector_to_signed(truncated_val) +
                                                 std_logic_vector_to_signed(one_or_zero));
        else
            result := unsigned_to_std_logic_vector(std_logic_vector_to_unsigned(truncated_val) +
                                                  std_logic_vector_to_unsigned(one_or_zero));
        end if;
        return result;
    end;
    function saturation_arith(inp:  std_logic_vector;  old_width, old_bin_pt,
                              old_arith, new_width, new_bin_pt, new_arith
                              : INTEGER)
        return std_logic_vector
    is
        constant left_of_dp : integer := (old_width - old_bin_pt) -
                                         (new_width - new_bin_pt);
        variable vec : std_logic_vector(old_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
        variable overflow : boolean;
    begin
        vec := inp;
        overflow := true;
        result := (others => '0');
        if (new_width >= old_width) then
            overflow := false;
        end if;
        if ((old_arith = xlSigned and new_arith = xlSigned) and (old_width > new_width)) then
            if all_same(vec(old_width-1 downto new_width-1)) then
                overflow := false;
            end if;
        end if;
        if (old_arith = xlSigned and new_arith = xlUnsigned) then
            if (old_width > new_width) then
                if all_zeros(vec(old_width-1 downto new_width)) then
                    overflow := false;
                end if;
            else
                if (old_width = new_width) then
                    if (vec(new_width-1) = '0') then
                        overflow := false;
                    end if;
                end if;
            end if;
        end if;
        if (old_arith = xlUnsigned and new_arith = xlUnsigned) then
            if (old_width > new_width) then
                if all_zeros(vec(old_width-1 downto new_width)) then
                    overflow := false;
                end if;
            else
                if (old_width = new_width) then
                    overflow := false;
                end if;
            end if;
        end if;
        if ((old_arith = xlUnsigned and new_arith = xlSigned) and (old_width > new_width)) then
            if all_same(vec(old_width-1 downto new_width-1)) then
                overflow := false;
            end if;
        end if;
        if overflow then
            if new_arith = xlSigned then
                if vec(old_width-1) = '0' then
                    result := max_signed(new_width);
                else
                    result := min_signed(new_width);
                end if;
            else
                if ((old_arith = xlSigned) and vec(old_width-1) = '1') then
                    result := (others => '0');
                else
                    result := (others => '1');
                end if;
            end if;
        else
            if (old_arith = xlSigned) and (new_arith = xlUnsigned) then
                if (vec(old_width-1) = '1') then
                    vec := (others => '0');
                end if;
            end if;
            if new_width <= old_width then
                result := vec(new_width-1 downto 0);
            else
                if new_arith = xlUnsigned then
                    result := zero_ext(vec, new_width);
                else
                    result := sign_ext(vec, new_width);
                end if;
            end if;
        end if;
        return result;
    end;
   function wrap_arith(inp:  std_logic_vector;  old_width, old_bin_pt,
                       old_arith, new_width, new_bin_pt, new_arith : INTEGER)
        return std_logic_vector
    is
        variable result : std_logic_vector(new_width-1 downto 0);
        variable result_arith : integer;
    begin
        if (old_arith = xlSigned) and (new_arith = xlUnsigned) then
            result_arith := xlSigned;
        end if;
        result := cast(inp, old_bin_pt, new_width, new_bin_pt, result_arith);
        return result;
    end;
    function fractional_bits(a_bin_pt, b_bin_pt: INTEGER) return INTEGER is
    begin
        return max(a_bin_pt, b_bin_pt);
    end;
    function integer_bits(a_width, a_bin_pt, b_width, b_bin_pt: INTEGER)
        return INTEGER is
    begin
        return  max(a_width - a_bin_pt, b_width - b_bin_pt);
    end;
    function pad_LSB(inp : std_logic_vector; new_width: integer)
        return STD_LOGIC_VECTOR
    is
        constant orig_width : integer := inp'length;
        variable vec : std_logic_vector(orig_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
        variable pos : integer;
        constant pad_pos : integer := new_width - orig_width - 1;
    begin
        vec := inp;
        pos := new_width-1;
        if (new_width >= orig_width) then
            for i in orig_width-1 downto 0 loop
                result(pos) := vec(i);
                pos := pos - 1;
            end loop;
            if pad_pos >= 0 then
                for i in pad_pos downto 0 loop
                    result(i) := '0';
                end loop;
            end if;
        end if;
        return result;
    end;
    function sign_ext(inp : std_logic_vector; new_width : INTEGER)
        return std_logic_vector
    is
        constant old_width : integer := inp'length;
        variable vec : std_logic_vector(old_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
    begin
        vec := inp;
        if new_width >= old_width then
            result(old_width-1 downto 0) := vec;
            if new_width-1 >= old_width then
                for i in new_width-1 downto old_width loop
                    result(i) := vec(old_width-1);
                end loop;
            end if;
        else
            result(new_width-1 downto 0) := vec(new_width-1 downto 0);
        end if;
        return result;
    end;
    function zero_ext(inp : std_logic_vector; new_width : INTEGER)
        return std_logic_vector
    is
        constant old_width : integer := inp'length;
        variable vec : std_logic_vector(old_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
    begin
        vec := inp;
        if new_width >= old_width then
            result(old_width-1 downto 0) := vec;
            if new_width-1 >= old_width then
                for i in new_width-1 downto old_width loop
                    result(i) := '0';
                end loop;
            end if;
        else
            result(new_width-1 downto 0) := vec(new_width-1 downto 0);
        end if;
        return result;
    end;
    function zero_ext(inp : std_logic; new_width : INTEGER)
        return std_logic_vector
    is
        variable result : std_logic_vector(new_width-1 downto 0);
    begin
        result(0) := inp;
        for i in new_width-1 downto 1 loop
            result(i) := '0';
        end loop;
        return result;
    end;
    function extend_MSB(inp : std_logic_vector; new_width, arith : INTEGER)
        return std_logic_vector
    is
        constant orig_width : integer := inp'length;
        variable vec : std_logic_vector(orig_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
    begin
        vec := inp;
        if arith = xlUnsigned then
            result := zero_ext(vec, new_width);
        else
            result := sign_ext(vec, new_width);
        end if;
        return result;
    end;
    function pad_LSB(inp : std_logic_vector; new_width, arith: integer)
        return STD_LOGIC_VECTOR
    is
        constant orig_width : integer := inp'length;
        variable vec : std_logic_vector(orig_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
        variable pos : integer;
    begin
        vec := inp;
        pos := new_width-1;
        if (arith = xlUnsigned) then
            result(pos) := '0';
            pos := pos - 1;
        else
            result(pos) := vec(orig_width-1);
            pos := pos - 1;
        end if;
        if (new_width >= orig_width) then
            for i in orig_width-1 downto 0 loop
                result(pos) := vec(i);
                pos := pos - 1;
            end loop;
            if pos >= 0 then
                for i in pos downto 0 loop
                    result(i) := '0';
                end loop;
            end if;
        end if;
        return result;
    end;
    function align_input(inp : std_logic_vector; old_width, delta, new_arith,
                         new_width: INTEGER)
        return std_logic_vector
    is
        variable vec : std_logic_vector(old_width-1 downto 0);
        variable padded_inp : std_logic_vector((old_width + delta)-1  downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
    begin
        vec := inp;
        if delta > 0 then
            padded_inp := pad_LSB(vec, old_width+delta);
            result := extend_MSB(padded_inp, new_width, new_arith);
        else
            result := extend_MSB(vec, new_width, new_arith);
        end if;
        return result;
    end;
    function max(L, R: INTEGER) return INTEGER is
    begin
        if L > R then
            return L;
        else
            return R;
        end if;
    end;
    function min(L, R: INTEGER) return INTEGER is
    begin
        if L < R then
            return L;
        else
            return R;
        end if;
    end;
    function "="(left,right: STRING) return boolean is
    begin
        if (left'length /= right'length) then
            return false;
        else
            test : for i in 1 to left'length loop
                if left(i) /= right(i) then
                    return false;
                end if;
            end loop test;
            return true;
        end if;
    end;
    -- synopsys translate_off
    function is_binary_string_invalid (inp : string)
        return boolean
    is
        variable vec : string(1 to inp'length);
        variable result : boolean;
    begin
        vec := inp;
        result := false;
        for i in 1 to vec'length loop
            if ( vec(i) = 'X' ) then
                result := true;
            end if;
        end loop;
        return result;
    end;
    function is_binary_string_undefined (inp : string)
        return boolean
    is
        variable vec : string(1 to inp'length);
        variable result : boolean;
    begin
        vec := inp;
        result := false;
        for i in 1 to vec'length loop
            if ( vec(i) = 'U' ) then
                result := true;
            end if;
        end loop;
        return result;
    end;
    function is_XorU(inp : std_logic_vector)
        return boolean
    is
        constant width : integer := inp'length;
        variable vec : std_logic_vector(width-1 downto 0);
        variable result : boolean;
    begin
        vec := inp;
        result := false;
        for i in 0 to width-1 loop
            if (vec(i) = 'U') or (vec(i) = 'X') then
                result := true;
            end if;
        end loop;
        return result;
    end;
    function to_real(inp : std_logic_vector; bin_pt : integer; arith : integer)
        return real
    is
        variable  vec : std_logic_vector(inp'length-1 downto 0);
        variable result, shift_val, undefined_real : real;
        variable neg_num : boolean;
    begin
        vec := inp;
        result := 0.0;
        neg_num := false;
        if vec(inp'length-1) = '1' then
            neg_num := true;
        end if;
        for i in 0 to inp'length-1 loop
            if  vec(i) = 'U' or vec(i) = 'X' then
                return undefined_real;
            end if;
            if arith = xlSigned then
                if neg_num then
                    if vec(i) = '0' then
                        result := result + 2.0**i;
                    end if;
                else
                    if vec(i) = '1' then
                        result := result + 2.0**i;
                    end if;
                end if;
            else
                if vec(i) = '1' then
                    result := result + 2.0**i;
                end if;
            end if;
        end loop;
        if arith = xlSigned then
            if neg_num then
                result := result + 1.0;
                result := result * (-1.0);
            end if;
        end if;
        shift_val := 2.0**(-1*bin_pt);
        result := result * shift_val;
        return result;
    end;
    function std_logic_to_real(inp : std_logic; bin_pt : integer; arith : integer)
        return real
    is
        variable result : real := 0.0;
    begin
        if inp = '1' then
            result := 1.0;
        end if;
        if arith = xlSigned then
            assert false
                report "It doesn't make sense to convert a 1 bit number to a signed real.";
        end if;
        return result;
    end;
    -- synopsys translate_on
    function integer_to_std_logic_vector (inp : integer;  width, arith : integer)
        return std_logic_vector
    is
        variable result : std_logic_vector(width-1 downto 0);
        variable unsigned_val : unsigned(width-1 downto 0);
        variable signed_val : signed(width-1 downto 0);
    begin
        if (arith = xlSigned) then
            signed_val := to_signed(inp, width);
            result := signed_to_std_logic_vector(signed_val);
        else
            unsigned_val := to_unsigned(inp, width);
            result := unsigned_to_std_logic_vector(unsigned_val);
        end if;
        return result;
    end;
    function std_logic_vector_to_integer (inp : std_logic_vector;  arith : integer)
        return integer
    is
        constant width : integer := inp'length;
        variable unsigned_val : unsigned(width-1 downto 0);
        variable signed_val : signed(width-1 downto 0);
        variable result : integer;
    begin
        if (arith = xlSigned) then
            signed_val := std_logic_vector_to_signed(inp);
            result := to_integer(signed_val);
        else
            unsigned_val := std_logic_vector_to_unsigned(inp);
            result := to_integer(unsigned_val);
        end if;
        return result;
    end;
    function std_logic_to_integer(constant inp : std_logic := '0')
        return integer
    is
    begin
        if inp = '1' then
            return 1;
        else
            return 0;
        end if;
    end;
    function makeZeroBinStr (width : integer) return STRING is
        variable result : string(1 to width+3);
    begin
        result(1) := '0';
        result(2) := 'b';
        for i in 3 to width+2 loop
            result(i) := '0';
        end loop;
        result(width+3) := '.';
        return result;
    end;
    -- synopsys translate_off
    function real_string_to_std_logic_vector (inp : string;  width, bin_pt, arith : integer)
        return std_logic_vector
    is
        variable result : std_logic_vector(width-1 downto 0);
    begin
        result := (others => '0');
        return result;
    end;
    function real_to_std_logic_vector (inp : real;  width, bin_pt, arith : integer)
        return std_logic_vector
    is
        variable real_val : real;
        variable int_val : integer;
        variable result : std_logic_vector(width-1 downto 0) := (others => '0');
        variable unsigned_val : unsigned(width-1 downto 0) := (others => '0');
        variable signed_val : signed(width-1 downto 0) := (others => '0');
    begin
        real_val := inp;
        int_val := integer(real_val * 2.0**(bin_pt));
        if (arith = xlSigned) then
            signed_val := to_signed(int_val, width);
            result := signed_to_std_logic_vector(signed_val);
        else
            unsigned_val := to_unsigned(int_val, width);
            result := unsigned_to_std_logic_vector(unsigned_val);
        end if;
        return result;
    end;
    -- synopsys translate_on
    function valid_bin_string (inp : string)
        return boolean
    is
        variable vec : string(1 to inp'length);
    begin
        vec := inp;
        if (vec(1) = '0' and vec(2) = 'b') then
            return true;
        else
            return false;
        end if;
    end;
    function hex_string_to_std_logic_vector(inp: string; width : integer)
        return std_logic_vector is
        constant strlen       : integer := inp'LENGTH;
        variable result       : std_logic_vector(width-1 downto 0);
        variable bitval       : std_logic_vector((strlen*4)-1 downto 0);
        variable posn         : integer;
        variable ch           : character;
        variable vec          : string(1 to strlen);
    begin
        vec := inp;
        result := (others => '0');
        posn := (strlen*4)-1;
        for i in 1 to strlen loop
            ch := vec(i);
            case ch is
                when '0' => bitval(posn downto posn-3) := "0000";
                when '1' => bitval(posn downto posn-3) := "0001";
                when '2' => bitval(posn downto posn-3) := "0010";
                when '3' => bitval(posn downto posn-3) := "0011";
                when '4' => bitval(posn downto posn-3) := "0100";
                when '5' => bitval(posn downto posn-3) := "0101";
                when '6' => bitval(posn downto posn-3) := "0110";
                when '7' => bitval(posn downto posn-3) := "0111";
                when '8' => bitval(posn downto posn-3) := "1000";
                when '9' => bitval(posn downto posn-3) := "1001";
                when 'A' | 'a' => bitval(posn downto posn-3) := "1010";
                when 'B' | 'b' => bitval(posn downto posn-3) := "1011";
                when 'C' | 'c' => bitval(posn downto posn-3) := "1100";
                when 'D' | 'd' => bitval(posn downto posn-3) := "1101";
                when 'E' | 'e' => bitval(posn downto posn-3) := "1110";
                when 'F' | 'f' => bitval(posn downto posn-3) := "1111";
                when others => bitval(posn downto posn-3) := "XXXX";
                               -- synopsys translate_off
                               ASSERT false
                                   REPORT "Invalid hex value" SEVERITY ERROR;
                               -- synopsys translate_on
            end case;
            posn := posn - 4;
        end loop;
        if (width <= strlen*4) then
            result :=  bitval(width-1 downto 0);
        else
            result((strlen*4)-1 downto 0) := bitval;
        end if;
        return result;
    end;
    function bin_string_to_std_logic_vector (inp : string)
        return std_logic_vector
    is
        variable pos : integer;
        variable vec : string(1 to inp'length);
        variable result : std_logic_vector(inp'length-1 downto 0);
    begin
        vec := inp;
        pos := inp'length-1;
        result := (others => '0');
        for i in 1 to vec'length loop
            -- synopsys translate_off
            if (pos < 0) and (vec(i) = '0' or vec(i) = '1' or vec(i) = 'X' or vec(i) = 'U')  then
                assert false
                    report "Input string is larger than output std_logic_vector. Truncating output.";
                return result;
            end if;
            -- synopsys translate_on
            if vec(i) = '0' then
                result(pos) := '0';
                pos := pos - 1;
            end if;
            if vec(i) = '1' then
                result(pos) := '1';
                pos := pos - 1;
            end if;
            -- synopsys translate_off
            if (vec(i) = 'X' or vec(i) = 'U') then
                result(pos) := 'U';
                pos := pos - 1;
            end if;
            -- synopsys translate_on
        end loop;
        return result;
    end;
    function bin_string_element_to_std_logic_vector (inp : string;  width, index : integer)
        return std_logic_vector
    is
        constant str_width : integer := width + 4;
        constant inp_len : integer := inp'length;
        constant num_elements : integer := (inp_len + 1)/str_width;
        constant reverse_index : integer := (num_elements-1) - index;
        variable left_pos : integer;
        variable right_pos : integer;
        variable vec : string(1 to inp'length);
        variable result : std_logic_vector(width-1 downto 0);
    begin
        vec := inp;
        result := (others => '0');
        if (reverse_index = 0) and (reverse_index < num_elements) and (inp_len-3 >= width) then
            left_pos := 1;
            right_pos := width + 3;
            result := bin_string_to_std_logic_vector(vec(left_pos to right_pos));
        end if;
        if (reverse_index > 0) and (reverse_index < num_elements) and (inp_len-3 >= width) then
            left_pos := (reverse_index * str_width) + 1;
            right_pos := left_pos + width + 2;
            result := bin_string_to_std_logic_vector(vec(left_pos to right_pos));
        end if;
        return result;
    end;
   -- synopsys translate_off
    function std_logic_vector_to_bin_string(inp : std_logic_vector)
        return string
    is
        variable vec : std_logic_vector(1 to inp'length);
        variable result : string(vec'range);
    begin
        vec := inp;
        for i in vec'range loop
            result(i) := to_char(vec(i));
        end loop;
        return result;
    end;
    function std_logic_to_bin_string(inp : std_logic)
        return string
    is
        variable result : string(1 to 3);
    begin
        result(1) := '0';
        result(2) := 'b';
        result(3) := to_char(inp);
        return result;
    end;
    function std_logic_vector_to_bin_string_w_point(inp : std_logic_vector; bin_pt : integer)
        return string
    is
        variable width : integer := inp'length;
        variable vec : std_logic_vector(width-1 downto 0);
        variable str_pos : integer;
        variable result : string(1 to width+3);
    begin
        vec := inp;
        str_pos := 1;
        result(str_pos) := '0';
        str_pos := 2;
        result(str_pos) := 'b';
        str_pos := 3;
        for i in width-1 downto 0  loop
            if (((width+3) - bin_pt) = str_pos) then
                result(str_pos) := '.';
                str_pos := str_pos + 1;
            end if;
            result(str_pos) := to_char(vec(i));
            str_pos := str_pos + 1;
        end loop;
        if (bin_pt = 0) then
            result(str_pos) := '.';
        end if;
        return result;
    end;
    function real_to_bin_string(inp : real;  width, bin_pt, arith : integer)
        return string
    is
        variable result : string(1 to width);
        variable vec : std_logic_vector(width-1 downto 0);
    begin
        vec := real_to_std_logic_vector(inp, width, bin_pt, arith);
        result := std_logic_vector_to_bin_string(vec);
        return result;
    end;
    function real_to_string (inp : real) return string
    is
        variable result : string(1 to display_precision) := (others => ' ');
    begin
        result(real'image(inp)'range) := real'image(inp);
        return result;
    end;
    -- synopsys translate_on
end conv_pkg;

-------------------------------------------------------------------
-- System Generator version 14.2 VHDL source file.
--
-- Copyright(C) 2012 by Xilinx, Inc.  All rights reserved.  This
-- text/file contains proprietary, confidential information of Xilinx,
-- Inc., is distributed under license from Xilinx, Inc., and may be used,
-- copied and/or disclosed only pursuant to the terms of a valid license
-- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
-- this text/file solely for design, simulation, implementation and
-- creation of design files limited to Xilinx devices or technologies.
-- Use with non-Xilinx devices or technologies is expressly prohibited
-- and immediately terminates your license unless covered by a separate
-- agreement.
--
-- Xilinx is providing this design, code, or information "as is" solely
-- for use in developing programs and solutions for Xilinx devices.  By
-- providing this design, code, or information as one possible
-- implementation of this feature, application or standard, Xilinx is
-- making no representation that this implementation is free from any
-- claims of infringement.  You are responsible for obtaining any rights
-- you may require for your implementation.  Xilinx expressly disclaims
-- any warranty whatsoever with respect to the adequacy of the
-- implementation, including but not limited to warranties of
-- merchantability or fitness for a particular purpose.
--
-- Xilinx products are not intended for use in life support appliances,
-- devices, or systems.  Use in such applications is expressly prohibited.
--
-- Any modifications that are made to the source code are done at the user's
-- sole risk and will be unsupported.
--
-- This copyright and support notice must be retained as part of this
-- text at all times.  (c) Copyright 1995-2012 Xilinx, Inc.  All rights
-- reserved.
-------------------------------------------------------------------
-- synopsys translate_off
library unisim;
use unisim.vcomponents.all;
-- synopsys translate_on
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;
entity srl17e is
    generic (width : integer:=16;
             latency : integer :=8);
    port (clk   : in std_logic;
          ce    : in std_logic;
          d     : in std_logic_vector(width-1 downto 0);
          q     : out std_logic_vector(width-1 downto 0));
end srl17e;
architecture structural of srl17e is
    component SRL16E
        port (D   : in STD_ULOGIC;
              CE  : in STD_ULOGIC;
              CLK : in STD_ULOGIC;
              A0  : in STD_ULOGIC;
              A1  : in STD_ULOGIC;
              A2  : in STD_ULOGIC;
              A3  : in STD_ULOGIC;
              Q   : out STD_ULOGIC);
    end component;
    attribute syn_black_box of SRL16E : component is true;
    attribute fpga_dont_touch of SRL16E : component is "true";
    component FDE
        port(
            Q  :        out   STD_ULOGIC;
            D  :        in    STD_ULOGIC;
            C  :        in    STD_ULOGIC;
            CE :        in    STD_ULOGIC);
    end component;
    attribute syn_black_box of FDE : component is true;
    attribute fpga_dont_touch of FDE : component is "true";
    constant a : std_logic_vector(4 downto 0) :=
        integer_to_std_logic_vector(latency-2,5,xlSigned);
    signal d_delayed : std_logic_vector(width-1 downto 0);
    signal srl16_out : std_logic_vector(width-1 downto 0);
begin
    d_delayed <= d after 200 ps;
    reg_array : for i in 0 to width-1 generate
        srl16_used: if latency > 1 generate
            u1 : srl16e port map(clk => clk,
                                 d => d_delayed(i),
                                 q => srl16_out(i),
                                 ce => ce,
                                 a0 => a(0),
                                 a1 => a(1),
                                 a2 => a(2),
                                 a3 => a(3));
        end generate;
        srl16_not_used: if latency <= 1 generate
            srl16_out(i) <= d_delayed(i);
        end generate;
        fde_used: if latency /= 0  generate
            u2 : fde port map(c => clk,
                              d => srl16_out(i),
                              q => q(i),
                              ce => ce);
        end generate;
        fde_not_used: if latency = 0  generate
            q(i) <= srl16_out(i);
        end generate;
    end generate;
 end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;
entity synth_reg is
    generic (width           : integer := 8;
             latency         : integer := 1);
    port (i       : in std_logic_vector(width-1 downto 0);
          ce      : in std_logic;
          clr     : in std_logic;
          clk     : in std_logic;
          o       : out std_logic_vector(width-1 downto 0));
end synth_reg;
architecture structural of synth_reg is
    component srl17e
        generic (width : integer:=16;
                 latency : integer :=8);
        port (clk : in std_logic;
              ce  : in std_logic;
              d   : in std_logic_vector(width-1 downto 0);
              q   : out std_logic_vector(width-1 downto 0));
    end component;
    function calc_num_srl17es (latency : integer)
        return integer
    is
        variable remaining_latency : integer;
        variable result : integer;
    begin
        result := latency / 17;
        remaining_latency := latency - (result * 17);
        if (remaining_latency /= 0) then
            result := result + 1;
        end if;
        return result;
    end;
    constant complete_num_srl17es : integer := latency / 17;
    constant num_srl17es : integer := calc_num_srl17es(latency);
    constant remaining_latency : integer := latency - (complete_num_srl17es * 17);
    type register_array is array (num_srl17es downto 0) of
        std_logic_vector(width-1 downto 0);
    signal z : register_array;
begin
    z(0) <= i;
    complete_ones : if complete_num_srl17es > 0 generate
        srl17e_array: for i in 0 to complete_num_srl17es-1 generate
            delay_comp : srl17e
                generic map (width => width,
                             latency => 17)
                port map (clk => clk,
                          ce  => ce,
                          d       => z(i),
                          q       => z(i+1));
        end generate;
    end generate;
    partial_one : if remaining_latency > 0 generate
        last_srl17e : srl17e
            generic map (width => width,
                         latency => remaining_latency)
            port map (clk => clk,
                      ce  => ce,
                      d   => z(num_srl17es-1),
                      q   => z(num_srl17es));
    end generate;
    o <= z(num_srl17es);
end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;
entity synth_reg_reg is
    generic (width           : integer := 8;
             latency         : integer := 1);
    port (i       : in std_logic_vector(width-1 downto 0);
          ce      : in std_logic;
          clr     : in std_logic;
          clk     : in std_logic;
          o       : out std_logic_vector(width-1 downto 0));
end synth_reg_reg;
architecture behav of synth_reg_reg is
  type reg_array_type is array (latency-1 downto 0) of std_logic_vector(width -1 downto 0);
  signal reg_bank : reg_array_type := (others => (others => '0'));
  signal reg_bank_in : reg_array_type := (others => (others => '0'));
  attribute syn_allow_retiming : boolean;
  attribute syn_srlstyle : string;
  attribute syn_allow_retiming of reg_bank : signal is true;
  attribute syn_allow_retiming of reg_bank_in : signal is true;
  attribute syn_srlstyle of reg_bank : signal is "registers";
  attribute syn_srlstyle of reg_bank_in : signal is "registers";
begin
  latency_eq_0: if latency = 0 generate
    o <= i;
  end generate latency_eq_0;
  latency_gt_0: if latency >= 1 generate
    o <= reg_bank(latency-1);
    reg_bank_in(0) <= i;
    loop_gen: for idx in latency-2 downto 0 generate
      reg_bank_in(idx+1) <= reg_bank(idx);
    end generate loop_gen;
    sync_loop: for sync_idx in latency-1 downto 0 generate
      sync_proc: process (clk)
      begin
        if clk'event and clk = '1' then
          if clr = '1' then
            reg_bank_in <= (others => (others => '0'));
          elsif ce = '1'  then
            reg_bank(sync_idx) <= reg_bank_in(sync_idx);
          end if;
        end if;
      end process sync_proc;
    end generate sync_loop;
  end generate latency_gt_0;
end behav;

-------------------------------------------------------------------
-- System Generator version 14.2 VHDL source file.
--
-- Copyright(C) 2012 by Xilinx, Inc.  All rights reserved.  This
-- text/file contains proprietary, confidential information of Xilinx,
-- Inc., is distributed under license from Xilinx, Inc., and may be used,
-- copied and/or disclosed only pursuant to the terms of a valid license
-- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
-- this text/file solely for design, simulation, implementation and
-- creation of design files limited to Xilinx devices or technologies.
-- Use with non-Xilinx devices or technologies is expressly prohibited
-- and immediately terminates your license unless covered by a separate
-- agreement.
--
-- Xilinx is providing this design, code, or information "as is" solely
-- for use in developing programs and solutions for Xilinx devices.  By
-- providing this design, code, or information as one possible
-- implementation of this feature, application or standard, Xilinx is
-- making no representation that this implementation is free from any
-- claims of infringement.  You are responsible for obtaining any rights
-- you may require for your implementation.  Xilinx expressly disclaims
-- any warranty whatsoever with respect to the adequacy of the
-- implementation, including but not limited to warranties of
-- merchantability or fitness for a particular purpose.
--
-- Xilinx products are not intended for use in life support appliances,
-- devices, or systems.  Use in such applications is expressly prohibited.
--
-- Any modifications that are made to the source code are done at the user's
-- sole risk and will be unsupported.
--
-- This copyright and support notice must be retained as part of this
-- text at all times.  (c) Copyright 1995-2012 Xilinx, Inc.  All rights
-- reserved.
-------------------------------------------------------------------
-- synopsys translate_off
library unisim;
use unisim.vcomponents.all;
-- synopsys translate_on
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;
entity single_reg_w_init is
  generic (
    width: integer := 8;
    init_index: integer := 0;
    init_value: bit_vector := b"0000"
  );
  port (
    i: in std_logic_vector(width - 1 downto 0);
    ce: in std_logic;
    clr: in std_logic;
    clk: in std_logic;
    o: out std_logic_vector(width - 1 downto 0)
  );
end single_reg_w_init;
architecture structural of single_reg_w_init is
  function build_init_const(width: integer;
                            init_index: integer;
                            init_value: bit_vector)
    return std_logic_vector
  is
    variable result: std_logic_vector(width - 1 downto 0);
  begin
    if init_index = 0 then
      result := (others => '0');
    elsif init_index = 1 then
      result := (others => '0');
      result(0) := '1';
    else
      result := to_stdlogicvector(init_value);
    end if;
    return result;
  end;
  component fdre
    port (
      q: out std_ulogic;
      d: in  std_ulogic;
      c: in  std_ulogic;
      ce: in  std_ulogic;
      r: in  std_ulogic
    );
  end component;
  attribute syn_black_box of fdre: component is true;
  attribute fpga_dont_touch of fdre: component is "true";
  component fdse
    port (
      q: out std_ulogic;
      d: in  std_ulogic;
      c: in  std_ulogic;
      ce: in  std_ulogic;
      s: in  std_ulogic
    );
  end component;
  attribute syn_black_box of fdse: component is true;
  attribute fpga_dont_touch of fdse: component is "true";
  constant init_const: std_logic_vector(width - 1 downto 0)
    := build_init_const(width, init_index, init_value);
begin
  fd_prim_array: for index in 0 to width - 1 generate
    bit_is_0: if (init_const(index) = '0') generate
      fdre_comp: fdre
        port map (
          c => clk,
          d => i(index),
          q => o(index),
          ce => ce,
          r => clr
        );
    end generate;
    bit_is_1: if (init_const(index) = '1') generate
      fdse_comp: fdse
        port map (
          c => clk,
          d => i(index),
          q => o(index),
          ce => ce,
          s => clr
        );
    end generate;
  end generate;
end architecture structural;
-- synopsys translate_off
library unisim;
use unisim.vcomponents.all;
-- synopsys translate_on
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;
entity synth_reg_w_init is
  generic (
    width: integer := 8;
    init_index: integer := 0;
    init_value: bit_vector := b"0000";
    latency: integer := 1
  );
  port (
    i: in std_logic_vector(width - 1 downto 0);
    ce: in std_logic;
    clr: in std_logic;
    clk: in std_logic;
    o: out std_logic_vector(width - 1 downto 0)
  );
end synth_reg_w_init;
architecture structural of synth_reg_w_init is
  component single_reg_w_init
    generic (
      width: integer := 8;
      init_index: integer := 0;
      init_value: bit_vector := b"0000"
    );
    port (
      i: in std_logic_vector(width - 1 downto 0);
      ce: in std_logic;
      clr: in std_logic;
      clk: in std_logic;
      o: out std_logic_vector(width - 1 downto 0)
    );
  end component;
  signal dly_i: std_logic_vector((latency + 1) * width - 1 downto 0);
  signal dly_clr: std_logic;
begin
  latency_eq_0: if (latency = 0) generate
    o <= i;
  end generate;
  latency_gt_0: if (latency >= 1) generate
    dly_i((latency + 1) * width - 1 downto latency * width) <= i
      after 200 ps;
    dly_clr <= clr after 200 ps;
    fd_array: for index in latency downto 1 generate
       reg_comp: single_reg_w_init
          generic map (
            width => width,
            init_index => init_index,
            init_value => init_value
          )
          port map (
            clk => clk,
            i => dly_i((index + 1) * width - 1 downto index * width),
            o => dly_i(index * width - 1 downto (index - 1) * width),
            ce => ce,
            clr => dly_clr
          );
    end generate;
    o <= dly_i(width - 1 downto 0);
  end generate;
end structural;

-------------------------------------------------------------------
-- System Generator version 14.2 VHDL source file.
--
-- Copyright(C) 2012 by Xilinx, Inc.  All rights reserved.  This
-- text/file contains proprietary, confidential information of Xilinx,
-- Inc., is distributed under license from Xilinx, Inc., and may be used,
-- copied and/or disclosed only pursuant to the terms of a valid license
-- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
-- this text/file solely for design, simulation, implementation and
-- creation of design files limited to Xilinx devices or technologies.
-- Use with non-Xilinx devices or technologies is expressly prohibited
-- and immediately terminates your license unless covered by a separate
-- agreement.
--
-- Xilinx is providing this design, code, or information "as is" solely
-- for use in developing programs and solutions for Xilinx devices.  By
-- providing this design, code, or information as one possible
-- implementation of this feature, application or standard, Xilinx is
-- making no representation that this implementation is free from any
-- claims of infringement.  You are responsible for obtaining any rights
-- you may require for your implementation.  Xilinx expressly disclaims
-- any warranty whatsoever with respect to the adequacy of the
-- implementation, including but not limited to warranties of
-- merchantability or fitness for a particular purpose.
--
-- Xilinx products are not intended for use in life support appliances,
-- devices, or systems.  Use in such applications is expressly prohibited.
--
-- Any modifications that are made to the source code are done at the user's
-- sole risk and will be unsupported.
--
-- This copyright and support notice must be retained as part of this
-- text at all times.  (c) Copyright 1995-2012 Xilinx, Inc.  All rights
-- reserved.
-------------------------------------------------------------------
library IEEE;
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
        
        -- 'From Register'
        -- 'tx_done'
        sm_tx_done_dout : in std_logic_vector(1-1 downto 0);
        -- 'To Register'
        -- 'tx_en'
        sm_tx_en_dout : in std_logic_vector(1-1 downto 0);
        sm_tx_en_din  : out std_logic_vector(1-1 downto 0);
        sm_tx_en_en   : out std_logic;
        -- 'clear_fifo'
        sm_clear_fifo_dout : in std_logic_vector(1-1 downto 0);
        sm_clear_fifo_din  : out std_logic_vector(1-1 downto 0);
        sm_clear_fifo_en   : out std_logic;
        -- 'From FIFO'
        -- 'To FIFO'
        -- 'tx_fifo'
        sm_tx_fifo_din   : out std_logic_vector(8-1 downto 0);
        sm_tx_fifo_we    : out std_logic;
        sm_tx_fifo_pfull : in  std_logic_vector(1-1 downto 0);
        sm_tx_fifo_full  : in  std_logic;
        -- 'Shared Memory'

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
    
-- 'From Register'
-- 'tx_done'
signal sm_tx_done_dout_i  : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
-- 'To Register'
-- 'tx_en'
signal sm_tx_en_din_i   : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
signal sm_tx_en_en_i    : std_logic;
signal sm_tx_en_dout_i  : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
-- 'clear_fifo'
signal sm_clear_fifo_din_i   : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
signal sm_clear_fifo_en_i    : std_logic;
signal sm_clear_fifo_dout_i  : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
-- 'From FIFO'
-- 'To FIFO'
-- 'tx_fifo'
signal sm_tx_fifo_din_i   : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
signal sm_tx_fifo_pfull_i : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
signal sm_tx_fifo_full_i  : std_logic;
signal sm_tx_fifo_we_i    : std_logic;
-- 'Shared Memory'

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

-- 're' of From/To FIFOs
signal s_fifo_re : std_logic;
-- 'we' of To FIFOs
signal s_fifo_we : std_logic;

begin

-- enable for 'Shared Memory' blocks

-- conversion to match with the data bus width
-- 'From Register'
-- 'tx_done'
gen_sm_tx_done_dout_i: if (1 < C_S_AXI_DATA_WIDTH) generate
    sm_tx_done_dout_i(C_S_AXI_DATA_WIDTH-1 downto 1) <= (others => '0');
end generate gen_sm_tx_done_dout_i;
sm_tx_done_dout_i(1-1 downto 0) <= sm_tx_done_dout;
-- 'To Register'
-- 'tx_en'
sm_tx_en_din     <= sm_tx_en_din_i(1-1 downto 0);
sm_tx_en_en      <= sm_tx_en_en_i;
gen_sm_tx_en_dout_i: if (1 < C_S_AXI_DATA_WIDTH) generate
    sm_tx_en_dout_i(C_S_AXI_DATA_WIDTH-1 downto 1) <= (others => '0');
end generate gen_sm_tx_en_dout_i;
sm_tx_en_dout_i(1-1 downto 0) <= sm_tx_en_dout;
-- 'clear_fifo'
sm_clear_fifo_din     <= sm_clear_fifo_din_i(1-1 downto 0);
sm_clear_fifo_en      <= sm_clear_fifo_en_i;
gen_sm_clear_fifo_dout_i: if (1 < C_S_AXI_DATA_WIDTH) generate
    sm_clear_fifo_dout_i(C_S_AXI_DATA_WIDTH-1 downto 1) <= (others => '0');
end generate gen_sm_clear_fifo_dout_i;
sm_clear_fifo_dout_i(1-1 downto 0) <= sm_clear_fifo_dout;
-- 'From FIFO'
-- 'To FIFO'
-- 'tx_fifo'
sm_tx_fifo_din    <= sm_tx_fifo_din_i(8-1 downto 0);
gen_sm_tx_fifo_pfull_i: if (1 < C_S_AXI_DATA_WIDTH) generate
    sm_tx_fifo_pfull_i(C_S_AXI_DATA_WIDTH-1 downto 1) <= (others => '0');
end generate gen_sm_tx_fifo_pfull_i;
sm_tx_fifo_pfull_i(1-1 downto 0) <= sm_tx_fifo_pfull;
sm_tx_fifo_full_i <= sm_tx_fifo_full;
sm_tx_fifo_we     <= sm_tx_fifo_we_i;
-- 'Shared Memory'

ReadWriteSelect: process(memmap_state) is begin
    if (memmap_state = READ) then
    else
    end if;
end process ReadWriteSelect;

-----------------------------------------------------------------------------
-- address for 'Shared Memory'
-----------------------------------------------------------------------------
SharedMemory_Addr_ResetN : process(AXI_AClk) is begin
    if (AXI_AClk'event and AXI_AClk = '1') then
        if (AXI_AResetN = '0') then
            memmap_state <= READ;
        else
            if (S_AXI_AWVALID = '1') then
                -- write operation
                memmap_state <= WRITE;
            elsif (S_AXI_ARVALID = '1') then
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
S_AXI_BRESP  <= (others=>'0');

PROC_AWREADY_ACK: process(read_state, write_state, S_AXI_ARVALID, S_AXI_AWVALID) is begin
    if (write_state = IDLE and S_AXI_AWVALID = '1' and read_state = IDLE) then
        S_AXI_AWREADY <= S_AXI_AWVALID;
    else
        S_AXI_AWREADY <= '0';
    end if;
end process PROC_AWREADY_ACK;

Cmd_Decode_Write: process(AXI_AClk) is begin
    if (AXI_AClk'event and AXI_AClk = '1') then
        if (AXI_AResetN = '0') then
            write_addr_valid    <= '0';
            write_ready         <= '0';
            s_fifo_we           <= '0';
            S_AXI_BVALID_i      <= '0';
            S_AXI_BID_i         <= (others => '0');
            write_bank_addr_i   <= (others => '0');
            write_linear_addr_i <= (others => '0');
        else
            if (write_state = IDLE) then
                if (S_AXI_AWVALID = '1' and read_state = IDLE) then
                    -- reflect awid
                    S_AXI_BID_i <= S_AXI_AWID;

                    -- latch bank and linear addresses
                    write_bank_addr_i   <= S_AXI_AWADDR(C_S_AXI_TOTAL_ADDR_LEN-1 downto C_S_AXI_LINEAR_ADDR_LEN+2);
                    write_linear_addr_i <= S_AXI_AWADDR(C_S_AXI_LINEAR_ADDR_LEN+1 downto 2);
                    write_addr_valid <= '1';
                    s_fifo_we <= '1';

                    -- write state transition
                    write_state <= WRITE_DATA;
                end if;
            elsif (write_state = WRITE_DATA) then
                write_ready <= '1';
                s_fifo_we <= '0';
                write_addr_valid <= S_AXI_WVALID;
                
                if (S_AXI_WVALID = '1' and write_ready = '1') then
                    write_linear_addr_i <= Std_Logic_Vector(unsigned(write_linear_addr_i) + 1);
                end if;

                if (S_AXI_WLAST = '1' and write_ready = '1') then
                    -- start responding through B channel upon the last write data sample
                    S_AXI_BVALID_i <= '1';
                    -- write data is over
                    write_addr_valid <= '0';
                    write_ready <= '0';
                    -- write state transition
                    write_state <= WRITE_RESPONSE;
                end if;
            elsif (write_state = WRITE_RESPONSE) then

                if (S_AXI_BREADY = '1') then
                    -- write respond is over
                    S_AXI_BVALID_i <= '0';
                    S_AXI_BID_i <= (others => '0');

                    -- write state transition
                    write_state <= IDLE;
                end if;
            end if;
        end if;
    end if;
end process Cmd_Decode_Write;

Write_Linear_Addr_Decode : process(AXI_AClk) is 

begin
    if (AXI_AClk'event and AXI_AClk = '1') then
        if (AXI_AResetN = '0') then
            -- 'To Register'
            -- tx_en din/en
            sm_tx_en_din_i <= (others => '0');
            sm_tx_en_en_i <= '0';
            -- clear_fifo din/en
            sm_clear_fifo_din_i <= (others => '0');
            sm_clear_fifo_en_i <= '0';
            -- 'To FIFO'
            -- tx_fifo din/en
            sm_tx_fifo_din_i <= (others => '0');
            sm_tx_fifo_we_i <= '0';
            -- 'Shared Memory'
        else
            -- default assignments

            -- 'To Register'
            if (unsigned(write_bank_addr_i) = 2) then
                if (unsigned(write_linear_addr_i) = 0) then
                    -- tx_en din/en
                    sm_tx_en_din_i <= S_AXI_WDATA;
                    sm_tx_en_en_i  <= write_addr_valid;
                elsif (unsigned(write_linear_addr_i) = 1) then
                    -- clear_fifo din/en
                    sm_clear_fifo_din_i <= S_AXI_WDATA;
                    sm_clear_fifo_en_i  <= write_addr_valid;
                end if;
            end if;        
            -- 'To FIFO'
            if (unsigned(write_bank_addr_i) = 1) then
                if (unsigned(write_linear_addr_i) = 0) then
                    -- tx_fifo din/we
                    sm_tx_fifo_din_i <= S_AXI_WDATA;
                    sm_tx_fifo_we_i  <= s_fifo_we and (not sm_tx_fifo_full_i);
                end if;
            end if;        
        
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
S_AXI_RRESP <= (others=>'0');

PROC_ARREADY_ACK: process(read_state, S_AXI_ARVALID, write_state, S_AXI_AWVALID) is begin
    -- Note: WRITE has higher priority than READ
    if (read_state = IDLE and S_AXI_ARVALID = '1' and write_state = IDLE and S_AXI_AWVALID /= '1') then
        S_AXI_ARREADY <= S_AXI_ARVALID;
    else
        S_AXI_ARREADY <= '0';
    end if;
end process PROC_ARREADY_ACK;

S_AXI_WREADY_i <= write_ready;

Process_Sideband: process(write_state, read_state) is begin
    if (read_state = READ_PREP) then
        s_shram_en <= '1';
    elsif (read_state = READ_DATA) then
        s_shram_en <= S_AXI_RREADY;
    elsif (write_state = WRITE_DATA) then
        s_shram_en <= S_AXI_WVALID;
    else
        s_shram_en <= '0';
    end if;
end process Process_Sideband;

Cmd_Decode_Read: process(AXI_AClk) is begin
    if (AXI_AClk'event and AXI_AClk = '1') then
        if (AXI_AResetN = '0') then
            S_AXI_RVALID_i <= '0';
            read_bank_addr_i    <= (others => '0');
            read_linear_addr_i  <= (others => '0');
            S_AXI_ARLEN_i       <= (others => '0');
            S_AXI_RLAST_i       <= '0';
            S_AXI_RID_i         <= (others => '0');
            read_state          <= IDLE;
            read_prep_counter   <= (others => '0');
            read_addr_counter   <= (others => '0');
            read_data_counter   <= (others => '0');
        else
            -- default assignments
            s_fifo_re <= '0';

            if (read_state = IDLE) then
                -- Note WRITE has higher priority than READ
                if (S_AXI_ARVALID = '1' and write_state = IDLE and S_AXI_AWVALID /= '1') then
                    -- extract bank and linear addresses
                    read_bank_addr_i    <= S_AXI_ARADDR(C_S_AXI_TOTAL_ADDR_LEN-1 downto C_S_AXI_LINEAR_ADDR_LEN+2);
                    read_linear_addr_i  <= S_AXI_ARADDR(C_S_AXI_LINEAR_ADDR_LEN+1 downto 2);
                    s_fifo_re <= '1';

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
                        S_AXI_RLAST_i <= '1';
                    end if;
                    -- valid data appears
                    S_AXI_RVALID_i <= '1';
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
                if (S_AXI_RREADY = '1') then
                    if (unsigned(read_data_counter) = 1) then
                        -- tag the last data generated by the slave
                        S_AXI_RLAST_i <= '1';
                    end if;

                    if (unsigned(read_data_counter) = 0) then
                        -- arid
                        S_AXI_RID_i <= (others => '0');
                        -- rlast
                        S_AXI_RLAST_i <= '0';
                        -- no more valid data
                        S_AXI_RVALID_i <= '0';
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
    if (AXI_AClk'event and AXI_AClk = '1') then
        if (AXI_AResetN = '0') then
            reg_bank_out_i   <= (others => '0');
            fifo_bank_out_i  <= (others => '0');
            shmem_bank_out_i <= (others => '0');
            S_AXI_RDATA_i    <= (others => '0');
        else
            if (unsigned(read_bank_addr_i) = 2) then
                -- 'From Register'
                if (unsigned(read_linear_addr_i) = 0) then
                    -- 'tx_done' dout
                    reg_bank_out_i <= sm_tx_done_dout_i;
                end if;

                S_AXI_RDATA_i <= reg_bank_out_i;
            elsif (unsigned(read_bank_addr_i) = 1) then
                -- 'From FIFO'
                -- 'To FIFO'
                if (unsigned(read_linear_addr_i) = 0) then
                    -- 'tx_fifo' pfull
                    fifo_bank_out_i <= sm_tx_fifo_pfull_i;
                elsif (unsigned(read_linear_addr_i) = 1) then
                    -- 'tx_fifo' full
                    fifo_bank_out_i <= (0 => sm_tx_fifo_full_i, others => '0');
                end if;

                S_AXI_RDATA_i <= fifo_bank_out_i;
            elsif (unsigned(read_bank_addr_i) = 0 and s_shram_en = '1') then
                -- 'Shared Memory'

                S_AXI_RDATA_i <= shmem_bank_out_i;
            end if;
        end if;
    end if;
end process Read_Linear_Addr_Decode;

end architecture IMP;


-------------------------------------------------------------------
-- System Generator version 14.2 VHDL source file.
--
-- Copyright(C) 2012 by Xilinx, Inc.  All rights reserved.  This
-- text/file contains proprietary, confidential information of Xilinx,
-- Inc., is distributed under license from Xilinx, Inc., and may be used,
-- copied and/or disclosed only pursuant to the terms of a valid license
-- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
-- this text/file solely for design, simulation, implementation and
-- creation of design files limited to Xilinx devices or technologies.
-- Use with non-Xilinx devices or technologies is expressly prohibited
-- and immediately terminates your license unless covered by a separate
-- agreement.
--
-- Xilinx is providing this design, code, or information "as is" solely
-- for use in developing programs and solutions for Xilinx devices.  By
-- providing this design, code, or information as one possible
-- implementation of this feature, application or standard, Xilinx is
-- making no representation that this implementation is free from any
-- claims of infringement.  You are responsible for obtaining any rights
-- you may require for your implementation.  Xilinx expressly disclaims
-- any warranty whatsoever with respect to the adequacy of the
-- implementation, including but not limited to warranties of
-- merchantability or fitness for a particular purpose.
--
-- Xilinx products are not intended for use in life support appliances,
-- devices, or systems.  Use in such applications is expressly prohibited.
--
-- Any modifications that are made to the source code are done at the user's
-- sole risk and will be unsupported.
--
-- This copyright and support notice must be retained as part of this
-- text at all times.  (c) Copyright 1995-2012 Xilinx, Inc.  All rights
-- reserved.
-------------------------------------------------------------------
-- synopsys translate_off
library XilinxCoreLib;
-- synopsys translate_on
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;
entity xlcounter_free_tx is
  generic (
    core_name0: string := "";
    op_width: integer := 5;
    op_arith: integer := xlSigned
  );
  port (
    ce: in std_logic;
    clr: in std_logic;
    clk: in std_logic;
    op: out std_logic_vector(op_width - 1 downto 0);
    up: in std_logic_vector(0 downto 0) := (others => '0');
    load: in std_logic_vector(0 downto 0) := (others => '0');
    din: in std_logic_vector(op_width - 1 downto 0) := (others => '0');
    en: in std_logic_vector(0 downto 0);
    rst: in std_logic_vector(0 downto 0)
  );
end xlcounter_free_tx ;
architecture behavior of xlcounter_free_tx is
  component cntr_11_0_8d5792a6ba24605d
    port (
      clk: in std_logic;
      ce: in std_logic;
      SINIT: in std_logic;
      q: out std_logic_vector(op_width - 1 downto 0)
    );
  end component;

  attribute syn_black_box of cntr_11_0_8d5792a6ba24605d:
    component is true;
  attribute fpga_dont_touch of cntr_11_0_8d5792a6ba24605d:
    component is "true";
  attribute box_type of cntr_11_0_8d5792a6ba24605d:
    component  is "black_box";
-- synopsys translate_off
  constant zeroVec: std_logic_vector(op_width - 1 downto 0) := (others => '0');
  constant oneVec: std_logic_vector(op_width - 1 downto 0) := (others => '1');
  constant zeroStr: string(1 to op_width) :=
    std_logic_vector_to_bin_string(zeroVec);
  constant oneStr: string(1 to op_width) :=
    std_logic_vector_to_bin_string(oneVec);
-- synopsys translate_on
  signal core_sinit: std_logic;
  signal core_ce: std_logic;
  signal op_net: std_logic_vector(op_width - 1 downto 0);
begin
  core_ce <= ce and en(0);
  core_sinit <= (clr or rst(0)) and ce;
  op <= op_net;
  comp0: if ((core_name0 = "cntr_11_0_8d5792a6ba24605d")) generate
    core_instance0: cntr_11_0_8d5792a6ba24605d
      port map (
        clk => clk,
        ce => core_ce,
        SINIT => core_sinit,
        q => op_net
      );
  end generate;
end behavior;

-------------------------------------------------------------------
-- System Generator version 14.2 VHDL source file.
--
-- Copyright(C) 2012 by Xilinx, Inc.  All rights reserved.  This
-- text/file contains proprietary, confidential information of Xilinx,
-- Inc., is distributed under license from Xilinx, Inc., and may be used,
-- copied and/or disclosed only pursuant to the terms of a valid license
-- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
-- this text/file solely for design, simulation, implementation and
-- creation of design files limited to Xilinx devices or technologies.
-- Use with non-Xilinx devices or technologies is expressly prohibited
-- and immediately terminates your license unless covered by a separate
-- agreement.
--
-- Xilinx is providing this design, code, or information "as is" solely
-- for use in developing programs and solutions for Xilinx devices.  By
-- providing this design, code, or information as one possible
-- implementation of this feature, application or standard, Xilinx is
-- making no representation that this implementation is free from any
-- claims of infringement.  You are responsible for obtaining any rights
-- you may require for your implementation.  Xilinx expressly disclaims
-- any warranty whatsoever with respect to the adequacy of the
-- implementation, including but not limited to warranties of
-- merchantability or fitness for a particular purpose.
--
-- Xilinx products are not intended for use in life support appliances,
-- devices, or systems.  Use in such applications is expressly prohibited.
--
-- Any modifications that are made to the source code are done at the user's
-- sole risk and will be unsupported.
--
-- This copyright and support notice must be retained as part of this
-- text at all times.  (c) Copyright 1995-2012 Xilinx, Inc.  All rights
-- reserved.
-------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use work.conv_pkg.all;
entity xlslice is
    generic (
        new_msb      : integer := 9;
        new_lsb      : integer := 1;
        x_width      : integer := 16;
        y_width      : integer := 8);
    port (
        x : in std_logic_vector (x_width-1 downto 0);
        y : out std_logic_vector (y_width-1 downto 0));
end xlslice;
architecture behavior of xlslice is
begin
    y <= x(new_msb downto new_lsb);
end  behavior;

-------------------------------------------------------------------
-- System Generator version 14.2 VHDL source file.
--
-- Copyright(C) 2012 by Xilinx, Inc.  All rights reserved.  This
-- text/file contains proprietary, confidential information of Xilinx,
-- Inc., is distributed under license from Xilinx, Inc., and may be used,
-- copied and/or disclosed only pursuant to the terms of a valid license
-- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
-- this text/file solely for design, simulation, implementation and
-- creation of design files limited to Xilinx devices or technologies.
-- Use with non-Xilinx devices or technologies is expressly prohibited
-- and immediately terminates your license unless covered by a separate
-- agreement.
--
-- Xilinx is providing this design, code, or information "as is" solely
-- for use in developing programs and solutions for Xilinx devices.  By
-- providing this design, code, or information as one possible
-- implementation of this feature, application or standard, Xilinx is
-- making no representation that this implementation is free from any
-- claims of infringement.  You are responsible for obtaining any rights
-- you may require for your implementation.  Xilinx expressly disclaims
-- any warranty whatsoever with respect to the adequacy of the
-- implementation, including but not limited to warranties of
-- merchantability or fitness for a particular purpose.
--
-- Xilinx products are not intended for use in life support appliances,
-- devices, or systems.  Use in such applications is expressly prohibited.
--
-- Any modifications that are made to the source code are done at the user's
-- sole risk and will be unsupported.
--
-- This copyright and support notice must be retained as part of this
-- text at all times.  (c) Copyright 1995-2012 Xilinx, Inc.  All rights
-- reserved.
-------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;
entity xlpassthrough is
    generic (
        din_width    : integer := 16;
        dout_width   : integer := 16
        );
    port (
        din : in std_logic_vector (din_width-1 downto 0);
        dout : out std_logic_vector (dout_width-1 downto 0));
end xlpassthrough;
architecture passthrough_arch of xlpassthrough is
begin
  dout <= din;
end passthrough_arch;
-- -------------------------------------------------------------
-- 
-- File Name: C:\QPSK_Projects\project_3\codegen\qpsk_tx\hdlsrc\qpsk_tx_FixPt_pkg.vhd
-- Created: 2013-01-04 14:23:48
-- 
-- Generated by MATLAB 8.0, MATLAB Coder 2.3 and HDL Coder 3.1
-- 
-- 
-- -------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE qpsk_tx_FixPt_pkg IS
  TYPE vector_of_signed32 IS ARRAY (NATURAL RANGE <>) OF signed(31 DOWNTO 0);
  TYPE vector_of_signed3 IS ARRAY (NATURAL RANGE <>) OF signed(2 DOWNTO 0);
  TYPE vector_of_signed23 IS ARRAY (NATURAL RANGE <>) OF signed(22 DOWNTO 0);
  TYPE vector_of_signed17 IS ARRAY (NATURAL RANGE <>) OF signed(16 DOWNTO 0);
  TYPE vector_of_signed14 IS ARRAY (NATURAL RANGE <>) OF signed(13 DOWNTO 0);
END qpsk_tx_FixPt_pkg;

-- -------------------------------------------------------------
-- 
-- File Name: C:\QPSK_Projects\project_3\codegen\qpsk_tx\hdlsrc\SimpleDualPortRAM_1024x8b.vhd
-- Created: 2013-01-04 14:23:48
-- 
-- Generated by MATLAB 8.0, MATLAB Coder 2.3 and HDL Coder 3.1
-- 
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SimpleDualPortRAM_1024x8b
-- Source Path: qpsk_tx_FixPt/tx_fifo_ram/SimpleDualPortRAM_1024x8b
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

-- -------------------------------------------------------------
-- 
-- File Name: C:\QPSK_Projects\project_3\codegen\qpsk_tx\hdlsrc\tx_fifo_ram.vhd
-- Created: 2013-01-04 14:23:48
-- 
-- Generated by MATLAB 8.0, MATLAB Coder 2.3 and HDL Coder 3.1
-- 
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: tx_fifo_ram
-- Source Path: qpsk_tx_FixPt/tx_fifo_ram
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY tx_fifo_ram IS
  PORT( clk                               :   IN    std_logic;
        enb                               :   IN    std_logic;
        wr_din                            :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        wr_addr                           :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
        wr_en                             :   IN    std_logic;  -- ufix1
        rd_addr                           :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
        rd_dout                           :   OUT   std_logic_vector(7 DOWNTO 0)  -- ufix8
        );
END tx_fifo_ram;


ARCHITECTURE rtl OF tx_fifo_ram IS

  -- Component Declarations
  COMPONENT SimpleDualPortRAM_1024x8b
    PORT( clk                             :   IN    std_logic;
          enb                             :   IN    std_logic;
          wr_din                          :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
          wr_addr                         :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          wr_en                           :   IN    std_logic;  -- ufix1
          rd_addr                         :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          rd_dout                         :   OUT   std_logic_vector(7 DOWNTO 0)  -- ufix8
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : SimpleDualPortRAM_1024x8b
    USE ENTITY work.SimpleDualPortRAM_1024x8b(rtl);

  -- Signals
  SIGNAL rd_dout_tmp                      : std_logic_vector(7 DOWNTO 0);  -- ufix8

BEGIN
  u_SimpleDualPortRAM_1024x8b : SimpleDualPortRAM_1024x8b
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => wr_din,  -- ufix8
              wr_addr => wr_addr,  -- ufix10
              wr_en => wr_en,  -- ufix1
              rd_addr => rd_addr,  -- ufix10
              rd_dout => rd_dout_tmp  -- ufix8
              );

  rd_dout <= rd_dout_tmp;

END rtl;

-- -------------------------------------------------------------
-- 
-- File Name: C:\QPSK_Projects\project_3\codegen\qpsk_tx\hdlsrc\qpsk_tx_FixPt.vhd
-- Created: 2013-01-04 14:23:48
-- 
-- Generated by MATLAB 8.0, MATLAB Coder 2.3 and HDL Coder 3.1
-- 
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Design base rate: 1
-- 
-- 
-- Clock Enable  Sample Time
-- -------------------------------------------------------------
-- ce_out        1
-- -------------------------------------------------------------
-- 
-- 
-- Output Signal                 Clock Enable  Sample Time
-- -------------------------------------------------------------
-- i_out                         ce_out        1
-- q_out                         ce_out        1
-- re_byte_out                   ce_out        1
-- tx_done_out                   ce_out        1
-- -------------------------------------------------------------
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: qpsk_tx_FixPt
-- Source Path: qpsk_tx_FixPt
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.qpsk_tx_FixPt_pkg.ALL;

ENTITY qpsk_tx_FixPt IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        ce                                :   IN    std_logic;
        data_in                           :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        empty_in                          :   IN    std_logic;  -- ufix1
        clear_fifo_in                     :   IN    std_logic;  -- ufix1
        tx_en_in                          :   IN    std_logic;  -- ufix1
        ce_out                            :   OUT   std_logic;
        i_out                             :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        q_out                             :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        re_byte_out                       :   OUT   std_logic;  -- ufix1
        tx_done_out                       :   OUT   std_logic  -- ufix1
        );
END qpsk_tx_FixPt;


ARCHITECTURE rtl OF qpsk_tx_FixPt IS

  -- Component Declarations
  COMPONENT tx_fifo_ram
    PORT( clk                             :   IN    std_logic;
          enb                             :   IN    std_logic;
          wr_din                          :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
          wr_addr                         :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          wr_en                           :   IN    std_logic;  -- ufix1
          rd_addr                         :   IN    std_logic_vector(9 DOWNTO 0);  -- ufix10
          rd_dout                         :   OUT   std_logic_vector(7 DOWNTO 0)  -- ufix8
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : tx_fifo_ram
    USE ENTITY work.tx_fifo_ram(rtl);

  -- Constants
  CONSTANT tbi                            : vector_of_signed3(0 TO 64) := ( to_signed(1, 3), to_signed(1, 3), to_signed(-1, 3), to_signed(-1, 3), to_signed(1, 3), 
                                                                          to_signed(1, 3), to_signed(-1, 3), to_signed(-1, 3), to_signed(1, 3), to_signed(-1, 3), 
                                                                          to_signed(-1, 3), to_signed(-1, 3), to_signed(-1, 3), to_signed(1, 3), to_signed(-1, 3), 
                                                                          to_signed(1, 3), to_signed(1, 3), to_signed(-1, 3), to_signed(-1, 3), to_signed(1, 3), 
                                                                          to_signed(1, 3), to_signed(1, 3), to_signed(-1, 3), to_signed(1, 3), to_signed(1, 3), 
                                                                          to_signed(1, 3), to_signed(-1, 3), to_signed(1, 3), to_signed(-1, 3), to_signed(1, 3), 
                                                                          to_signed(1, 3), to_signed(1, 3), to_signed(-1, 3), to_signed(1, 3), to_signed(1, 3), 
                                                                          to_signed(1, 3), to_signed(1, 3), to_signed(-1, 3), to_signed(1, 3), to_signed(1, 3), 
                                                                          to_signed(-1, 3), to_signed(-1, 3), to_signed(-1, 3), to_signed(-1, 3), to_signed(1, 3), 
                                                                          to_signed(1, 3), to_signed(1, 3), to_signed(-1, 3), to_signed(-1, 3), to_signed(-1, 3), 
                                                                          to_signed(1, 3), to_signed(1, 3), to_signed(1, 3), to_signed(1, 3), to_signed(-1, 3), 
                                                                          to_signed(1, 3), to_signed(1, 3), to_signed(1, 3), to_signed(1, 3), to_signed(1, 3), 
                                                                          to_signed(-1, 3), to_signed(-1, 3), to_signed(-1, 3), to_signed(1, 3), to_signed(1, 3) );  -- sfix3 [65]
  CONSTANT tbq                            : vector_of_signed3(0 TO 64) := ( to_signed(1, 3), to_signed(-1, 3), to_signed(1, 3), to_signed(1, 3), to_signed(1, 3), 
                                                                          to_signed(-1, 3), to_signed(-1, 3), to_signed(-1, 3), to_signed(-1, 3), to_signed(1, 3), 
                                                                          to_signed(1, 3), to_signed(-1, 3), to_signed(1, 3), to_signed(1, 3), to_signed(-1, 3), 
                                                                          to_signed(-1, 3), to_signed(-1, 3), to_signed(1, 3), to_signed(-1, 3), to_signed(-1, 3), 
                                                                          to_signed(1, 3), to_signed(1, 3), to_signed(1, 3), to_signed(-1, 3), to_signed(-1, 3), 
                                                                          to_signed(1, 3), to_signed(1, 3), to_signed(1, 3), to_signed(-1, 3), to_signed(-1, 3), 
                                                                          to_signed(-1, 3), to_signed(-1, 3), to_signed(-1, 3), to_signed(-1, 3), to_signed(1, 3), 
                                                                          to_signed(1, 3), to_signed(-1, 3), to_signed(1, 3), to_signed(-1, 3), to_signed(1, 3), 
                                                                          to_signed(1, 3), to_signed(-1, 3), to_signed(-1, 3), to_signed(1, 3), to_signed(-1, 3), 
                                                                          to_signed(-1, 3), to_signed(1, 3), to_signed(1, 3), to_signed(-1, 3), to_signed(-1, 3), 
                                                                          to_signed(-1, 3), to_signed(-1, 3), to_signed(-1, 3), to_signed(1, 3), to_signed(1, 3), 
                                                                          to_signed(1, 3), to_signed(1, 3), to_signed(-1, 3), to_signed(-1, 3), to_signed(-1, 3), 
                                                                          to_signed(-1, 3), to_signed(1, 3), to_signed(-1, 3), to_signed(1, 3), to_signed(-1, 3) );  -- sfix3 [65]
  CONSTANT tbi_2                          : vector_of_signed3(0 TO 64) := ( to_signed(1, 3), to_signed(1, 3), to_signed(-1, 3), to_signed(-1, 3), to_signed(1, 3), 
                                                                          to_signed(1, 3), to_signed(-1, 3), to_signed(-1, 3), to_signed(1, 3), to_signed(-1, 3), 
                                                                          to_signed(-1, 3), to_signed(-1, 3), to_signed(-1, 3), to_signed(1, 3), to_signed(-1, 3), 
                                                                          to_signed(1, 3), to_signed(1, 3), to_signed(-1, 3), to_signed(-1, 3), to_signed(1, 3), 
                                                                          to_signed(1, 3), to_signed(1, 3), to_signed(-1, 3), to_signed(1, 3), to_signed(1, 3), 
                                                                          to_signed(1, 3), to_signed(-1, 3), to_signed(1, 3), to_signed(-1, 3), to_signed(1, 3), 
                                                                          to_signed(1, 3), to_signed(1, 3), to_signed(-1, 3), to_signed(1, 3), to_signed(1, 3), 
                                                                          to_signed(1, 3), to_signed(1, 3), to_signed(-1, 3), to_signed(1, 3), to_signed(1, 3), 
                                                                          to_signed(-1, 3), to_signed(-1, 3), to_signed(-1, 3), to_signed(-1, 3), to_signed(1, 3), 
                                                                          to_signed(1, 3), to_signed(1, 3), to_signed(-1, 3), to_signed(-1, 3), to_signed(-1, 3), 
                                                                          to_signed(1, 3), to_signed(1, 3), to_signed(1, 3), to_signed(1, 3), to_signed(-1, 3), 
                                                                          to_signed(1, 3), to_signed(1, 3), to_signed(1, 3), to_signed(1, 3), to_signed(1, 3), 
                                                                          to_signed(-1, 3), to_signed(-1, 3), to_signed(-1, 3), to_signed(1, 3), to_signed(1, 3) );  -- sfix3 [65]
  CONSTANT tbq_2                          : vector_of_signed3(0 TO 64) := ( to_signed(1, 3), to_signed(-1, 3), to_signed(1, 3), to_signed(1, 3), to_signed(1, 3), 
                                                                          to_signed(-1, 3), to_signed(-1, 3), to_signed(-1, 3), to_signed(-1, 3), to_signed(1, 3), 
                                                                          to_signed(1, 3), to_signed(-1, 3), to_signed(1, 3), to_signed(1, 3), to_signed(-1, 3), 
                                                                          to_signed(-1, 3), to_signed(-1, 3), to_signed(1, 3), to_signed(-1, 3), to_signed(-1, 3), 
                                                                          to_signed(1, 3), to_signed(1, 3), to_signed(1, 3), to_signed(-1, 3), to_signed(-1, 3), 
                                                                          to_signed(1, 3), to_signed(1, 3), to_signed(1, 3), to_signed(-1, 3), to_signed(-1, 3), 
                                                                          to_signed(-1, 3), to_signed(-1, 3), to_signed(-1, 3), to_signed(-1, 3), to_signed(1, 3), 
                                                                          to_signed(1, 3), to_signed(-1, 3), to_signed(1, 3), to_signed(-1, 3), to_signed(1, 3), 
                                                                          to_signed(1, 3), to_signed(-1, 3), to_signed(-1, 3), to_signed(1, 3), to_signed(-1, 3), 
                                                                          to_signed(-1, 3), to_signed(1, 3), to_signed(1, 3), to_signed(-1, 3), to_signed(-1, 3), 
                                                                          to_signed(-1, 3), to_signed(-1, 3), to_signed(-1, 3), to_signed(1, 3), to_signed(1, 3), 
                                                                          to_signed(1, 3), to_signed(1, 3), to_signed(-1, 3), to_signed(-1, 3), to_signed(-1, 3), 
                                                                          to_signed(-1, 3), to_signed(1, 3), to_signed(-1, 3), to_signed(1, 3), to_signed(-1, 3) );  -- sfix3 [65]
  CONSTANT nc                             : vector_of_signed14(0 TO 16) := ( to_signed(109, 14), to_signed(-95, 14), to_signed(-194, 14), to_signed(337, 14), to_signed(274, 14), 
                                                                           to_signed(-880, 14), to_signed(-332, 14), to_signed(3211, 14), to_signed(5518, 14), 
                                                                           to_signed(3211, 14), to_signed(-332, 14), to_signed(-880, 14), to_signed(274, 14), to_signed(337, 14), 
                                                                           to_signed(-194, 14), to_signed(-95, 14), to_signed(109, 14) );  -- sfix14 [17]

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL c_re                             : signed(21 DOWNTO 0);  -- sfix22_En14
  SIGNAL c_im                             : signed(21 DOWNTO 0);  -- sfix22_En14
  SIGNAL c_re_1                           : signed(21 DOWNTO 0);  -- sfix22_En14
  SIGNAL c_im_1                           : signed(21 DOWNTO 0);  -- sfix22_En14
  SIGNAL tmp                              : vector_of_signed32(0 TO 15);  -- int32 [16]
  SIGNAL tmp_1                            : vector_of_signed32(0 TO 15);  -- int32 [16]
  SIGNAL empty_in_1                       : std_logic;  -- ufix1
  SIGNAL tx_en_in_1                       : std_logic;  -- ufix1
  SIGNAL tmp_2                            : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL tmp_3                            : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL tmp_4                            : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL tmp_5                            : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL tmp_6                            : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL tmp_7                            : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL reBuf                            : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL tmp_8                            : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL tmp_9                            : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL tmp_10                           : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL tmp_11                           : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL wrCount                          : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL tmp_12                           : std_logic;  -- ufix1
  SIGNAL count                            : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL tmp_13                           : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL rdCount                          : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL sentTrain                        : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL tmp_14                           : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL p49_tmp                          : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL p49_tmp_1                        : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL tmp_15                           : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL tmp_16                           : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL tmp_17                           : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL count_1                          : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL tmp_18                           : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL tmp_19                           : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL p44_tmp                          : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL tmp_20                           : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL tmp_21                           : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL count_2                          : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL tmp_22                           : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL tmp_23                           : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL p43_tmp                          : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL p43_tmp_1                        : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL tmp_24                           : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL tmp_25                           : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL tmp_26                           : std_logic;  -- ufix1
  SIGNAL p52_tmp                          : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL p52_tmp_1                        : std_logic;  -- ufix1
  SIGNAL p52_tmp_2                        : std_logic;  -- ufix1
  SIGNAL tmp_27                           : std_logic;  -- ufix1
  SIGNAL tmp_28                           : std_logic;  -- ufix1
  SIGNAL txDone                           : std_logic;  -- ufix1
  SIGNAL tmp_29                           : std_logic;  -- ufix1
  SIGNAL iA                               : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL iA_1                             : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL symIndex                         : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL tmp_30                           : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL tmp_31                           : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL p51_tmp                          : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL p51_tmp_1                        : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL p51_tmp_2                        : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL p51_div_temp                     : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL p51_cast                         : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL p51_mul_temp                     : signed(48 DOWNTO 0);  -- sfix49
  SIGNAL p51_sub_cast                     : signed(31 DOWNTO 0);  -- int32
  SIGNAL p51_sub_cast_1                   : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL p51_sub_temp                     : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL p51_cast_1                       : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL tmp_32                           : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL sym2                             : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL p73sym2_cast                     : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL sym2_1                           : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL wrIndex                          : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL data_in_unsigned                 : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL tmp_33                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL tmp_34                           : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tmp_35                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL p110tmp_sub_cast                 : signed(31 DOWNTO 0);  -- int32
  SIGNAL indexLogic_fixptsig              : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL tx_fifo_ram_wrenb                : std_logic;  -- ufix1
  SIGNAL rdIndex                          : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL tmp_36                           : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL tmp_37                           : signed(31 DOWNTO 0);  -- int32
  SIGNAL p82tmp_sub_cast                  : signed(31 DOWNTO 0);  -- int32
  SIGNAL indexLogic_fixptsig_1            : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL tx_fifo                          : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL tx_fifo_unsigned                 : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL data                             : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL tmp_38                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL tmp_39                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL p57tmp_cast                      : unsigned(8 DOWNTO 0);  -- ufix9_En1
  SIGNAL p57tmp_cast_1                    : unsigned(8 DOWNTO 0);  -- ufix9_En1
  SIGNAL tmp_40                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL p58tmp_cast                      : unsigned(9 DOWNTO 0);  -- ufix10_En2
  SIGNAL p58tmp_cast_1                    : unsigned(9 DOWNTO 0);  -- ufix10_En2
  SIGNAL tmp_41                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL p59tmp_cast                      : unsigned(10 DOWNTO 0);  -- ufix11_En3
  SIGNAL p59tmp_cast_1                    : unsigned(10 DOWNTO 0);  -- ufix11_En3
  SIGNAL tmp_42                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL p60tmp_cast                      : unsigned(11 DOWNTO 0);  -- ufix12_En4
  SIGNAL p60tmp_cast_1                    : unsigned(11 DOWNTO 0);  -- ufix12_En4
  SIGNAL tmp_43                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL p61tmp_cast                      : unsigned(12 DOWNTO 0);  -- ufix13_En5
  SIGNAL p61tmp_cast_1                    : unsigned(12 DOWNTO 0);  -- ufix13_En5
  SIGNAL tmp_44                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL p62tmp_cast                      : unsigned(13 DOWNTO 0);  -- ufix14_En6
  SIGNAL p62tmp_cast_1                    : unsigned(13 DOWNTO 0);  -- ufix14_En6
  SIGNAL tmp_45                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL p63tmp_cast                      : unsigned(14 DOWNTO 0);  -- ufix15_En7
  SIGNAL p63tmp_cast_1                    : unsigned(14 DOWNTO 0);  -- ufix15_En7
  SIGNAL tmp_47                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL iA_2                             : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL sym2_2                           : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL a                                : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL c                                : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL tmp_48                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL a_1                              : unsigned(8 DOWNTO 0);  -- ufix9_En1
  SIGNAL c_1                              : unsigned(8 DOWNTO 0);  -- ufix9_En1
  SIGNAL tmp_49                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL a_2                              : unsigned(9 DOWNTO 0);  -- ufix10_En2
  SIGNAL c_2                              : unsigned(9 DOWNTO 0);  -- ufix10_En2
  SIGNAL tmp_50                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL a_3                              : unsigned(10 DOWNTO 0);  -- ufix11_En3
  SIGNAL c_3                              : unsigned(10 DOWNTO 0);  -- ufix11_En3
  SIGNAL tmp_51                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL a_4                              : unsigned(11 DOWNTO 0);  -- ufix12_En4
  SIGNAL c_4                              : unsigned(11 DOWNTO 0);  -- ufix12_En4
  SIGNAL tmp_52                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL a_5                              : unsigned(12 DOWNTO 0);  -- ufix13_En5
  SIGNAL c_5                              : unsigned(12 DOWNTO 0);  -- ufix13_En5
  SIGNAL tmp_53                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL a_6                              : unsigned(13 DOWNTO 0);  -- ufix14_En6
  SIGNAL c_6                              : unsigned(13 DOWNTO 0);  -- ufix14_En6
  SIGNAL tmp_54                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL a_7                              : unsigned(14 DOWNTO 0);  -- ufix15_En7
  SIGNAL c_7                              : unsigned(14 DOWNTO 0);  -- ufix15_En7
  SIGNAL tmp_55                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL tmp_57                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL iA_3                             : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL empty_in_2                       : std_logic;  -- ufix1
  SIGNAL tx_en_in_2                       : std_logic;  -- ufix1
  SIGNAL tmp_58                           : std_logic;  -- ufix1
  SIGNAL iA_4                             : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL iA_5                             : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL iA_6                             : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL sentTrain_1                      : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL count_3                          : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL diLatch                          : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL tmp_59                           : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL p48_tmp                          : signed(31 DOWNTO 0);  -- int32
  SIGNAL p48_tmp_1                        : signed(31 DOWNTO 0);  -- int32
  SIGNAL p48_tmp_2                        : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL p48_tmp_3                        : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL p48_tmp_4                        : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL p48_tmp_5                        : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL p48_div_temp                     : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL p48_div_temp_1                   : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL p48_div_temp_2                   : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL p48_cast                         : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL p48_mul_temp                     : signed(48 DOWNTO 0);  -- sfix49
  SIGNAL p48_sub_cast                     : signed(31 DOWNTO 0);  -- int32
  SIGNAL p48_sub_cast_1                   : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL p48_sub_temp                     : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL p48_cast_1                       : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL p48_sub_temp_1                   : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL p48_sub_cast_2                   : signed(31 DOWNTO 0);  -- int32
  SIGNAL p48_cast_2                       : signed(8 DOWNTO 0);  -- sfix9
  SIGNAL p48_mul_temp_1                   : signed(40 DOWNTO 0);  -- sfix41
  SIGNAL p48_sub_cast_3                   : signed(31 DOWNTO 0);  -- int32
  SIGNAL p48_sub_cast_4                   : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL p48_sub_temp_2                   : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL p48_cast_3                       : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL p48_cast_4                       : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL p48_mul_temp_2                   : signed(5 DOWNTO 0);  -- sfix6
  SIGNAL p48_sub_cast_5                   : signed(4 DOWNTO 0);  -- sfix5
  SIGNAL p48_sub_temp_3                   : signed(5 DOWNTO 0);  -- sfix6
  SIGNAL p48_sub_temp_4                   : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL p48_cast_5                       : std_logic;  -- ufix1
  SIGNAL p48_sub_cast_6                   : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL p48_sub_temp_5                   : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL tmp_60                           : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL empty_in_3                       : std_logic;  -- ufix1
  SIGNAL tx_en_in_3                       : std_logic;  -- ufix1
  SIGNAL tmp_61                           : std_logic;  -- ufix1
  SIGNAL iA_7                             : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL iA_8                             : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL sentTrain_2                      : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL count_4                          : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL dqLatch                          : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL tmp_62                           : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL p46_tmp                          : signed(31 DOWNTO 0);  -- int32
  SIGNAL p46_tmp_1                        : signed(31 DOWNTO 0);  -- int32
  SIGNAL p46_tmp_2                        : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL p46_tmp_3                        : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL p46_tmp_4                        : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL p46_tmp_5                        : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL p46_div_temp                     : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL p46_div_temp_1                   : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL p46_div_temp_2                   : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL p46_cast                         : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL p46_mul_temp                     : signed(48 DOWNTO 0);  -- sfix49
  SIGNAL p46_sub_cast                     : signed(31 DOWNTO 0);  -- int32
  SIGNAL p46_sub_cast_1                   : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL p46_sub_temp                     : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL p46_cast_1                       : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL p46_sub_temp_1                   : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL p46_sub_cast_2                   : signed(31 DOWNTO 0);  -- int32
  SIGNAL p46_cast_2                       : signed(8 DOWNTO 0);  -- sfix9
  SIGNAL p46_mul_temp_1                   : signed(40 DOWNTO 0);  -- sfix41
  SIGNAL p46_sub_cast_3                   : signed(31 DOWNTO 0);  -- int32
  SIGNAL p46_sub_cast_4                   : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL p46_sub_temp_2                   : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL p46_cast_3                       : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL p46_cast_4                       : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL p46_mul_temp_2                   : signed(5 DOWNTO 0);  -- sfix6
  SIGNAL p46_sub_cast_5                   : signed(4 DOWNTO 0);  -- sfix5
  SIGNAL p46_sub_temp_3                   : signed(5 DOWNTO 0);  -- sfix6
  SIGNAL p46_sub_temp_4                   : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL p46_cast_5                       : std_logic;  -- ufix1
  SIGNAL p46_sub_cast_6                   : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL p46_sub_temp_5                   : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL tmp_63                           : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL iA_9                             : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL fmo_1_re                         : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL fmo_1_im                         : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL fmo_1_re_1                       : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL fmo_1_im_1                       : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL sentTrain_3                      : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL count_5                          : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL tmp_re                           : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL tmp_im                           : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL p42_tmp                          : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL p42_tmp_1                        : signed(31 DOWNTO 0);  -- int32
  SIGNAL p42_tmp_2                        : signed(31 DOWNTO 0);  -- int32
  SIGNAL p42_tmp_3                        : signed(31 DOWNTO 0);  -- int32
  SIGNAL p42_tmp_4                        : signed(31 DOWNTO 0);  -- int32
  SIGNAL p42_tmp_5                        : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL p42_tmp_6                        : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL p42_tmp_7                        : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL p42_tmp_8                        : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL p42_tmp_9                        : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL p42_tmp_10                       : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL p42_div_temp                     : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL p42_div_temp_1                   : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL p42_div_temp_2                   : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL p42_div_temp_3                   : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL p42_cast                         : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL p42_mul_temp                     : signed(48 DOWNTO 0);  -- sfix49
  SIGNAL p42_sub_cast                     : signed(31 DOWNTO 0);  -- int32
  SIGNAL p42_sub_cast_1                   : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL p42_sub_temp                     : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL p42_cast_1                       : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL p42_sub_temp_1                   : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL p42_sub_cast_2                   : signed(31 DOWNTO 0);  -- int32
  SIGNAL p42_cast_2                       : signed(8 DOWNTO 0);  -- sfix9
  SIGNAL p42_mul_temp_1                   : signed(40 DOWNTO 0);  -- sfix41
  SIGNAL p42_sub_cast_3                   : signed(31 DOWNTO 0);  -- int32
  SIGNAL p42_sub_cast_4                   : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL p42_sub_temp_2                   : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL p42_cast_3                       : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL p42_cast_4                       : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL p42_mul_temp_2                   : signed(5 DOWNTO 0);  -- sfix6
  SIGNAL p42_sub_cast_5                   : signed(4 DOWNTO 0);  -- sfix5
  SIGNAL p42_sub_temp_3                   : signed(5 DOWNTO 0);  -- sfix6
  SIGNAL p42_sub_temp_4                   : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL p42_cast_5                       : std_logic;  -- ufix1
  SIGNAL p42_sub_cast_6                   : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL p42_sub_temp_5                   : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL p42_sub_temp_6                   : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL p42_cast_6                       : std_logic;  -- ufix1
  SIGNAL p42_sub_cast_7                   : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL p42_sub_temp_7                   : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL p42_sub_temp_8                   : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL p42_sub_cast_8                   : signed(31 DOWNTO 0);  -- int32
  SIGNAL d_b2s_re                         : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL d_b2s_im                         : signed(2 DOWNTO 0);  -- sfix3
  SIGNAL buf_re                           : vector_of_signed3(0 TO 16);  -- sfix3 [17]
  SIGNAL buf_im                           : vector_of_signed3(0 TO 16);  -- sfix3 [17]
  SIGNAL buf_re_1                         : vector_of_signed3(0 TO 16);  -- sfix3 [17]
  SIGNAL buf_im_1                         : vector_of_signed3(0 TO 16);  -- sfix3 [17]
  SIGNAL tmp_re_1                         : vector_of_signed3(0 TO 15);  -- sfix3 [16]
  SIGNAL tmp_im_1                         : vector_of_signed3(0 TO 15);  -- sfix3 [16]
  SIGNAL tmp_re_2                         : vector_of_signed3(0 TO 16);  -- sfix3 [17]
  SIGNAL tmp_im_2                         : vector_of_signed3(0 TO 16);  -- sfix3 [17]
  SIGNAL c_re_2                           : signed(21 DOWNTO 0);  -- sfix22_En14
  SIGNAL c_im_2                           : signed(21 DOWNTO 0);  -- sfix22_En14
  SIGNAL d_ssrc_re                        : signed(13 DOWNTO 0);  -- sfix14_En13
  SIGNAL d_ssrc_im                        : signed(13 DOWNTO 0);  -- sfix14_En13
  SIGNAL a0                               : signed(13 DOWNTO 0);  -- sfix14_En13
  SIGNAL c_8                              : signed(27 DOWNTO 0);  -- sfix28_En14
  SIGNAL tmp_64                           : signed(14 DOWNTO 0);  -- sfix15
  SIGNAL p18tmp_add_cast                  : signed(15 DOWNTO 0);  -- sfix16_En1
  SIGNAL p18tmp_add_temp                  : signed(15 DOWNTO 0);  -- sfix16_En1
  SIGNAL tmp_65                           : signed(14 DOWNTO 0);  -- sfix15
  SIGNAL p19tmp_sub_cast                  : signed(15 DOWNTO 0);  -- sfix16_En1
  SIGNAL p19tmp_sub_temp                  : signed(15 DOWNTO 0);  -- sfix16_En1
  SIGNAL p19tmp_cast                      : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL tmp_66                           : signed(14 DOWNTO 0);  -- sfix15
  SIGNAL p17_cast                         : signed(27 DOWNTO 0);  -- sfix28_En14
  SIGNAL i_out_1                          : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL i_out_2                          : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL a0_1                             : signed(13 DOWNTO 0);  -- sfix14_En13
  SIGNAL c_9                              : signed(27 DOWNTO 0);  -- sfix28_En14
  SIGNAL tmp_67                           : signed(14 DOWNTO 0);  -- sfix15
  SIGNAL p12tmp_add_cast                  : signed(15 DOWNTO 0);  -- sfix16_En1
  SIGNAL p12tmp_add_temp                  : signed(15 DOWNTO 0);  -- sfix16_En1
  SIGNAL tmp_68                           : signed(14 DOWNTO 0);  -- sfix15
  SIGNAL p13tmp_sub_cast                  : signed(15 DOWNTO 0);  -- sfix16_En1
  SIGNAL p13tmp_sub_temp                  : signed(15 DOWNTO 0);  -- sfix16_En1
  SIGNAL p13tmp_cast                      : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL tmp_69                           : signed(14 DOWNTO 0);  -- sfix15
  SIGNAL p11_cast                         : signed(27 DOWNTO 0);  -- sfix28_En14
  SIGNAL q_out_1                          : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL q_out_2                          : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL fmo_2                            : std_logic;  -- ufix1
  SIGNAL tmp_70                           : std_logic;  -- ufix1
  SIGNAL re_byte_b2s                      : std_logic;  -- ufix1
  SIGNAL re_byte_out_1                    : std_logic;  -- ufix1
  SIGNAL re_byte_out_2                    : std_logic;  -- ufix1
  SIGNAL tmp_71                           : std_logic;  -- ufix1
  SIGNAL tx_done_b2s                      : std_logic;  -- ufix1
  SIGNAL tx_done_out_1                    : std_logic;  -- ufix1
  SIGNAL tx_done_out_2                    : std_logic;  -- ufix1

BEGIN
  u_tx_fifo_ram : tx_fifo_ram
    PORT MAP( clk => clk,
              enb => ce,
              wr_din => std_logic_vector(tmp_33),  -- ufix8
              wr_addr => std_logic_vector(indexLogic_fixptsig),  -- ufix10
              wr_en => tx_fifo_ram_wrenb,  -- ufix1
              rd_addr => std_logic_vector(indexLogic_fixptsig_1),  -- ufix10
              rd_dout => tx_fifo  -- ufix8
              );

  c_re <= to_signed(0, 22);
  c_im <= to_signed(0, 22);

  enb <= ce;

  delayMatch_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      c_re_1 <= to_signed(0, 22);
      c_im_1 <= to_signed(0, 22);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        c_re_1 <= c_re;
        c_im_1 <= c_im;
      END IF;
    END IF;
  END PROCESS delayMatch_process;


  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  --                                                                          %
  --        Generated by MATLAB 8.0, MATLAB Coder 2.3 and HDL Coder 3.1      %
  --                                                                          %
  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  tmp_gen: FOR t_0 IN 0 TO 15 GENERATE
    tmp(t_0) <= to_signed(1 + t_0, 32);
  END GENERATE tmp_gen;


  delayMatch_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_1 <= (OTHERS => to_signed(0, 32));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_1 <= tmp;
      END IF;
    END IF;
  END PROCESS delayMatch_1_process;


  delayMatch_2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      empty_in_1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        empty_in_1 <= empty_in;
      END IF;
    END IF;
  END PROCESS delayMatch_2_process;


  delayMatch_3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tx_en_in_1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tx_en_in_1 <= tx_en_in;
      END IF;
    END IF;
  END PROCESS delayMatch_3_process;


  tmp_3 <= tmp_2 - 1;

  
  tmp_2 <= to_unsigned(8, 4) WHEN (empty_in = '0') AND (tmp_4 = 0) ELSE
      tmp_4;

  
  tmp_5 <= tmp_3 WHEN tmp_2 > 0 ELSE
      to_unsigned(0, 4);

  
  tmp_6 <= to_unsigned(0, 4) WHEN tmp_5 = 1 ELSE
      tmp_5;

  tmp_7 <= tmp_6;

  reBuf_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      reBuf <= to_unsigned(0, 4);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        reBuf <= tmp_7;
      END IF;
    END IF;
  END PROCESS reBuf_reg_process;


  
  tmp_4 <= to_unsigned(0, 4) WHEN clear_fifo_in = '1' ELSE
      reBuf;

  
  tmp_10 <= tmp_8 WHEN tmp_5 = 1 ELSE
      tmp_9;

  tmp_11 <= tmp_10;

  wrCount_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      wrCount <= to_unsigned(0, 10);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        wrCount <= tmp_11;
      END IF;
    END IF;
  END PROCESS wrCount_reg_process;


  
  tmp_9 <= to_unsigned(0, 10) WHEN clear_fifo_in = '1' ELSE
      wrCount;

  tmp_8 <= tmp_9 + 1;

  
  p49_tmp <= tmp_13 WHEN count >= 32 ELSE
      rdCount;
  
  p49_tmp_1 <= rdCount WHEN resize(sentTrain, 8) <= 89 ELSE
      p49_tmp;
  
  tmp_14 <= p49_tmp_1 WHEN ((empty_in = '1') AND (tx_en_in = '1')) AND (tmp_12 = '0') ELSE
      rdCount;

  
  tmp_15 <= tmp_8 WHEN tmp_5 = 1 ELSE
      tmp_14;

  tmp_16 <= tmp_15;

  rdCount_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rdCount <= to_unsigned(0, 10);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rdCount <= tmp_16;
      END IF;
    END IF;
  END PROCESS rdCount_reg_process;


  -- sending pad bits
  -- sending header bits
  -- Overhead bits
  -- done transmitting
  -- when transmitted all bytes
  -- get next byte
  tmp_13 <= rdCount - 1;

  --spssa
  -- current byte location of packet overhead
  -- maintain latency for tx packet
  -- maintain latency for reading from tx_fifo
  -- track bytes (read) when transmitting
  -- offset used to write to end of tx_fifo
  -- total number of bytes written
  -- decrement tx_fifo latency counter
  -- read tx_fifo buffer line (active high)
  -- initialize done sending variable
  -- initialize tx_fifo latency counter
  -- output i and q bit
  -- next bit
  tmp_17 <= sentTrain + 1;

  
  tmp_18 <= tmp_17 WHEN count_1 >= 8 ELSE
      sentTrain;

  
  p44_tmp <= tmp_18 WHEN resize(sentTrain, 8) <= 89 ELSE
      sentTrain;
  
  tmp_19 <= p44_tmp WHEN ((empty_in = '1') AND (tx_en_in = '1')) AND (tmp_12 = '0') ELSE
      sentTrain;

  
  tmp_20 <= to_unsigned(1, 7) WHEN tmp_5 = 1 ELSE
      tmp_19;

  tmp_21 <= tmp_20;

  sentTrain_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      sentTrain <= to_unsigned(0, 7);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        sentTrain <= tmp_21;
      END IF;
    END IF;
  END PROCESS sentTrain_reg_process;


  -- reset latency counter
  -- increment latency counter
  count_1 <= count_2 + 1;

  
  tmp_22 <= to_unsigned(0, 10) WHEN count_1 >= 8 ELSE
      count_1;

  
  p43_tmp <= to_unsigned(0, 10) WHEN count >= 32 ELSE
      count;
  
  p43_tmp_1 <= tmp_22 WHEN resize(sentTrain, 8) <= 89 ELSE
      p43_tmp;
  
  tmp_23 <= p43_tmp_1 WHEN ((empty_in = '1') AND (tx_en_in = '1')) AND (tmp_12 = '0') ELSE
      count_2;

  
  tmp_24 <= to_unsigned(0, 10) WHEN tmp_5 = 1 ELSE
      tmp_23;

  tmp_25 <= tmp_24;

  count_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      count_2 <= to_unsigned(0, 10);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        count_2 <= tmp_25;
      END IF;
    END IF;
  END PROCESS count_reg_process;


  -- reset symbol index
  -- reset latecny counter
  -- increment latency counter
  count <= count_2 + 1;

  
  p52_tmp <= tmp_13 WHEN count >= 32 ELSE
      rdCount;
  
  p52_tmp_1 <= '1' WHEN p52_tmp = 0 ELSE
      '0';
  
  p52_tmp_2 <= '0' WHEN resize(sentTrain, 8) <= 89 ELSE
      p52_tmp_1;
  
  tmp_26 <= p52_tmp_2 WHEN ((empty_in = '1') AND (tx_en_in = '1')) AND (tmp_12 = '0') ELSE
      tmp_12;

  
  tmp_27 <= '0' WHEN (empty_in = '0') AND (tmp_4 = 0) ELSE
      tmp_26;

  tmp_28 <= tmp_27;

  txDone_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      txDone <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        txDone <= tmp_28;
      END IF;
    END IF;
  END PROCESS txDone_reg_process;


  
  tmp_12 <= '0' WHEN clear_fifo_in = '1' ELSE
      txDone;

  delayMatch_4_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_29 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_29 <= tmp_12;
      END IF;
    END IF;
  END PROCESS delayMatch_4_process;


  -- Latency check
  iA <= resize(count_2, 16);

  delayMatch_5_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      iA_1 <= to_unsigned(0, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        iA_1 <= iA;
      END IF;
    END IF;
  END PROCESS delayMatch_5_process;


  -- next symbol index
  tmp_30 <= symIndex + 1;

  p51_div_temp <= iA / 8;
  p51_cast <= signed(resize(p51_div_temp, 17));
  -- CSD Encoding (8) : 1000; Cost (Adders) = 0
  p51_mul_temp <= resize(p51_cast & '0' & '0' & '0', 49);
  p51_sub_cast <= p51_mul_temp(31 DOWNTO 0);
  p51_sub_cast_1 <= unsigned(p51_sub_cast(15 DOWNTO 0));
  p51_sub_temp <= iA - p51_sub_cast_1;
  
  p51_cast_1 <= "1111111111" WHEN p51_sub_temp(15 DOWNTO 10) /= "000000" ELSE
      p51_sub_temp(9 DOWNTO 0);
  
  p51_tmp <= tmp_30 WHEN p51_cast_1 = 0 ELSE
      symIndex;
  
  p51_tmp_1 <= to_unsigned(0, 3) WHEN count >= 32 ELSE
      p51_tmp;
  
  p51_tmp_2 <= symIndex WHEN resize(sentTrain, 8) <= 89 ELSE
      p51_tmp_1;
  
  tmp_31 <= p51_tmp_2 WHEN ((empty_in = '1') AND (tx_en_in = '1')) AND (tmp_12 = '0') ELSE
      symIndex;

  tmp_32 <= tmp_31;

  symIndex_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      symIndex <= to_unsigned(0, 3);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        symIndex <= tmp_32;
      END IF;
    END IF;
  END PROCESS symIndex_reg_process;


  -- get next j bit
  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  --                                                                          %
  --        Generated by MATLAB 8.0, MATLAB Coder 2.3 and HDL Coder 3.1      %
  --                                                                          %
  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  -- get next i bit
  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  --                                                                          %
  --        Generated by MATLAB 8.0, MATLAB Coder 2.3 and HDL Coder 3.1      %
  --                                                                          %
  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  p73sym2_cast <= resize(symIndex & '0', 5);
  sym2 <= p73sym2_cast(2 DOWNTO 0);

  delayMatch_6_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      sym2_1 <= to_unsigned(0, 3);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        sym2_1 <= sym2;
      END IF;
    END IF;
  END PROCESS delayMatch_6_process;


  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  -- transfer data from processor to internal buffer. Because the core has a
  -- non-zero throughput we need to stale a bit for the requested data to make
  -- it to our input.
  wrIndex <= to_unsigned(1024, 11);

  data_in_unsigned <= unsigned(data_in);

  tmp_33 <= data_in_unsigned;

  
  tmp_34 <= resize(tmp_8, 11) WHEN tmp_5 = 1 ELSE
      wrIndex;

  p110tmp_sub_cast <= signed(resize(tmp_34, 32));
  tmp_35 <= p110tmp_sub_cast - 1;

  indexLogic_fixptsig <= unsigned(tmp_35(9 DOWNTO 0));

  tx_fifo_ram_wrenb <= '1';

  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  -- we are ready to transmit some data
  rdIndex <= resize(resize(resize(tmp_9, 11) - resize(rdCount, 11), 12) + 1, 10);

  
  tmp_36 <= to_unsigned(0, 10) WHEN rdIndex <= 0 ELSE
      rdIndex;

  p82tmp_sub_cast <= signed(resize(tmp_36, 32));
  tmp_37 <= p82tmp_sub_cast - 1;

  indexLogic_fixptsig_1 <= unsigned(tmp_37(9 DOWNTO 0));

  tx_fifo_unsigned <= unsigned(tx_fifo);

  data <= tx_fifo_unsigned;

  tmp_38 <= data;

  p57tmp_cast <= data & '0';
  p57tmp_cast_1 <= p57tmp_cast srl 1;
  tmp_39 <= p57tmp_cast_1(8 DOWNTO 1);

  p58tmp_cast <= data & '0' & '0';
  p58tmp_cast_1 <= p58tmp_cast srl 2;
  tmp_40 <= p58tmp_cast_1(9 DOWNTO 2);

  p59tmp_cast <= data & '0' & '0' & '0';
  p59tmp_cast_1 <= p59tmp_cast srl 3;
  tmp_41 <= p59tmp_cast_1(10 DOWNTO 3);

  p60tmp_cast <= data & '0' & '0' & '0' & '0';
  p60tmp_cast_1 <= p60tmp_cast srl 4;
  tmp_42 <= p60tmp_cast_1(11 DOWNTO 4);

  p61tmp_cast <= data & '0' & '0' & '0' & '0' & '0';
  p61tmp_cast_1 <= p61tmp_cast srl 5;
  tmp_43 <= p61tmp_cast_1(12 DOWNTO 5);

  p62tmp_cast <= data & '0' & '0' & '0' & '0' & '0' & '0';
  p62tmp_cast_1 <= p62tmp_cast srl 6;
  tmp_44 <= p62tmp_cast_1(13 DOWNTO 6);

  p63tmp_cast <= data & '0' & '0' & '0' & '0' & '0' & '0' & '0';
  p63tmp_cast_1 <= p63tmp_cast srl 7;
  tmp_45 <= p63tmp_cast_1(14 DOWNTO 7);

  p55_output : PROCESS (sym2_1, tmp_38, tmp_39, tmp_40, tmp_41, tmp_42, tmp_43, tmp_44, tmp_45)
    VARIABLE tmp46 : unsigned(7 DOWNTO 0);
    VARIABLE add_temp : unsigned(3 DOWNTO 0);
  BEGIN
    add_temp := resize(sym2_1, 4) + 1;

    CASE add_temp IS
      WHEN "0001" =>
        tmp46 := tmp_38;
      WHEN "0010" =>
        tmp46 := tmp_39;
      WHEN "0011" =>
        tmp46 := tmp_40;
      WHEN "0100" =>
        tmp46 := tmp_41;
      WHEN "0101" =>
        tmp46 := tmp_42;
      WHEN "0110" =>
        tmp46 := tmp_43;
      WHEN "0111" =>
        tmp46 := tmp_44;
      WHEN "1000" =>
        tmp46 := tmp_45;
      WHEN OTHERS => 
        tmp46 := to_unsigned(0, 8);
    END CASE;

    tmp_47 <= tmp46;
  END PROCESS p55_output;


  iA_2 <= tmp_47;

  delayMatch_7_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      sym2_2 <= to_unsigned(0, 3);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        sym2_2 <= sym2;
      END IF;
    END IF;
  END PROCESS delayMatch_7_process;


  a <= data;

  c <= a;

  tmp_48 <= c;

  a_1 <= data & '0';

  c_1 <= a_1 srl 1;

  tmp_49 <= c_1(8 DOWNTO 1);

  a_2 <= data & '0' & '0';

  c_2 <= a_2 srl 2;

  tmp_50 <= c_2(9 DOWNTO 2);

  a_3 <= data & '0' & '0' & '0';

  c_3 <= a_3 srl 3;

  tmp_51 <= c_3(10 DOWNTO 3);

  a_4 <= data & '0' & '0' & '0' & '0';

  c_4 <= a_4 srl 4;

  tmp_52 <= c_4(11 DOWNTO 4);

  a_5 <= data & '0' & '0' & '0' & '0' & '0';

  c_5 <= a_5 srl 5;

  tmp_53 <= c_5(12 DOWNTO 5);

  a_6 <= data & '0' & '0' & '0' & '0' & '0' & '0';

  c_6 <= a_6 srl 6;

  tmp_54 <= c_6(13 DOWNTO 6);

  a_7 <= data & '0' & '0' & '0' & '0' & '0' & '0' & '0';

  c_7 <= a_7 srl 7;

  tmp_55 <= c_7(14 DOWNTO 7);

  p65_output : PROCESS (sym2_2, tmp_48, tmp_49, tmp_50, tmp_51, tmp_52, tmp_53, tmp_54, tmp_55)
    VARIABLE tmp56 : unsigned(7 DOWNTO 0);
    VARIABLE add_temp1 : unsigned(3 DOWNTO 0);
  BEGIN
    add_temp1 := resize(sym2_2, 4) + 2;

    CASE add_temp1 IS
      WHEN "0001" =>
        tmp56 := tmp_48;
      WHEN "0010" =>
        tmp56 := tmp_49;
      WHEN "0011" =>
        tmp56 := tmp_50;
      WHEN "0100" =>
        tmp56 := tmp_51;
      WHEN "0101" =>
        tmp56 := tmp_52;
      WHEN "0110" =>
        tmp56 := tmp_53;
      WHEN "0111" =>
        tmp56 := tmp_54;
      WHEN "1000" =>
        tmp56 := tmp_55;
      WHEN OTHERS => 
        tmp56 := to_unsigned(0, 8);
    END CASE;

    tmp_57 <= tmp56;
  END PROCESS p65_output;


  iA_3 <= tmp_57;

  delayMatch_8_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      empty_in_2 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        empty_in_2 <= empty_in;
      END IF;
    END IF;
  END PROCESS delayMatch_8_process;


  delayMatch_9_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tx_en_in_2 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tx_en_in_2 <= tx_en_in;
      END IF;
    END IF;
  END PROCESS delayMatch_9_process;


  delayMatch_10_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_58 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_58 <= tmp_12;
      END IF;
    END IF;
  END PROCESS delayMatch_10_process;


  delayMatch_11_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      iA_4 <= to_unsigned(0, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        iA_4 <= iA;
      END IF;
    END IF;
  END PROCESS delayMatch_11_process;


  iA_5 <= resize(sentTrain, 8);

  delayMatch_12_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      iA_6 <= to_unsigned(0, 8);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        iA_6 <= iA_5;
      END IF;
    END IF;
  END PROCESS delayMatch_12_process;


  delayMatch_13_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      sentTrain_1 <= to_unsigned(0, 7);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        sentTrain_1 <= sentTrain;
      END IF;
    END IF;
  END PROCESS delayMatch_13_process;


  delayMatch_14_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      count_3 <= to_unsigned(0, 10);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        count_3 <= count_2;
      END IF;
    END IF;
  END PROCESS delayMatch_14_process;


  p48_div_temp_2 <= iA_6 / 2;
  p48_cast_2 <= signed(resize(p48_div_temp_2, 9));
  -- CSD Encoding (2) : 10; Cost (Adders) = 0
  p48_mul_temp_1 <= resize(p48_cast_2 & '0', 41);
  p48_sub_cast_3 <= p48_mul_temp_1(31 DOWNTO 0);
  p48_sub_cast_4 <= unsigned(p48_sub_cast_3(7 DOWNTO 0));
  p48_sub_temp_2 <= iA_6 - p48_sub_cast_4;
  
  p48_cast_3 <= "1111111" WHEN p48_sub_temp_2(7) /= '0' ELSE
      p48_sub_temp_2(6 DOWNTO 0);
  p48_cast_4 <= signed(p48_cast_3(2 DOWNTO 0));
  -- CSD Encoding (2) : 10; Cost (Adders) = 0
  p48_mul_temp_2 <= resize(p48_cast_4 & '0', 6);
  p48_sub_cast_5 <= p48_mul_temp_2(4 DOWNTO 0);
  p48_sub_temp_3 <= resize(p48_sub_cast_5, 6) - 1;
  p48_sub_temp_1 <= resize(sentTrain_1, 8) - 24;
  p48_sub_cast_2 <= signed(resize(p48_sub_temp_1, 32));
  p48_tmp <= p48_sub_cast_2 - 1;
  
  p48_tmp_1 <= to_signed(0, 32) WHEN p48_tmp < 0 ELSE
      p48_tmp;
  
  p48_tmp_2 <= tbi(to_integer(p48_tmp_1)) WHEN count_3 = 0 ELSE
      diLatch;
  
  p48_tmp_3 <= p48_sub_temp_3(2 DOWNTO 0) WHEN (count_3 = 0) AND (sentTrain_1 <= 24) ELSE
      p48_tmp_2;
  p48_div_temp <= iA_4 / 8;
  p48_cast <= signed(resize(p48_div_temp, 17));
  -- CSD Encoding (8) : 1000; Cost (Adders) = 0
  p48_mul_temp <= resize(p48_cast & '0' & '0' & '0', 49);
  p48_sub_cast <= p48_mul_temp(31 DOWNTO 0);
  p48_sub_cast_1 <= unsigned(p48_sub_cast(15 DOWNTO 0));
  p48_sub_temp <= iA_4 - p48_sub_cast_1;
  
  p48_cast_1 <= "1111111111" WHEN p48_sub_temp(15 DOWNTO 10) /= "000000" ELSE
      p48_sub_temp(9 DOWNTO 0);
  p48_div_temp_1 <= iA_2 / 2;
  p48_sub_temp_4 <= iA_2 - resize(p48_div_temp_1 * 2, 8);
  p48_cast_5 <= p48_sub_temp_4(0);
  
  p48_sub_cast_6 <= to_unsigned(2, 4) WHEN p48_cast_5 = '1' ELSE
      to_unsigned(0, 4);
  p48_sub_temp_5 <= p48_sub_cast_6 - 1;
  
  p48_tmp_4 <= signed(p48_sub_temp_5(2 DOWNTO 0)) WHEN p48_cast_1 = 0 ELSE
      diLatch;
  
  p48_tmp_5 <= p48_tmp_3 WHEN resize(sentTrain_1, 8) <= 89 ELSE
      p48_tmp_4;
  
  tmp_59 <= p48_tmp_5 WHEN ((empty_in_2 = '1') AND (tx_en_in_2 = '1')) AND (tmp_58 = '0') ELSE
      diLatch;

  tmp_60 <= tmp_59;

  diLatch_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      diLatch <= to_signed(0, 3);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        diLatch <= tmp_60;
      END IF;
    END IF;
  END PROCESS diLatch_reg_process;


  delayMatch_15_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      empty_in_3 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        empty_in_3 <= empty_in;
      END IF;
    END IF;
  END PROCESS delayMatch_15_process;


  delayMatch_16_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tx_en_in_3 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tx_en_in_3 <= tx_en_in;
      END IF;
    END IF;
  END PROCESS delayMatch_16_process;


  delayMatch_17_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_61 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_61 <= tmp_12;
      END IF;
    END IF;
  END PROCESS delayMatch_17_process;


  delayMatch_18_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      iA_7 <= to_unsigned(0, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        iA_7 <= iA;
      END IF;
    END IF;
  END PROCESS delayMatch_18_process;


  delayMatch_19_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      iA_8 <= to_unsigned(0, 8);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        iA_8 <= iA_5;
      END IF;
    END IF;
  END PROCESS delayMatch_19_process;


  delayMatch_20_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      sentTrain_2 <= to_unsigned(0, 7);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        sentTrain_2 <= sentTrain;
      END IF;
    END IF;
  END PROCESS delayMatch_20_process;


  delayMatch_21_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      count_4 <= to_unsigned(0, 10);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        count_4 <= count_2;
      END IF;
    END IF;
  END PROCESS delayMatch_21_process;


  p46_div_temp_2 <= iA_8 / 2;
  p46_cast_2 <= signed(resize(p46_div_temp_2, 9));
  -- CSD Encoding (2) : 10; Cost (Adders) = 0
  p46_mul_temp_1 <= resize(p46_cast_2 & '0', 41);
  p46_sub_cast_3 <= p46_mul_temp_1(31 DOWNTO 0);
  p46_sub_cast_4 <= unsigned(p46_sub_cast_3(7 DOWNTO 0));
  p46_sub_temp_2 <= iA_8 - p46_sub_cast_4;
  
  p46_cast_3 <= "1111111" WHEN p46_sub_temp_2(7) /= '0' ELSE
      p46_sub_temp_2(6 DOWNTO 0);
  p46_cast_4 <= signed(p46_cast_3(2 DOWNTO 0));
  -- CSD Encoding (2) : 10; Cost (Adders) = 0
  p46_mul_temp_2 <= resize(p46_cast_4 & '0', 6);
  p46_sub_cast_5 <= p46_mul_temp_2(4 DOWNTO 0);
  p46_sub_temp_3 <= resize(p46_sub_cast_5, 6) - 1;
  p46_sub_temp_1 <= resize(sentTrain_2, 8) - 24;
  p46_sub_cast_2 <= signed(resize(p46_sub_temp_1, 32));
  p46_tmp <= p46_sub_cast_2 - 1;
  
  p46_tmp_1 <= to_signed(0, 32) WHEN p46_tmp < 0 ELSE
      p46_tmp;
  
  p46_tmp_2 <= tbq(to_integer(p46_tmp_1)) WHEN count_4 = 0 ELSE
      dqLatch;
  
  p46_tmp_3 <= p46_sub_temp_3(2 DOWNTO 0) WHEN (count_4 = 0) AND (sentTrain_2 <= 24) ELSE
      p46_tmp_2;
  p46_div_temp <= iA_7 / 8;
  p46_cast <= signed(resize(p46_div_temp, 17));
  -- CSD Encoding (8) : 1000; Cost (Adders) = 0
  p46_mul_temp <= resize(p46_cast & '0' & '0' & '0', 49);
  p46_sub_cast <= p46_mul_temp(31 DOWNTO 0);
  p46_sub_cast_1 <= unsigned(p46_sub_cast(15 DOWNTO 0));
  p46_sub_temp <= iA_7 - p46_sub_cast_1;
  
  p46_cast_1 <= "1111111111" WHEN p46_sub_temp(15 DOWNTO 10) /= "000000" ELSE
      p46_sub_temp(9 DOWNTO 0);
  p46_div_temp_1 <= iA_3 / 2;
  p46_sub_temp_4 <= iA_3 - resize(p46_div_temp_1 * 2, 8);
  p46_cast_5 <= p46_sub_temp_4(0);
  
  p46_sub_cast_6 <= to_unsigned(2, 4) WHEN p46_cast_5 = '1' ELSE
      to_unsigned(0, 4);
  p46_sub_temp_5 <= p46_sub_cast_6 - 1;
  
  p46_tmp_4 <= signed(p46_sub_temp_5(2 DOWNTO 0)) WHEN p46_cast_1 = 0 ELSE
      dqLatch;
  
  p46_tmp_5 <= p46_tmp_3 WHEN resize(sentTrain_2, 8) <= 89 ELSE
      p46_tmp_4;
  
  tmp_62 <= p46_tmp_5 WHEN ((empty_in_3 = '1') AND (tx_en_in_3 = '1')) AND (tmp_61 = '0') ELSE
      dqLatch;

  tmp_63 <= tmp_62;

  dqLatch_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dqLatch <= to_signed(0, 3);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        dqLatch <= tmp_63;
      END IF;
    END IF;
  END PROCESS dqLatch_reg_process;


  delayMatch_22_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      iA_9 <= to_unsigned(0, 8);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        iA_9 <= iA_5;
      END IF;
    END IF;
  END PROCESS delayMatch_22_process;


  -- get next byte of data
  fmo_1_re <= to_signed(0, 3);
  fmo_1_im <= to_signed(0, 3);

  delayMatch_23_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      fmo_1_re_1 <= to_signed(0, 3);
      fmo_1_im_1 <= to_signed(0, 3);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        fmo_1_re_1 <= fmo_1_re;
        fmo_1_im_1 <= fmo_1_im;
      END IF;
    END IF;
  END PROCESS delayMatch_23_process;


  delayMatch_24_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      sentTrain_3 <= to_unsigned(0, 7);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        sentTrain_3 <= sentTrain;
      END IF;
    END IF;
  END PROCESS delayMatch_24_process;


  delayMatch_25_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      count_5 <= to_unsigned(0, 10);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        count_5 <= count_2;
      END IF;
    END IF;
  END PROCESS delayMatch_25_process;


  p42_div_temp_2 <= iA_9 / 2;
  p42_cast_2 <= signed(resize(p42_div_temp_2, 9));
  -- CSD Encoding (2) : 10; Cost (Adders) = 0
  p42_mul_temp_1 <= resize(p42_cast_2 & '0', 41);
  p42_sub_cast_3 <= p42_mul_temp_1(31 DOWNTO 0);
  p42_sub_cast_4 <= unsigned(p42_sub_cast_3(7 DOWNTO 0));
  p42_sub_temp_2 <= iA_9 - p42_sub_cast_4;
  
  p42_cast_3 <= "1111111" WHEN p42_sub_temp_2(7) /= '0' ELSE
      p42_sub_temp_2(6 DOWNTO 0);
  p42_cast_4 <= signed(p42_cast_3(2 DOWNTO 0));
  -- CSD Encoding (2) : 10; Cost (Adders) = 0
  p42_mul_temp_2 <= resize(p42_cast_4 & '0', 6);
  p42_sub_cast_5 <= p42_mul_temp_2(4 DOWNTO 0);
  p42_sub_temp_3 <= resize(p42_sub_cast_5, 6) - 1;
  p42_tmp <= p42_sub_temp_3(2 DOWNTO 0);
  p42_sub_temp_1 <= resize(sentTrain_3, 8) - 24;
  p42_sub_cast_2 <= signed(resize(p42_sub_temp_1, 32));
  p42_tmp_1 <= p42_sub_cast_2 - 1;
  
  p42_tmp_2 <= to_signed(0, 32) WHEN p42_tmp_1 < 0 ELSE
      p42_tmp_1;
  p42_sub_temp_8 <= resize(sentTrain_3, 8) - 24;
  p42_sub_cast_8 <= signed(resize(p42_sub_temp_8, 32));
  p42_tmp_3 <= p42_sub_cast_8 - 1;
  
  p42_tmp_4 <= to_signed(0, 32) WHEN p42_tmp_3 < 0 ELSE
      p42_tmp_3;
  
  p42_tmp_6 <= tbq_2(to_integer(p42_tmp_4)) WHEN count_5 = 0 ELSE
      dqLatch;
  
  p42_tmp_5 <= tbi_2(to_integer(p42_tmp_2)) WHEN count_5 = 0 ELSE
      diLatch;
  p42_div_temp <= iA_1 / 8;
  p42_cast <= signed(resize(p42_div_temp, 17));
  -- CSD Encoding (8) : 1000; Cost (Adders) = 0
  p42_mul_temp <= resize(p42_cast & '0' & '0' & '0', 49);
  p42_sub_cast <= p42_mul_temp(31 DOWNTO 0);
  p42_sub_cast_1 <= unsigned(p42_sub_cast(15 DOWNTO 0));
  p42_sub_temp <= iA_1 - p42_sub_cast_1;
  
  p42_cast_1 <= "1111111111" WHEN p42_sub_temp(15 DOWNTO 10) /= "000000" ELSE
      p42_sub_temp(9 DOWNTO 0);
  p42_div_temp_1 <= iA_3 / 2;
  p42_sub_temp_4 <= iA_3 - resize(p42_div_temp_1 * 2, 8);
  p42_cast_5 <= p42_sub_temp_4(0);
  
  p42_sub_cast_6 <= to_unsigned(2, 4) WHEN p42_cast_5 = '1' ELSE
      to_unsigned(0, 4);
  p42_sub_temp_5 <= p42_sub_cast_6 - 1;
  p42_div_temp_3 <= iA_2 / 2;
  p42_sub_temp_6 <= iA_2 - resize(p42_div_temp_3 * 2, 8);
  p42_cast_6 <= p42_sub_temp_6(0);
  
  p42_sub_cast_7 <= to_unsigned(2, 4) WHEN p42_cast_6 = '1' ELSE
      to_unsigned(0, 4);
  p42_sub_temp_7 <= p42_sub_cast_7 - 1;
  
  p42_tmp_8 <= signed(p42_sub_temp_5(2 DOWNTO 0)) WHEN p42_cast_1 = 0 ELSE
      dqLatch;
  
  p42_tmp_7 <= signed(p42_sub_temp_7(2 DOWNTO 0)) WHEN p42_cast_1 = 0 ELSE
      diLatch;
  
  p42_tmp_10 <= p42_tmp WHEN (resize(sentTrain_3, 8) <= 89) AND ((count_5 = 0) AND (sentTrain_3 <= 24)) ELSE
      p42_tmp_6 WHEN resize(sentTrain_3, 8) <= 89 ELSE
      p42_tmp_8;
  
  p42_tmp_9 <= p42_tmp WHEN (resize(sentTrain_3, 8) <= 89) AND ((count_5 = 0) AND (sentTrain_3 <= 24)) ELSE
      p42_tmp_5 WHEN resize(sentTrain_3, 8) <= 89 ELSE
      p42_tmp_7;
  
  tmp_re <= p42_tmp_9 WHEN ((empty_in_1 = '1') AND (tx_en_in_1 = '1')) AND (tmp_29 = '0') ELSE
      fmo_1_re_1;
  
  tmp_im <= p42_tmp_10 WHEN ((empty_in_1 = '1') AND (tx_en_in_1 = '1')) AND (tmp_29 = '0') ELSE
      fmo_1_im_1;

  d_b2s_re <= tmp_re;
  d_b2s_im <= tmp_im;

  buf_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      buf_re_1 <= (OTHERS => to_signed(0, 3));
      buf_im_1 <= (OTHERS => to_signed(0, 3));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        buf_re_1 <= buf_re;
        buf_im_1 <= buf_im;
      END IF;
    END IF;
  END PROCESS buf_reg_process;



  tmp_im_1_gen: FOR t_01 IN 0 TO 15 GENERATE
    tmp_re_1(t_01) <= buf_re_1(to_integer(tmp_1(t_01)));
    tmp_im_1(t_01) <= buf_im_1(to_integer(tmp_1(t_01)));
  END GENERATE tmp_im_1_gen;


  tmp_re_2(0 TO 15) <= tmp_re_1(0 TO 15);
  tmp_im_2(0 TO 15) <= tmp_im_1(0 TO 15);
  tmp_re_2(16) <= d_b2s_re;
  tmp_im_2(16) <= d_b2s_im;

  buf_re <= tmp_re_2;
  buf_im <= tmp_im_2;

  p23_output : PROCESS (c_re_1, c_im_1, buf_re, buf_im)
    VARIABLE tmp_im1 : signed(21 DOWNTO 0);
    VARIABLE c_im1 : signed(21 DOWNTO 0);
    VARIABLE tmp_re1 : signed(21 DOWNTO 0);
    VARIABLE c_re1 : signed(21 DOWNTO 0);
    VARIABLE tmp_re_0 : signed(21 DOWNTO 0);
    VARIABLE tmp_im_0 : signed(21 DOWNTO 0);
    VARIABLE add_cast : vector_of_signed23(0 TO 16);
    VARIABLE mul_temp : vector_of_signed17(0 TO 16);
    VARIABLE add_cast_0 : vector_of_signed23(0 TO 16);
    VARIABLE add_temp2 : vector_of_signed23(0 TO 16);
    VARIABLE add_cast_1 : vector_of_signed23(0 TO 16);
    VARIABLE mul_temp_0 : vector_of_signed17(0 TO 16);
    VARIABLE add_cast_2 : vector_of_signed23(0 TO 16);
    VARIABLE add_temp_0 : vector_of_signed23(0 TO 16);
  BEGIN
    c_re1 := c_re_1;
    tmp_re1 := c_re_1;
    c_im1 := c_im_1;
    tmp_im1 := c_im_1;

    FOR k IN 0 TO 16 LOOP
      add_cast(k) := resize(tmp_re1, 23);
      mul_temp(k) := buf_re(k) * nc(k);
      add_cast_0(k) := resize(mul_temp(k), 23);
      add_temp2(k) := add_cast(k) + add_cast_0(k);
      tmp_re_0 := add_temp2(k)(21 DOWNTO 0);
      add_cast_1(k) := resize(tmp_im1, 23);
      mul_temp_0(k) := buf_im(k) * nc(k);
      add_cast_2(k) := resize(mul_temp_0(k), 23);
      add_temp_0(k) := add_cast_1(k) + add_cast_2(k);
      tmp_im_0 := add_temp_0(k)(21 DOWNTO 0);
      c_re1 := tmp_re_0;
      tmp_re1 := tmp_re_0;
      c_im1 := tmp_im_0;
      tmp_im1 := tmp_im_0;
    END LOOP;

    c_re_2 <= c_re1;
    c_im_2 <= c_im1;
  END PROCESS p23_output;


  d_ssrc_re <= c_re_2(14 DOWNTO 1);
  d_ssrc_im <= c_im_2(14 DOWNTO 1);

  -- make i/q discrete ports and scale to the full 12-bit range of the DAC
  -- (one bit is for sign)
  a0 <= d_ssrc_re;

  c_8 <= resize(a0 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 28);

  p18tmp_add_cast <= resize(c_8(27 DOWNTO 13), 16);
  p18tmp_add_temp <= p18tmp_add_cast + 1;
  tmp_64 <= p18tmp_add_temp(15 DOWNTO 1);

  p19tmp_sub_cast <= (resize(c_8(27 DOWNTO 13), 16)) + ('0' & (c_8(12) OR c_8(11) OR c_8(10) OR c_8(9) OR c_8(8) OR c_8(7) OR c_8(6) OR c_8(5) OR c_8(4) OR c_8(3) OR c_8(2) OR c_8(1) OR c_8(0)));
  p19tmp_sub_temp <= p19tmp_sub_cast - 1;
  p19tmp_cast <= (resize(p19tmp_sub_temp(15 DOWNTO 1), 16)) + ('0' & p19tmp_sub_temp(0));
  tmp_65 <= p19tmp_cast(14 DOWNTO 0);

  p17_cast <= resize(a0 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 28);
  
  tmp_66 <= tmp_65 WHEN p17_cast < 0 ELSE
      tmp_64;

  i_out_1 <= tmp_66(11 DOWNTO 0);

  i_out_2 <= i_out_1;

  i_out <= std_logic_vector(i_out_2);

  a0_1 <= d_ssrc_im;

  c_9 <= resize(a0_1 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 28);

  p12tmp_add_cast <= resize(c_9(27 DOWNTO 13), 16);
  p12tmp_add_temp <= p12tmp_add_cast + 1;
  tmp_67 <= p12tmp_add_temp(15 DOWNTO 1);

  p13tmp_sub_cast <= (resize(c_9(27 DOWNTO 13), 16)) + ('0' & (c_9(12) OR c_9(11) OR c_9(10) OR c_9(9) OR c_9(8) OR c_9(7) OR c_9(6) OR c_9(5) OR c_9(4) OR c_9(3) OR c_9(2) OR c_9(1) OR c_9(0)));
  p13tmp_sub_temp <= p13tmp_sub_cast - 1;
  p13tmp_cast <= (resize(p13tmp_sub_temp(15 DOWNTO 1), 16)) + ('0' & p13tmp_sub_temp(0));
  tmp_68 <= p13tmp_cast(14 DOWNTO 0);

  p11_cast <= resize(a0_1 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 28);
  
  tmp_69 <= tmp_68 WHEN p11_cast < 0 ELSE
      tmp_67;

  q_out_1 <= tmp_69(11 DOWNTO 0);

  q_out_2 <= q_out_1;

  q_out <= std_logic_vector(q_out_2);

  fmo_2 <= '0';

  
  tmp_70 <= '1' WHEN (empty_in = '0') AND (tmp_4 = 0) ELSE
      fmo_2;

  re_byte_b2s <= tmp_70;

  re_byte_out_1 <= re_byte_b2s;

  re_byte_out_2 <= re_byte_out_1;

  delayMatch_26_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      re_byte_out <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        re_byte_out <= re_byte_out_2;
      END IF;
    END IF;
  END PROCESS delayMatch_26_process;


  tmp_71 <= tmp_28;

  tx_done_b2s <= tmp_71;

  tx_done_out_1 <= tx_done_b2s;

  tx_done_out_2 <= tx_done_out_1;

  delayMatch_27_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tx_done_out <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tx_done_out <= tx_done_out_2;
      END IF;
    END IF;
  END PROCESS delayMatch_27_process;


  ce_out <= ce;

END rtl;


-------------------------------------------------------------------
-- System Generator version 14.2 VHDL source file.
--
-- Copyright(C) 2012 by Xilinx, Inc.  All rights reserved.  This
-- text/file contains proprietary, confidential information of Xilinx,
-- Inc., is distributed under license from Xilinx, Inc., and may be used,
-- copied and/or disclosed only pursuant to the terms of a valid license
-- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
-- this text/file solely for design, simulation, implementation and
-- creation of design files limited to Xilinx devices or technologies.
-- Use with non-Xilinx devices or technologies is expressly prohibited
-- and immediately terminates your license unless covered by a separate
-- agreement.
--
-- Xilinx is providing this design, code, or information "as is" solely
-- for use in developing programs and solutions for Xilinx devices.  By
-- providing this design, code, or information as one possible
-- implementation of this feature, application or standard, Xilinx is
-- making no representation that this implementation is free from any
-- claims of infringement.  You are responsible for obtaining any rights
-- you may require for your implementation.  Xilinx expressly disclaims
-- any warranty whatsoever with respect to the adequacy of the
-- implementation, including but not limited to warranties of
-- merchantability or fitness for a particular purpose.
--
-- Xilinx products are not intended for use in life support appliances,
-- devices, or systems.  Use in such applications is expressly prohibited.
--
-- Any modifications that are made to the source code are done at the user's
-- sole risk and will be unsupported.
--
-- This copyright and support notice must be retained as part of this
-- text at all times.  (c) Copyright 1995-2012 Xilinx, Inc.  All rights
-- reserved.
-------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity xlchipscope is
    port (
	trig0 : in std_logic_vector(1-1 downto 0);
	trig1 : in std_logic_vector(1-1 downto 0);
	trig2 : in std_logic_vector(1-1 downto 0);
	trig3 : in std_logic_vector(8-1 downto 0);
	trig4 : in std_logic_vector(12-1 downto 0);
	trig5 : in std_logic_vector(12-1 downto 0);
	trig6 : in std_logic_vector(1-1 downto 0);
	trig7 : in std_logic_vector(1-1 downto 0);


          ce       : in std_logic;
          clr      : in std_logic;
          clk      : in std_logic);
end xlchipscope;
architecture behavior of xlchipscope is
    attribute syn_noprune : boolean;
    attribute syn_black_box : boolean;
    attribute box_type : string;
    attribute syn_noprune of behavior : architecture is true;
    signal data     : std_logic_vector (37-1 downto 0);
    signal control  : std_logic_vector (35 downto 0);
    component ila_1_05_a_57bd433ceaa521ba
    port (control     : inout std_logic_vector(35 downto 0);
	trig0 : in std_logic_vector(1-1 downto 0);
	trig1 : in std_logic_vector(1-1 downto 0);
	trig2 : in std_logic_vector(1-1 downto 0);
	trig3 : in std_logic_vector(8-1 downto 0);
	trig4 : in std_logic_vector(12-1 downto 0);
	trig5 : in std_logic_vector(12-1 downto 0);
	trig6 : in std_logic_vector(1-1 downto 0);
	trig7 : in std_logic_vector(1-1 downto 0);

          clk         : in    std_logic
    );
    end component;
    attribute syn_black_box of ila_1_05_a_57bd433ceaa521ba : component is TRUE;
    attribute box_type of ila_1_05_a_57bd433ceaa521ba : component  is "black_box";
    attribute syn_noprune of ila_1_05_a_57bd433ceaa521ba : component is TRUE;
    component icon_1_06_a_69d945462da1db7c
    port (control0    :  inout std_logic_vector(35 downto 0)
    );
    end component;
    attribute syn_black_box of icon_1_06_a_69d945462da1db7c : component is TRUE;
    attribute box_type of icon_1_06_a_69d945462da1db7c : component  is "black_box";
    attribute syn_noprune of icon_1_06_a_69d945462da1db7c : component is TRUE;

begin

 i_ila : ila_1_05_a_57bd433ceaa521ba
    port map
    (   control   => control,
        trig0     => trig0,
        trig1     => trig1,
        trig2     => trig2,
        trig3     => trig3,
        trig4     => trig4,
        trig5     => trig5,
        trig6     => trig6,
        trig7     => trig7,
        clk       => clk
    );
  i_icon_for_syn : icon_1_06_a_69d945462da1db7c
    port map
    (
      control0   => control
    );
end architecture behavior;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.conv_pkg.all;

entity constant_963ed6358a is
  port (
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end constant_963ed6358a;


architecture behavior of constant_963ed6358a is
begin
  op <= "0";
end behavior;


-------------------------------------------------------------------
-- System Generator version 14.2 VHDL source file.
--
-- Copyright(C) 2012 by Xilinx, Inc.  All rights reserved.  This
-- text/file contains proprietary, confidential information of Xilinx,
-- Inc., is distributed under license from Xilinx, Inc., and may be used,
-- copied and/or disclosed only pursuant to the terms of a valid license
-- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
-- this text/file solely for design, simulation, implementation and
-- creation of design files limited to Xilinx devices or technologies.
-- Use with non-Xilinx devices or technologies is expressly prohibited
-- and immediately terminates your license unless covered by a separate
-- agreement.
--
-- Xilinx is providing this design, code, or information "as is" solely
-- for use in developing programs and solutions for Xilinx devices.  By
-- providing this design, code, or information as one possible
-- implementation of this feature, application or standard, Xilinx is
-- making no representation that this implementation is free from any
-- claims of infringement.  You are responsible for obtaining any rights
-- you may require for your implementation.  Xilinx expressly disclaims
-- any warranty whatsoever with respect to the adequacy of the
-- implementation, including but not limited to warranties of
-- merchantability or fitness for a particular purpose.
--
-- Xilinx products are not intended for use in life support appliances,
-- devices, or systems.  Use in such applications is expressly prohibited.
--
-- Any modifications that are made to the source code are done at the user's
-- sole risk and will be unsupported.
--
-- This copyright and support notice must be retained as part of this
-- text at all times.  (c) Copyright 1995-2012 Xilinx, Inc.  All rights
-- reserved.
-------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;
entity convert_func_call is
    generic (
        din_width    : integer := 16;
        din_bin_pt   : integer := 4;
        din_arith    : integer := xlUnsigned;
        dout_width   : integer := 8;
        dout_bin_pt  : integer := 2;
        dout_arith   : integer := xlUnsigned;
        quantization : integer := xlTruncate;
        overflow     : integer := xlWrap);
    port (
        din : in std_logic_vector (din_width-1 downto 0);
        result : out std_logic_vector (dout_width-1 downto 0));
end convert_func_call;
architecture behavior of convert_func_call is
begin
    result <= convert_type(din, din_width, din_bin_pt, din_arith,
                           dout_width, dout_bin_pt, dout_arith,
                           quantization, overflow);
end behavior;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;
entity xlconvert is
    generic (
        din_width    : integer := 16;
        din_bin_pt   : integer := 4;
        din_arith    : integer := xlUnsigned;
        dout_width   : integer := 8;
        dout_bin_pt  : integer := 2;
        dout_arith   : integer := xlUnsigned;
        en_width     : integer := 1;
        en_bin_pt    : integer := 0;
        en_arith     : integer := xlUnsigned;
        bool_conversion : integer :=0;
        latency      : integer := 0;
        quantization : integer := xlTruncate;
        overflow     : integer := xlWrap);
    port (
        din : in std_logic_vector (din_width-1 downto 0);
        en  : in std_logic_vector (en_width-1 downto 0);
        ce  : in std_logic;
        clr : in std_logic;
        clk : in std_logic;
        dout : out std_logic_vector (dout_width-1 downto 0));
end xlconvert;
architecture behavior of xlconvert is
    component synth_reg
        generic (width       : integer;
                 latency     : integer);
        port (i       : in std_logic_vector(width-1 downto 0);
              ce      : in std_logic;
              clr     : in std_logic;
              clk     : in std_logic;
              o       : out std_logic_vector(width-1 downto 0));
    end component;
    component convert_func_call
        generic (
            din_width    : integer := 16;
            din_bin_pt   : integer := 4;
            din_arith    : integer := xlUnsigned;
            dout_width   : integer := 8;
            dout_bin_pt  : integer := 2;
            dout_arith   : integer := xlUnsigned;
            quantization : integer := xlTruncate;
            overflow     : integer := xlWrap);
        port (
            din : in std_logic_vector (din_width-1 downto 0);
            result : out std_logic_vector (dout_width-1 downto 0));
    end component;
    -- synopsys translate_off
    -- synopsys translate_on
    signal result : std_logic_vector(dout_width-1 downto 0);
    signal internal_ce : std_logic;
begin
    -- synopsys translate_off
    -- synopsys translate_on
    internal_ce <= ce and en(0);

    bool_conversion_generate : if (bool_conversion = 1)
    generate
      result <= din;
    end generate;
    std_conversion_generate : if (bool_conversion = 0)
    generate
      convert : convert_func_call
        generic map (
          din_width   => din_width,
          din_bin_pt  => din_bin_pt,
          din_arith   => din_arith,
          dout_width  => dout_width,
          dout_bin_pt => dout_bin_pt,
          dout_arith  => dout_arith,
          quantization => quantization,
          overflow     => overflow)
        port map (
          din => din,
          result => result);
    end generate;
    latency_test : if (latency > 0) generate
        reg : synth_reg
            generic map (
              width => dout_width,
              latency => latency
            )
            port map (
              i => result,
              ce => internal_ce,
              clr => clr,
              clk => clk,
              o => dout
            );
    end generate;
    latency0 : if (latency = 0)
    generate
        dout <= result;
    end generate latency0;
end  behavior;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.conv_pkg.all;

entity counter_8ec3f4ab23 is
  port (
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end counter_8ec3f4ab23;


architecture behavior of counter_8ec3f4ab23 is
  signal count_reg_20_23: unsigned((1 - 1) downto 0) := "0";
begin
  proc_count_reg_20_23: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        count_reg_20_23 <= count_reg_20_23 + std_logic_vector_to_unsigned("1");
      end if;
    end if;
  end process proc_count_reg_20_23;
  op <= unsigned_to_std_logic_vector(count_reg_20_23);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "tx/EDK Processor"

entity edk_processor_entity_aef01d5267 is
  port (
    axi_aresetn: in std_logic; 
    from_register: in std_logic; 
    plb_ce_1: in std_logic; 
    plb_clk_1: in std_logic; 
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
    to_fifo: in std_logic; 
    to_fifo_x0: in std_logic; 
    to_register: in std_logic; 
    to_register1: in std_logic; 
    memmap_x0: out std_logic; 
    memmap_x1: out std_logic; 
    memmap_x10: out std_logic; 
    memmap_x11: out std_logic; 
    memmap_x12: out std_logic; 
    memmap_x13: out std_logic; 
    memmap_x14: out std_logic; 
    memmap_x15: out std_logic_vector(7 downto 0); 
    memmap_x16: out std_logic; 
    memmap_x2: out std_logic_vector(7 downto 0); 
    memmap_x3: out std_logic_vector(1 downto 0); 
    memmap_x4: out std_logic; 
    memmap_x5: out std_logic_vector(31 downto 0); 
    memmap_x6: out std_logic_vector(7 downto 0); 
    memmap_x7: out std_logic; 
    memmap_x8: out std_logic_vector(1 downto 0); 
    memmap_x9: out std_logic
  );
end edk_processor_entity_aef01d5267;

architecture structural of edk_processor_entity_aef01d5267 is
  signal axi_aresetn_net_x0: std_logic;
  signal from_register_data_out_net_x0: std_logic;
  signal memmap_s_axi_arready_net_x0: std_logic;
  signal memmap_s_axi_awready_net_x0: std_logic;
  signal memmap_s_axi_bid_net_x0: std_logic_vector(7 downto 0);
  signal memmap_s_axi_bresp_net_x0: std_logic_vector(1 downto 0);
  signal memmap_s_axi_bvalid_net_x0: std_logic;
  signal memmap_s_axi_rdata_net_x0: std_logic_vector(31 downto 0);
  signal memmap_s_axi_rid_net_x0: std_logic_vector(7 downto 0);
  signal memmap_s_axi_rlast_net_x0: std_logic;
  signal memmap_s_axi_rresp_net_x0: std_logic_vector(1 downto 0);
  signal memmap_s_axi_rvalid_net_x0: std_logic;
  signal memmap_s_axi_wready_net_x0: std_logic;
  signal memmap_sm_clear_fifo_din_net_x0: std_logic;
  signal memmap_sm_clear_fifo_en_net_x0: std_logic;
  signal memmap_sm_tx_en_din_net_x0: std_logic;
  signal memmap_sm_tx_en_en_net_x0: std_logic;
  signal memmap_sm_tx_fifo_din_net_x0: std_logic_vector(7 downto 0);
  signal memmap_sm_tx_fifo_we_net_x0: std_logic;
  signal plb_ce_1_sg_x0: std_logic;
  signal plb_clk_1_sg_x0: std_logic;
  signal s_axi_araddr_net_x0: std_logic_vector(31 downto 0);
  signal s_axi_arburst_net_x0: std_logic_vector(1 downto 0);
  signal s_axi_arcache_net_x0: std_logic_vector(3 downto 0);
  signal s_axi_arid_net_x0: std_logic_vector(7 downto 0);
  signal s_axi_arlen_net_x0: std_logic_vector(7 downto 0);
  signal s_axi_arlock_net_x0: std_logic_vector(1 downto 0);
  signal s_axi_arprot_net_x0: std_logic_vector(2 downto 0);
  signal s_axi_arsize_net_x0: std_logic_vector(2 downto 0);
  signal s_axi_arvalid_net_x0: std_logic;
  signal s_axi_awaddr_net_x0: std_logic_vector(31 downto 0);
  signal s_axi_awburst_net_x0: std_logic_vector(1 downto 0);
  signal s_axi_awcache_net_x0: std_logic_vector(3 downto 0);
  signal s_axi_awid_net_x0: std_logic_vector(7 downto 0);
  signal s_axi_awlen_net_x0: std_logic_vector(7 downto 0);
  signal s_axi_awlock_net_x0: std_logic_vector(1 downto 0);
  signal s_axi_awprot_net_x0: std_logic_vector(2 downto 0);
  signal s_axi_awsize_net_x0: std_logic_vector(2 downto 0);
  signal s_axi_awvalid_net_x0: std_logic;
  signal s_axi_bready_net_x0: std_logic;
  signal s_axi_rready_net_x0: std_logic;
  signal s_axi_wdata_net_x0: std_logic_vector(31 downto 0);
  signal s_axi_wlast_net_x0: std_logic;
  signal s_axi_wstrb_net_x0: std_logic_vector(3 downto 0);
  signal s_axi_wvalid_net_x0: std_logic;
  signal to_fifo_full_net_x0: std_logic;
  signal to_fifo_percent_full_net_x0: std_logic;
  signal to_register1_dout_net_x0: std_logic;
  signal to_register_dout_net_x0: std_logic;

begin
  axi_aresetn_net_x0 <= axi_aresetn;
  from_register_data_out_net_x0 <= from_register;
  plb_ce_1_sg_x0 <= plb_ce_1;
  plb_clk_1_sg_x0 <= plb_clk_1;
  s_axi_araddr_net_x0 <= s_axi_araddr;
  s_axi_arburst_net_x0 <= s_axi_arburst;
  s_axi_arcache_net_x0 <= s_axi_arcache;
  s_axi_arid_net_x0 <= s_axi_arid;
  s_axi_arlen_net_x0 <= s_axi_arlen;
  s_axi_arlock_net_x0 <= s_axi_arlock;
  s_axi_arprot_net_x0 <= s_axi_arprot;
  s_axi_arsize_net_x0 <= s_axi_arsize;
  s_axi_arvalid_net_x0 <= s_axi_arvalid;
  s_axi_awaddr_net_x0 <= s_axi_awaddr;
  s_axi_awburst_net_x0 <= s_axi_awburst;
  s_axi_awcache_net_x0 <= s_axi_awcache;
  s_axi_awid_net_x0 <= s_axi_awid;
  s_axi_awlen_net_x0 <= s_axi_awlen;
  s_axi_awlock_net_x0 <= s_axi_awlock;
  s_axi_awprot_net_x0 <= s_axi_awprot;
  s_axi_awsize_net_x0 <= s_axi_awsize;
  s_axi_awvalid_net_x0 <= s_axi_awvalid;
  s_axi_bready_net_x0 <= s_axi_bready;
  s_axi_rready_net_x0 <= s_axi_rready;
  s_axi_wdata_net_x0 <= s_axi_wdata;
  s_axi_wlast_net_x0 <= s_axi_wlast;
  s_axi_wstrb_net_x0 <= s_axi_wstrb;
  s_axi_wvalid_net_x0 <= s_axi_wvalid;
  to_fifo_percent_full_net_x0 <= to_fifo;
  to_fifo_full_net_x0 <= to_fifo_x0;
  to_register_dout_net_x0 <= to_register;
  to_register1_dout_net_x0 <= to_register1;
  memmap_x0 <= memmap_s_axi_arready_net_x0;
  memmap_x1 <= memmap_s_axi_awready_net_x0;
  memmap_x10 <= memmap_s_axi_wready_net_x0;
  memmap_x11 <= memmap_sm_tx_en_din_net_x0;
  memmap_x12 <= memmap_sm_tx_en_en_net_x0;
  memmap_x13 <= memmap_sm_clear_fifo_din_net_x0;
  memmap_x14 <= memmap_sm_clear_fifo_en_net_x0;
  memmap_x15 <= memmap_sm_tx_fifo_din_net_x0;
  memmap_x16 <= memmap_sm_tx_fifo_we_net_x0;
  memmap_x2 <= memmap_s_axi_bid_net_x0;
  memmap_x3 <= memmap_s_axi_bresp_net_x0;
  memmap_x4 <= memmap_s_axi_bvalid_net_x0;
  memmap_x5 <= memmap_s_axi_rdata_net_x0;
  memmap_x6 <= memmap_s_axi_rid_net_x0;
  memmap_x7 <= memmap_s_axi_rlast_net_x0;
  memmap_x8 <= memmap_s_axi_rresp_net_x0;
  memmap_x9 <= memmap_s_axi_rvalid_net_x0;

  memmap: entity work.axi_sgiface
    port map (
      axi_aclk => plb_clk_1_sg_x0,
      axi_aresetn => axi_aresetn_net_x0,
      axi_ce => plb_ce_1_sg_x0,
      s_axi_araddr => s_axi_araddr_net_x0,
      s_axi_arburst => s_axi_arburst_net_x0,
      s_axi_arcache => s_axi_arcache_net_x0,
      s_axi_arid => s_axi_arid_net_x0,
      s_axi_arlen => s_axi_arlen_net_x0,
      s_axi_arlock => s_axi_arlock_net_x0,
      s_axi_arprot => s_axi_arprot_net_x0,
      s_axi_arsize => s_axi_arsize_net_x0,
      s_axi_arvalid => s_axi_arvalid_net_x0,
      s_axi_awaddr => s_axi_awaddr_net_x0,
      s_axi_awburst => s_axi_awburst_net_x0,
      s_axi_awcache => s_axi_awcache_net_x0,
      s_axi_awid => s_axi_awid_net_x0,
      s_axi_awlen => s_axi_awlen_net_x0,
      s_axi_awlock => s_axi_awlock_net_x0,
      s_axi_awprot => s_axi_awprot_net_x0,
      s_axi_awsize => s_axi_awsize_net_x0,
      s_axi_awvalid => s_axi_awvalid_net_x0,
      s_axi_bready => s_axi_bready_net_x0,
      s_axi_rready => s_axi_rready_net_x0,
      s_axi_wdata => s_axi_wdata_net_x0,
      s_axi_wlast => s_axi_wlast_net_x0,
      s_axi_wstrb => s_axi_wstrb_net_x0,
      s_axi_wvalid => s_axi_wvalid_net_x0,
      sm_clear_fifo_dout(0) => to_register1_dout_net_x0,
      sm_tx_done_dout(0) => from_register_data_out_net_x0,
      sm_tx_en_dout(0) => to_register_dout_net_x0,
      sm_tx_fifo_full => to_fifo_full_net_x0,
      sm_tx_fifo_pfull(0) => to_fifo_percent_full_net_x0,
      s_axi_arready => memmap_s_axi_arready_net_x0,
      s_axi_awready => memmap_s_axi_awready_net_x0,
      s_axi_bid => memmap_s_axi_bid_net_x0,
      s_axi_bresp => memmap_s_axi_bresp_net_x0,
      s_axi_bvalid => memmap_s_axi_bvalid_net_x0,
      s_axi_rdata => memmap_s_axi_rdata_net_x0,
      s_axi_rid => memmap_s_axi_rid_net_x0,
      s_axi_rlast => memmap_s_axi_rlast_net_x0,
      s_axi_rresp => memmap_s_axi_rresp_net_x0,
      s_axi_rvalid => memmap_s_axi_rvalid_net_x0,
      s_axi_wready => memmap_s_axi_wready_net_x0,
      sm_clear_fifo_din(0) => memmap_sm_clear_fifo_din_net_x0,
      sm_clear_fifo_en => memmap_sm_clear_fifo_en_net_x0,
      sm_tx_en_din(0) => memmap_sm_tx_en_din_net_x0,
      sm_tx_en_en => memmap_sm_tx_en_en_net_x0,
      sm_tx_fifo_din => memmap_sm_tx_fifo_din_net_x0,
      sm_tx_fifo_we => memmap_sm_tx_fifo_we_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "tx/blinky"

entity blinky_entity_ad186371d2 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    slice_x0: out std_logic
  );
end blinky_entity_ad186371d2;

architecture structural of blinky_entity_ad186371d2 is
  signal ce_1_sg_x0: std_logic;
  signal clk_1_sg_x0: std_logic;
  signal counter_op_net: std_logic_vector(24 downto 0);
  signal slice_y_net_x0: std_logic;

begin
  ce_1_sg_x0 <= ce_1;
  clk_1_sg_x0 <= clk_1;
  slice_x0 <= slice_y_net_x0;

  counter: entity work.xlcounter_free_tx
    generic map (
      core_name0 => "cntr_11_0_8d5792a6ba24605d",
      op_arith => xlUnsigned,
      op_width => 25
    )
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      en => "1",
      rst => "0",
      op => counter_op_net
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 24,
      new_msb => 24,
      x_width => 25,
      y_width => 1
    )
    port map (
      x => counter_op_net,
      y(0) => slice_y_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "tx"

entity tx is
  port (
    axi_aresetn: in std_logic; 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_out: in std_logic_vector(7 downto 0); 
    data_out_x0: in std_logic; 
    data_out_x1: in std_logic; 
    data_out_x2: in std_logic; 
    dout_x0: in std_logic; 
    dout_x1: in std_logic; 
    empty: in std_logic; 
    full: in std_logic; 
    percent_full: in std_logic; 
    plb_ce_1: in std_logic; 
    plb_clk_1: in std_logic; 
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
    blinky_tx: out std_logic; 
    data_in: out std_logic; 
    data_in_x0: out std_logic_vector(7 downto 0); 
    data_in_x1: out std_logic; 
    data_in_x2: out std_logic; 
    en: out std_logic; 
    en_x0: out std_logic; 
    en_x1: out std_logic; 
    re: out std_logic; 
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
    s_axi_wready: out std_logic; 
    tx_i: out std_logic_vector(11 downto 0); 
    tx_q: out std_logic_vector(11 downto 0); 
    we: out std_logic
  );
end tx;

architecture structural of tx is
  attribute core_generation_info: string;
  attribute core_generation_info of structural : architecture is "tx,sysgen_core,{clock_period=10.00000000,clocking=Clock_Enables,sample_periods=1.00000000000 1.00000000000,testbench=0,total_blocks=101,xilinx_assert_block=1,xilinx_bit_slice_extractor_block=1,xilinx_black_box_block=1,xilinx_chipscope_block=1,xilinx_constant_block_block=1,xilinx_counter_block=2,xilinx_edk_core_block=1,xilinx_edk_processor_block=1,xilinx_gateway_in_block=25,xilinx_gateway_out_block=14,xilinx_shared_memory_based_from_fifo_block=1,xilinx_shared_memory_based_from_register_block=3,xilinx_shared_memory_based_to_fifo_block=1,xilinx_shared_memory_based_to_register_block=3,xilinx_system_generator_block=1,xilinx_type_converter_block=3,}";

  signal assert_dout_net: std_logic;
  signal axi_aresetn_net: std_logic;
  signal black_box_ce_out_net: std_logic;
  signal black_box_re_byte_out_net: std_logic;
  signal blinky_tx_net: std_logic;
  signal ce_1_sg_x1: std_logic;
  signal clk_1_sg_x1: std_logic;
  signal constant_op_net: std_logic;
  signal convert_2_dout_net: std_logic;
  signal counter_op_net: std_logic;
  signal data_in_net: std_logic;
  signal data_in_x0_net: std_logic_vector(7 downto 0);
  signal data_in_x1_net: std_logic;
  signal data_in_x2_net: std_logic;
  signal data_out_net: std_logic_vector(7 downto 0);
  signal data_out_x0_net: std_logic;
  signal data_out_x1_net: std_logic;
  signal data_out_x2_net: std_logic;
  signal dout_x0_net: std_logic;
  signal dout_x1_net: std_logic;
  signal empty_net: std_logic;
  signal en_net: std_logic;
  signal en_x0_net: std_logic;
  signal en_x1_net: std_logic;
  signal full_net: std_logic;
  signal percent_full_net: std_logic;
  signal plb_ce_1_sg_x1: std_logic;
  signal plb_clk_1_sg_x1: std_logic;
  signal re_net: std_logic;
  signal s_axi_araddr_net: std_logic_vector(31 downto 0);
  signal s_axi_arburst_net: std_logic_vector(1 downto 0);
  signal s_axi_arcache_net: std_logic_vector(3 downto 0);
  signal s_axi_arid_net: std_logic_vector(7 downto 0);
  signal s_axi_arlen_net: std_logic_vector(7 downto 0);
  signal s_axi_arlock_net: std_logic_vector(1 downto 0);
  signal s_axi_arprot_net: std_logic_vector(2 downto 0);
  signal s_axi_arready_net: std_logic;
  signal s_axi_arsize_net: std_logic_vector(2 downto 0);
  signal s_axi_arvalid_net: std_logic;
  signal s_axi_awaddr_net: std_logic_vector(31 downto 0);
  signal s_axi_awburst_net: std_logic_vector(1 downto 0);
  signal s_axi_awcache_net: std_logic_vector(3 downto 0);
  signal s_axi_awid_net: std_logic_vector(7 downto 0);
  signal s_axi_awlen_net: std_logic_vector(7 downto 0);
  signal s_axi_awlock_net: std_logic_vector(1 downto 0);
  signal s_axi_awprot_net: std_logic_vector(2 downto 0);
  signal s_axi_awready_net: std_logic;
  signal s_axi_awsize_net: std_logic_vector(2 downto 0);
  signal s_axi_awvalid_net: std_logic;
  signal s_axi_bid_net: std_logic_vector(7 downto 0);
  signal s_axi_bready_net: std_logic;
  signal s_axi_bresp_net: std_logic_vector(1 downto 0);
  signal s_axi_bvalid_net: std_logic;
  signal s_axi_rdata_net: std_logic_vector(31 downto 0);
  signal s_axi_rid_net: std_logic_vector(7 downto 0);
  signal s_axi_rlast_net: std_logic;
  signal s_axi_rready_net: std_logic;
  signal s_axi_rresp_net: std_logic_vector(1 downto 0);
  signal s_axi_rvalid_net: std_logic;
  signal s_axi_wdata_net: std_logic_vector(31 downto 0);
  signal s_axi_wlast_net: std_logic;
  signal s_axi_wready_net: std_logic;
  signal s_axi_wstrb_net: std_logic_vector(3 downto 0);
  signal s_axi_wvalid_net: std_logic;
  signal tx_i_net: std_logic_vector(11 downto 0);
  signal tx_q_net: std_logic_vector(11 downto 0);
  signal we_net: std_logic;

begin
  axi_aresetn_net <= axi_aresetn;
  ce_1_sg_x1 <= ce_1;
  clk_1_sg_x1 <= clk_1;
  data_out_net <= data_out;
  data_out_x0_net <= data_out_x0;
  data_out_x1_net <= data_out_x1;
  data_out_x2_net <= data_out_x2;
  dout_x0_net <= dout_x0;
  dout_x1_net <= dout_x1;
  empty_net <= empty;
  full_net <= full;
  percent_full_net <= percent_full;
  plb_ce_1_sg_x1 <= plb_ce_1;
  plb_clk_1_sg_x1 <= plb_clk_1;
  s_axi_araddr_net <= s_axi_araddr;
  s_axi_arburst_net <= s_axi_arburst;
  s_axi_arcache_net <= s_axi_arcache;
  s_axi_arid_net <= s_axi_arid;
  s_axi_arlen_net <= s_axi_arlen;
  s_axi_arlock_net <= s_axi_arlock;
  s_axi_arprot_net <= s_axi_arprot;
  s_axi_arsize_net <= s_axi_arsize;
  s_axi_arvalid_net <= s_axi_arvalid;
  s_axi_awaddr_net <= s_axi_awaddr;
  s_axi_awburst_net <= s_axi_awburst;
  s_axi_awcache_net <= s_axi_awcache;
  s_axi_awid_net <= s_axi_awid;
  s_axi_awlen_net <= s_axi_awlen;
  s_axi_awlock_net <= s_axi_awlock;
  s_axi_awprot_net <= s_axi_awprot;
  s_axi_awsize_net <= s_axi_awsize;
  s_axi_awvalid_net <= s_axi_awvalid;
  s_axi_bready_net <= s_axi_bready;
  s_axi_rready_net <= s_axi_rready;
  s_axi_wdata_net <= s_axi_wdata;
  s_axi_wlast_net <= s_axi_wlast;
  s_axi_wstrb_net <= s_axi_wstrb;
  s_axi_wvalid_net <= s_axi_wvalid;
  blinky_tx <= blinky_tx_net;
  data_in <= data_in_net;
  data_in_x0 <= data_in_x0_net;
  data_in_x1 <= data_in_x1_net;
  data_in_x2 <= data_in_x2_net;
  en <= en_net;
  en_x0 <= en_x0_net;
  en_x1 <= en_x1_net;
  re <= re_net;
  s_axi_arready <= s_axi_arready_net;
  s_axi_awready <= s_axi_awready_net;
  s_axi_bid <= s_axi_bid_net;
  s_axi_bresp <= s_axi_bresp_net;
  s_axi_bvalid <= s_axi_bvalid_net;
  s_axi_rdata <= s_axi_rdata_net;
  s_axi_rid <= s_axi_rid_net;
  s_axi_rlast <= s_axi_rlast_net;
  s_axi_rresp <= s_axi_rresp_net;
  s_axi_rvalid <= s_axi_rvalid_net;
  s_axi_wready <= s_axi_wready_net;
  tx_i <= tx_i_net;
  tx_q <= tx_q_net;
  we <= we_net;

  assert_x0: entity work.xlpassthrough
    generic map (
      din_width => 1,
      dout_width => 1
    )
    port map (
      din(0) => black_box_re_byte_out_net,
      dout(0) => assert_dout_net
    );

  black_box: entity work.qpsk_tx_FixPt
    port map (
      ce => ce_1_sg_x1,
      clear_fifo_in => data_out_x0_net,
      clk => clk_1_sg_x1,
      data_in => data_out_net,
      empty_in => convert_2_dout_net,
      reset => constant_op_net,
      tx_en_in => data_out_x1_net,
      ce_out => black_box_ce_out_net,
      i_out => tx_i_net,
      q_out => tx_q_net,
      re_byte_out => black_box_re_byte_out_net,
      tx_done_out => data_in_net
    );

  blinky_ad186371d2: entity work.blinky_entity_ad186371d2
    port map (
      ce_1 => ce_1_sg_x1,
      clk_1 => clk_1_sg_x1,
      slice_x0 => blinky_tx_net
    );

  chipscope: entity work.xlchipscope
    port map (
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      trig0(0) => data_out_x1_net,
      trig1(0) => data_out_x0_net,
      trig2(0) => convert_2_dout_net,
      trig3 => data_out_net,
      trig4 => tx_i_net,
      trig5 => tx_q_net,
      trig6(0) => black_box_re_byte_out_net,
      trig7(0) => data_in_net
    );

  constant_x0: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant_op_net
    );

  convert_1: entity work.xlconvert
    generic map (
      bool_conversion => 1,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      din(0) => assert_dout_net,
      en => "1",
      dout(0) => re_net
    );

  convert_2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      din(0) => empty_net,
      en => "1",
      dout(0) => convert_2_dout_net
    );

  convert_3: entity work.xlconvert
    generic map (
      bool_conversion => 1,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      din(0) => counter_op_net,
      en => "1",
      dout(0) => en_net
    );

  counter: entity work.counter_8ec3f4ab23
    port map (
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      op(0) => counter_op_net
    );

  edk_processor_aef01d5267: entity work.edk_processor_entity_aef01d5267
    port map (
      axi_aresetn => axi_aresetn_net,
      from_register => data_out_x2_net,
      plb_ce_1 => plb_ce_1_sg_x1,
      plb_clk_1 => plb_clk_1_sg_x1,
      s_axi_araddr => s_axi_araddr_net,
      s_axi_arburst => s_axi_arburst_net,
      s_axi_arcache => s_axi_arcache_net,
      s_axi_arid => s_axi_arid_net,
      s_axi_arlen => s_axi_arlen_net,
      s_axi_arlock => s_axi_arlock_net,
      s_axi_arprot => s_axi_arprot_net,
      s_axi_arsize => s_axi_arsize_net,
      s_axi_arvalid => s_axi_arvalid_net,
      s_axi_awaddr => s_axi_awaddr_net,
      s_axi_awburst => s_axi_awburst_net,
      s_axi_awcache => s_axi_awcache_net,
      s_axi_awid => s_axi_awid_net,
      s_axi_awlen => s_axi_awlen_net,
      s_axi_awlock => s_axi_awlock_net,
      s_axi_awprot => s_axi_awprot_net,
      s_axi_awsize => s_axi_awsize_net,
      s_axi_awvalid => s_axi_awvalid_net,
      s_axi_bready => s_axi_bready_net,
      s_axi_rready => s_axi_rready_net,
      s_axi_wdata => s_axi_wdata_net,
      s_axi_wlast => s_axi_wlast_net,
      s_axi_wstrb => s_axi_wstrb_net,
      s_axi_wvalid => s_axi_wvalid_net,
      to_fifo => percent_full_net,
      to_fifo_x0 => full_net,
      to_register => dout_x0_net,
      to_register1 => dout_x1_net,
      memmap_x0 => s_axi_arready_net,
      memmap_x1 => s_axi_awready_net,
      memmap_x10 => s_axi_wready_net,
      memmap_x11 => data_in_x1_net,
      memmap_x12 => en_x0_net,
      memmap_x13 => data_in_x2_net,
      memmap_x14 => en_x1_net,
      memmap_x15 => data_in_x0_net,
      memmap_x16 => we_net,
      memmap_x2 => s_axi_bid_net,
      memmap_x3 => s_axi_bresp_net,
      memmap_x4 => s_axi_bvalid_net,
      memmap_x5 => s_axi_rdata_net,
      memmap_x6 => s_axi_rid_net,
      memmap_x7 => s_axi_rlast_net,
      memmap_x8 => s_axi_rresp_net,
      memmap_x9 => s_axi_rvalid_net
    );

end structural;
