-------------------------------------------------------------------------------
-- Copyright (c) 2013 Xilinx, Inc.
-- All Rights Reserved
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor     : Xilinx
-- \   \   \/     Version    : 14.4
--  \   \         Application: XILINX CORE Generator
--  /   /         Filename   : icon_1_06_a_a814991b9aa9824e.vhd
-- /___/   /\     Timestamp  : Thu Feb 07 14:37:44 Pacific Standard Time 2013
-- \   \  /  \
--  \___\/\___\
--
-- Design Name: VHDL Synthesis Wrapper
-------------------------------------------------------------------------------
-- This wrapper is used to integrate with Project Navigator and PlanAhead

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY icon_1_06_a_a814991b9aa9824e IS
  port (
    CONTROL0: inout std_logic_vector(35 downto 0));
END icon_1_06_a_a814991b9aa9824e;

ARCHITECTURE icon_1_06_a_a814991b9aa9824e_a OF icon_1_06_a_a814991b9aa9824e IS
BEGIN

END icon_1_06_a_a814991b9aa9824e_a;
-------------------------------------------------------------------------------
-- Copyright (c) 2013 Xilinx, Inc.
-- All Rights Reserved
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor     : Xilinx
-- \   \   \/     Version    : 14.4
--  \   \         Application: XILINX CORE Generator
--  /   /         Filename   : ila_1_05_a_cc04612f5deda358.vhd
-- /___/   /\     Timestamp  : Fri Apr 12 14:51:56 Pacific Daylight Time 2013
-- \   \  /  \
--  \___\/\___\
--
-- Design Name: VHDL Synthesis Wrapper
-------------------------------------------------------------------------------
-- This wrapper is used to integrate with Project Navigator and PlanAhead

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY ila_1_05_a_cc04612f5deda358 IS
  port (
    CONTROL: inout std_logic_vector(35 downto 0);
    CLK: in std_logic;
    TRIG0: in std_logic_vector(11 downto 0);
    TRIG1: in std_logic_vector(25 downto 0);
    TRIG2: in std_logic_vector(25 downto 0);
    TRIG3: in std_logic_vector(25 downto 0));
END ila_1_05_a_cc04612f5deda358;

ARCHITECTURE ila_1_05_a_cc04612f5deda358_a OF ila_1_05_a_cc04612f5deda358 IS
BEGIN

END ila_1_05_a_cc04612f5deda358_a;

-------------------------------------------------------------------
-- System Generator version 14.3 VHDL source file.
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
-- System Generator version 14.3 VHDL source file.
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
-- System Generator version 14.3 VHDL source file.
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
-- System Generator version 14.3 VHDL source file.
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
        -- 'To Register'
        -- 'From FIFO'
        -- 'To FIFO'
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
-- 'To Register'
-- 'From FIFO'
-- 'To FIFO'
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
-- 'To Register'
-- 'From FIFO'
-- 'To FIFO'
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
            -- 'To FIFO'
            -- 'Shared Memory'
        else
            -- default assignments

        
        
        
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

                S_AXI_RDATA_i <= reg_bank_out_i;
            elsif (unsigned(read_bank_addr_i) = 1) then
                -- 'From FIFO'
                -- 'To FIFO'

                S_AXI_RDATA_i <= fifo_bank_out_i;
            elsif (unsigned(read_bank_addr_i) = 0 and s_shram_en = '1') then
                -- 'Shared Memory'

                S_AXI_RDATA_i <= shmem_bank_out_i;
            end if;
        end if;
    end if;
end process Read_Linear_Addr_Decode;

end architecture IMP;

-- -------------------------------------------------------------
-- 
-- File Name: C:\GIT\Chilipepper\Labs\Lab_4\Matlab\codegen\qpsk_rx\hdlsrc\qpsk_rx_FixPt_pkg.vhd
-- Created: 2013-04-12 12:57:45
-- 
-- Generated by MATLAB 8.1, MATLAB Coder 2.4 and HDL Coder 3.2
-- 
-- 
-- -------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE qpsk_rx_FixPt_pkg IS
  TYPE vector_of_signed26 IS ARRAY (NATURAL RANGE <>) OF signed(25 DOWNTO 0);
  TYPE vector_of_signed45 IS ARRAY (NATURAL RANGE <>) OF signed(44 DOWNTO 0);
  TYPE vector_of_signed39 IS ARRAY (NATURAL RANGE <>) OF signed(38 DOWNTO 0);
  TYPE vector_of_signed14 IS ARRAY (NATURAL RANGE <>) OF signed(13 DOWNTO 0);
  TYPE vector_of_signed13 IS ARRAY (NATURAL RANGE <>) OF signed(12 DOWNTO 0);
END qpsk_rx_FixPt_pkg;

-- -------------------------------------------------------------
-- 
-- File Name: C:\GIT\Chilipepper\Labs\Lab_4\Matlab\codegen\qpsk_rx\hdlsrc\qpsk_rx_FixPt.vhd
-- Created: 2013-04-12 12:57:45
-- 
-- Generated by MATLAB 8.1, MATLAB Coder 2.4 and HDL Coder 3.2
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
-- r_out                         ce_out        1
-- s_f_out_re                    ce_out        1
-- s_f_out_im                    ce_out        1
-- s_c_out_re                    ce_out        1
-- s_c_out_im                    ce_out        1
-- f_est_out                     ce_out        1
-- -------------------------------------------------------------
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: qpsk_rx_FixPt
-- Source Path: qpsk_rx_FixPt
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.qpsk_rx_FixPt_pkg.ALL;

ENTITY qpsk_rx_FixPt IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        ce                                :   IN    std_logic;
        i_in                              :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        q_in                              :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        mu_foc_in                         :   IN    std_logic_vector(11 DOWNTO 0);  -- ufix12
        ce_out                            :   OUT   std_logic;
        r_out                             :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        s_f_out_re                        :   OUT   std_logic_vector(25 DOWNTO 0);  -- sfix26_En12
        s_f_out_im                        :   OUT   std_logic_vector(25 DOWNTO 0);  -- sfix26_En12
        s_c_out_re                        :   OUT   std_logic_vector(25 DOWNTO 0);  -- sfix26_En12
        s_c_out_im                        :   OUT   std_logic_vector(25 DOWNTO 0);  -- sfix26_En12
        f_est_out                         :   OUT   std_logic_vector(25 DOWNTO 0)  -- sfix26_En12
        );
END qpsk_rx_FixPt;


ARCHITECTURE rtl OF qpsk_rx_FixPt IS

  -- Constants
  CONSTANT lSin                           : vector_of_signed14(0 TO 4095) := ( to_signed(0, 14), to_signed(6, 14), to_signed(12, 14), to_signed(18, 14), to_signed(25, 14), 
                                                                             to_signed(31, 14), to_signed(37, 14), to_signed(43, 14), to_signed(50, 14), to_signed(56, 14), 
                                                                             to_signed(62, 14), to_signed(69, 14), to_signed(75, 14), to_signed(81, 14), to_signed(87, 14), 
                                                                             to_signed(94, 14), to_signed(100, 14), to_signed(106, 14), to_signed(113, 14), to_signed(119, 14), 
                                                                             to_signed(125, 14), to_signed(131, 14), to_signed(138, 14), to_signed(144, 14), to_signed(150, 14), 
                                                                             to_signed(157, 14), to_signed(163, 14), to_signed(169, 14), to_signed(175, 14), to_signed(182, 14), 
                                                                             to_signed(188, 14), to_signed(194, 14), to_signed(200, 14), to_signed(207, 14), to_signed(213, 14), 
                                                                             to_signed(219, 14), to_signed(226, 14), to_signed(232, 14), to_signed(238, 14), to_signed(244, 14), 
                                                                             to_signed(251, 14), to_signed(257, 14), to_signed(263, 14), to_signed(269, 14), to_signed(276, 14), 
                                                                             to_signed(282, 14), to_signed(288, 14), to_signed(295, 14), to_signed(301, 14), to_signed(307, 14), 
                                                                             to_signed(313, 14), to_signed(320, 14), to_signed(326, 14), to_signed(332, 14), to_signed(338, 14), 
                                                                             to_signed(345, 14), to_signed(351, 14), to_signed(357, 14), to_signed(363, 14), to_signed(370, 14), 
                                                                             to_signed(376, 14), to_signed(382, 14), to_signed(388, 14), to_signed(395, 14), to_signed(401, 14), 
                                                                             to_signed(407, 14), to_signed(413, 14), to_signed(420, 14), to_signed(426, 14), to_signed(432, 14), 
                                                                             to_signed(438, 14), to_signed(445, 14), to_signed(451, 14), to_signed(457, 14), to_signed(463, 14), 
                                                                             to_signed(470, 14), to_signed(476, 14), to_signed(482, 14), to_signed(488, 14), to_signed(495, 14), 
                                                                             to_signed(501, 14), to_signed(507, 14), to_signed(513, 14), to_signed(520, 14), to_signed(526, 14), 
                                                                             to_signed(532, 14), to_signed(538, 14), to_signed(545, 14), to_signed(551, 14), to_signed(557, 14), 
                                                                             to_signed(563, 14), to_signed(569, 14), to_signed(576, 14), to_signed(582, 14), to_signed(588, 14), 
                                                                             to_signed(594, 14), to_signed(601, 14), to_signed(607, 14), to_signed(613, 14), to_signed(619, 14), 
                                                                             to_signed(625, 14), to_signed(632, 14), to_signed(638, 14), to_signed(644, 14), to_signed(650, 14), 
                                                                             to_signed(656, 14), to_signed(663, 14), to_signed(669, 14), to_signed(675, 14), to_signed(681, 14), 
                                                                             to_signed(687, 14), to_signed(694, 14), to_signed(700, 14), to_signed(706, 14), to_signed(712, 14), 
                                                                             to_signed(718, 14), to_signed(725, 14), to_signed(731, 14), to_signed(737, 14), to_signed(743, 14), 
                                                                             to_signed(749, 14), to_signed(755, 14), to_signed(762, 14), to_signed(768, 14), to_signed(774, 14), 
                                                                             to_signed(780, 14), to_signed(786, 14), to_signed(792, 14), to_signed(799, 14), to_signed(805, 14), 
                                                                             to_signed(811, 14), to_signed(817, 14), to_signed(823, 14), to_signed(829, 14), to_signed(836, 14), 
                                                                             to_signed(842, 14), to_signed(848, 14), to_signed(854, 14), to_signed(860, 14), to_signed(866, 14), 
                                                                             to_signed(872, 14), to_signed(879, 14), to_signed(885, 14), to_signed(891, 14), to_signed(897, 14), 
                                                                             to_signed(903, 14), to_signed(909, 14), to_signed(915, 14), to_signed(921, 14), to_signed(928, 14), 
                                                                             to_signed(934, 14), to_signed(940, 14), to_signed(946, 14), to_signed(952, 14), to_signed(958, 14), 
                                                                             to_signed(964, 14), to_signed(970, 14), to_signed(976, 14), to_signed(983, 14), to_signed(989, 14), 
                                                                             to_signed(995, 14), to_signed(1001, 14), to_signed(1007, 14), to_signed(1013, 14), to_signed(1019, 14), 
                                                                             to_signed(1025, 14), to_signed(1031, 14), to_signed(1037, 14), to_signed(1043, 14), 
                                                                             to_signed(1050, 14), to_signed(1056, 14), to_signed(1062, 14), to_signed(1068, 14), 
                                                                             to_signed(1074, 14), to_signed(1080, 14), to_signed(1086, 14), to_signed(1092, 14), 
                                                                             to_signed(1098, 14), to_signed(1104, 14), to_signed(1110, 14), to_signed(1116, 14), 
                                                                             to_signed(1122, 14), to_signed(1128, 14), to_signed(1134, 14), to_signed(1140, 14), 
                                                                             to_signed(1146, 14), to_signed(1152, 14), to_signed(1158, 14), to_signed(1164, 14), 
                                                                             to_signed(1170, 14), to_signed(1176, 14), to_signed(1182, 14), to_signed(1189, 14), 
                                                                             to_signed(1195, 14), to_signed(1201, 14), to_signed(1207, 14), to_signed(1213, 14), 
                                                                             to_signed(1219, 14), to_signed(1225, 14), to_signed(1231, 14), to_signed(1237, 14), 
                                                                             to_signed(1243, 14), to_signed(1248, 14), to_signed(1254, 14), to_signed(1260, 14), 
                                                                             to_signed(1266, 14), to_signed(1272, 14), to_signed(1278, 14), to_signed(1284, 14), 
                                                                             to_signed(1290, 14), to_signed(1296, 14), to_signed(1302, 14), to_signed(1308, 14), 
                                                                             to_signed(1314, 14), to_signed(1320, 14), to_signed(1326, 14), to_signed(1332, 14), 
                                                                             to_signed(1338, 14), to_signed(1344, 14), to_signed(1350, 14), to_signed(1356, 14), 
                                                                             to_signed(1362, 14), to_signed(1368, 14), to_signed(1373, 14), to_signed(1379, 14), 
                                                                             to_signed(1385, 14), to_signed(1391, 14), to_signed(1397, 14), to_signed(1403, 14), 
                                                                             to_signed(1409, 14), to_signed(1415, 14), to_signed(1421, 14), to_signed(1427, 14), 
                                                                             to_signed(1433, 14), to_signed(1438, 14), to_signed(1444, 14), to_signed(1450, 14), 
                                                                             to_signed(1456, 14), to_signed(1462, 14), to_signed(1468, 14), to_signed(1474, 14), 
                                                                             to_signed(1479, 14), to_signed(1485, 14), to_signed(1491, 14), to_signed(1497, 14), 
                                                                             to_signed(1503, 14), to_signed(1509, 14), to_signed(1515, 14), to_signed(1520, 14), 
                                                                             to_signed(1526, 14), to_signed(1532, 14), to_signed(1538, 14), to_signed(1544, 14), 
                                                                             to_signed(1550, 14), to_signed(1555, 14), to_signed(1561, 14), to_signed(1567, 14), 
                                                                             to_signed(1573, 14), to_signed(1579, 14), to_signed(1584, 14), to_signed(1590, 14), 
                                                                             to_signed(1596, 14), to_signed(1602, 14), to_signed(1608, 14), to_signed(1613, 14), 
                                                                             to_signed(1619, 14), to_signed(1625, 14), to_signed(1631, 14), to_signed(1636, 14), 
                                                                             to_signed(1642, 14), to_signed(1648, 14), to_signed(1654, 14), to_signed(1659, 14), 
                                                                             to_signed(1665, 14), to_signed(1671, 14), to_signed(1677, 14), to_signed(1682, 14), 
                                                                             to_signed(1688, 14), to_signed(1694, 14), to_signed(1699, 14), to_signed(1705, 14), 
                                                                             to_signed(1711, 14), to_signed(1717, 14), to_signed(1722, 14), to_signed(1728, 14), 
                                                                             to_signed(1734, 14), to_signed(1739, 14), to_signed(1745, 14), to_signed(1751, 14), 
                                                                             to_signed(1756, 14), to_signed(1762, 14), to_signed(1768, 14), to_signed(1773, 14), 
                                                                             to_signed(1779, 14), to_signed(1785, 14), to_signed(1790, 14), to_signed(1796, 14), 
                                                                             to_signed(1802, 14), to_signed(1807, 14), to_signed(1813, 14), to_signed(1819, 14), 
                                                                             to_signed(1824, 14), to_signed(1830, 14), to_signed(1835, 14), to_signed(1841, 14), 
                                                                             to_signed(1847, 14), to_signed(1852, 14), to_signed(1858, 14), to_signed(1864, 14), 
                                                                             to_signed(1869, 14), to_signed(1875, 14), to_signed(1880, 14), to_signed(1886, 14), 
                                                                             to_signed(1891, 14), to_signed(1897, 14), to_signed(1903, 14), to_signed(1908, 14), 
                                                                             to_signed(1914, 14), to_signed(1919, 14), to_signed(1925, 14), to_signed(1930, 14), 
                                                                             to_signed(1936, 14), to_signed(1941, 14), to_signed(1947, 14), to_signed(1952, 14), 
                                                                             to_signed(1958, 14), to_signed(1964, 14), to_signed(1969, 14), to_signed(1975, 14), 
                                                                             to_signed(1980, 14), to_signed(1986, 14), to_signed(1991, 14), to_signed(1997, 14), 
                                                                             to_signed(2002, 14), to_signed(2007, 14), to_signed(2013, 14), to_signed(2018, 14), 
                                                                             to_signed(2024, 14), to_signed(2029, 14), to_signed(2035, 14), to_signed(2040, 14), 
                                                                             to_signed(2046, 14), to_signed(2051, 14), to_signed(2057, 14), to_signed(2062, 14), 
                                                                             to_signed(2067, 14), to_signed(2073, 14), to_signed(2078, 14), to_signed(2084, 14), 
                                                                             to_signed(2089, 14), to_signed(2094, 14), to_signed(2100, 14), to_signed(2105, 14), 
                                                                             to_signed(2111, 14), to_signed(2116, 14), to_signed(2121, 14), to_signed(2127, 14), 
                                                                             to_signed(2132, 14), to_signed(2138, 14), to_signed(2143, 14), to_signed(2148, 14), 
                                                                             to_signed(2154, 14), to_signed(2159, 14), to_signed(2164, 14), to_signed(2170, 14), 
                                                                             to_signed(2175, 14), to_signed(2180, 14), to_signed(2186, 14), to_signed(2191, 14), 
                                                                             to_signed(2196, 14), to_signed(2201, 14), to_signed(2207, 14), to_signed(2212, 14), 
                                                                             to_signed(2217, 14), to_signed(2223, 14), to_signed(2228, 14), to_signed(2233, 14), 
                                                                             to_signed(2238, 14), to_signed(2244, 14), to_signed(2249, 14), to_signed(2254, 14), 
                                                                             to_signed(2259, 14), to_signed(2265, 14), to_signed(2270, 14), to_signed(2275, 14), 
                                                                             to_signed(2280, 14), to_signed(2286, 14), to_signed(2291, 14), to_signed(2296, 14), 
                                                                             to_signed(2301, 14), to_signed(2306, 14), to_signed(2312, 14), to_signed(2317, 14), 
                                                                             to_signed(2322, 14), to_signed(2327, 14), to_signed(2332, 14), to_signed(2337, 14), 
                                                                             to_signed(2343, 14), to_signed(2348, 14), to_signed(2353, 14), to_signed(2358, 14), 
                                                                             to_signed(2363, 14), to_signed(2368, 14), to_signed(2373, 14), to_signed(2379, 14), 
                                                                             to_signed(2384, 14), to_signed(2389, 14), to_signed(2394, 14), to_signed(2399, 14), 
                                                                             to_signed(2404, 14), to_signed(2409, 14), to_signed(2414, 14), to_signed(2419, 14), 
                                                                             to_signed(2424, 14), to_signed(2429, 14), to_signed(2434, 14), to_signed(2439, 14), 
                                                                             to_signed(2445, 14), to_signed(2450, 14), to_signed(2455, 14), to_signed(2460, 14), 
                                                                             to_signed(2465, 14), to_signed(2470, 14), to_signed(2475, 14), to_signed(2480, 14), 
                                                                             to_signed(2485, 14), to_signed(2490, 14), to_signed(2495, 14), to_signed(2500, 14), 
                                                                             to_signed(2505, 14), to_signed(2510, 14), to_signed(2515, 14), to_signed(2519, 14), 
                                                                             to_signed(2524, 14), to_signed(2529, 14), to_signed(2534, 14), to_signed(2539, 14), 
                                                                             to_signed(2544, 14), to_signed(2549, 14), to_signed(2554, 14), to_signed(2559, 14), 
                                                                             to_signed(2564, 14), to_signed(2569, 14), to_signed(2574, 14), to_signed(2578, 14), 
                                                                             to_signed(2583, 14), to_signed(2588, 14), to_signed(2593, 14), to_signed(2598, 14), 
                                                                             to_signed(2603, 14), to_signed(2608, 14), to_signed(2613, 14), to_signed(2617, 14), 
                                                                             to_signed(2622, 14), to_signed(2627, 14), to_signed(2632, 14), to_signed(2637, 14), 
                                                                             to_signed(2641, 14), to_signed(2646, 14), to_signed(2651, 14), to_signed(2656, 14), 
                                                                             to_signed(2661, 14), to_signed(2665, 14), to_signed(2670, 14), to_signed(2675, 14), 
                                                                             to_signed(2680, 14), to_signed(2684, 14), to_signed(2689, 14), to_signed(2694, 14), 
                                                                             to_signed(2699, 14), to_signed(2703, 14), to_signed(2708, 14), to_signed(2713, 14), 
                                                                             to_signed(2717, 14), to_signed(2722, 14), to_signed(2727, 14), to_signed(2732, 14), 
                                                                             to_signed(2736, 14), to_signed(2741, 14), to_signed(2746, 14), to_signed(2750, 14), 
                                                                             to_signed(2755, 14), to_signed(2760, 14), to_signed(2764, 14), to_signed(2769, 14), 
                                                                             to_signed(2773, 14), to_signed(2778, 14), to_signed(2783, 14), to_signed(2787, 14), 
                                                                             to_signed(2792, 14), to_signed(2796, 14), to_signed(2801, 14), to_signed(2806, 14), 
                                                                             to_signed(2810, 14), to_signed(2815, 14), to_signed(2819, 14), to_signed(2824, 14), 
                                                                             to_signed(2828, 14), to_signed(2833, 14), to_signed(2837, 14), to_signed(2842, 14), 
                                                                             to_signed(2847, 14), to_signed(2851, 14), to_signed(2856, 14), to_signed(2860, 14), 
                                                                             to_signed(2865, 14), to_signed(2869, 14), to_signed(2874, 14), to_signed(2878, 14), 
                                                                             to_signed(2882, 14), to_signed(2887, 14), to_signed(2891, 14), to_signed(2896, 14), 
                                                                             to_signed(2900, 14), to_signed(2905, 14), to_signed(2909, 14), to_signed(2914, 14), 
                                                                             to_signed(2918, 14), to_signed(2922, 14), to_signed(2927, 14), to_signed(2931, 14), 
                                                                             to_signed(2936, 14), to_signed(2940, 14), to_signed(2944, 14), to_signed(2949, 14), 
                                                                             to_signed(2953, 14), to_signed(2957, 14), to_signed(2962, 14), to_signed(2966, 14), 
                                                                             to_signed(2970, 14), to_signed(2975, 14), to_signed(2979, 14), to_signed(2983, 14), 
                                                                             to_signed(2988, 14), to_signed(2992, 14), to_signed(2996, 14), to_signed(3000, 14), 
                                                                             to_signed(3005, 14), to_signed(3009, 14), to_signed(3013, 14), to_signed(3018, 14), 
                                                                             to_signed(3022, 14), to_signed(3026, 14), to_signed(3030, 14), to_signed(3034, 14), 
                                                                             to_signed(3039, 14), to_signed(3043, 14), to_signed(3047, 14), to_signed(3051, 14), 
                                                                             to_signed(3055, 14), to_signed(3060, 14), to_signed(3064, 14), to_signed(3068, 14), 
                                                                             to_signed(3072, 14), to_signed(3076, 14), to_signed(3080, 14), to_signed(3085, 14), 
                                                                             to_signed(3089, 14), to_signed(3093, 14), to_signed(3097, 14), to_signed(3101, 14), 
                                                                             to_signed(3105, 14), to_signed(3109, 14), to_signed(3113, 14), to_signed(3117, 14), 
                                                                             to_signed(3121, 14), to_signed(3126, 14), to_signed(3130, 14), to_signed(3134, 14), 
                                                                             to_signed(3138, 14), to_signed(3142, 14), to_signed(3146, 14), to_signed(3150, 14), 
                                                                             to_signed(3154, 14), to_signed(3158, 14), to_signed(3162, 14), to_signed(3166, 14), 
                                                                             to_signed(3170, 14), to_signed(3174, 14), to_signed(3178, 14), to_signed(3182, 14), 
                                                                             to_signed(3186, 14), to_signed(3190, 14), to_signed(3193, 14), to_signed(3197, 14), 
                                                                             to_signed(3201, 14), to_signed(3205, 14), to_signed(3209, 14), to_signed(3213, 14), 
                                                                             to_signed(3217, 14), to_signed(3221, 14), to_signed(3225, 14), to_signed(3229, 14), 
                                                                             to_signed(3232, 14), to_signed(3236, 14), to_signed(3240, 14), to_signed(3244, 14), 
                                                                             to_signed(3248, 14), to_signed(3252, 14), to_signed(3255, 14), to_signed(3259, 14), 
                                                                             to_signed(3263, 14), to_signed(3267, 14), to_signed(3271, 14), to_signed(3274, 14), 
                                                                             to_signed(3278, 14), to_signed(3282, 14), to_signed(3286, 14), to_signed(3289, 14), 
                                                                             to_signed(3293, 14), to_signed(3297, 14), to_signed(3301, 14), to_signed(3304, 14), 
                                                                             to_signed(3308, 14), to_signed(3312, 14), to_signed(3315, 14), to_signed(3319, 14), 
                                                                             to_signed(3323, 14), to_signed(3326, 14), to_signed(3330, 14), to_signed(3334, 14), 
                                                                             to_signed(3337, 14), to_signed(3341, 14), to_signed(3345, 14), to_signed(3348, 14), 
                                                                             to_signed(3352, 14), to_signed(3356, 14), to_signed(3359, 14), to_signed(3363, 14), 
                                                                             to_signed(3366, 14), to_signed(3370, 14), to_signed(3373, 14), to_signed(3377, 14), 
                                                                             to_signed(3381, 14), to_signed(3384, 14), to_signed(3388, 14), to_signed(3391, 14), 
                                                                             to_signed(3395, 14), to_signed(3398, 14), to_signed(3402, 14), to_signed(3405, 14), 
                                                                             to_signed(3409, 14), to_signed(3412, 14), to_signed(3416, 14), to_signed(3419, 14), 
                                                                             to_signed(3423, 14), to_signed(3426, 14), to_signed(3429, 14), to_signed(3433, 14), 
                                                                             to_signed(3436, 14), to_signed(3440, 14), to_signed(3443, 14), to_signed(3447, 14), 
                                                                             to_signed(3450, 14), to_signed(3453, 14), to_signed(3457, 14), to_signed(3460, 14), 
                                                                             to_signed(3463, 14), to_signed(3467, 14), to_signed(3470, 14), to_signed(3473, 14), 
                                                                             to_signed(3477, 14), to_signed(3480, 14), to_signed(3483, 14), to_signed(3487, 14), 
                                                                             to_signed(3490, 14), to_signed(3493, 14), to_signed(3497, 14), to_signed(3500, 14), 
                                                                             to_signed(3503, 14), to_signed(3506, 14), to_signed(3510, 14), to_signed(3513, 14), 
                                                                             to_signed(3516, 14), to_signed(3519, 14), to_signed(3522, 14), to_signed(3526, 14), 
                                                                             to_signed(3529, 14), to_signed(3532, 14), to_signed(3535, 14), to_signed(3538, 14), 
                                                                             to_signed(3541, 14), to_signed(3545, 14), to_signed(3548, 14), to_signed(3551, 14), 
                                                                             to_signed(3554, 14), to_signed(3557, 14), to_signed(3560, 14), to_signed(3563, 14), 
                                                                             to_signed(3566, 14), to_signed(3570, 14), to_signed(3573, 14), to_signed(3576, 14), 
                                                                             to_signed(3579, 14), to_signed(3582, 14), to_signed(3585, 14), to_signed(3588, 14), 
                                                                             to_signed(3591, 14), to_signed(3594, 14), to_signed(3597, 14), to_signed(3600, 14), 
                                                                             to_signed(3603, 14), to_signed(3606, 14), to_signed(3609, 14), to_signed(3612, 14), 
                                                                             to_signed(3615, 14), to_signed(3618, 14), to_signed(3621, 14), to_signed(3624, 14), 
                                                                             to_signed(3627, 14), to_signed(3629, 14), to_signed(3632, 14), to_signed(3635, 14), 
                                                                             to_signed(3638, 14), to_signed(3641, 14), to_signed(3644, 14), to_signed(3647, 14), 
                                                                             to_signed(3650, 14), to_signed(3652, 14), to_signed(3655, 14), to_signed(3658, 14), 
                                                                             to_signed(3661, 14), to_signed(3664, 14), to_signed(3667, 14), to_signed(3669, 14), 
                                                                             to_signed(3672, 14), to_signed(3675, 14), to_signed(3678, 14), to_signed(3680, 14), 
                                                                             to_signed(3683, 14), to_signed(3686, 14), to_signed(3689, 14), to_signed(3691, 14), 
                                                                             to_signed(3694, 14), to_signed(3697, 14), to_signed(3700, 14), to_signed(3702, 14), 
                                                                             to_signed(3705, 14), to_signed(3708, 14), to_signed(3710, 14), to_signed(3713, 14), 
                                                                             to_signed(3716, 14), to_signed(3718, 14), to_signed(3721, 14), to_signed(3723, 14), 
                                                                             to_signed(3726, 14), to_signed(3729, 14), to_signed(3731, 14), to_signed(3734, 14), 
                                                                             to_signed(3736, 14), to_signed(3739, 14), to_signed(3742, 14), to_signed(3744, 14), 
                                                                             to_signed(3747, 14), to_signed(3749, 14), to_signed(3752, 14), to_signed(3754, 14), 
                                                                             to_signed(3757, 14), to_signed(3759, 14), to_signed(3762, 14), to_signed(3764, 14), 
                                                                             to_signed(3767, 14), to_signed(3769, 14), to_signed(3772, 14), to_signed(3774, 14), 
                                                                             to_signed(3776, 14), to_signed(3779, 14), to_signed(3781, 14), to_signed(3784, 14), 
                                                                             to_signed(3786, 14), to_signed(3789, 14), to_signed(3791, 14), to_signed(3793, 14), 
                                                                             to_signed(3796, 14), to_signed(3798, 14), to_signed(3800, 14), to_signed(3803, 14), 
                                                                             to_signed(3805, 14), to_signed(3807, 14), to_signed(3810, 14), to_signed(3812, 14), 
                                                                             to_signed(3814, 14), to_signed(3816, 14), to_signed(3819, 14), to_signed(3821, 14), 
                                                                             to_signed(3823, 14), to_signed(3826, 14), to_signed(3828, 14), to_signed(3830, 14), 
                                                                             to_signed(3832, 14), to_signed(3834, 14), to_signed(3837, 14), to_signed(3839, 14), 
                                                                             to_signed(3841, 14), to_signed(3843, 14), to_signed(3845, 14), to_signed(3848, 14), 
                                                                             to_signed(3850, 14), to_signed(3852, 14), to_signed(3854, 14), to_signed(3856, 14), 
                                                                             to_signed(3858, 14), to_signed(3860, 14), to_signed(3862, 14), to_signed(3864, 14), 
                                                                             to_signed(3867, 14), to_signed(3869, 14), to_signed(3871, 14), to_signed(3873, 14), 
                                                                             to_signed(3875, 14), to_signed(3877, 14), to_signed(3879, 14), to_signed(3881, 14), 
                                                                             to_signed(3883, 14), to_signed(3885, 14), to_signed(3887, 14), to_signed(3889, 14), 
                                                                             to_signed(3891, 14), to_signed(3893, 14), to_signed(3895, 14), to_signed(3897, 14), 
                                                                             to_signed(3899, 14), to_signed(3900, 14), to_signed(3902, 14), to_signed(3904, 14), 
                                                                             to_signed(3906, 14), to_signed(3908, 14), to_signed(3910, 14), to_signed(3912, 14), 
                                                                             to_signed(3914, 14), to_signed(3915, 14), to_signed(3917, 14), to_signed(3919, 14), 
                                                                             to_signed(3921, 14), to_signed(3923, 14), to_signed(3925, 14), to_signed(3926, 14), 
                                                                             to_signed(3928, 14), to_signed(3930, 14), to_signed(3932, 14), to_signed(3933, 14), 
                                                                             to_signed(3935, 14), to_signed(3937, 14), to_signed(3939, 14), to_signed(3940, 14), 
                                                                             to_signed(3942, 14), to_signed(3944, 14), to_signed(3945, 14), to_signed(3947, 14), 
                                                                             to_signed(3949, 14), to_signed(3950, 14), to_signed(3952, 14), to_signed(3954, 14), 
                                                                             to_signed(3955, 14), to_signed(3957, 14), to_signed(3959, 14), to_signed(3960, 14), 
                                                                             to_signed(3962, 14), to_signed(3963, 14), to_signed(3965, 14), to_signed(3967, 14), 
                                                                             to_signed(3968, 14), to_signed(3970, 14), to_signed(3971, 14), to_signed(3973, 14), 
                                                                             to_signed(3974, 14), to_signed(3976, 14), to_signed(3977, 14), to_signed(3979, 14), 
                                                                             to_signed(3980, 14), to_signed(3982, 14), to_signed(3983, 14), to_signed(3985, 14), 
                                                                             to_signed(3986, 14), to_signed(3988, 14), to_signed(3989, 14), to_signed(3990, 14), 
                                                                             to_signed(3992, 14), to_signed(3993, 14), to_signed(3995, 14), to_signed(3996, 14), 
                                                                             to_signed(3997, 14), to_signed(3999, 14), to_signed(4000, 14), to_signed(4001, 14), 
                                                                             to_signed(4003, 14), to_signed(4004, 14), to_signed(4005, 14), to_signed(4007, 14), 
                                                                             to_signed(4008, 14), to_signed(4009, 14), to_signed(4011, 14), to_signed(4012, 14), 
                                                                             to_signed(4013, 14), to_signed(4014, 14), to_signed(4016, 14), to_signed(4017, 14), 
                                                                             to_signed(4018, 14), to_signed(4019, 14), to_signed(4020, 14), to_signed(4022, 14), 
                                                                             to_signed(4023, 14), to_signed(4024, 14), to_signed(4025, 14), to_signed(4026, 14), 
                                                                             to_signed(4027, 14), to_signed(4029, 14), to_signed(4030, 14), to_signed(4031, 14), 
                                                                             to_signed(4032, 14), to_signed(4033, 14), to_signed(4034, 14), to_signed(4035, 14), 
                                                                             to_signed(4036, 14), to_signed(4037, 14), to_signed(4038, 14), to_signed(4039, 14), 
                                                                             to_signed(4040, 14), to_signed(4041, 14), to_signed(4042, 14), to_signed(4043, 14), 
                                                                             to_signed(4044, 14), to_signed(4045, 14), to_signed(4046, 14), to_signed(4047, 14), 
                                                                             to_signed(4048, 14), to_signed(4049, 14), to_signed(4050, 14), to_signed(4051, 14), 
                                                                             to_signed(4052, 14), to_signed(4053, 14), to_signed(4054, 14), to_signed(4055, 14), 
                                                                             to_signed(4056, 14), to_signed(4057, 14), to_signed(4057, 14), to_signed(4058, 14), 
                                                                             to_signed(4059, 14), to_signed(4060, 14), to_signed(4061, 14), to_signed(4062, 14), 
                                                                             to_signed(4062, 14), to_signed(4063, 14), to_signed(4064, 14), to_signed(4065, 14), 
                                                                             to_signed(4065, 14), to_signed(4066, 14), to_signed(4067, 14), to_signed(4068, 14), 
                                                                             to_signed(4068, 14), to_signed(4069, 14), to_signed(4070, 14), to_signed(4071, 14), 
                                                                             to_signed(4071, 14), to_signed(4072, 14), to_signed(4073, 14), to_signed(4073, 14), 
                                                                             to_signed(4074, 14), to_signed(4075, 14), to_signed(4075, 14), to_signed(4076, 14), 
                                                                             to_signed(4076, 14), to_signed(4077, 14), to_signed(4078, 14), to_signed(4078, 14), 
                                                                             to_signed(4079, 14), to_signed(4079, 14), to_signed(4080, 14), to_signed(4080, 14), 
                                                                             to_signed(4081, 14), to_signed(4081, 14), to_signed(4082, 14), to_signed(4082, 14), 
                                                                             to_signed(4083, 14), to_signed(4083, 14), to_signed(4084, 14), to_signed(4084, 14), 
                                                                             to_signed(4085, 14), to_signed(4085, 14), to_signed(4086, 14), to_signed(4086, 14), 
                                                                             to_signed(4087, 14), to_signed(4087, 14), to_signed(4087, 14), to_signed(4088, 14), 
                                                                             to_signed(4088, 14), to_signed(4089, 14), to_signed(4089, 14), to_signed(4089, 14), 
                                                                             to_signed(4090, 14), to_signed(4090, 14), to_signed(4090, 14), to_signed(4091, 14), 
                                                                             to_signed(4091, 14), to_signed(4091, 14), to_signed(4091, 14), to_signed(4092, 14), 
                                                                             to_signed(4092, 14), to_signed(4092, 14), to_signed(4092, 14), to_signed(4093, 14), 
                                                                             to_signed(4093, 14), to_signed(4093, 14), to_signed(4093, 14), to_signed(4094, 14), 
                                                                             to_signed(4094, 14), to_signed(4094, 14), to_signed(4094, 14), to_signed(4094, 14), 
                                                                             to_signed(4094, 14), to_signed(4095, 14), to_signed(4095, 14), to_signed(4095, 14), 
                                                                             to_signed(4095, 14), to_signed(4095, 14), to_signed(4095, 14), to_signed(4095, 14), 
                                                                             to_signed(4095, 14), to_signed(4095, 14), to_signed(4095, 14), to_signed(4095, 14), 
                                                                             to_signed(4095, 14), to_signed(4095, 14), to_signed(4095, 14), to_signed(4096, 14), 
                                                                             to_signed(4095, 14), to_signed(4095, 14), to_signed(4095, 14), to_signed(4095, 14), 
                                                                             to_signed(4095, 14), to_signed(4095, 14), to_signed(4095, 14), to_signed(4095, 14), 
                                                                             to_signed(4095, 14), to_signed(4095, 14), to_signed(4095, 14), to_signed(4095, 14), 
                                                                             to_signed(4095, 14), to_signed(4095, 14), to_signed(4094, 14), to_signed(4094, 14), 
                                                                             to_signed(4094, 14), to_signed(4094, 14), to_signed(4094, 14), to_signed(4094, 14), 
                                                                             to_signed(4093, 14), to_signed(4093, 14), to_signed(4093, 14), to_signed(4093, 14), 
                                                                             to_signed(4092, 14), to_signed(4092, 14), to_signed(4092, 14), to_signed(4092, 14), 
                                                                             to_signed(4091, 14), to_signed(4091, 14), to_signed(4091, 14), to_signed(4091, 14), 
                                                                             to_signed(4090, 14), to_signed(4090, 14), to_signed(4090, 14), to_signed(4089, 14), 
                                                                             to_signed(4089, 14), to_signed(4089, 14), to_signed(4088, 14), to_signed(4088, 14), 
                                                                             to_signed(4087, 14), to_signed(4087, 14), to_signed(4087, 14), to_signed(4086, 14), 
                                                                             to_signed(4086, 14), to_signed(4085, 14), to_signed(4085, 14), to_signed(4084, 14), 
                                                                             to_signed(4084, 14), to_signed(4083, 14), to_signed(4083, 14), to_signed(4082, 14), 
                                                                             to_signed(4082, 14), to_signed(4081, 14), to_signed(4081, 14), to_signed(4080, 14), 
                                                                             to_signed(4080, 14), to_signed(4079, 14), to_signed(4079, 14), to_signed(4078, 14), 
                                                                             to_signed(4078, 14), to_signed(4077, 14), to_signed(4076, 14), to_signed(4076, 14), 
                                                                             to_signed(4075, 14), to_signed(4075, 14), to_signed(4074, 14), to_signed(4073, 14), 
                                                                             to_signed(4073, 14), to_signed(4072, 14), to_signed(4071, 14), to_signed(4071, 14), 
                                                                             to_signed(4070, 14), to_signed(4069, 14), to_signed(4068, 14), to_signed(4068, 14), 
                                                                             to_signed(4067, 14), to_signed(4066, 14), to_signed(4065, 14), to_signed(4065, 14), 
                                                                             to_signed(4064, 14), to_signed(4063, 14), to_signed(4062, 14), to_signed(4062, 14), 
                                                                             to_signed(4061, 14), to_signed(4060, 14), to_signed(4059, 14), to_signed(4058, 14), 
                                                                             to_signed(4057, 14), to_signed(4057, 14), to_signed(4056, 14), to_signed(4055, 14), 
                                                                             to_signed(4054, 14), to_signed(4053, 14), to_signed(4052, 14), to_signed(4051, 14), 
                                                                             to_signed(4050, 14), to_signed(4049, 14), to_signed(4048, 14), to_signed(4047, 14), 
                                                                             to_signed(4046, 14), to_signed(4045, 14), to_signed(4044, 14), to_signed(4043, 14), 
                                                                             to_signed(4042, 14), to_signed(4041, 14), to_signed(4040, 14), to_signed(4039, 14), 
                                                                             to_signed(4038, 14), to_signed(4037, 14), to_signed(4036, 14), to_signed(4035, 14), 
                                                                             to_signed(4034, 14), to_signed(4033, 14), to_signed(4032, 14), to_signed(4031, 14), 
                                                                             to_signed(4030, 14), to_signed(4029, 14), to_signed(4027, 14), to_signed(4026, 14), 
                                                                             to_signed(4025, 14), to_signed(4024, 14), to_signed(4023, 14), to_signed(4022, 14), 
                                                                             to_signed(4020, 14), to_signed(4019, 14), to_signed(4018, 14), to_signed(4017, 14), 
                                                                             to_signed(4016, 14), to_signed(4014, 14), to_signed(4013, 14), to_signed(4012, 14), 
                                                                             to_signed(4011, 14), to_signed(4009, 14), to_signed(4008, 14), to_signed(4007, 14), 
                                                                             to_signed(4005, 14), to_signed(4004, 14), to_signed(4003, 14), to_signed(4001, 14), 
                                                                             to_signed(4000, 14), to_signed(3999, 14), to_signed(3997, 14), to_signed(3996, 14), 
                                                                             to_signed(3995, 14), to_signed(3993, 14), to_signed(3992, 14), to_signed(3990, 14), 
                                                                             to_signed(3989, 14), to_signed(3988, 14), to_signed(3986, 14), to_signed(3985, 14), 
                                                                             to_signed(3983, 14), to_signed(3982, 14), to_signed(3980, 14), to_signed(3979, 14), 
                                                                             to_signed(3977, 14), to_signed(3976, 14), to_signed(3974, 14), to_signed(3973, 14), 
                                                                             to_signed(3971, 14), to_signed(3970, 14), to_signed(3968, 14), to_signed(3967, 14), 
                                                                             to_signed(3965, 14), to_signed(3963, 14), to_signed(3962, 14), to_signed(3960, 14), 
                                                                             to_signed(3959, 14), to_signed(3957, 14), to_signed(3955, 14), to_signed(3954, 14), 
                                                                             to_signed(3952, 14), to_signed(3950, 14), to_signed(3949, 14), to_signed(3947, 14), 
                                                                             to_signed(3945, 14), to_signed(3944, 14), to_signed(3942, 14), to_signed(3940, 14), 
                                                                             to_signed(3939, 14), to_signed(3937, 14), to_signed(3935, 14), to_signed(3933, 14), 
                                                                             to_signed(3932, 14), to_signed(3930, 14), to_signed(3928, 14), to_signed(3926, 14), 
                                                                             to_signed(3925, 14), to_signed(3923, 14), to_signed(3921, 14), to_signed(3919, 14), 
                                                                             to_signed(3917, 14), to_signed(3915, 14), to_signed(3914, 14), to_signed(3912, 14), 
                                                                             to_signed(3910, 14), to_signed(3908, 14), to_signed(3906, 14), to_signed(3904, 14), 
                                                                             to_signed(3902, 14), to_signed(3900, 14), to_signed(3899, 14), to_signed(3897, 14), 
                                                                             to_signed(3895, 14), to_signed(3893, 14), to_signed(3891, 14), to_signed(3889, 14), 
                                                                             to_signed(3887, 14), to_signed(3885, 14), to_signed(3883, 14), to_signed(3881, 14), 
                                                                             to_signed(3879, 14), to_signed(3877, 14), to_signed(3875, 14), to_signed(3873, 14), 
                                                                             to_signed(3871, 14), to_signed(3869, 14), to_signed(3867, 14), to_signed(3864, 14), 
                                                                             to_signed(3862, 14), to_signed(3860, 14), to_signed(3858, 14), to_signed(3856, 14), 
                                                                             to_signed(3854, 14), to_signed(3852, 14), to_signed(3850, 14), to_signed(3848, 14), 
                                                                             to_signed(3845, 14), to_signed(3843, 14), to_signed(3841, 14), to_signed(3839, 14), 
                                                                             to_signed(3837, 14), to_signed(3834, 14), to_signed(3832, 14), to_signed(3830, 14), 
                                                                             to_signed(3828, 14), to_signed(3826, 14), to_signed(3823, 14), to_signed(3821, 14), 
                                                                             to_signed(3819, 14), to_signed(3816, 14), to_signed(3814, 14), to_signed(3812, 14), 
                                                                             to_signed(3810, 14), to_signed(3807, 14), to_signed(3805, 14), to_signed(3803, 14), 
                                                                             to_signed(3800, 14), to_signed(3798, 14), to_signed(3796, 14), to_signed(3793, 14), 
                                                                             to_signed(3791, 14), to_signed(3789, 14), to_signed(3786, 14), to_signed(3784, 14), 
                                                                             to_signed(3781, 14), to_signed(3779, 14), to_signed(3776, 14), to_signed(3774, 14), 
                                                                             to_signed(3772, 14), to_signed(3769, 14), to_signed(3767, 14), to_signed(3764, 14), 
                                                                             to_signed(3762, 14), to_signed(3759, 14), to_signed(3757, 14), to_signed(3754, 14), 
                                                                             to_signed(3752, 14), to_signed(3749, 14), to_signed(3747, 14), to_signed(3744, 14), 
                                                                             to_signed(3742, 14), to_signed(3739, 14), to_signed(3736, 14), to_signed(3734, 14), 
                                                                             to_signed(3731, 14), to_signed(3729, 14), to_signed(3726, 14), to_signed(3723, 14), 
                                                                             to_signed(3721, 14), to_signed(3718, 14), to_signed(3716, 14), to_signed(3713, 14), 
                                                                             to_signed(3710, 14), to_signed(3708, 14), to_signed(3705, 14), to_signed(3702, 14), 
                                                                             to_signed(3700, 14), to_signed(3697, 14), to_signed(3694, 14), to_signed(3691, 14), 
                                                                             to_signed(3689, 14), to_signed(3686, 14), to_signed(3683, 14), to_signed(3680, 14), 
                                                                             to_signed(3678, 14), to_signed(3675, 14), to_signed(3672, 14), to_signed(3669, 14), 
                                                                             to_signed(3667, 14), to_signed(3664, 14), to_signed(3661, 14), to_signed(3658, 14), 
                                                                             to_signed(3655, 14), to_signed(3652, 14), to_signed(3650, 14), to_signed(3647, 14), 
                                                                             to_signed(3644, 14), to_signed(3641, 14), to_signed(3638, 14), to_signed(3635, 14), 
                                                                             to_signed(3632, 14), to_signed(3629, 14), to_signed(3627, 14), to_signed(3624, 14), 
                                                                             to_signed(3621, 14), to_signed(3618, 14), to_signed(3615, 14), to_signed(3612, 14), 
                                                                             to_signed(3609, 14), to_signed(3606, 14), to_signed(3603, 14), to_signed(3600, 14), 
                                                                             to_signed(3597, 14), to_signed(3594, 14), to_signed(3591, 14), to_signed(3588, 14), 
                                                                             to_signed(3585, 14), to_signed(3582, 14), to_signed(3579, 14), to_signed(3576, 14), 
                                                                             to_signed(3573, 14), to_signed(3570, 14), to_signed(3566, 14), to_signed(3563, 14), 
                                                                             to_signed(3560, 14), to_signed(3557, 14), to_signed(3554, 14), to_signed(3551, 14), 
                                                                             to_signed(3548, 14), to_signed(3545, 14), to_signed(3541, 14), to_signed(3538, 14), 
                                                                             to_signed(3535, 14), to_signed(3532, 14), to_signed(3529, 14), to_signed(3526, 14), 
                                                                             to_signed(3522, 14), to_signed(3519, 14), to_signed(3516, 14), to_signed(3513, 14), 
                                                                             to_signed(3510, 14), to_signed(3506, 14), to_signed(3503, 14), to_signed(3500, 14), 
                                                                             to_signed(3497, 14), to_signed(3493, 14), to_signed(3490, 14), to_signed(3487, 14), 
                                                                             to_signed(3483, 14), to_signed(3480, 14), to_signed(3477, 14), to_signed(3473, 14), 
                                                                             to_signed(3470, 14), to_signed(3467, 14), to_signed(3463, 14), to_signed(3460, 14), 
                                                                             to_signed(3457, 14), to_signed(3453, 14), to_signed(3450, 14), to_signed(3447, 14), 
                                                                             to_signed(3443, 14), to_signed(3440, 14), to_signed(3436, 14), to_signed(3433, 14), 
                                                                             to_signed(3429, 14), to_signed(3426, 14), to_signed(3423, 14), to_signed(3419, 14), 
                                                                             to_signed(3416, 14), to_signed(3412, 14), to_signed(3409, 14), to_signed(3405, 14), 
                                                                             to_signed(3402, 14), to_signed(3398, 14), to_signed(3395, 14), to_signed(3391, 14), 
                                                                             to_signed(3388, 14), to_signed(3384, 14), to_signed(3381, 14), to_signed(3377, 14), 
                                                                             to_signed(3373, 14), to_signed(3370, 14), to_signed(3366, 14), to_signed(3363, 14), 
                                                                             to_signed(3359, 14), to_signed(3356, 14), to_signed(3352, 14), to_signed(3348, 14), 
                                                                             to_signed(3345, 14), to_signed(3341, 14), to_signed(3337, 14), to_signed(3334, 14), 
                                                                             to_signed(3330, 14), to_signed(3326, 14), to_signed(3323, 14), to_signed(3319, 14), 
                                                                             to_signed(3315, 14), to_signed(3312, 14), to_signed(3308, 14), to_signed(3304, 14), 
                                                                             to_signed(3301, 14), to_signed(3297, 14), to_signed(3293, 14), to_signed(3289, 14), 
                                                                             to_signed(3286, 14), to_signed(3282, 14), to_signed(3278, 14), to_signed(3274, 14), 
                                                                             to_signed(3271, 14), to_signed(3267, 14), to_signed(3263, 14), to_signed(3259, 14), 
                                                                             to_signed(3255, 14), to_signed(3252, 14), to_signed(3248, 14), to_signed(3244, 14), 
                                                                             to_signed(3240, 14), to_signed(3236, 14), to_signed(3232, 14), to_signed(3229, 14), 
                                                                             to_signed(3225, 14), to_signed(3221, 14), to_signed(3217, 14), to_signed(3213, 14), 
                                                                             to_signed(3209, 14), to_signed(3205, 14), to_signed(3201, 14), to_signed(3197, 14), 
                                                                             to_signed(3193, 14), to_signed(3190, 14), to_signed(3186, 14), to_signed(3182, 14), 
                                                                             to_signed(3178, 14), to_signed(3174, 14), to_signed(3170, 14), to_signed(3166, 14), 
                                                                             to_signed(3162, 14), to_signed(3158, 14), to_signed(3154, 14), to_signed(3150, 14), 
                                                                             to_signed(3146, 14), to_signed(3142, 14), to_signed(3138, 14), to_signed(3134, 14), 
                                                                             to_signed(3130, 14), to_signed(3126, 14), to_signed(3121, 14), to_signed(3117, 14), 
                                                                             to_signed(3113, 14), to_signed(3109, 14), to_signed(3105, 14), to_signed(3101, 14), 
                                                                             to_signed(3097, 14), to_signed(3093, 14), to_signed(3089, 14), to_signed(3085, 14), 
                                                                             to_signed(3080, 14), to_signed(3076, 14), to_signed(3072, 14), to_signed(3068, 14), 
                                                                             to_signed(3064, 14), to_signed(3060, 14), to_signed(3055, 14), to_signed(3051, 14), 
                                                                             to_signed(3047, 14), to_signed(3043, 14), to_signed(3039, 14), to_signed(3034, 14), 
                                                                             to_signed(3030, 14), to_signed(3026, 14), to_signed(3022, 14), to_signed(3018, 14), 
                                                                             to_signed(3013, 14), to_signed(3009, 14), to_signed(3005, 14), to_signed(3000, 14), 
                                                                             to_signed(2996, 14), to_signed(2992, 14), to_signed(2988, 14), to_signed(2983, 14), 
                                                                             to_signed(2979, 14), to_signed(2975, 14), to_signed(2970, 14), to_signed(2966, 14), 
                                                                             to_signed(2962, 14), to_signed(2957, 14), to_signed(2953, 14), to_signed(2949, 14), 
                                                                             to_signed(2944, 14), to_signed(2940, 14), to_signed(2936, 14), to_signed(2931, 14), 
                                                                             to_signed(2927, 14), to_signed(2922, 14), to_signed(2918, 14), to_signed(2914, 14), 
                                                                             to_signed(2909, 14), to_signed(2905, 14), to_signed(2900, 14), to_signed(2896, 14), 
                                                                             to_signed(2891, 14), to_signed(2887, 14), to_signed(2882, 14), to_signed(2878, 14), 
                                                                             to_signed(2874, 14), to_signed(2869, 14), to_signed(2865, 14), to_signed(2860, 14), 
                                                                             to_signed(2856, 14), to_signed(2851, 14), to_signed(2847, 14), to_signed(2842, 14), 
                                                                             to_signed(2837, 14), to_signed(2833, 14), to_signed(2828, 14), to_signed(2824, 14), 
                                                                             to_signed(2819, 14), to_signed(2815, 14), to_signed(2810, 14), to_signed(2806, 14), 
                                                                             to_signed(2801, 14), to_signed(2796, 14), to_signed(2792, 14), to_signed(2787, 14), 
                                                                             to_signed(2783, 14), to_signed(2778, 14), to_signed(2773, 14), to_signed(2769, 14), 
                                                                             to_signed(2764, 14), to_signed(2760, 14), to_signed(2755, 14), to_signed(2750, 14), 
                                                                             to_signed(2746, 14), to_signed(2741, 14), to_signed(2736, 14), to_signed(2732, 14), 
                                                                             to_signed(2727, 14), to_signed(2722, 14), to_signed(2717, 14), to_signed(2713, 14), 
                                                                             to_signed(2708, 14), to_signed(2703, 14), to_signed(2699, 14), to_signed(2694, 14), 
                                                                             to_signed(2689, 14), to_signed(2684, 14), to_signed(2680, 14), to_signed(2675, 14), 
                                                                             to_signed(2670, 14), to_signed(2665, 14), to_signed(2661, 14), to_signed(2656, 14), 
                                                                             to_signed(2651, 14), to_signed(2646, 14), to_signed(2641, 14), to_signed(2637, 14), 
                                                                             to_signed(2632, 14), to_signed(2627, 14), to_signed(2622, 14), to_signed(2617, 14), 
                                                                             to_signed(2613, 14), to_signed(2608, 14), to_signed(2603, 14), to_signed(2598, 14), 
                                                                             to_signed(2593, 14), to_signed(2588, 14), to_signed(2583, 14), to_signed(2578, 14), 
                                                                             to_signed(2574, 14), to_signed(2569, 14), to_signed(2564, 14), to_signed(2559, 14), 
                                                                             to_signed(2554, 14), to_signed(2549, 14), to_signed(2544, 14), to_signed(2539, 14), 
                                                                             to_signed(2534, 14), to_signed(2529, 14), to_signed(2524, 14), to_signed(2519, 14), 
                                                                             to_signed(2515, 14), to_signed(2510, 14), to_signed(2505, 14), to_signed(2500, 14), 
                                                                             to_signed(2495, 14), to_signed(2490, 14), to_signed(2485, 14), to_signed(2480, 14), 
                                                                             to_signed(2475, 14), to_signed(2470, 14), to_signed(2465, 14), to_signed(2460, 14), 
                                                                             to_signed(2455, 14), to_signed(2450, 14), to_signed(2445, 14), to_signed(2439, 14), 
                                                                             to_signed(2434, 14), to_signed(2429, 14), to_signed(2424, 14), to_signed(2419, 14), 
                                                                             to_signed(2414, 14), to_signed(2409, 14), to_signed(2404, 14), to_signed(2399, 14), 
                                                                             to_signed(2394, 14), to_signed(2389, 14), to_signed(2384, 14), to_signed(2379, 14), 
                                                                             to_signed(2373, 14), to_signed(2368, 14), to_signed(2363, 14), to_signed(2358, 14), 
                                                                             to_signed(2353, 14), to_signed(2348, 14), to_signed(2343, 14), to_signed(2337, 14), 
                                                                             to_signed(2332, 14), to_signed(2327, 14), to_signed(2322, 14), to_signed(2317, 14), 
                                                                             to_signed(2312, 14), to_signed(2306, 14), to_signed(2301, 14), to_signed(2296, 14), 
                                                                             to_signed(2291, 14), to_signed(2286, 14), to_signed(2280, 14), to_signed(2275, 14), 
                                                                             to_signed(2270, 14), to_signed(2265, 14), to_signed(2259, 14), to_signed(2254, 14), 
                                                                             to_signed(2249, 14), to_signed(2244, 14), to_signed(2238, 14), to_signed(2233, 14), 
                                                                             to_signed(2228, 14), to_signed(2223, 14), to_signed(2217, 14), to_signed(2212, 14), 
                                                                             to_signed(2207, 14), to_signed(2201, 14), to_signed(2196, 14), to_signed(2191, 14), 
                                                                             to_signed(2186, 14), to_signed(2180, 14), to_signed(2175, 14), to_signed(2170, 14), 
                                                                             to_signed(2164, 14), to_signed(2159, 14), to_signed(2154, 14), to_signed(2148, 14), 
                                                                             to_signed(2143, 14), to_signed(2138, 14), to_signed(2132, 14), to_signed(2127, 14), 
                                                                             to_signed(2121, 14), to_signed(2116, 14), to_signed(2111, 14), to_signed(2105, 14), 
                                                                             to_signed(2100, 14), to_signed(2094, 14), to_signed(2089, 14), to_signed(2084, 14), 
                                                                             to_signed(2078, 14), to_signed(2073, 14), to_signed(2067, 14), to_signed(2062, 14), 
                                                                             to_signed(2057, 14), to_signed(2051, 14), to_signed(2046, 14), to_signed(2040, 14), 
                                                                             to_signed(2035, 14), to_signed(2029, 14), to_signed(2024, 14), to_signed(2018, 14), 
                                                                             to_signed(2013, 14), to_signed(2007, 14), to_signed(2002, 14), to_signed(1997, 14), 
                                                                             to_signed(1991, 14), to_signed(1986, 14), to_signed(1980, 14), to_signed(1975, 14), 
                                                                             to_signed(1969, 14), to_signed(1964, 14), to_signed(1958, 14), to_signed(1952, 14), 
                                                                             to_signed(1947, 14), to_signed(1941, 14), to_signed(1936, 14), to_signed(1930, 14), 
                                                                             to_signed(1925, 14), to_signed(1919, 14), to_signed(1914, 14), to_signed(1908, 14), 
                                                                             to_signed(1903, 14), to_signed(1897, 14), to_signed(1891, 14), to_signed(1886, 14), 
                                                                             to_signed(1880, 14), to_signed(1875, 14), to_signed(1869, 14), to_signed(1864, 14), 
                                                                             to_signed(1858, 14), to_signed(1852, 14), to_signed(1847, 14), to_signed(1841, 14), 
                                                                             to_signed(1835, 14), to_signed(1830, 14), to_signed(1824, 14), to_signed(1819, 14), 
                                                                             to_signed(1813, 14), to_signed(1807, 14), to_signed(1802, 14), to_signed(1796, 14), 
                                                                             to_signed(1790, 14), to_signed(1785, 14), to_signed(1779, 14), to_signed(1773, 14), 
                                                                             to_signed(1768, 14), to_signed(1762, 14), to_signed(1756, 14), to_signed(1751, 14), 
                                                                             to_signed(1745, 14), to_signed(1739, 14), to_signed(1734, 14), to_signed(1728, 14), 
                                                                             to_signed(1722, 14), to_signed(1717, 14), to_signed(1711, 14), to_signed(1705, 14), 
                                                                             to_signed(1699, 14), to_signed(1694, 14), to_signed(1688, 14), to_signed(1682, 14), 
                                                                             to_signed(1677, 14), to_signed(1671, 14), to_signed(1665, 14), to_signed(1659, 14), 
                                                                             to_signed(1654, 14), to_signed(1648, 14), to_signed(1642, 14), to_signed(1636, 14), 
                                                                             to_signed(1631, 14), to_signed(1625, 14), to_signed(1619, 14), to_signed(1613, 14), 
                                                                             to_signed(1608, 14), to_signed(1602, 14), to_signed(1596, 14), to_signed(1590, 14), 
                                                                             to_signed(1584, 14), to_signed(1579, 14), to_signed(1573, 14), to_signed(1567, 14), 
                                                                             to_signed(1561, 14), to_signed(1555, 14), to_signed(1550, 14), to_signed(1544, 14), 
                                                                             to_signed(1538, 14), to_signed(1532, 14), to_signed(1526, 14), to_signed(1520, 14), 
                                                                             to_signed(1515, 14), to_signed(1509, 14), to_signed(1503, 14), to_signed(1497, 14), 
                                                                             to_signed(1491, 14), to_signed(1485, 14), to_signed(1479, 14), to_signed(1474, 14), 
                                                                             to_signed(1468, 14), to_signed(1462, 14), to_signed(1456, 14), to_signed(1450, 14), 
                                                                             to_signed(1444, 14), to_signed(1438, 14), to_signed(1433, 14), to_signed(1427, 14), 
                                                                             to_signed(1421, 14), to_signed(1415, 14), to_signed(1409, 14), to_signed(1403, 14), 
                                                                             to_signed(1397, 14), to_signed(1391, 14), to_signed(1385, 14), to_signed(1379, 14), 
                                                                             to_signed(1373, 14), to_signed(1368, 14), to_signed(1362, 14), to_signed(1356, 14), 
                                                                             to_signed(1350, 14), to_signed(1344, 14), to_signed(1338, 14), to_signed(1332, 14), 
                                                                             to_signed(1326, 14), to_signed(1320, 14), to_signed(1314, 14), to_signed(1308, 14), 
                                                                             to_signed(1302, 14), to_signed(1296, 14), to_signed(1290, 14), to_signed(1284, 14), 
                                                                             to_signed(1278, 14), to_signed(1272, 14), to_signed(1266, 14), to_signed(1260, 14), 
                                                                             to_signed(1254, 14), to_signed(1248, 14), to_signed(1243, 14), to_signed(1237, 14), 
                                                                             to_signed(1231, 14), to_signed(1225, 14), to_signed(1219, 14), to_signed(1213, 14), 
                                                                             to_signed(1207, 14), to_signed(1201, 14), to_signed(1195, 14), to_signed(1189, 14), 
                                                                             to_signed(1182, 14), to_signed(1176, 14), to_signed(1170, 14), to_signed(1164, 14), 
                                                                             to_signed(1158, 14), to_signed(1152, 14), to_signed(1146, 14), to_signed(1140, 14), 
                                                                             to_signed(1134, 14), to_signed(1128, 14), to_signed(1122, 14), to_signed(1116, 14), 
                                                                             to_signed(1110, 14), to_signed(1104, 14), to_signed(1098, 14), to_signed(1092, 14), 
                                                                             to_signed(1086, 14), to_signed(1080, 14), to_signed(1074, 14), to_signed(1068, 14), 
                                                                             to_signed(1062, 14), to_signed(1056, 14), to_signed(1050, 14), to_signed(1043, 14), 
                                                                             to_signed(1037, 14), to_signed(1031, 14), to_signed(1025, 14), to_signed(1019, 14), 
                                                                             to_signed(1013, 14), to_signed(1007, 14), to_signed(1001, 14), to_signed(995, 14), to_signed(989, 14), 
                                                                             to_signed(983, 14), to_signed(976, 14), to_signed(970, 14), to_signed(964, 14), to_signed(958, 14), 
                                                                             to_signed(952, 14), to_signed(946, 14), to_signed(940, 14), to_signed(934, 14), to_signed(928, 14), 
                                                                             to_signed(921, 14), to_signed(915, 14), to_signed(909, 14), to_signed(903, 14), to_signed(897, 14), 
                                                                             to_signed(891, 14), to_signed(885, 14), to_signed(879, 14), to_signed(872, 14), to_signed(866, 14), 
                                                                             to_signed(860, 14), to_signed(854, 14), to_signed(848, 14), to_signed(842, 14), to_signed(836, 14), 
                                                                             to_signed(829, 14), to_signed(823, 14), to_signed(817, 14), to_signed(811, 14), to_signed(805, 14), 
                                                                             to_signed(799, 14), to_signed(792, 14), to_signed(786, 14), to_signed(780, 14), to_signed(774, 14), 
                                                                             to_signed(768, 14), to_signed(762, 14), to_signed(755, 14), to_signed(749, 14), to_signed(743, 14), 
                                                                             to_signed(737, 14), to_signed(731, 14), to_signed(725, 14), to_signed(718, 14), to_signed(712, 14), 
                                                                             to_signed(706, 14), to_signed(700, 14), to_signed(694, 14), to_signed(687, 14), to_signed(681, 14), 
                                                                             to_signed(675, 14), to_signed(669, 14), to_signed(663, 14), to_signed(656, 14), to_signed(650, 14), 
                                                                             to_signed(644, 14), to_signed(638, 14), to_signed(632, 14), to_signed(625, 14), to_signed(619, 14), 
                                                                             to_signed(613, 14), to_signed(607, 14), to_signed(601, 14), to_signed(594, 14), to_signed(588, 14), 
                                                                             to_signed(582, 14), to_signed(576, 14), to_signed(569, 14), to_signed(563, 14), to_signed(557, 14), 
                                                                             to_signed(551, 14), to_signed(545, 14), to_signed(538, 14), to_signed(532, 14), to_signed(526, 14), 
                                                                             to_signed(520, 14), to_signed(513, 14), to_signed(507, 14), to_signed(501, 14), to_signed(495, 14), 
                                                                             to_signed(488, 14), to_signed(482, 14), to_signed(476, 14), to_signed(470, 14), to_signed(463, 14), 
                                                                             to_signed(457, 14), to_signed(451, 14), to_signed(445, 14), to_signed(438, 14), to_signed(432, 14), 
                                                                             to_signed(426, 14), to_signed(420, 14), to_signed(413, 14), to_signed(407, 14), to_signed(401, 14), 
                                                                             to_signed(395, 14), to_signed(388, 14), to_signed(382, 14), to_signed(376, 14), to_signed(370, 14), 
                                                                             to_signed(363, 14), to_signed(357, 14), to_signed(351, 14), to_signed(345, 14), to_signed(338, 14), 
                                                                             to_signed(332, 14), to_signed(326, 14), to_signed(320, 14), to_signed(313, 14), to_signed(307, 14), 
                                                                             to_signed(301, 14), to_signed(295, 14), to_signed(288, 14), to_signed(282, 14), to_signed(276, 14), 
                                                                             to_signed(269, 14), to_signed(263, 14), to_signed(257, 14), to_signed(251, 14), to_signed(244, 14), 
                                                                             to_signed(238, 14), to_signed(232, 14), to_signed(226, 14), to_signed(219, 14), to_signed(213, 14), 
                                                                             to_signed(207, 14), to_signed(200, 14), to_signed(194, 14), to_signed(188, 14), to_signed(182, 14), 
                                                                             to_signed(175, 14), to_signed(169, 14), to_signed(163, 14), to_signed(157, 14), to_signed(150, 14), 
                                                                             to_signed(144, 14), to_signed(138, 14), to_signed(131, 14), to_signed(125, 14), to_signed(119, 14), 
                                                                             to_signed(113, 14), to_signed(106, 14), to_signed(100, 14), to_signed(94, 14), to_signed(87, 14), 
                                                                             to_signed(81, 14), to_signed(75, 14), to_signed(69, 14), to_signed(62, 14), to_signed(56, 14), 
                                                                             to_signed(50, 14), to_signed(43, 14), to_signed(37, 14), to_signed(31, 14), to_signed(25, 14), 
                                                                             to_signed(18, 14), to_signed(12, 14), to_signed(6, 14), to_signed(0, 14), to_signed(-7, 14), 
                                                                             to_signed(-13, 14), to_signed(-19, 14), to_signed(-26, 14), to_signed(-32, 14), to_signed(-38, 14), 
                                                                             to_signed(-44, 14), to_signed(-51, 14), to_signed(-57, 14), to_signed(-63, 14), to_signed(-70, 14), 
                                                                             to_signed(-76, 14), to_signed(-82, 14), to_signed(-88, 14), to_signed(-95, 14), to_signed(-101, 14), 
                                                                             to_signed(-107, 14), to_signed(-114, 14), to_signed(-120, 14), to_signed(-126, 14), 
                                                                             to_signed(-132, 14), to_signed(-139, 14), to_signed(-145, 14), to_signed(-151, 14), 
                                                                             to_signed(-158, 14), to_signed(-164, 14), to_signed(-170, 14), to_signed(-176, 14), 
                                                                             to_signed(-183, 14), to_signed(-189, 14), to_signed(-195, 14), to_signed(-201, 14), 
                                                                             to_signed(-208, 14), to_signed(-214, 14), to_signed(-220, 14), to_signed(-227, 14), 
                                                                             to_signed(-233, 14), to_signed(-239, 14), to_signed(-245, 14), to_signed(-252, 14), 
                                                                             to_signed(-258, 14), to_signed(-264, 14), to_signed(-270, 14), to_signed(-277, 14), 
                                                                             to_signed(-283, 14), to_signed(-289, 14), to_signed(-296, 14), to_signed(-302, 14), 
                                                                             to_signed(-308, 14), to_signed(-314, 14), to_signed(-321, 14), to_signed(-327, 14), 
                                                                             to_signed(-333, 14), to_signed(-339, 14), to_signed(-346, 14), to_signed(-352, 14), 
                                                                             to_signed(-358, 14), to_signed(-364, 14), to_signed(-371, 14), to_signed(-377, 14), 
                                                                             to_signed(-383, 14), to_signed(-389, 14), to_signed(-396, 14), to_signed(-402, 14), 
                                                                             to_signed(-408, 14), to_signed(-414, 14), to_signed(-421, 14), to_signed(-427, 14), 
                                                                             to_signed(-433, 14), to_signed(-439, 14), to_signed(-446, 14), to_signed(-452, 14), 
                                                                             to_signed(-458, 14), to_signed(-464, 14), to_signed(-471, 14), to_signed(-477, 14), 
                                                                             to_signed(-483, 14), to_signed(-489, 14), to_signed(-496, 14), to_signed(-502, 14), 
                                                                             to_signed(-508, 14), to_signed(-514, 14), to_signed(-521, 14), to_signed(-527, 14), 
                                                                             to_signed(-533, 14), to_signed(-539, 14), to_signed(-546, 14), to_signed(-552, 14), 
                                                                             to_signed(-558, 14), to_signed(-564, 14), to_signed(-570, 14), to_signed(-577, 14), 
                                                                             to_signed(-583, 14), to_signed(-589, 14), to_signed(-595, 14), to_signed(-602, 14), 
                                                                             to_signed(-608, 14), to_signed(-614, 14), to_signed(-620, 14), to_signed(-626, 14), 
                                                                             to_signed(-633, 14), to_signed(-639, 14), to_signed(-645, 14), to_signed(-651, 14), 
                                                                             to_signed(-657, 14), to_signed(-664, 14), to_signed(-670, 14), to_signed(-676, 14), 
                                                                             to_signed(-682, 14), to_signed(-688, 14), to_signed(-695, 14), to_signed(-701, 14), 
                                                                             to_signed(-707, 14), to_signed(-713, 14), to_signed(-719, 14), to_signed(-726, 14), 
                                                                             to_signed(-732, 14), to_signed(-738, 14), to_signed(-744, 14), to_signed(-750, 14), 
                                                                             to_signed(-756, 14), to_signed(-763, 14), to_signed(-769, 14), to_signed(-775, 14), 
                                                                             to_signed(-781, 14), to_signed(-787, 14), to_signed(-793, 14), to_signed(-800, 14), 
                                                                             to_signed(-806, 14), to_signed(-812, 14), to_signed(-818, 14), to_signed(-824, 14), 
                                                                             to_signed(-830, 14), to_signed(-837, 14), to_signed(-843, 14), to_signed(-849, 14), 
                                                                             to_signed(-855, 14), to_signed(-861, 14), to_signed(-867, 14), to_signed(-873, 14), 
                                                                             to_signed(-880, 14), to_signed(-886, 14), to_signed(-892, 14), to_signed(-898, 14), 
                                                                             to_signed(-904, 14), to_signed(-910, 14), to_signed(-916, 14), to_signed(-922, 14), 
                                                                             to_signed(-929, 14), to_signed(-935, 14), to_signed(-941, 14), to_signed(-947, 14), 
                                                                             to_signed(-953, 14), to_signed(-959, 14), to_signed(-965, 14), to_signed(-971, 14), 
                                                                             to_signed(-977, 14), to_signed(-984, 14), to_signed(-990, 14), to_signed(-996, 14), 
                                                                             to_signed(-1002, 14), to_signed(-1008, 14), to_signed(-1014, 14), to_signed(-1020, 14), 
                                                                             to_signed(-1026, 14), to_signed(-1032, 14), to_signed(-1038, 14), to_signed(-1044, 14), 
                                                                             to_signed(-1051, 14), to_signed(-1057, 14), to_signed(-1063, 14), to_signed(-1069, 14), 
                                                                             to_signed(-1075, 14), to_signed(-1081, 14), to_signed(-1087, 14), to_signed(-1093, 14), 
                                                                             to_signed(-1099, 14), to_signed(-1105, 14), to_signed(-1111, 14), to_signed(-1117, 14), 
                                                                             to_signed(-1123, 14), to_signed(-1129, 14), to_signed(-1135, 14), to_signed(-1141, 14), 
                                                                             to_signed(-1147, 14), to_signed(-1153, 14), to_signed(-1159, 14), to_signed(-1165, 14), 
                                                                             to_signed(-1171, 14), to_signed(-1177, 14), to_signed(-1183, 14), to_signed(-1190, 14), 
                                                                             to_signed(-1196, 14), to_signed(-1202, 14), to_signed(-1208, 14), to_signed(-1214, 14), 
                                                                             to_signed(-1220, 14), to_signed(-1226, 14), to_signed(-1232, 14), to_signed(-1238, 14), 
                                                                             to_signed(-1244, 14), to_signed(-1249, 14), to_signed(-1255, 14), to_signed(-1261, 14), 
                                                                             to_signed(-1267, 14), to_signed(-1273, 14), to_signed(-1279, 14), to_signed(-1285, 14), 
                                                                             to_signed(-1291, 14), to_signed(-1297, 14), to_signed(-1303, 14), to_signed(-1309, 14), 
                                                                             to_signed(-1315, 14), to_signed(-1321, 14), to_signed(-1327, 14), to_signed(-1333, 14), 
                                                                             to_signed(-1339, 14), to_signed(-1345, 14), to_signed(-1351, 14), to_signed(-1357, 14), 
                                                                             to_signed(-1363, 14), to_signed(-1369, 14), to_signed(-1374, 14), to_signed(-1380, 14), 
                                                                             to_signed(-1386, 14), to_signed(-1392, 14), to_signed(-1398, 14), to_signed(-1404, 14), 
                                                                             to_signed(-1410, 14), to_signed(-1416, 14), to_signed(-1422, 14), to_signed(-1428, 14), 
                                                                             to_signed(-1434, 14), to_signed(-1439, 14), to_signed(-1445, 14), to_signed(-1451, 14), 
                                                                             to_signed(-1457, 14), to_signed(-1463, 14), to_signed(-1469, 14), to_signed(-1475, 14), 
                                                                             to_signed(-1480, 14), to_signed(-1486, 14), to_signed(-1492, 14), to_signed(-1498, 14), 
                                                                             to_signed(-1504, 14), to_signed(-1510, 14), to_signed(-1516, 14), to_signed(-1521, 14), 
                                                                             to_signed(-1527, 14), to_signed(-1533, 14), to_signed(-1539, 14), to_signed(-1545, 14), 
                                                                             to_signed(-1551, 14), to_signed(-1556, 14), to_signed(-1562, 14), to_signed(-1568, 14), 
                                                                             to_signed(-1574, 14), to_signed(-1580, 14), to_signed(-1585, 14), to_signed(-1591, 14), 
                                                                             to_signed(-1597, 14), to_signed(-1603, 14), to_signed(-1609, 14), to_signed(-1614, 14), 
                                                                             to_signed(-1620, 14), to_signed(-1626, 14), to_signed(-1632, 14), to_signed(-1637, 14), 
                                                                             to_signed(-1643, 14), to_signed(-1649, 14), to_signed(-1655, 14), to_signed(-1660, 14), 
                                                                             to_signed(-1666, 14), to_signed(-1672, 14), to_signed(-1678, 14), to_signed(-1683, 14), 
                                                                             to_signed(-1689, 14), to_signed(-1695, 14), to_signed(-1700, 14), to_signed(-1706, 14), 
                                                                             to_signed(-1712, 14), to_signed(-1718, 14), to_signed(-1723, 14), to_signed(-1729, 14), 
                                                                             to_signed(-1735, 14), to_signed(-1740, 14), to_signed(-1746, 14), to_signed(-1752, 14), 
                                                                             to_signed(-1757, 14), to_signed(-1763, 14), to_signed(-1769, 14), to_signed(-1774, 14), 
                                                                             to_signed(-1780, 14), to_signed(-1786, 14), to_signed(-1791, 14), to_signed(-1797, 14), 
                                                                             to_signed(-1803, 14), to_signed(-1808, 14), to_signed(-1814, 14), to_signed(-1820, 14), 
                                                                             to_signed(-1825, 14), to_signed(-1831, 14), to_signed(-1836, 14), to_signed(-1842, 14), 
                                                                             to_signed(-1848, 14), to_signed(-1853, 14), to_signed(-1859, 14), to_signed(-1865, 14), 
                                                                             to_signed(-1870, 14), to_signed(-1876, 14), to_signed(-1881, 14), to_signed(-1887, 14), 
                                                                             to_signed(-1892, 14), to_signed(-1898, 14), to_signed(-1904, 14), to_signed(-1909, 14), 
                                                                             to_signed(-1915, 14), to_signed(-1920, 14), to_signed(-1926, 14), to_signed(-1931, 14), 
                                                                             to_signed(-1937, 14), to_signed(-1942, 14), to_signed(-1948, 14), to_signed(-1953, 14), 
                                                                             to_signed(-1959, 14), to_signed(-1965, 14), to_signed(-1970, 14), to_signed(-1976, 14), 
                                                                             to_signed(-1981, 14), to_signed(-1987, 14), to_signed(-1992, 14), to_signed(-1998, 14), 
                                                                             to_signed(-2003, 14), to_signed(-2008, 14), to_signed(-2014, 14), to_signed(-2019, 14), 
                                                                             to_signed(-2025, 14), to_signed(-2030, 14), to_signed(-2036, 14), to_signed(-2041, 14), 
                                                                             to_signed(-2047, 14), to_signed(-2052, 14), to_signed(-2058, 14), to_signed(-2063, 14), 
                                                                             to_signed(-2068, 14), to_signed(-2074, 14), to_signed(-2079, 14), to_signed(-2085, 14), 
                                                                             to_signed(-2090, 14), to_signed(-2095, 14), to_signed(-2101, 14), to_signed(-2106, 14), 
                                                                             to_signed(-2112, 14), to_signed(-2117, 14), to_signed(-2122, 14), to_signed(-2128, 14), 
                                                                             to_signed(-2133, 14), to_signed(-2139, 14), to_signed(-2144, 14), to_signed(-2149, 14), 
                                                                             to_signed(-2155, 14), to_signed(-2160, 14), to_signed(-2165, 14), to_signed(-2171, 14), 
                                                                             to_signed(-2176, 14), to_signed(-2181, 14), to_signed(-2187, 14), to_signed(-2192, 14), 
                                                                             to_signed(-2197, 14), to_signed(-2202, 14), to_signed(-2208, 14), to_signed(-2213, 14), 
                                                                             to_signed(-2218, 14), to_signed(-2224, 14), to_signed(-2229, 14), to_signed(-2234, 14), 
                                                                             to_signed(-2239, 14), to_signed(-2245, 14), to_signed(-2250, 14), to_signed(-2255, 14), 
                                                                             to_signed(-2260, 14), to_signed(-2266, 14), to_signed(-2271, 14), to_signed(-2276, 14), 
                                                                             to_signed(-2281, 14), to_signed(-2287, 14), to_signed(-2292, 14), to_signed(-2297, 14), 
                                                                             to_signed(-2302, 14), to_signed(-2307, 14), to_signed(-2313, 14), to_signed(-2318, 14), 
                                                                             to_signed(-2323, 14), to_signed(-2328, 14), to_signed(-2333, 14), to_signed(-2338, 14), 
                                                                             to_signed(-2344, 14), to_signed(-2349, 14), to_signed(-2354, 14), to_signed(-2359, 14), 
                                                                             to_signed(-2364, 14), to_signed(-2369, 14), to_signed(-2374, 14), to_signed(-2380, 14), 
                                                                             to_signed(-2385, 14), to_signed(-2390, 14), to_signed(-2395, 14), to_signed(-2400, 14), 
                                                                             to_signed(-2405, 14), to_signed(-2410, 14), to_signed(-2415, 14), to_signed(-2420, 14), 
                                                                             to_signed(-2425, 14), to_signed(-2430, 14), to_signed(-2435, 14), to_signed(-2440, 14), 
                                                                             to_signed(-2446, 14), to_signed(-2451, 14), to_signed(-2456, 14), to_signed(-2461, 14), 
                                                                             to_signed(-2466, 14), to_signed(-2471, 14), to_signed(-2476, 14), to_signed(-2481, 14), 
                                                                             to_signed(-2486, 14), to_signed(-2491, 14), to_signed(-2496, 14), to_signed(-2501, 14), 
                                                                             to_signed(-2506, 14), to_signed(-2511, 14), to_signed(-2516, 14), to_signed(-2520, 14), 
                                                                             to_signed(-2525, 14), to_signed(-2530, 14), to_signed(-2535, 14), to_signed(-2540, 14), 
                                                                             to_signed(-2545, 14), to_signed(-2550, 14), to_signed(-2555, 14), to_signed(-2560, 14), 
                                                                             to_signed(-2565, 14), to_signed(-2570, 14), to_signed(-2575, 14), to_signed(-2579, 14), 
                                                                             to_signed(-2584, 14), to_signed(-2589, 14), to_signed(-2594, 14), to_signed(-2599, 14), 
                                                                             to_signed(-2604, 14), to_signed(-2609, 14), to_signed(-2614, 14), to_signed(-2618, 14), 
                                                                             to_signed(-2623, 14), to_signed(-2628, 14), to_signed(-2633, 14), to_signed(-2638, 14), 
                                                                             to_signed(-2642, 14), to_signed(-2647, 14), to_signed(-2652, 14), to_signed(-2657, 14), 
                                                                             to_signed(-2662, 14), to_signed(-2666, 14), to_signed(-2671, 14), to_signed(-2676, 14), 
                                                                             to_signed(-2681, 14), to_signed(-2685, 14), to_signed(-2690, 14), to_signed(-2695, 14), 
                                                                             to_signed(-2700, 14), to_signed(-2704, 14), to_signed(-2709, 14), to_signed(-2714, 14), 
                                                                             to_signed(-2718, 14), to_signed(-2723, 14), to_signed(-2728, 14), to_signed(-2733, 14), 
                                                                             to_signed(-2737, 14), to_signed(-2742, 14), to_signed(-2747, 14), to_signed(-2751, 14), 
                                                                             to_signed(-2756, 14), to_signed(-2761, 14), to_signed(-2765, 14), to_signed(-2770, 14), 
                                                                             to_signed(-2774, 14), to_signed(-2779, 14), to_signed(-2784, 14), to_signed(-2788, 14), 
                                                                             to_signed(-2793, 14), to_signed(-2797, 14), to_signed(-2802, 14), to_signed(-2807, 14), 
                                                                             to_signed(-2811, 14), to_signed(-2816, 14), to_signed(-2820, 14), to_signed(-2825, 14), 
                                                                             to_signed(-2829, 14), to_signed(-2834, 14), to_signed(-2838, 14), to_signed(-2843, 14), 
                                                                             to_signed(-2848, 14), to_signed(-2852, 14), to_signed(-2857, 14), to_signed(-2861, 14), 
                                                                             to_signed(-2866, 14), to_signed(-2870, 14), to_signed(-2875, 14), to_signed(-2879, 14), 
                                                                             to_signed(-2883, 14), to_signed(-2888, 14), to_signed(-2892, 14), to_signed(-2897, 14), 
                                                                             to_signed(-2901, 14), to_signed(-2906, 14), to_signed(-2910, 14), to_signed(-2915, 14), 
                                                                             to_signed(-2919, 14), to_signed(-2923, 14), to_signed(-2928, 14), to_signed(-2932, 14), 
                                                                             to_signed(-2937, 14), to_signed(-2941, 14), to_signed(-2945, 14), to_signed(-2950, 14), 
                                                                             to_signed(-2954, 14), to_signed(-2958, 14), to_signed(-2963, 14), to_signed(-2967, 14), 
                                                                             to_signed(-2971, 14), to_signed(-2976, 14), to_signed(-2980, 14), to_signed(-2984, 14), 
                                                                             to_signed(-2989, 14), to_signed(-2993, 14), to_signed(-2997, 14), to_signed(-3001, 14), 
                                                                             to_signed(-3006, 14), to_signed(-3010, 14), to_signed(-3014, 14), to_signed(-3019, 14), 
                                                                             to_signed(-3023, 14), to_signed(-3027, 14), to_signed(-3031, 14), to_signed(-3035, 14), 
                                                                             to_signed(-3040, 14), to_signed(-3044, 14), to_signed(-3048, 14), to_signed(-3052, 14), 
                                                                             to_signed(-3056, 14), to_signed(-3061, 14), to_signed(-3065, 14), to_signed(-3069, 14), 
                                                                             to_signed(-3073, 14), to_signed(-3077, 14), to_signed(-3081, 14), to_signed(-3086, 14), 
                                                                             to_signed(-3090, 14), to_signed(-3094, 14), to_signed(-3098, 14), to_signed(-3102, 14), 
                                                                             to_signed(-3106, 14), to_signed(-3110, 14), to_signed(-3114, 14), to_signed(-3118, 14), 
                                                                             to_signed(-3122, 14), to_signed(-3127, 14), to_signed(-3131, 14), to_signed(-3135, 14), 
                                                                             to_signed(-3139, 14), to_signed(-3143, 14), to_signed(-3147, 14), to_signed(-3151, 14), 
                                                                             to_signed(-3155, 14), to_signed(-3159, 14), to_signed(-3163, 14), to_signed(-3167, 14), 
                                                                             to_signed(-3171, 14), to_signed(-3175, 14), to_signed(-3179, 14), to_signed(-3183, 14), 
                                                                             to_signed(-3187, 14), to_signed(-3191, 14), to_signed(-3194, 14), to_signed(-3198, 14), 
                                                                             to_signed(-3202, 14), to_signed(-3206, 14), to_signed(-3210, 14), to_signed(-3214, 14), 
                                                                             to_signed(-3218, 14), to_signed(-3222, 14), to_signed(-3226, 14), to_signed(-3230, 14), 
                                                                             to_signed(-3233, 14), to_signed(-3237, 14), to_signed(-3241, 14), to_signed(-3245, 14), 
                                                                             to_signed(-3249, 14), to_signed(-3253, 14), to_signed(-3256, 14), to_signed(-3260, 14), 
                                                                             to_signed(-3264, 14), to_signed(-3268, 14), to_signed(-3272, 14), to_signed(-3275, 14), 
                                                                             to_signed(-3279, 14), to_signed(-3283, 14), to_signed(-3287, 14), to_signed(-3290, 14), 
                                                                             to_signed(-3294, 14), to_signed(-3298, 14), to_signed(-3302, 14), to_signed(-3305, 14), 
                                                                             to_signed(-3309, 14), to_signed(-3313, 14), to_signed(-3316, 14), to_signed(-3320, 14), 
                                                                             to_signed(-3324, 14), to_signed(-3327, 14), to_signed(-3331, 14), to_signed(-3335, 14), 
                                                                             to_signed(-3338, 14), to_signed(-3342, 14), to_signed(-3346, 14), to_signed(-3349, 14), 
                                                                             to_signed(-3353, 14), to_signed(-3357, 14), to_signed(-3360, 14), to_signed(-3364, 14), 
                                                                             to_signed(-3367, 14), to_signed(-3371, 14), to_signed(-3374, 14), to_signed(-3378, 14), 
                                                                             to_signed(-3382, 14), to_signed(-3385, 14), to_signed(-3389, 14), to_signed(-3392, 14), 
                                                                             to_signed(-3396, 14), to_signed(-3399, 14), to_signed(-3403, 14), to_signed(-3406, 14), 
                                                                             to_signed(-3410, 14), to_signed(-3413, 14), to_signed(-3417, 14), to_signed(-3420, 14), 
                                                                             to_signed(-3424, 14), to_signed(-3427, 14), to_signed(-3430, 14), to_signed(-3434, 14), 
                                                                             to_signed(-3437, 14), to_signed(-3441, 14), to_signed(-3444, 14), to_signed(-3448, 14), 
                                                                             to_signed(-3451, 14), to_signed(-3454, 14), to_signed(-3458, 14), to_signed(-3461, 14), 
                                                                             to_signed(-3464, 14), to_signed(-3468, 14), to_signed(-3471, 14), to_signed(-3474, 14), 
                                                                             to_signed(-3478, 14), to_signed(-3481, 14), to_signed(-3484, 14), to_signed(-3488, 14), 
                                                                             to_signed(-3491, 14), to_signed(-3494, 14), to_signed(-3498, 14), to_signed(-3501, 14), 
                                                                             to_signed(-3504, 14), to_signed(-3507, 14), to_signed(-3511, 14), to_signed(-3514, 14), 
                                                                             to_signed(-3517, 14), to_signed(-3520, 14), to_signed(-3523, 14), to_signed(-3527, 14), 
                                                                             to_signed(-3530, 14), to_signed(-3533, 14), to_signed(-3536, 14), to_signed(-3539, 14), 
                                                                             to_signed(-3542, 14), to_signed(-3546, 14), to_signed(-3549, 14), to_signed(-3552, 14), 
                                                                             to_signed(-3555, 14), to_signed(-3558, 14), to_signed(-3561, 14), to_signed(-3564, 14), 
                                                                             to_signed(-3567, 14), to_signed(-3571, 14), to_signed(-3574, 14), to_signed(-3577, 14), 
                                                                             to_signed(-3580, 14), to_signed(-3583, 14), to_signed(-3586, 14), to_signed(-3589, 14), 
                                                                             to_signed(-3592, 14), to_signed(-3595, 14), to_signed(-3598, 14), to_signed(-3601, 14), 
                                                                             to_signed(-3604, 14), to_signed(-3607, 14), to_signed(-3610, 14), to_signed(-3613, 14), 
                                                                             to_signed(-3616, 14), to_signed(-3619, 14), to_signed(-3622, 14), to_signed(-3625, 14), 
                                                                             to_signed(-3628, 14), to_signed(-3630, 14), to_signed(-3633, 14), to_signed(-3636, 14), 
                                                                             to_signed(-3639, 14), to_signed(-3642, 14), to_signed(-3645, 14), to_signed(-3648, 14), 
                                                                             to_signed(-3651, 14), to_signed(-3653, 14), to_signed(-3656, 14), to_signed(-3659, 14), 
                                                                             to_signed(-3662, 14), to_signed(-3665, 14), to_signed(-3668, 14), to_signed(-3670, 14), 
                                                                             to_signed(-3673, 14), to_signed(-3676, 14), to_signed(-3679, 14), to_signed(-3681, 14), 
                                                                             to_signed(-3684, 14), to_signed(-3687, 14), to_signed(-3690, 14), to_signed(-3692, 14), 
                                                                             to_signed(-3695, 14), to_signed(-3698, 14), to_signed(-3701, 14), to_signed(-3703, 14), 
                                                                             to_signed(-3706, 14), to_signed(-3709, 14), to_signed(-3711, 14), to_signed(-3714, 14), 
                                                                             to_signed(-3717, 14), to_signed(-3719, 14), to_signed(-3722, 14), to_signed(-3724, 14), 
                                                                             to_signed(-3727, 14), to_signed(-3730, 14), to_signed(-3732, 14), to_signed(-3735, 14), 
                                                                             to_signed(-3737, 14), to_signed(-3740, 14), to_signed(-3743, 14), to_signed(-3745, 14), 
                                                                             to_signed(-3748, 14), to_signed(-3750, 14), to_signed(-3753, 14), to_signed(-3755, 14), 
                                                                             to_signed(-3758, 14), to_signed(-3760, 14), to_signed(-3763, 14), to_signed(-3765, 14), 
                                                                             to_signed(-3768, 14), to_signed(-3770, 14), to_signed(-3773, 14), to_signed(-3775, 14), 
                                                                             to_signed(-3777, 14), to_signed(-3780, 14), to_signed(-3782, 14), to_signed(-3785, 14), 
                                                                             to_signed(-3787, 14), to_signed(-3790, 14), to_signed(-3792, 14), to_signed(-3794, 14), 
                                                                             to_signed(-3797, 14), to_signed(-3799, 14), to_signed(-3801, 14), to_signed(-3804, 14), 
                                                                             to_signed(-3806, 14), to_signed(-3808, 14), to_signed(-3811, 14), to_signed(-3813, 14), 
                                                                             to_signed(-3815, 14), to_signed(-3817, 14), to_signed(-3820, 14), to_signed(-3822, 14), 
                                                                             to_signed(-3824, 14), to_signed(-3827, 14), to_signed(-3829, 14), to_signed(-3831, 14), 
                                                                             to_signed(-3833, 14), to_signed(-3835, 14), to_signed(-3838, 14), to_signed(-3840, 14), 
                                                                             to_signed(-3842, 14), to_signed(-3844, 14), to_signed(-3846, 14), to_signed(-3849, 14), 
                                                                             to_signed(-3851, 14), to_signed(-3853, 14), to_signed(-3855, 14), to_signed(-3857, 14), 
                                                                             to_signed(-3859, 14), to_signed(-3861, 14), to_signed(-3863, 14), to_signed(-3865, 14), 
                                                                             to_signed(-3868, 14), to_signed(-3870, 14), to_signed(-3872, 14), to_signed(-3874, 14), 
                                                                             to_signed(-3876, 14), to_signed(-3878, 14), to_signed(-3880, 14), to_signed(-3882, 14), 
                                                                             to_signed(-3884, 14), to_signed(-3886, 14), to_signed(-3888, 14), to_signed(-3890, 14), 
                                                                             to_signed(-3892, 14), to_signed(-3894, 14), to_signed(-3896, 14), to_signed(-3898, 14), 
                                                                             to_signed(-3900, 14), to_signed(-3901, 14), to_signed(-3903, 14), to_signed(-3905, 14), 
                                                                             to_signed(-3907, 14), to_signed(-3909, 14), to_signed(-3911, 14), to_signed(-3913, 14), 
                                                                             to_signed(-3915, 14), to_signed(-3916, 14), to_signed(-3918, 14), to_signed(-3920, 14), 
                                                                             to_signed(-3922, 14), to_signed(-3924, 14), to_signed(-3926, 14), to_signed(-3927, 14), 
                                                                             to_signed(-3929, 14), to_signed(-3931, 14), to_signed(-3933, 14), to_signed(-3934, 14), 
                                                                             to_signed(-3936, 14), to_signed(-3938, 14), to_signed(-3940, 14), to_signed(-3941, 14), 
                                                                             to_signed(-3943, 14), to_signed(-3945, 14), to_signed(-3946, 14), to_signed(-3948, 14), 
                                                                             to_signed(-3950, 14), to_signed(-3951, 14), to_signed(-3953, 14), to_signed(-3955, 14), 
                                                                             to_signed(-3956, 14), to_signed(-3958, 14), to_signed(-3960, 14), to_signed(-3961, 14), 
                                                                             to_signed(-3963, 14), to_signed(-3964, 14), to_signed(-3966, 14), to_signed(-3968, 14), 
                                                                             to_signed(-3969, 14), to_signed(-3971, 14), to_signed(-3972, 14), to_signed(-3974, 14), 
                                                                             to_signed(-3975, 14), to_signed(-3977, 14), to_signed(-3978, 14), to_signed(-3980, 14), 
                                                                             to_signed(-3981, 14), to_signed(-3983, 14), to_signed(-3984, 14), to_signed(-3986, 14), 
                                                                             to_signed(-3987, 14), to_signed(-3989, 14), to_signed(-3990, 14), to_signed(-3991, 14), 
                                                                             to_signed(-3993, 14), to_signed(-3994, 14), to_signed(-3996, 14), to_signed(-3997, 14), 
                                                                             to_signed(-3998, 14), to_signed(-4000, 14), to_signed(-4001, 14), to_signed(-4002, 14), 
                                                                             to_signed(-4004, 14), to_signed(-4005, 14), to_signed(-4006, 14), to_signed(-4008, 14), 
                                                                             to_signed(-4009, 14), to_signed(-4010, 14), to_signed(-4012, 14), to_signed(-4013, 14), 
                                                                             to_signed(-4014, 14), to_signed(-4015, 14), to_signed(-4017, 14), to_signed(-4018, 14), 
                                                                             to_signed(-4019, 14), to_signed(-4020, 14), to_signed(-4021, 14), to_signed(-4023, 14), 
                                                                             to_signed(-4024, 14), to_signed(-4025, 14), to_signed(-4026, 14), to_signed(-4027, 14), 
                                                                             to_signed(-4028, 14), to_signed(-4030, 14), to_signed(-4031, 14), to_signed(-4032, 14), 
                                                                             to_signed(-4033, 14), to_signed(-4034, 14), to_signed(-4035, 14), to_signed(-4036, 14), 
                                                                             to_signed(-4037, 14), to_signed(-4038, 14), to_signed(-4039, 14), to_signed(-4040, 14), 
                                                                             to_signed(-4041, 14), to_signed(-4042, 14), to_signed(-4043, 14), to_signed(-4044, 14), 
                                                                             to_signed(-4045, 14), to_signed(-4046, 14), to_signed(-4047, 14), to_signed(-4048, 14), 
                                                                             to_signed(-4049, 14), to_signed(-4050, 14), to_signed(-4051, 14), to_signed(-4052, 14), 
                                                                             to_signed(-4053, 14), to_signed(-4054, 14), to_signed(-4055, 14), to_signed(-4056, 14), 
                                                                             to_signed(-4057, 14), to_signed(-4058, 14), to_signed(-4058, 14), to_signed(-4059, 14), 
                                                                             to_signed(-4060, 14), to_signed(-4061, 14), to_signed(-4062, 14), to_signed(-4063, 14), 
                                                                             to_signed(-4063, 14), to_signed(-4064, 14), to_signed(-4065, 14), to_signed(-4066, 14), 
                                                                             to_signed(-4066, 14), to_signed(-4067, 14), to_signed(-4068, 14), to_signed(-4069, 14), 
                                                                             to_signed(-4069, 14), to_signed(-4070, 14), to_signed(-4071, 14), to_signed(-4072, 14), 
                                                                             to_signed(-4072, 14), to_signed(-4073, 14), to_signed(-4074, 14), to_signed(-4074, 14), 
                                                                             to_signed(-4075, 14), to_signed(-4076, 14), to_signed(-4076, 14), to_signed(-4077, 14), 
                                                                             to_signed(-4077, 14), to_signed(-4078, 14), to_signed(-4079, 14), to_signed(-4079, 14), 
                                                                             to_signed(-4080, 14), to_signed(-4080, 14), to_signed(-4081, 14), to_signed(-4081, 14), 
                                                                             to_signed(-4082, 14), to_signed(-4082, 14), to_signed(-4083, 14), to_signed(-4083, 14), 
                                                                             to_signed(-4084, 14), to_signed(-4084, 14), to_signed(-4085, 14), to_signed(-4085, 14), 
                                                                             to_signed(-4086, 14), to_signed(-4086, 14), to_signed(-4087, 14), to_signed(-4087, 14), 
                                                                             to_signed(-4088, 14), to_signed(-4088, 14), to_signed(-4088, 14), to_signed(-4089, 14), 
                                                                             to_signed(-4089, 14), to_signed(-4090, 14), to_signed(-4090, 14), to_signed(-4090, 14), 
                                                                             to_signed(-4091, 14), to_signed(-4091, 14), to_signed(-4091, 14), to_signed(-4092, 14), 
                                                                             to_signed(-4092, 14), to_signed(-4092, 14), to_signed(-4092, 14), to_signed(-4093, 14), 
                                                                             to_signed(-4093, 14), to_signed(-4093, 14), to_signed(-4093, 14), to_signed(-4094, 14), 
                                                                             to_signed(-4094, 14), to_signed(-4094, 14), to_signed(-4094, 14), to_signed(-4095, 14), 
                                                                             to_signed(-4095, 14), to_signed(-4095, 14), to_signed(-4095, 14), to_signed(-4095, 14), 
                                                                             to_signed(-4095, 14), to_signed(-4096, 14), to_signed(-4096, 14), to_signed(-4096, 14), 
                                                                             to_signed(-4096, 14), to_signed(-4096, 14), to_signed(-4096, 14), to_signed(-4096, 14), 
                                                                             to_signed(-4096, 14), to_signed(-4096, 14), to_signed(-4096, 14), to_signed(-4096, 14), 
                                                                             to_signed(-4096, 14), to_signed(-4096, 14), to_signed(-4096, 14), to_signed(-4096, 14), 
                                                                             to_signed(-4096, 14), to_signed(-4096, 14), to_signed(-4096, 14), to_signed(-4096, 14), 
                                                                             to_signed(-4096, 14), to_signed(-4096, 14), to_signed(-4096, 14), to_signed(-4096, 14), 
                                                                             to_signed(-4096, 14), to_signed(-4096, 14), to_signed(-4096, 14), to_signed(-4096, 14), 
                                                                             to_signed(-4096, 14), to_signed(-4096, 14), to_signed(-4095, 14), to_signed(-4095, 14), 
                                                                             to_signed(-4095, 14), to_signed(-4095, 14), to_signed(-4095, 14), to_signed(-4095, 14), 
                                                                             to_signed(-4094, 14), to_signed(-4094, 14), to_signed(-4094, 14), to_signed(-4094, 14), 
                                                                             to_signed(-4093, 14), to_signed(-4093, 14), to_signed(-4093, 14), to_signed(-4093, 14), 
                                                                             to_signed(-4092, 14), to_signed(-4092, 14), to_signed(-4092, 14), to_signed(-4092, 14), 
                                                                             to_signed(-4091, 14), to_signed(-4091, 14), to_signed(-4091, 14), to_signed(-4090, 14), 
                                                                             to_signed(-4090, 14), to_signed(-4090, 14), to_signed(-4089, 14), to_signed(-4089, 14), 
                                                                             to_signed(-4088, 14), to_signed(-4088, 14), to_signed(-4088, 14), to_signed(-4087, 14), 
                                                                             to_signed(-4087, 14), to_signed(-4086, 14), to_signed(-4086, 14), to_signed(-4085, 14), 
                                                                             to_signed(-4085, 14), to_signed(-4084, 14), to_signed(-4084, 14), to_signed(-4083, 14), 
                                                                             to_signed(-4083, 14), to_signed(-4082, 14), to_signed(-4082, 14), to_signed(-4081, 14), 
                                                                             to_signed(-4081, 14), to_signed(-4080, 14), to_signed(-4080, 14), to_signed(-4079, 14), 
                                                                             to_signed(-4079, 14), to_signed(-4078, 14), to_signed(-4077, 14), to_signed(-4077, 14), 
                                                                             to_signed(-4076, 14), to_signed(-4076, 14), to_signed(-4075, 14), to_signed(-4074, 14), 
                                                                             to_signed(-4074, 14), to_signed(-4073, 14), to_signed(-4072, 14), to_signed(-4072, 14), 
                                                                             to_signed(-4071, 14), to_signed(-4070, 14), to_signed(-4069, 14), to_signed(-4069, 14), 
                                                                             to_signed(-4068, 14), to_signed(-4067, 14), to_signed(-4066, 14), to_signed(-4066, 14), 
                                                                             to_signed(-4065, 14), to_signed(-4064, 14), to_signed(-4063, 14), to_signed(-4063, 14), 
                                                                             to_signed(-4062, 14), to_signed(-4061, 14), to_signed(-4060, 14), to_signed(-4059, 14), 
                                                                             to_signed(-4058, 14), to_signed(-4058, 14), to_signed(-4057, 14), to_signed(-4056, 14), 
                                                                             to_signed(-4055, 14), to_signed(-4054, 14), to_signed(-4053, 14), to_signed(-4052, 14), 
                                                                             to_signed(-4051, 14), to_signed(-4050, 14), to_signed(-4049, 14), to_signed(-4048, 14), 
                                                                             to_signed(-4047, 14), to_signed(-4046, 14), to_signed(-4045, 14), to_signed(-4044, 14), 
                                                                             to_signed(-4043, 14), to_signed(-4042, 14), to_signed(-4041, 14), to_signed(-4040, 14), 
                                                                             to_signed(-4039, 14), to_signed(-4038, 14), to_signed(-4037, 14), to_signed(-4036, 14), 
                                                                             to_signed(-4035, 14), to_signed(-4034, 14), to_signed(-4033, 14), to_signed(-4032, 14), 
                                                                             to_signed(-4031, 14), to_signed(-4030, 14), to_signed(-4028, 14), to_signed(-4027, 14), 
                                                                             to_signed(-4026, 14), to_signed(-4025, 14), to_signed(-4024, 14), to_signed(-4023, 14), 
                                                                             to_signed(-4021, 14), to_signed(-4020, 14), to_signed(-4019, 14), to_signed(-4018, 14), 
                                                                             to_signed(-4017, 14), to_signed(-4015, 14), to_signed(-4014, 14), to_signed(-4013, 14), 
                                                                             to_signed(-4012, 14), to_signed(-4010, 14), to_signed(-4009, 14), to_signed(-4008, 14), 
                                                                             to_signed(-4006, 14), to_signed(-4005, 14), to_signed(-4004, 14), to_signed(-4002, 14), 
                                                                             to_signed(-4001, 14), to_signed(-4000, 14), to_signed(-3998, 14), to_signed(-3997, 14), 
                                                                             to_signed(-3996, 14), to_signed(-3994, 14), to_signed(-3993, 14), to_signed(-3991, 14), 
                                                                             to_signed(-3990, 14), to_signed(-3989, 14), to_signed(-3987, 14), to_signed(-3986, 14), 
                                                                             to_signed(-3984, 14), to_signed(-3983, 14), to_signed(-3981, 14), to_signed(-3980, 14), 
                                                                             to_signed(-3978, 14), to_signed(-3977, 14), to_signed(-3975, 14), to_signed(-3974, 14), 
                                                                             to_signed(-3972, 14), to_signed(-3971, 14), to_signed(-3969, 14), to_signed(-3968, 14), 
                                                                             to_signed(-3966, 14), to_signed(-3964, 14), to_signed(-3963, 14), to_signed(-3961, 14), 
                                                                             to_signed(-3960, 14), to_signed(-3958, 14), to_signed(-3956, 14), to_signed(-3955, 14), 
                                                                             to_signed(-3953, 14), to_signed(-3951, 14), to_signed(-3950, 14), to_signed(-3948, 14), 
                                                                             to_signed(-3946, 14), to_signed(-3945, 14), to_signed(-3943, 14), to_signed(-3941, 14), 
                                                                             to_signed(-3940, 14), to_signed(-3938, 14), to_signed(-3936, 14), to_signed(-3934, 14), 
                                                                             to_signed(-3933, 14), to_signed(-3931, 14), to_signed(-3929, 14), to_signed(-3927, 14), 
                                                                             to_signed(-3926, 14), to_signed(-3924, 14), to_signed(-3922, 14), to_signed(-3920, 14), 
                                                                             to_signed(-3918, 14), to_signed(-3916, 14), to_signed(-3915, 14), to_signed(-3913, 14), 
                                                                             to_signed(-3911, 14), to_signed(-3909, 14), to_signed(-3907, 14), to_signed(-3905, 14), 
                                                                             to_signed(-3903, 14), to_signed(-3901, 14), to_signed(-3900, 14), to_signed(-3898, 14), 
                                                                             to_signed(-3896, 14), to_signed(-3894, 14), to_signed(-3892, 14), to_signed(-3890, 14), 
                                                                             to_signed(-3888, 14), to_signed(-3886, 14), to_signed(-3884, 14), to_signed(-3882, 14), 
                                                                             to_signed(-3880, 14), to_signed(-3878, 14), to_signed(-3876, 14), to_signed(-3874, 14), 
                                                                             to_signed(-3872, 14), to_signed(-3870, 14), to_signed(-3868, 14), to_signed(-3865, 14), 
                                                                             to_signed(-3863, 14), to_signed(-3861, 14), to_signed(-3859, 14), to_signed(-3857, 14), 
                                                                             to_signed(-3855, 14), to_signed(-3853, 14), to_signed(-3851, 14), to_signed(-3849, 14), 
                                                                             to_signed(-3846, 14), to_signed(-3844, 14), to_signed(-3842, 14), to_signed(-3840, 14), 
                                                                             to_signed(-3838, 14), to_signed(-3835, 14), to_signed(-3833, 14), to_signed(-3831, 14), 
                                                                             to_signed(-3829, 14), to_signed(-3827, 14), to_signed(-3824, 14), to_signed(-3822, 14), 
                                                                             to_signed(-3820, 14), to_signed(-3817, 14), to_signed(-3815, 14), to_signed(-3813, 14), 
                                                                             to_signed(-3811, 14), to_signed(-3808, 14), to_signed(-3806, 14), to_signed(-3804, 14), 
                                                                             to_signed(-3801, 14), to_signed(-3799, 14), to_signed(-3797, 14), to_signed(-3794, 14), 
                                                                             to_signed(-3792, 14), to_signed(-3790, 14), to_signed(-3787, 14), to_signed(-3785, 14), 
                                                                             to_signed(-3782, 14), to_signed(-3780, 14), to_signed(-3777, 14), to_signed(-3775, 14), 
                                                                             to_signed(-3773, 14), to_signed(-3770, 14), to_signed(-3768, 14), to_signed(-3765, 14), 
                                                                             to_signed(-3763, 14), to_signed(-3760, 14), to_signed(-3758, 14), to_signed(-3755, 14), 
                                                                             to_signed(-3753, 14), to_signed(-3750, 14), to_signed(-3748, 14), to_signed(-3745, 14), 
                                                                             to_signed(-3743, 14), to_signed(-3740, 14), to_signed(-3737, 14), to_signed(-3735, 14), 
                                                                             to_signed(-3732, 14), to_signed(-3730, 14), to_signed(-3727, 14), to_signed(-3724, 14), 
                                                                             to_signed(-3722, 14), to_signed(-3719, 14), to_signed(-3717, 14), to_signed(-3714, 14), 
                                                                             to_signed(-3711, 14), to_signed(-3709, 14), to_signed(-3706, 14), to_signed(-3703, 14), 
                                                                             to_signed(-3701, 14), to_signed(-3698, 14), to_signed(-3695, 14), to_signed(-3692, 14), 
                                                                             to_signed(-3690, 14), to_signed(-3687, 14), to_signed(-3684, 14), to_signed(-3681, 14), 
                                                                             to_signed(-3679, 14), to_signed(-3676, 14), to_signed(-3673, 14), to_signed(-3670, 14), 
                                                                             to_signed(-3668, 14), to_signed(-3665, 14), to_signed(-3662, 14), to_signed(-3659, 14), 
                                                                             to_signed(-3656, 14), to_signed(-3653, 14), to_signed(-3651, 14), to_signed(-3648, 14), 
                                                                             to_signed(-3645, 14), to_signed(-3642, 14), to_signed(-3639, 14), to_signed(-3636, 14), 
                                                                             to_signed(-3633, 14), to_signed(-3630, 14), to_signed(-3628, 14), to_signed(-3625, 14), 
                                                                             to_signed(-3622, 14), to_signed(-3619, 14), to_signed(-3616, 14), to_signed(-3613, 14), 
                                                                             to_signed(-3610, 14), to_signed(-3607, 14), to_signed(-3604, 14), to_signed(-3601, 14), 
                                                                             to_signed(-3598, 14), to_signed(-3595, 14), to_signed(-3592, 14), to_signed(-3589, 14), 
                                                                             to_signed(-3586, 14), to_signed(-3583, 14), to_signed(-3580, 14), to_signed(-3577, 14), 
                                                                             to_signed(-3574, 14), to_signed(-3571, 14), to_signed(-3567, 14), to_signed(-3564, 14), 
                                                                             to_signed(-3561, 14), to_signed(-3558, 14), to_signed(-3555, 14), to_signed(-3552, 14), 
                                                                             to_signed(-3549, 14), to_signed(-3546, 14), to_signed(-3542, 14), to_signed(-3539, 14), 
                                                                             to_signed(-3536, 14), to_signed(-3533, 14), to_signed(-3530, 14), to_signed(-3527, 14), 
                                                                             to_signed(-3523, 14), to_signed(-3520, 14), to_signed(-3517, 14), to_signed(-3514, 14), 
                                                                             to_signed(-3511, 14), to_signed(-3507, 14), to_signed(-3504, 14), to_signed(-3501, 14), 
                                                                             to_signed(-3498, 14), to_signed(-3494, 14), to_signed(-3491, 14), to_signed(-3488, 14), 
                                                                             to_signed(-3484, 14), to_signed(-3481, 14), to_signed(-3478, 14), to_signed(-3474, 14), 
                                                                             to_signed(-3471, 14), to_signed(-3468, 14), to_signed(-3464, 14), to_signed(-3461, 14), 
                                                                             to_signed(-3458, 14), to_signed(-3454, 14), to_signed(-3451, 14), to_signed(-3448, 14), 
                                                                             to_signed(-3444, 14), to_signed(-3441, 14), to_signed(-3437, 14), to_signed(-3434, 14), 
                                                                             to_signed(-3430, 14), to_signed(-3427, 14), to_signed(-3424, 14), to_signed(-3420, 14), 
                                                                             to_signed(-3417, 14), to_signed(-3413, 14), to_signed(-3410, 14), to_signed(-3406, 14), 
                                                                             to_signed(-3403, 14), to_signed(-3399, 14), to_signed(-3396, 14), to_signed(-3392, 14), 
                                                                             to_signed(-3389, 14), to_signed(-3385, 14), to_signed(-3382, 14), to_signed(-3378, 14), 
                                                                             to_signed(-3374, 14), to_signed(-3371, 14), to_signed(-3367, 14), to_signed(-3364, 14), 
                                                                             to_signed(-3360, 14), to_signed(-3357, 14), to_signed(-3353, 14), to_signed(-3349, 14), 
                                                                             to_signed(-3346, 14), to_signed(-3342, 14), to_signed(-3338, 14), to_signed(-3335, 14), 
                                                                             to_signed(-3331, 14), to_signed(-3327, 14), to_signed(-3324, 14), to_signed(-3320, 14), 
                                                                             to_signed(-3316, 14), to_signed(-3313, 14), to_signed(-3309, 14), to_signed(-3305, 14), 
                                                                             to_signed(-3302, 14), to_signed(-3298, 14), to_signed(-3294, 14), to_signed(-3290, 14), 
                                                                             to_signed(-3287, 14), to_signed(-3283, 14), to_signed(-3279, 14), to_signed(-3275, 14), 
                                                                             to_signed(-3272, 14), to_signed(-3268, 14), to_signed(-3264, 14), to_signed(-3260, 14), 
                                                                             to_signed(-3256, 14), to_signed(-3253, 14), to_signed(-3249, 14), to_signed(-3245, 14), 
                                                                             to_signed(-3241, 14), to_signed(-3237, 14), to_signed(-3233, 14), to_signed(-3230, 14), 
                                                                             to_signed(-3226, 14), to_signed(-3222, 14), to_signed(-3218, 14), to_signed(-3214, 14), 
                                                                             to_signed(-3210, 14), to_signed(-3206, 14), to_signed(-3202, 14), to_signed(-3198, 14), 
                                                                             to_signed(-3194, 14), to_signed(-3191, 14), to_signed(-3187, 14), to_signed(-3183, 14), 
                                                                             to_signed(-3179, 14), to_signed(-3175, 14), to_signed(-3171, 14), to_signed(-3167, 14), 
                                                                             to_signed(-3163, 14), to_signed(-3159, 14), to_signed(-3155, 14), to_signed(-3151, 14), 
                                                                             to_signed(-3147, 14), to_signed(-3143, 14), to_signed(-3139, 14), to_signed(-3135, 14), 
                                                                             to_signed(-3131, 14), to_signed(-3127, 14), to_signed(-3122, 14), to_signed(-3118, 14), 
                                                                             to_signed(-3114, 14), to_signed(-3110, 14), to_signed(-3106, 14), to_signed(-3102, 14), 
                                                                             to_signed(-3098, 14), to_signed(-3094, 14), to_signed(-3090, 14), to_signed(-3086, 14), 
                                                                             to_signed(-3081, 14), to_signed(-3077, 14), to_signed(-3073, 14), to_signed(-3069, 14), 
                                                                             to_signed(-3065, 14), to_signed(-3061, 14), to_signed(-3056, 14), to_signed(-3052, 14), 
                                                                             to_signed(-3048, 14), to_signed(-3044, 14), to_signed(-3040, 14), to_signed(-3035, 14), 
                                                                             to_signed(-3031, 14), to_signed(-3027, 14), to_signed(-3023, 14), to_signed(-3019, 14), 
                                                                             to_signed(-3014, 14), to_signed(-3010, 14), to_signed(-3006, 14), to_signed(-3001, 14), 
                                                                             to_signed(-2997, 14), to_signed(-2993, 14), to_signed(-2989, 14), to_signed(-2984, 14), 
                                                                             to_signed(-2980, 14), to_signed(-2976, 14), to_signed(-2971, 14), to_signed(-2967, 14), 
                                                                             to_signed(-2963, 14), to_signed(-2958, 14), to_signed(-2954, 14), to_signed(-2950, 14), 
                                                                             to_signed(-2945, 14), to_signed(-2941, 14), to_signed(-2937, 14), to_signed(-2932, 14), 
                                                                             to_signed(-2928, 14), to_signed(-2923, 14), to_signed(-2919, 14), to_signed(-2915, 14), 
                                                                             to_signed(-2910, 14), to_signed(-2906, 14), to_signed(-2901, 14), to_signed(-2897, 14), 
                                                                             to_signed(-2892, 14), to_signed(-2888, 14), to_signed(-2883, 14), to_signed(-2879, 14), 
                                                                             to_signed(-2875, 14), to_signed(-2870, 14), to_signed(-2866, 14), to_signed(-2861, 14), 
                                                                             to_signed(-2857, 14), to_signed(-2852, 14), to_signed(-2848, 14), to_signed(-2843, 14), 
                                                                             to_signed(-2838, 14), to_signed(-2834, 14), to_signed(-2829, 14), to_signed(-2825, 14), 
                                                                             to_signed(-2820, 14), to_signed(-2816, 14), to_signed(-2811, 14), to_signed(-2807, 14), 
                                                                             to_signed(-2802, 14), to_signed(-2797, 14), to_signed(-2793, 14), to_signed(-2788, 14), 
                                                                             to_signed(-2784, 14), to_signed(-2779, 14), to_signed(-2774, 14), to_signed(-2770, 14), 
                                                                             to_signed(-2765, 14), to_signed(-2761, 14), to_signed(-2756, 14), to_signed(-2751, 14), 
                                                                             to_signed(-2747, 14), to_signed(-2742, 14), to_signed(-2737, 14), to_signed(-2733, 14), 
                                                                             to_signed(-2728, 14), to_signed(-2723, 14), to_signed(-2718, 14), to_signed(-2714, 14), 
                                                                             to_signed(-2709, 14), to_signed(-2704, 14), to_signed(-2700, 14), to_signed(-2695, 14), 
                                                                             to_signed(-2690, 14), to_signed(-2685, 14), to_signed(-2681, 14), to_signed(-2676, 14), 
                                                                             to_signed(-2671, 14), to_signed(-2666, 14), to_signed(-2662, 14), to_signed(-2657, 14), 
                                                                             to_signed(-2652, 14), to_signed(-2647, 14), to_signed(-2642, 14), to_signed(-2638, 14), 
                                                                             to_signed(-2633, 14), to_signed(-2628, 14), to_signed(-2623, 14), to_signed(-2618, 14), 
                                                                             to_signed(-2614, 14), to_signed(-2609, 14), to_signed(-2604, 14), to_signed(-2599, 14), 
                                                                             to_signed(-2594, 14), to_signed(-2589, 14), to_signed(-2584, 14), to_signed(-2579, 14), 
                                                                             to_signed(-2575, 14), to_signed(-2570, 14), to_signed(-2565, 14), to_signed(-2560, 14), 
                                                                             to_signed(-2555, 14), to_signed(-2550, 14), to_signed(-2545, 14), to_signed(-2540, 14), 
                                                                             to_signed(-2535, 14), to_signed(-2530, 14), to_signed(-2525, 14), to_signed(-2520, 14), 
                                                                             to_signed(-2516, 14), to_signed(-2511, 14), to_signed(-2506, 14), to_signed(-2501, 14), 
                                                                             to_signed(-2496, 14), to_signed(-2491, 14), to_signed(-2486, 14), to_signed(-2481, 14), 
                                                                             to_signed(-2476, 14), to_signed(-2471, 14), to_signed(-2466, 14), to_signed(-2461, 14), 
                                                                             to_signed(-2456, 14), to_signed(-2451, 14), to_signed(-2446, 14), to_signed(-2440, 14), 
                                                                             to_signed(-2435, 14), to_signed(-2430, 14), to_signed(-2425, 14), to_signed(-2420, 14), 
                                                                             to_signed(-2415, 14), to_signed(-2410, 14), to_signed(-2405, 14), to_signed(-2400, 14), 
                                                                             to_signed(-2395, 14), to_signed(-2390, 14), to_signed(-2385, 14), to_signed(-2380, 14), 
                                                                             to_signed(-2374, 14), to_signed(-2369, 14), to_signed(-2364, 14), to_signed(-2359, 14), 
                                                                             to_signed(-2354, 14), to_signed(-2349, 14), to_signed(-2344, 14), to_signed(-2338, 14), 
                                                                             to_signed(-2333, 14), to_signed(-2328, 14), to_signed(-2323, 14), to_signed(-2318, 14), 
                                                                             to_signed(-2313, 14), to_signed(-2307, 14), to_signed(-2302, 14), to_signed(-2297, 14), 
                                                                             to_signed(-2292, 14), to_signed(-2287, 14), to_signed(-2281, 14), to_signed(-2276, 14), 
                                                                             to_signed(-2271, 14), to_signed(-2266, 14), to_signed(-2260, 14), to_signed(-2255, 14), 
                                                                             to_signed(-2250, 14), to_signed(-2245, 14), to_signed(-2239, 14), to_signed(-2234, 14), 
                                                                             to_signed(-2229, 14), to_signed(-2224, 14), to_signed(-2218, 14), to_signed(-2213, 14), 
                                                                             to_signed(-2208, 14), to_signed(-2202, 14), to_signed(-2197, 14), to_signed(-2192, 14), 
                                                                             to_signed(-2187, 14), to_signed(-2181, 14), to_signed(-2176, 14), to_signed(-2171, 14), 
                                                                             to_signed(-2165, 14), to_signed(-2160, 14), to_signed(-2155, 14), to_signed(-2149, 14), 
                                                                             to_signed(-2144, 14), to_signed(-2139, 14), to_signed(-2133, 14), to_signed(-2128, 14), 
                                                                             to_signed(-2122, 14), to_signed(-2117, 14), to_signed(-2112, 14), to_signed(-2106, 14), 
                                                                             to_signed(-2101, 14), to_signed(-2095, 14), to_signed(-2090, 14), to_signed(-2085, 14), 
                                                                             to_signed(-2079, 14), to_signed(-2074, 14), to_signed(-2068, 14), to_signed(-2063, 14), 
                                                                             to_signed(-2058, 14), to_signed(-2052, 14), to_signed(-2047, 14), to_signed(-2041, 14), 
                                                                             to_signed(-2036, 14), to_signed(-2030, 14), to_signed(-2025, 14), to_signed(-2019, 14), 
                                                                             to_signed(-2014, 14), to_signed(-2008, 14), to_signed(-2003, 14), to_signed(-1998, 14), 
                                                                             to_signed(-1992, 14), to_signed(-1987, 14), to_signed(-1981, 14), to_signed(-1976, 14), 
                                                                             to_signed(-1970, 14), to_signed(-1965, 14), to_signed(-1959, 14), to_signed(-1953, 14), 
                                                                             to_signed(-1948, 14), to_signed(-1942, 14), to_signed(-1937, 14), to_signed(-1931, 14), 
                                                                             to_signed(-1926, 14), to_signed(-1920, 14), to_signed(-1915, 14), to_signed(-1909, 14), 
                                                                             to_signed(-1904, 14), to_signed(-1898, 14), to_signed(-1892, 14), to_signed(-1887, 14), 
                                                                             to_signed(-1881, 14), to_signed(-1876, 14), to_signed(-1870, 14), to_signed(-1865, 14), 
                                                                             to_signed(-1859, 14), to_signed(-1853, 14), to_signed(-1848, 14), to_signed(-1842, 14), 
                                                                             to_signed(-1836, 14), to_signed(-1831, 14), to_signed(-1825, 14), to_signed(-1820, 14), 
                                                                             to_signed(-1814, 14), to_signed(-1808, 14), to_signed(-1803, 14), to_signed(-1797, 14), 
                                                                             to_signed(-1791, 14), to_signed(-1786, 14), to_signed(-1780, 14), to_signed(-1774, 14), 
                                                                             to_signed(-1769, 14), to_signed(-1763, 14), to_signed(-1757, 14), to_signed(-1752, 14), 
                                                                             to_signed(-1746, 14), to_signed(-1740, 14), to_signed(-1735, 14), to_signed(-1729, 14), 
                                                                             to_signed(-1723, 14), to_signed(-1718, 14), to_signed(-1712, 14), to_signed(-1706, 14), 
                                                                             to_signed(-1700, 14), to_signed(-1695, 14), to_signed(-1689, 14), to_signed(-1683, 14), 
                                                                             to_signed(-1678, 14), to_signed(-1672, 14), to_signed(-1666, 14), to_signed(-1660, 14), 
                                                                             to_signed(-1655, 14), to_signed(-1649, 14), to_signed(-1643, 14), to_signed(-1637, 14), 
                                                                             to_signed(-1632, 14), to_signed(-1626, 14), to_signed(-1620, 14), to_signed(-1614, 14), 
                                                                             to_signed(-1609, 14), to_signed(-1603, 14), to_signed(-1597, 14), to_signed(-1591, 14), 
                                                                             to_signed(-1585, 14), to_signed(-1580, 14), to_signed(-1574, 14), to_signed(-1568, 14), 
                                                                             to_signed(-1562, 14), to_signed(-1556, 14), to_signed(-1551, 14), to_signed(-1545, 14), 
                                                                             to_signed(-1539, 14), to_signed(-1533, 14), to_signed(-1527, 14), to_signed(-1521, 14), 
                                                                             to_signed(-1516, 14), to_signed(-1510, 14), to_signed(-1504, 14), to_signed(-1498, 14), 
                                                                             to_signed(-1492, 14), to_signed(-1486, 14), to_signed(-1480, 14), to_signed(-1475, 14), 
                                                                             to_signed(-1469, 14), to_signed(-1463, 14), to_signed(-1457, 14), to_signed(-1451, 14), 
                                                                             to_signed(-1445, 14), to_signed(-1439, 14), to_signed(-1434, 14), to_signed(-1428, 14), 
                                                                             to_signed(-1422, 14), to_signed(-1416, 14), to_signed(-1410, 14), to_signed(-1404, 14), 
                                                                             to_signed(-1398, 14), to_signed(-1392, 14), to_signed(-1386, 14), to_signed(-1380, 14), 
                                                                             to_signed(-1374, 14), to_signed(-1369, 14), to_signed(-1363, 14), to_signed(-1357, 14), 
                                                                             to_signed(-1351, 14), to_signed(-1345, 14), to_signed(-1339, 14), to_signed(-1333, 14), 
                                                                             to_signed(-1327, 14), to_signed(-1321, 14), to_signed(-1315, 14), to_signed(-1309, 14), 
                                                                             to_signed(-1303, 14), to_signed(-1297, 14), to_signed(-1291, 14), to_signed(-1285, 14), 
                                                                             to_signed(-1279, 14), to_signed(-1273, 14), to_signed(-1267, 14), to_signed(-1261, 14), 
                                                                             to_signed(-1255, 14), to_signed(-1249, 14), to_signed(-1244, 14), to_signed(-1238, 14), 
                                                                             to_signed(-1232, 14), to_signed(-1226, 14), to_signed(-1220, 14), to_signed(-1214, 14), 
                                                                             to_signed(-1208, 14), to_signed(-1202, 14), to_signed(-1196, 14), to_signed(-1190, 14), 
                                                                             to_signed(-1183, 14), to_signed(-1177, 14), to_signed(-1171, 14), to_signed(-1165, 14), 
                                                                             to_signed(-1159, 14), to_signed(-1153, 14), to_signed(-1147, 14), to_signed(-1141, 14), 
                                                                             to_signed(-1135, 14), to_signed(-1129, 14), to_signed(-1123, 14), to_signed(-1117, 14), 
                                                                             to_signed(-1111, 14), to_signed(-1105, 14), to_signed(-1099, 14), to_signed(-1093, 14), 
                                                                             to_signed(-1087, 14), to_signed(-1081, 14), to_signed(-1075, 14), to_signed(-1069, 14), 
                                                                             to_signed(-1063, 14), to_signed(-1057, 14), to_signed(-1051, 14), to_signed(-1044, 14), 
                                                                             to_signed(-1038, 14), to_signed(-1032, 14), to_signed(-1026, 14), to_signed(-1020, 14), 
                                                                             to_signed(-1014, 14), to_signed(-1008, 14), to_signed(-1002, 14), to_signed(-996, 14), 
                                                                             to_signed(-990, 14), to_signed(-984, 14), to_signed(-977, 14), to_signed(-971, 14), 
                                                                             to_signed(-965, 14), to_signed(-959, 14), to_signed(-953, 14), to_signed(-947, 14), 
                                                                             to_signed(-941, 14), to_signed(-935, 14), to_signed(-929, 14), to_signed(-922, 14), 
                                                                             to_signed(-916, 14), to_signed(-910, 14), to_signed(-904, 14), to_signed(-898, 14), 
                                                                             to_signed(-892, 14), to_signed(-886, 14), to_signed(-880, 14), to_signed(-873, 14), 
                                                                             to_signed(-867, 14), to_signed(-861, 14), to_signed(-855, 14), to_signed(-849, 14), 
                                                                             to_signed(-843, 14), to_signed(-837, 14), to_signed(-830, 14), to_signed(-824, 14), 
                                                                             to_signed(-818, 14), to_signed(-812, 14), to_signed(-806, 14), to_signed(-800, 14), 
                                                                             to_signed(-793, 14), to_signed(-787, 14), to_signed(-781, 14), to_signed(-775, 14), 
                                                                             to_signed(-769, 14), to_signed(-763, 14), to_signed(-756, 14), to_signed(-750, 14), 
                                                                             to_signed(-744, 14), to_signed(-738, 14), to_signed(-732, 14), to_signed(-726, 14), 
                                                                             to_signed(-719, 14), to_signed(-713, 14), to_signed(-707, 14), to_signed(-701, 14), 
                                                                             to_signed(-695, 14), to_signed(-688, 14), to_signed(-682, 14), to_signed(-676, 14), 
                                                                             to_signed(-670, 14), to_signed(-664, 14), to_signed(-657, 14), to_signed(-651, 14), 
                                                                             to_signed(-645, 14), to_signed(-639, 14), to_signed(-633, 14), to_signed(-626, 14), 
                                                                             to_signed(-620, 14), to_signed(-614, 14), to_signed(-608, 14), to_signed(-602, 14), 
                                                                             to_signed(-595, 14), to_signed(-589, 14), to_signed(-583, 14), to_signed(-577, 14), 
                                                                             to_signed(-570, 14), to_signed(-564, 14), to_signed(-558, 14), to_signed(-552, 14), 
                                                                             to_signed(-546, 14), to_signed(-539, 14), to_signed(-533, 14), to_signed(-527, 14), 
                                                                             to_signed(-521, 14), to_signed(-514, 14), to_signed(-508, 14), to_signed(-502, 14), 
                                                                             to_signed(-496, 14), to_signed(-489, 14), to_signed(-483, 14), to_signed(-477, 14), 
                                                                             to_signed(-471, 14), to_signed(-464, 14), to_signed(-458, 14), to_signed(-452, 14), 
                                                                             to_signed(-446, 14), to_signed(-439, 14), to_signed(-433, 14), to_signed(-427, 14), 
                                                                             to_signed(-421, 14), to_signed(-414, 14), to_signed(-408, 14), to_signed(-402, 14), 
                                                                             to_signed(-396, 14), to_signed(-389, 14), to_signed(-383, 14), to_signed(-377, 14), 
                                                                             to_signed(-371, 14), to_signed(-364, 14), to_signed(-358, 14), to_signed(-352, 14), 
                                                                             to_signed(-346, 14), to_signed(-339, 14), to_signed(-333, 14), to_signed(-327, 14), 
                                                                             to_signed(-321, 14), to_signed(-314, 14), to_signed(-308, 14), to_signed(-302, 14), 
                                                                             to_signed(-296, 14), to_signed(-289, 14), to_signed(-283, 14), to_signed(-277, 14), 
                                                                             to_signed(-270, 14), to_signed(-264, 14), to_signed(-258, 14), to_signed(-252, 14), 
                                                                             to_signed(-245, 14), to_signed(-239, 14), to_signed(-233, 14), to_signed(-227, 14), 
                                                                             to_signed(-220, 14), to_signed(-214, 14), to_signed(-208, 14), to_signed(-201, 14), 
                                                                             to_signed(-195, 14), to_signed(-189, 14), to_signed(-183, 14), to_signed(-176, 14), 
                                                                             to_signed(-170, 14), to_signed(-164, 14), to_signed(-158, 14), to_signed(-151, 14), 
                                                                             to_signed(-145, 14), to_signed(-139, 14), to_signed(-132, 14), to_signed(-126, 14), 
                                                                             to_signed(-120, 14), to_signed(-114, 14), to_signed(-107, 14), to_signed(-101, 14), 
                                                                             to_signed(-95, 14), to_signed(-88, 14), to_signed(-82, 14), to_signed(-76, 14), to_signed(-70, 14), 
                                                                             to_signed(-63, 14), to_signed(-57, 14), to_signed(-51, 14), to_signed(-44, 14), to_signed(-38, 14), 
                                                                             to_signed(-32, 14), to_signed(-26, 14), to_signed(-19, 14), to_signed(-13, 14), to_signed(-7, 14) );  -- sfix14 [4096]
  CONSTANT lCos                           : vector_of_signed14(0 TO 4095) := ( to_signed(4096, 14), to_signed(4095, 14), to_signed(4095, 14), to_signed(4095, 14), 
                                                                             to_signed(4095, 14), to_signed(4095, 14), to_signed(4095, 14), to_signed(4095, 14), 
                                                                             to_signed(4095, 14), to_signed(4095, 14), to_signed(4095, 14), to_signed(4095, 14), 
                                                                             to_signed(4095, 14), to_signed(4095, 14), to_signed(4095, 14), to_signed(4094, 14), 
                                                                             to_signed(4094, 14), to_signed(4094, 14), to_signed(4094, 14), to_signed(4094, 14), 
                                                                             to_signed(4094, 14), to_signed(4093, 14), to_signed(4093, 14), to_signed(4093, 14), 
                                                                             to_signed(4093, 14), to_signed(4092, 14), to_signed(4092, 14), to_signed(4092, 14), 
                                                                             to_signed(4092, 14), to_signed(4091, 14), to_signed(4091, 14), to_signed(4091, 14), 
                                                                             to_signed(4091, 14), to_signed(4090, 14), to_signed(4090, 14), to_signed(4090, 14), 
                                                                             to_signed(4089, 14), to_signed(4089, 14), to_signed(4089, 14), to_signed(4088, 14), 
                                                                             to_signed(4088, 14), to_signed(4087, 14), to_signed(4087, 14), to_signed(4087, 14), 
                                                                             to_signed(4086, 14), to_signed(4086, 14), to_signed(4085, 14), to_signed(4085, 14), 
                                                                             to_signed(4084, 14), to_signed(4084, 14), to_signed(4083, 14), to_signed(4083, 14), 
                                                                             to_signed(4082, 14), to_signed(4082, 14), to_signed(4081, 14), to_signed(4081, 14), 
                                                                             to_signed(4080, 14), to_signed(4080, 14), to_signed(4079, 14), to_signed(4079, 14), 
                                                                             to_signed(4078, 14), to_signed(4078, 14), to_signed(4077, 14), to_signed(4076, 14), 
                                                                             to_signed(4076, 14), to_signed(4075, 14), to_signed(4075, 14), to_signed(4074, 14), 
                                                                             to_signed(4073, 14), to_signed(4073, 14), to_signed(4072, 14), to_signed(4071, 14), 
                                                                             to_signed(4071, 14), to_signed(4070, 14), to_signed(4069, 14), to_signed(4068, 14), 
                                                                             to_signed(4068, 14), to_signed(4067, 14), to_signed(4066, 14), to_signed(4065, 14), 
                                                                             to_signed(4065, 14), to_signed(4064, 14), to_signed(4063, 14), to_signed(4062, 14), 
                                                                             to_signed(4062, 14), to_signed(4061, 14), to_signed(4060, 14), to_signed(4059, 14), 
                                                                             to_signed(4058, 14), to_signed(4057, 14), to_signed(4057, 14), to_signed(4056, 14), 
                                                                             to_signed(4055, 14), to_signed(4054, 14), to_signed(4053, 14), to_signed(4052, 14), 
                                                                             to_signed(4051, 14), to_signed(4050, 14), to_signed(4049, 14), to_signed(4048, 14), 
                                                                             to_signed(4047, 14), to_signed(4046, 14), to_signed(4045, 14), to_signed(4044, 14), 
                                                                             to_signed(4043, 14), to_signed(4042, 14), to_signed(4041, 14), to_signed(4040, 14), 
                                                                             to_signed(4039, 14), to_signed(4038, 14), to_signed(4037, 14), to_signed(4036, 14), 
                                                                             to_signed(4035, 14), to_signed(4034, 14), to_signed(4033, 14), to_signed(4032, 14), 
                                                                             to_signed(4031, 14), to_signed(4030, 14), to_signed(4029, 14), to_signed(4027, 14), 
                                                                             to_signed(4026, 14), to_signed(4025, 14), to_signed(4024, 14), to_signed(4023, 14), 
                                                                             to_signed(4022, 14), to_signed(4020, 14), to_signed(4019, 14), to_signed(4018, 14), 
                                                                             to_signed(4017, 14), to_signed(4016, 14), to_signed(4014, 14), to_signed(4013, 14), 
                                                                             to_signed(4012, 14), to_signed(4011, 14), to_signed(4009, 14), to_signed(4008, 14), 
                                                                             to_signed(4007, 14), to_signed(4005, 14), to_signed(4004, 14), to_signed(4003, 14), 
                                                                             to_signed(4001, 14), to_signed(4000, 14), to_signed(3999, 14), to_signed(3997, 14), 
                                                                             to_signed(3996, 14), to_signed(3995, 14), to_signed(3993, 14), to_signed(3992, 14), 
                                                                             to_signed(3990, 14), to_signed(3989, 14), to_signed(3988, 14), to_signed(3986, 14), 
                                                                             to_signed(3985, 14), to_signed(3983, 14), to_signed(3982, 14), to_signed(3980, 14), 
                                                                             to_signed(3979, 14), to_signed(3977, 14), to_signed(3976, 14), to_signed(3974, 14), 
                                                                             to_signed(3973, 14), to_signed(3971, 14), to_signed(3970, 14), to_signed(3968, 14), 
                                                                             to_signed(3967, 14), to_signed(3965, 14), to_signed(3963, 14), to_signed(3962, 14), 
                                                                             to_signed(3960, 14), to_signed(3959, 14), to_signed(3957, 14), to_signed(3955, 14), 
                                                                             to_signed(3954, 14), to_signed(3952, 14), to_signed(3950, 14), to_signed(3949, 14), 
                                                                             to_signed(3947, 14), to_signed(3945, 14), to_signed(3944, 14), to_signed(3942, 14), 
                                                                             to_signed(3940, 14), to_signed(3939, 14), to_signed(3937, 14), to_signed(3935, 14), 
                                                                             to_signed(3933, 14), to_signed(3932, 14), to_signed(3930, 14), to_signed(3928, 14), 
                                                                             to_signed(3926, 14), to_signed(3925, 14), to_signed(3923, 14), to_signed(3921, 14), 
                                                                             to_signed(3919, 14), to_signed(3917, 14), to_signed(3915, 14), to_signed(3914, 14), 
                                                                             to_signed(3912, 14), to_signed(3910, 14), to_signed(3908, 14), to_signed(3906, 14), 
                                                                             to_signed(3904, 14), to_signed(3902, 14), to_signed(3900, 14), to_signed(3899, 14), 
                                                                             to_signed(3897, 14), to_signed(3895, 14), to_signed(3893, 14), to_signed(3891, 14), 
                                                                             to_signed(3889, 14), to_signed(3887, 14), to_signed(3885, 14), to_signed(3883, 14), 
                                                                             to_signed(3881, 14), to_signed(3879, 14), to_signed(3877, 14), to_signed(3875, 14), 
                                                                             to_signed(3873, 14), to_signed(3871, 14), to_signed(3869, 14), to_signed(3867, 14), 
                                                                             to_signed(3864, 14), to_signed(3862, 14), to_signed(3860, 14), to_signed(3858, 14), 
                                                                             to_signed(3856, 14), to_signed(3854, 14), to_signed(3852, 14), to_signed(3850, 14), 
                                                                             to_signed(3848, 14), to_signed(3845, 14), to_signed(3843, 14), to_signed(3841, 14), 
                                                                             to_signed(3839, 14), to_signed(3837, 14), to_signed(3834, 14), to_signed(3832, 14), 
                                                                             to_signed(3830, 14), to_signed(3828, 14), to_signed(3826, 14), to_signed(3823, 14), 
                                                                             to_signed(3821, 14), to_signed(3819, 14), to_signed(3816, 14), to_signed(3814, 14), 
                                                                             to_signed(3812, 14), to_signed(3810, 14), to_signed(3807, 14), to_signed(3805, 14), 
                                                                             to_signed(3803, 14), to_signed(3800, 14), to_signed(3798, 14), to_signed(3796, 14), 
                                                                             to_signed(3793, 14), to_signed(3791, 14), to_signed(3789, 14), to_signed(3786, 14), 
                                                                             to_signed(3784, 14), to_signed(3781, 14), to_signed(3779, 14), to_signed(3776, 14), 
                                                                             to_signed(3774, 14), to_signed(3772, 14), to_signed(3769, 14), to_signed(3767, 14), 
                                                                             to_signed(3764, 14), to_signed(3762, 14), to_signed(3759, 14), to_signed(3757, 14), 
                                                                             to_signed(3754, 14), to_signed(3752, 14), to_signed(3749, 14), to_signed(3747, 14), 
                                                                             to_signed(3744, 14), to_signed(3742, 14), to_signed(3739, 14), to_signed(3736, 14), 
                                                                             to_signed(3734, 14), to_signed(3731, 14), to_signed(3729, 14), to_signed(3726, 14), 
                                                                             to_signed(3723, 14), to_signed(3721, 14), to_signed(3718, 14), to_signed(3716, 14), 
                                                                             to_signed(3713, 14), to_signed(3710, 14), to_signed(3708, 14), to_signed(3705, 14), 
                                                                             to_signed(3702, 14), to_signed(3700, 14), to_signed(3697, 14), to_signed(3694, 14), 
                                                                             to_signed(3691, 14), to_signed(3689, 14), to_signed(3686, 14), to_signed(3683, 14), 
                                                                             to_signed(3680, 14), to_signed(3678, 14), to_signed(3675, 14), to_signed(3672, 14), 
                                                                             to_signed(3669, 14), to_signed(3667, 14), to_signed(3664, 14), to_signed(3661, 14), 
                                                                             to_signed(3658, 14), to_signed(3655, 14), to_signed(3652, 14), to_signed(3650, 14), 
                                                                             to_signed(3647, 14), to_signed(3644, 14), to_signed(3641, 14), to_signed(3638, 14), 
                                                                             to_signed(3635, 14), to_signed(3632, 14), to_signed(3629, 14), to_signed(3627, 14), 
                                                                             to_signed(3624, 14), to_signed(3621, 14), to_signed(3618, 14), to_signed(3615, 14), 
                                                                             to_signed(3612, 14), to_signed(3609, 14), to_signed(3606, 14), to_signed(3603, 14), 
                                                                             to_signed(3600, 14), to_signed(3597, 14), to_signed(3594, 14), to_signed(3591, 14), 
                                                                             to_signed(3588, 14), to_signed(3585, 14), to_signed(3582, 14), to_signed(3579, 14), 
                                                                             to_signed(3576, 14), to_signed(3573, 14), to_signed(3570, 14), to_signed(3566, 14), 
                                                                             to_signed(3563, 14), to_signed(3560, 14), to_signed(3557, 14), to_signed(3554, 14), 
                                                                             to_signed(3551, 14), to_signed(3548, 14), to_signed(3545, 14), to_signed(3541, 14), 
                                                                             to_signed(3538, 14), to_signed(3535, 14), to_signed(3532, 14), to_signed(3529, 14), 
                                                                             to_signed(3526, 14), to_signed(3522, 14), to_signed(3519, 14), to_signed(3516, 14), 
                                                                             to_signed(3513, 14), to_signed(3510, 14), to_signed(3506, 14), to_signed(3503, 14), 
                                                                             to_signed(3500, 14), to_signed(3497, 14), to_signed(3493, 14), to_signed(3490, 14), 
                                                                             to_signed(3487, 14), to_signed(3483, 14), to_signed(3480, 14), to_signed(3477, 14), 
                                                                             to_signed(3473, 14), to_signed(3470, 14), to_signed(3467, 14), to_signed(3463, 14), 
                                                                             to_signed(3460, 14), to_signed(3457, 14), to_signed(3453, 14), to_signed(3450, 14), 
                                                                             to_signed(3447, 14), to_signed(3443, 14), to_signed(3440, 14), to_signed(3436, 14), 
                                                                             to_signed(3433, 14), to_signed(3429, 14), to_signed(3426, 14), to_signed(3423, 14), 
                                                                             to_signed(3419, 14), to_signed(3416, 14), to_signed(3412, 14), to_signed(3409, 14), 
                                                                             to_signed(3405, 14), to_signed(3402, 14), to_signed(3398, 14), to_signed(3395, 14), 
                                                                             to_signed(3391, 14), to_signed(3388, 14), to_signed(3384, 14), to_signed(3381, 14), 
                                                                             to_signed(3377, 14), to_signed(3373, 14), to_signed(3370, 14), to_signed(3366, 14), 
                                                                             to_signed(3363, 14), to_signed(3359, 14), to_signed(3356, 14), to_signed(3352, 14), 
                                                                             to_signed(3348, 14), to_signed(3345, 14), to_signed(3341, 14), to_signed(3337, 14), 
                                                                             to_signed(3334, 14), to_signed(3330, 14), to_signed(3326, 14), to_signed(3323, 14), 
                                                                             to_signed(3319, 14), to_signed(3315, 14), to_signed(3312, 14), to_signed(3308, 14), 
                                                                             to_signed(3304, 14), to_signed(3301, 14), to_signed(3297, 14), to_signed(3293, 14), 
                                                                             to_signed(3289, 14), to_signed(3286, 14), to_signed(3282, 14), to_signed(3278, 14), 
                                                                             to_signed(3274, 14), to_signed(3271, 14), to_signed(3267, 14), to_signed(3263, 14), 
                                                                             to_signed(3259, 14), to_signed(3255, 14), to_signed(3252, 14), to_signed(3248, 14), 
                                                                             to_signed(3244, 14), to_signed(3240, 14), to_signed(3236, 14), to_signed(3232, 14), 
                                                                             to_signed(3229, 14), to_signed(3225, 14), to_signed(3221, 14), to_signed(3217, 14), 
                                                                             to_signed(3213, 14), to_signed(3209, 14), to_signed(3205, 14), to_signed(3201, 14), 
                                                                             to_signed(3197, 14), to_signed(3193, 14), to_signed(3190, 14), to_signed(3186, 14), 
                                                                             to_signed(3182, 14), to_signed(3178, 14), to_signed(3174, 14), to_signed(3170, 14), 
                                                                             to_signed(3166, 14), to_signed(3162, 14), to_signed(3158, 14), to_signed(3154, 14), 
                                                                             to_signed(3150, 14), to_signed(3146, 14), to_signed(3142, 14), to_signed(3138, 14), 
                                                                             to_signed(3134, 14), to_signed(3130, 14), to_signed(3126, 14), to_signed(3121, 14), 
                                                                             to_signed(3117, 14), to_signed(3113, 14), to_signed(3109, 14), to_signed(3105, 14), 
                                                                             to_signed(3101, 14), to_signed(3097, 14), to_signed(3093, 14), to_signed(3089, 14), 
                                                                             to_signed(3085, 14), to_signed(3080, 14), to_signed(3076, 14), to_signed(3072, 14), 
                                                                             to_signed(3068, 14), to_signed(3064, 14), to_signed(3060, 14), to_signed(3055, 14), 
                                                                             to_signed(3051, 14), to_signed(3047, 14), to_signed(3043, 14), to_signed(3039, 14), 
                                                                             to_signed(3034, 14), to_signed(3030, 14), to_signed(3026, 14), to_signed(3022, 14), 
                                                                             to_signed(3018, 14), to_signed(3013, 14), to_signed(3009, 14), to_signed(3005, 14), 
                                                                             to_signed(3000, 14), to_signed(2996, 14), to_signed(2992, 14), to_signed(2988, 14), 
                                                                             to_signed(2983, 14), to_signed(2979, 14), to_signed(2975, 14), to_signed(2970, 14), 
                                                                             to_signed(2966, 14), to_signed(2962, 14), to_signed(2957, 14), to_signed(2953, 14), 
                                                                             to_signed(2949, 14), to_signed(2944, 14), to_signed(2940, 14), to_signed(2936, 14), 
                                                                             to_signed(2931, 14), to_signed(2927, 14), to_signed(2922, 14), to_signed(2918, 14), 
                                                                             to_signed(2914, 14), to_signed(2909, 14), to_signed(2905, 14), to_signed(2900, 14), 
                                                                             to_signed(2896, 14), to_signed(2891, 14), to_signed(2887, 14), to_signed(2882, 14), 
                                                                             to_signed(2878, 14), to_signed(2874, 14), to_signed(2869, 14), to_signed(2865, 14), 
                                                                             to_signed(2860, 14), to_signed(2856, 14), to_signed(2851, 14), to_signed(2847, 14), 
                                                                             to_signed(2842, 14), to_signed(2837, 14), to_signed(2833, 14), to_signed(2828, 14), 
                                                                             to_signed(2824, 14), to_signed(2819, 14), to_signed(2815, 14), to_signed(2810, 14), 
                                                                             to_signed(2806, 14), to_signed(2801, 14), to_signed(2796, 14), to_signed(2792, 14), 
                                                                             to_signed(2787, 14), to_signed(2783, 14), to_signed(2778, 14), to_signed(2773, 14), 
                                                                             to_signed(2769, 14), to_signed(2764, 14), to_signed(2760, 14), to_signed(2755, 14), 
                                                                             to_signed(2750, 14), to_signed(2746, 14), to_signed(2741, 14), to_signed(2736, 14), 
                                                                             to_signed(2732, 14), to_signed(2727, 14), to_signed(2722, 14), to_signed(2717, 14), 
                                                                             to_signed(2713, 14), to_signed(2708, 14), to_signed(2703, 14), to_signed(2699, 14), 
                                                                             to_signed(2694, 14), to_signed(2689, 14), to_signed(2684, 14), to_signed(2680, 14), 
                                                                             to_signed(2675, 14), to_signed(2670, 14), to_signed(2665, 14), to_signed(2661, 14), 
                                                                             to_signed(2656, 14), to_signed(2651, 14), to_signed(2646, 14), to_signed(2641, 14), 
                                                                             to_signed(2637, 14), to_signed(2632, 14), to_signed(2627, 14), to_signed(2622, 14), 
                                                                             to_signed(2617, 14), to_signed(2613, 14), to_signed(2608, 14), to_signed(2603, 14), 
                                                                             to_signed(2598, 14), to_signed(2593, 14), to_signed(2588, 14), to_signed(2583, 14), 
                                                                             to_signed(2578, 14), to_signed(2574, 14), to_signed(2569, 14), to_signed(2564, 14), 
                                                                             to_signed(2559, 14), to_signed(2554, 14), to_signed(2549, 14), to_signed(2544, 14), 
                                                                             to_signed(2539, 14), to_signed(2534, 14), to_signed(2529, 14), to_signed(2524, 14), 
                                                                             to_signed(2519, 14), to_signed(2515, 14), to_signed(2510, 14), to_signed(2505, 14), 
                                                                             to_signed(2500, 14), to_signed(2495, 14), to_signed(2490, 14), to_signed(2485, 14), 
                                                                             to_signed(2480, 14), to_signed(2475, 14), to_signed(2470, 14), to_signed(2465, 14), 
                                                                             to_signed(2460, 14), to_signed(2455, 14), to_signed(2450, 14), to_signed(2445, 14), 
                                                                             to_signed(2439, 14), to_signed(2434, 14), to_signed(2429, 14), to_signed(2424, 14), 
                                                                             to_signed(2419, 14), to_signed(2414, 14), to_signed(2409, 14), to_signed(2404, 14), 
                                                                             to_signed(2399, 14), to_signed(2394, 14), to_signed(2389, 14), to_signed(2384, 14), 
                                                                             to_signed(2379, 14), to_signed(2373, 14), to_signed(2368, 14), to_signed(2363, 14), 
                                                                             to_signed(2358, 14), to_signed(2353, 14), to_signed(2348, 14), to_signed(2343, 14), 
                                                                             to_signed(2337, 14), to_signed(2332, 14), to_signed(2327, 14), to_signed(2322, 14), 
                                                                             to_signed(2317, 14), to_signed(2312, 14), to_signed(2306, 14), to_signed(2301, 14), 
                                                                             to_signed(2296, 14), to_signed(2291, 14), to_signed(2286, 14), to_signed(2280, 14), 
                                                                             to_signed(2275, 14), to_signed(2270, 14), to_signed(2265, 14), to_signed(2259, 14), 
                                                                             to_signed(2254, 14), to_signed(2249, 14), to_signed(2244, 14), to_signed(2238, 14), 
                                                                             to_signed(2233, 14), to_signed(2228, 14), to_signed(2223, 14), to_signed(2217, 14), 
                                                                             to_signed(2212, 14), to_signed(2207, 14), to_signed(2201, 14), to_signed(2196, 14), 
                                                                             to_signed(2191, 14), to_signed(2186, 14), to_signed(2180, 14), to_signed(2175, 14), 
                                                                             to_signed(2170, 14), to_signed(2164, 14), to_signed(2159, 14), to_signed(2154, 14), 
                                                                             to_signed(2148, 14), to_signed(2143, 14), to_signed(2138, 14), to_signed(2132, 14), 
                                                                             to_signed(2127, 14), to_signed(2121, 14), to_signed(2116, 14), to_signed(2111, 14), 
                                                                             to_signed(2105, 14), to_signed(2100, 14), to_signed(2094, 14), to_signed(2089, 14), 
                                                                             to_signed(2084, 14), to_signed(2078, 14), to_signed(2073, 14), to_signed(2067, 14), 
                                                                             to_signed(2062, 14), to_signed(2057, 14), to_signed(2051, 14), to_signed(2046, 14), 
                                                                             to_signed(2040, 14), to_signed(2035, 14), to_signed(2029, 14), to_signed(2024, 14), 
                                                                             to_signed(2018, 14), to_signed(2013, 14), to_signed(2007, 14), to_signed(2002, 14), 
                                                                             to_signed(1997, 14), to_signed(1991, 14), to_signed(1986, 14), to_signed(1980, 14), 
                                                                             to_signed(1975, 14), to_signed(1969, 14), to_signed(1964, 14), to_signed(1958, 14), 
                                                                             to_signed(1952, 14), to_signed(1947, 14), to_signed(1941, 14), to_signed(1936, 14), 
                                                                             to_signed(1930, 14), to_signed(1925, 14), to_signed(1919, 14), to_signed(1914, 14), 
                                                                             to_signed(1908, 14), to_signed(1903, 14), to_signed(1897, 14), to_signed(1891, 14), 
                                                                             to_signed(1886, 14), to_signed(1880, 14), to_signed(1875, 14), to_signed(1869, 14), 
                                                                             to_signed(1864, 14), to_signed(1858, 14), to_signed(1852, 14), to_signed(1847, 14), 
                                                                             to_signed(1841, 14), to_signed(1835, 14), to_signed(1830, 14), to_signed(1824, 14), 
                                                                             to_signed(1819, 14), to_signed(1813, 14), to_signed(1807, 14), to_signed(1802, 14), 
                                                                             to_signed(1796, 14), to_signed(1790, 14), to_signed(1785, 14), to_signed(1779, 14), 
                                                                             to_signed(1773, 14), to_signed(1768, 14), to_signed(1762, 14), to_signed(1756, 14), 
                                                                             to_signed(1751, 14), to_signed(1745, 14), to_signed(1739, 14), to_signed(1734, 14), 
                                                                             to_signed(1728, 14), to_signed(1722, 14), to_signed(1717, 14), to_signed(1711, 14), 
                                                                             to_signed(1705, 14), to_signed(1699, 14), to_signed(1694, 14), to_signed(1688, 14), 
                                                                             to_signed(1682, 14), to_signed(1677, 14), to_signed(1671, 14), to_signed(1665, 14), 
                                                                             to_signed(1659, 14), to_signed(1654, 14), to_signed(1648, 14), to_signed(1642, 14), 
                                                                             to_signed(1636, 14), to_signed(1631, 14), to_signed(1625, 14), to_signed(1619, 14), 
                                                                             to_signed(1613, 14), to_signed(1608, 14), to_signed(1602, 14), to_signed(1596, 14), 
                                                                             to_signed(1590, 14), to_signed(1584, 14), to_signed(1579, 14), to_signed(1573, 14), 
                                                                             to_signed(1567, 14), to_signed(1561, 14), to_signed(1555, 14), to_signed(1550, 14), 
                                                                             to_signed(1544, 14), to_signed(1538, 14), to_signed(1532, 14), to_signed(1526, 14), 
                                                                             to_signed(1520, 14), to_signed(1515, 14), to_signed(1509, 14), to_signed(1503, 14), 
                                                                             to_signed(1497, 14), to_signed(1491, 14), to_signed(1485, 14), to_signed(1479, 14), 
                                                                             to_signed(1474, 14), to_signed(1468, 14), to_signed(1462, 14), to_signed(1456, 14), 
                                                                             to_signed(1450, 14), to_signed(1444, 14), to_signed(1438, 14), to_signed(1433, 14), 
                                                                             to_signed(1427, 14), to_signed(1421, 14), to_signed(1415, 14), to_signed(1409, 14), 
                                                                             to_signed(1403, 14), to_signed(1397, 14), to_signed(1391, 14), to_signed(1385, 14), 
                                                                             to_signed(1379, 14), to_signed(1373, 14), to_signed(1368, 14), to_signed(1362, 14), 
                                                                             to_signed(1356, 14), to_signed(1350, 14), to_signed(1344, 14), to_signed(1338, 14), 
                                                                             to_signed(1332, 14), to_signed(1326, 14), to_signed(1320, 14), to_signed(1314, 14), 
                                                                             to_signed(1308, 14), to_signed(1302, 14), to_signed(1296, 14), to_signed(1290, 14), 
                                                                             to_signed(1284, 14), to_signed(1278, 14), to_signed(1272, 14), to_signed(1266, 14), 
                                                                             to_signed(1260, 14), to_signed(1254, 14), to_signed(1248, 14), to_signed(1243, 14), 
                                                                             to_signed(1237, 14), to_signed(1231, 14), to_signed(1225, 14), to_signed(1219, 14), 
                                                                             to_signed(1213, 14), to_signed(1207, 14), to_signed(1201, 14), to_signed(1195, 14), 
                                                                             to_signed(1189, 14), to_signed(1182, 14), to_signed(1176, 14), to_signed(1170, 14), 
                                                                             to_signed(1164, 14), to_signed(1158, 14), to_signed(1152, 14), to_signed(1146, 14), 
                                                                             to_signed(1140, 14), to_signed(1134, 14), to_signed(1128, 14), to_signed(1122, 14), 
                                                                             to_signed(1116, 14), to_signed(1110, 14), to_signed(1104, 14), to_signed(1098, 14), 
                                                                             to_signed(1092, 14), to_signed(1086, 14), to_signed(1080, 14), to_signed(1074, 14), 
                                                                             to_signed(1068, 14), to_signed(1062, 14), to_signed(1056, 14), to_signed(1050, 14), 
                                                                             to_signed(1043, 14), to_signed(1037, 14), to_signed(1031, 14), to_signed(1025, 14), 
                                                                             to_signed(1019, 14), to_signed(1013, 14), to_signed(1007, 14), to_signed(1001, 14), 
                                                                             to_signed(995, 14), to_signed(989, 14), to_signed(983, 14), to_signed(976, 14), to_signed(970, 14), 
                                                                             to_signed(964, 14), to_signed(958, 14), to_signed(952, 14), to_signed(946, 14), to_signed(940, 14), 
                                                                             to_signed(934, 14), to_signed(928, 14), to_signed(921, 14), to_signed(915, 14), to_signed(909, 14), 
                                                                             to_signed(903, 14), to_signed(897, 14), to_signed(891, 14), to_signed(885, 14), to_signed(879, 14), 
                                                                             to_signed(872, 14), to_signed(866, 14), to_signed(860, 14), to_signed(854, 14), to_signed(848, 14), 
                                                                             to_signed(842, 14), to_signed(836, 14), to_signed(829, 14), to_signed(823, 14), to_signed(817, 14), 
                                                                             to_signed(811, 14), to_signed(805, 14), to_signed(799, 14), to_signed(792, 14), to_signed(786, 14), 
                                                                             to_signed(780, 14), to_signed(774, 14), to_signed(768, 14), to_signed(762, 14), to_signed(755, 14), 
                                                                             to_signed(749, 14), to_signed(743, 14), to_signed(737, 14), to_signed(731, 14), to_signed(725, 14), 
                                                                             to_signed(718, 14), to_signed(712, 14), to_signed(706, 14), to_signed(700, 14), to_signed(694, 14), 
                                                                             to_signed(687, 14), to_signed(681, 14), to_signed(675, 14), to_signed(669, 14), to_signed(663, 14), 
                                                                             to_signed(656, 14), to_signed(650, 14), to_signed(644, 14), to_signed(638, 14), to_signed(632, 14), 
                                                                             to_signed(625, 14), to_signed(619, 14), to_signed(613, 14), to_signed(607, 14), to_signed(601, 14), 
                                                                             to_signed(594, 14), to_signed(588, 14), to_signed(582, 14), to_signed(576, 14), to_signed(569, 14), 
                                                                             to_signed(563, 14), to_signed(557, 14), to_signed(551, 14), to_signed(545, 14), to_signed(538, 14), 
                                                                             to_signed(532, 14), to_signed(526, 14), to_signed(520, 14), to_signed(513, 14), to_signed(507, 14), 
                                                                             to_signed(501, 14), to_signed(495, 14), to_signed(488, 14), to_signed(482, 14), to_signed(476, 14), 
                                                                             to_signed(470, 14), to_signed(463, 14), to_signed(457, 14), to_signed(451, 14), to_signed(445, 14), 
                                                                             to_signed(438, 14), to_signed(432, 14), to_signed(426, 14), to_signed(420, 14), to_signed(413, 14), 
                                                                             to_signed(407, 14), to_signed(401, 14), to_signed(395, 14), to_signed(388, 14), to_signed(382, 14), 
                                                                             to_signed(376, 14), to_signed(370, 14), to_signed(363, 14), to_signed(357, 14), to_signed(351, 14), 
                                                                             to_signed(345, 14), to_signed(338, 14), to_signed(332, 14), to_signed(326, 14), to_signed(320, 14), 
                                                                             to_signed(313, 14), to_signed(307, 14), to_signed(301, 14), to_signed(295, 14), to_signed(288, 14), 
                                                                             to_signed(282, 14), to_signed(276, 14), to_signed(269, 14), to_signed(263, 14), to_signed(257, 14), 
                                                                             to_signed(251, 14), to_signed(244, 14), to_signed(238, 14), to_signed(232, 14), to_signed(226, 14), 
                                                                             to_signed(219, 14), to_signed(213, 14), to_signed(207, 14), to_signed(200, 14), to_signed(194, 14), 
                                                                             to_signed(188, 14), to_signed(182, 14), to_signed(175, 14), to_signed(169, 14), to_signed(163, 14), 
                                                                             to_signed(157, 14), to_signed(150, 14), to_signed(144, 14), to_signed(138, 14), to_signed(131, 14), 
                                                                             to_signed(125, 14), to_signed(119, 14), to_signed(113, 14), to_signed(106, 14), to_signed(100, 14), 
                                                                             to_signed(94, 14), to_signed(87, 14), to_signed(81, 14), to_signed(75, 14), to_signed(69, 14), 
                                                                             to_signed(62, 14), to_signed(56, 14), to_signed(50, 14), to_signed(43, 14), to_signed(37, 14), 
                                                                             to_signed(31, 14), to_signed(25, 14), to_signed(18, 14), to_signed(12, 14), to_signed(6, 14), 
                                                                             to_signed(0, 14), to_signed(-7, 14), to_signed(-13, 14), to_signed(-19, 14), to_signed(-26, 14), 
                                                                             to_signed(-32, 14), to_signed(-38, 14), to_signed(-44, 14), to_signed(-51, 14), to_signed(-57, 14), 
                                                                             to_signed(-63, 14), to_signed(-70, 14), to_signed(-76, 14), to_signed(-82, 14), to_signed(-88, 14), 
                                                                             to_signed(-95, 14), to_signed(-101, 14), to_signed(-107, 14), to_signed(-114, 14), to_signed(-120, 14), 
                                                                             to_signed(-126, 14), to_signed(-132, 14), to_signed(-139, 14), to_signed(-145, 14), 
                                                                             to_signed(-151, 14), to_signed(-158, 14), to_signed(-164, 14), to_signed(-170, 14), 
                                                                             to_signed(-176, 14), to_signed(-183, 14), to_signed(-189, 14), to_signed(-195, 14), 
                                                                             to_signed(-201, 14), to_signed(-208, 14), to_signed(-214, 14), to_signed(-220, 14), 
                                                                             to_signed(-227, 14), to_signed(-233, 14), to_signed(-239, 14), to_signed(-245, 14), 
                                                                             to_signed(-252, 14), to_signed(-258, 14), to_signed(-264, 14), to_signed(-270, 14), 
                                                                             to_signed(-277, 14), to_signed(-283, 14), to_signed(-289, 14), to_signed(-296, 14), 
                                                                             to_signed(-302, 14), to_signed(-308, 14), to_signed(-314, 14), to_signed(-321, 14), 
                                                                             to_signed(-327, 14), to_signed(-333, 14), to_signed(-339, 14), to_signed(-346, 14), 
                                                                             to_signed(-352, 14), to_signed(-358, 14), to_signed(-364, 14), to_signed(-371, 14), 
                                                                             to_signed(-377, 14), to_signed(-383, 14), to_signed(-389, 14), to_signed(-396, 14), 
                                                                             to_signed(-402, 14), to_signed(-408, 14), to_signed(-414, 14), to_signed(-421, 14), 
                                                                             to_signed(-427, 14), to_signed(-433, 14), to_signed(-439, 14), to_signed(-446, 14), 
                                                                             to_signed(-452, 14), to_signed(-458, 14), to_signed(-464, 14), to_signed(-471, 14), 
                                                                             to_signed(-477, 14), to_signed(-483, 14), to_signed(-489, 14), to_signed(-496, 14), 
                                                                             to_signed(-502, 14), to_signed(-508, 14), to_signed(-514, 14), to_signed(-521, 14), 
                                                                             to_signed(-527, 14), to_signed(-533, 14), to_signed(-539, 14), to_signed(-546, 14), 
                                                                             to_signed(-552, 14), to_signed(-558, 14), to_signed(-564, 14), to_signed(-570, 14), 
                                                                             to_signed(-577, 14), to_signed(-583, 14), to_signed(-589, 14), to_signed(-595, 14), 
                                                                             to_signed(-602, 14), to_signed(-608, 14), to_signed(-614, 14), to_signed(-620, 14), 
                                                                             to_signed(-626, 14), to_signed(-633, 14), to_signed(-639, 14), to_signed(-645, 14), 
                                                                             to_signed(-651, 14), to_signed(-657, 14), to_signed(-664, 14), to_signed(-670, 14), 
                                                                             to_signed(-676, 14), to_signed(-682, 14), to_signed(-688, 14), to_signed(-695, 14), 
                                                                             to_signed(-701, 14), to_signed(-707, 14), to_signed(-713, 14), to_signed(-719, 14), 
                                                                             to_signed(-726, 14), to_signed(-732, 14), to_signed(-738, 14), to_signed(-744, 14), 
                                                                             to_signed(-750, 14), to_signed(-756, 14), to_signed(-763, 14), to_signed(-769, 14), 
                                                                             to_signed(-775, 14), to_signed(-781, 14), to_signed(-787, 14), to_signed(-793, 14), 
                                                                             to_signed(-800, 14), to_signed(-806, 14), to_signed(-812, 14), to_signed(-818, 14), 
                                                                             to_signed(-824, 14), to_signed(-830, 14), to_signed(-837, 14), to_signed(-843, 14), 
                                                                             to_signed(-849, 14), to_signed(-855, 14), to_signed(-861, 14), to_signed(-867, 14), 
                                                                             to_signed(-873, 14), to_signed(-880, 14), to_signed(-886, 14), to_signed(-892, 14), 
                                                                             to_signed(-898, 14), to_signed(-904, 14), to_signed(-910, 14), to_signed(-916, 14), 
                                                                             to_signed(-922, 14), to_signed(-929, 14), to_signed(-935, 14), to_signed(-941, 14), 
                                                                             to_signed(-947, 14), to_signed(-953, 14), to_signed(-959, 14), to_signed(-965, 14), 
                                                                             to_signed(-971, 14), to_signed(-977, 14), to_signed(-984, 14), to_signed(-990, 14), 
                                                                             to_signed(-996, 14), to_signed(-1002, 14), to_signed(-1008, 14), to_signed(-1014, 14), 
                                                                             to_signed(-1020, 14), to_signed(-1026, 14), to_signed(-1032, 14), to_signed(-1038, 14), 
                                                                             to_signed(-1044, 14), to_signed(-1051, 14), to_signed(-1057, 14), to_signed(-1063, 14), 
                                                                             to_signed(-1069, 14), to_signed(-1075, 14), to_signed(-1081, 14), to_signed(-1087, 14), 
                                                                             to_signed(-1093, 14), to_signed(-1099, 14), to_signed(-1105, 14), to_signed(-1111, 14), 
                                                                             to_signed(-1117, 14), to_signed(-1123, 14), to_signed(-1129, 14), to_signed(-1135, 14), 
                                                                             to_signed(-1141, 14), to_signed(-1147, 14), to_signed(-1153, 14), to_signed(-1159, 14), 
                                                                             to_signed(-1165, 14), to_signed(-1171, 14), to_signed(-1177, 14), to_signed(-1183, 14), 
                                                                             to_signed(-1190, 14), to_signed(-1196, 14), to_signed(-1202, 14), to_signed(-1208, 14), 
                                                                             to_signed(-1214, 14), to_signed(-1220, 14), to_signed(-1226, 14), to_signed(-1232, 14), 
                                                                             to_signed(-1238, 14), to_signed(-1244, 14), to_signed(-1249, 14), to_signed(-1255, 14), 
                                                                             to_signed(-1261, 14), to_signed(-1267, 14), to_signed(-1273, 14), to_signed(-1279, 14), 
                                                                             to_signed(-1285, 14), to_signed(-1291, 14), to_signed(-1297, 14), to_signed(-1303, 14), 
                                                                             to_signed(-1309, 14), to_signed(-1315, 14), to_signed(-1321, 14), to_signed(-1327, 14), 
                                                                             to_signed(-1333, 14), to_signed(-1339, 14), to_signed(-1345, 14), to_signed(-1351, 14), 
                                                                             to_signed(-1357, 14), to_signed(-1363, 14), to_signed(-1369, 14), to_signed(-1374, 14), 
                                                                             to_signed(-1380, 14), to_signed(-1386, 14), to_signed(-1392, 14), to_signed(-1398, 14), 
                                                                             to_signed(-1404, 14), to_signed(-1410, 14), to_signed(-1416, 14), to_signed(-1422, 14), 
                                                                             to_signed(-1428, 14), to_signed(-1434, 14), to_signed(-1439, 14), to_signed(-1445, 14), 
                                                                             to_signed(-1451, 14), to_signed(-1457, 14), to_signed(-1463, 14), to_signed(-1469, 14), 
                                                                             to_signed(-1475, 14), to_signed(-1480, 14), to_signed(-1486, 14), to_signed(-1492, 14), 
                                                                             to_signed(-1498, 14), to_signed(-1504, 14), to_signed(-1510, 14), to_signed(-1516, 14), 
                                                                             to_signed(-1521, 14), to_signed(-1527, 14), to_signed(-1533, 14), to_signed(-1539, 14), 
                                                                             to_signed(-1545, 14), to_signed(-1551, 14), to_signed(-1556, 14), to_signed(-1562, 14), 
                                                                             to_signed(-1568, 14), to_signed(-1574, 14), to_signed(-1580, 14), to_signed(-1585, 14), 
                                                                             to_signed(-1591, 14), to_signed(-1597, 14), to_signed(-1603, 14), to_signed(-1609, 14), 
                                                                             to_signed(-1614, 14), to_signed(-1620, 14), to_signed(-1626, 14), to_signed(-1632, 14), 
                                                                             to_signed(-1637, 14), to_signed(-1643, 14), to_signed(-1649, 14), to_signed(-1655, 14), 
                                                                             to_signed(-1660, 14), to_signed(-1666, 14), to_signed(-1672, 14), to_signed(-1678, 14), 
                                                                             to_signed(-1683, 14), to_signed(-1689, 14), to_signed(-1695, 14), to_signed(-1700, 14), 
                                                                             to_signed(-1706, 14), to_signed(-1712, 14), to_signed(-1718, 14), to_signed(-1723, 14), 
                                                                             to_signed(-1729, 14), to_signed(-1735, 14), to_signed(-1740, 14), to_signed(-1746, 14), 
                                                                             to_signed(-1752, 14), to_signed(-1757, 14), to_signed(-1763, 14), to_signed(-1769, 14), 
                                                                             to_signed(-1774, 14), to_signed(-1780, 14), to_signed(-1786, 14), to_signed(-1791, 14), 
                                                                             to_signed(-1797, 14), to_signed(-1803, 14), to_signed(-1808, 14), to_signed(-1814, 14), 
                                                                             to_signed(-1820, 14), to_signed(-1825, 14), to_signed(-1831, 14), to_signed(-1836, 14), 
                                                                             to_signed(-1842, 14), to_signed(-1848, 14), to_signed(-1853, 14), to_signed(-1859, 14), 
                                                                             to_signed(-1865, 14), to_signed(-1870, 14), to_signed(-1876, 14), to_signed(-1881, 14), 
                                                                             to_signed(-1887, 14), to_signed(-1892, 14), to_signed(-1898, 14), to_signed(-1904, 14), 
                                                                             to_signed(-1909, 14), to_signed(-1915, 14), to_signed(-1920, 14), to_signed(-1926, 14), 
                                                                             to_signed(-1931, 14), to_signed(-1937, 14), to_signed(-1942, 14), to_signed(-1948, 14), 
                                                                             to_signed(-1953, 14), to_signed(-1959, 14), to_signed(-1965, 14), to_signed(-1970, 14), 
                                                                             to_signed(-1976, 14), to_signed(-1981, 14), to_signed(-1987, 14), to_signed(-1992, 14), 
                                                                             to_signed(-1998, 14), to_signed(-2003, 14), to_signed(-2008, 14), to_signed(-2014, 14), 
                                                                             to_signed(-2019, 14), to_signed(-2025, 14), to_signed(-2030, 14), to_signed(-2036, 14), 
                                                                             to_signed(-2041, 14), to_signed(-2047, 14), to_signed(-2052, 14), to_signed(-2058, 14), 
                                                                             to_signed(-2063, 14), to_signed(-2068, 14), to_signed(-2074, 14), to_signed(-2079, 14), 
                                                                             to_signed(-2085, 14), to_signed(-2090, 14), to_signed(-2095, 14), to_signed(-2101, 14), 
                                                                             to_signed(-2106, 14), to_signed(-2112, 14), to_signed(-2117, 14), to_signed(-2122, 14), 
                                                                             to_signed(-2128, 14), to_signed(-2133, 14), to_signed(-2139, 14), to_signed(-2144, 14), 
                                                                             to_signed(-2149, 14), to_signed(-2155, 14), to_signed(-2160, 14), to_signed(-2165, 14), 
                                                                             to_signed(-2171, 14), to_signed(-2176, 14), to_signed(-2181, 14), to_signed(-2187, 14), 
                                                                             to_signed(-2192, 14), to_signed(-2197, 14), to_signed(-2202, 14), to_signed(-2208, 14), 
                                                                             to_signed(-2213, 14), to_signed(-2218, 14), to_signed(-2224, 14), to_signed(-2229, 14), 
                                                                             to_signed(-2234, 14), to_signed(-2239, 14), to_signed(-2245, 14), to_signed(-2250, 14), 
                                                                             to_signed(-2255, 14), to_signed(-2260, 14), to_signed(-2266, 14), to_signed(-2271, 14), 
                                                                             to_signed(-2276, 14), to_signed(-2281, 14), to_signed(-2287, 14), to_signed(-2292, 14), 
                                                                             to_signed(-2297, 14), to_signed(-2302, 14), to_signed(-2307, 14), to_signed(-2313, 14), 
                                                                             to_signed(-2318, 14), to_signed(-2323, 14), to_signed(-2328, 14), to_signed(-2333, 14), 
                                                                             to_signed(-2338, 14), to_signed(-2344, 14), to_signed(-2349, 14), to_signed(-2354, 14), 
                                                                             to_signed(-2359, 14), to_signed(-2364, 14), to_signed(-2369, 14), to_signed(-2374, 14), 
                                                                             to_signed(-2380, 14), to_signed(-2385, 14), to_signed(-2390, 14), to_signed(-2395, 14), 
                                                                             to_signed(-2400, 14), to_signed(-2405, 14), to_signed(-2410, 14), to_signed(-2415, 14), 
                                                                             to_signed(-2420, 14), to_signed(-2425, 14), to_signed(-2430, 14), to_signed(-2435, 14), 
                                                                             to_signed(-2440, 14), to_signed(-2446, 14), to_signed(-2451, 14), to_signed(-2456, 14), 
                                                                             to_signed(-2461, 14), to_signed(-2466, 14), to_signed(-2471, 14), to_signed(-2476, 14), 
                                                                             to_signed(-2481, 14), to_signed(-2486, 14), to_signed(-2491, 14), to_signed(-2496, 14), 
                                                                             to_signed(-2501, 14), to_signed(-2506, 14), to_signed(-2511, 14), to_signed(-2516, 14), 
                                                                             to_signed(-2520, 14), to_signed(-2525, 14), to_signed(-2530, 14), to_signed(-2535, 14), 
                                                                             to_signed(-2540, 14), to_signed(-2545, 14), to_signed(-2550, 14), to_signed(-2555, 14), 
                                                                             to_signed(-2560, 14), to_signed(-2565, 14), to_signed(-2570, 14), to_signed(-2575, 14), 
                                                                             to_signed(-2579, 14), to_signed(-2584, 14), to_signed(-2589, 14), to_signed(-2594, 14), 
                                                                             to_signed(-2599, 14), to_signed(-2604, 14), to_signed(-2609, 14), to_signed(-2614, 14), 
                                                                             to_signed(-2618, 14), to_signed(-2623, 14), to_signed(-2628, 14), to_signed(-2633, 14), 
                                                                             to_signed(-2638, 14), to_signed(-2642, 14), to_signed(-2647, 14), to_signed(-2652, 14), 
                                                                             to_signed(-2657, 14), to_signed(-2662, 14), to_signed(-2666, 14), to_signed(-2671, 14), 
                                                                             to_signed(-2676, 14), to_signed(-2681, 14), to_signed(-2685, 14), to_signed(-2690, 14), 
                                                                             to_signed(-2695, 14), to_signed(-2700, 14), to_signed(-2704, 14), to_signed(-2709, 14), 
                                                                             to_signed(-2714, 14), to_signed(-2718, 14), to_signed(-2723, 14), to_signed(-2728, 14), 
                                                                             to_signed(-2733, 14), to_signed(-2737, 14), to_signed(-2742, 14), to_signed(-2747, 14), 
                                                                             to_signed(-2751, 14), to_signed(-2756, 14), to_signed(-2761, 14), to_signed(-2765, 14), 
                                                                             to_signed(-2770, 14), to_signed(-2774, 14), to_signed(-2779, 14), to_signed(-2784, 14), 
                                                                             to_signed(-2788, 14), to_signed(-2793, 14), to_signed(-2797, 14), to_signed(-2802, 14), 
                                                                             to_signed(-2807, 14), to_signed(-2811, 14), to_signed(-2816, 14), to_signed(-2820, 14), 
                                                                             to_signed(-2825, 14), to_signed(-2829, 14), to_signed(-2834, 14), to_signed(-2838, 14), 
                                                                             to_signed(-2843, 14), to_signed(-2848, 14), to_signed(-2852, 14), to_signed(-2857, 14), 
                                                                             to_signed(-2861, 14), to_signed(-2866, 14), to_signed(-2870, 14), to_signed(-2875, 14), 
                                                                             to_signed(-2879, 14), to_signed(-2883, 14), to_signed(-2888, 14), to_signed(-2892, 14), 
                                                                             to_signed(-2897, 14), to_signed(-2901, 14), to_signed(-2906, 14), to_signed(-2910, 14), 
                                                                             to_signed(-2915, 14), to_signed(-2919, 14), to_signed(-2923, 14), to_signed(-2928, 14), 
                                                                             to_signed(-2932, 14), to_signed(-2937, 14), to_signed(-2941, 14), to_signed(-2945, 14), 
                                                                             to_signed(-2950, 14), to_signed(-2954, 14), to_signed(-2958, 14), to_signed(-2963, 14), 
                                                                             to_signed(-2967, 14), to_signed(-2971, 14), to_signed(-2976, 14), to_signed(-2980, 14), 
                                                                             to_signed(-2984, 14), to_signed(-2989, 14), to_signed(-2993, 14), to_signed(-2997, 14), 
                                                                             to_signed(-3001, 14), to_signed(-3006, 14), to_signed(-3010, 14), to_signed(-3014, 14), 
                                                                             to_signed(-3019, 14), to_signed(-3023, 14), to_signed(-3027, 14), to_signed(-3031, 14), 
                                                                             to_signed(-3035, 14), to_signed(-3040, 14), to_signed(-3044, 14), to_signed(-3048, 14), 
                                                                             to_signed(-3052, 14), to_signed(-3056, 14), to_signed(-3061, 14), to_signed(-3065, 14), 
                                                                             to_signed(-3069, 14), to_signed(-3073, 14), to_signed(-3077, 14), to_signed(-3081, 14), 
                                                                             to_signed(-3086, 14), to_signed(-3090, 14), to_signed(-3094, 14), to_signed(-3098, 14), 
                                                                             to_signed(-3102, 14), to_signed(-3106, 14), to_signed(-3110, 14), to_signed(-3114, 14), 
                                                                             to_signed(-3118, 14), to_signed(-3122, 14), to_signed(-3127, 14), to_signed(-3131, 14), 
                                                                             to_signed(-3135, 14), to_signed(-3139, 14), to_signed(-3143, 14), to_signed(-3147, 14), 
                                                                             to_signed(-3151, 14), to_signed(-3155, 14), to_signed(-3159, 14), to_signed(-3163, 14), 
                                                                             to_signed(-3167, 14), to_signed(-3171, 14), to_signed(-3175, 14), to_signed(-3179, 14), 
                                                                             to_signed(-3183, 14), to_signed(-3187, 14), to_signed(-3191, 14), to_signed(-3194, 14), 
                                                                             to_signed(-3198, 14), to_signed(-3202, 14), to_signed(-3206, 14), to_signed(-3210, 14), 
                                                                             to_signed(-3214, 14), to_signed(-3218, 14), to_signed(-3222, 14), to_signed(-3226, 14), 
                                                                             to_signed(-3230, 14), to_signed(-3233, 14), to_signed(-3237, 14), to_signed(-3241, 14), 
                                                                             to_signed(-3245, 14), to_signed(-3249, 14), to_signed(-3253, 14), to_signed(-3256, 14), 
                                                                             to_signed(-3260, 14), to_signed(-3264, 14), to_signed(-3268, 14), to_signed(-3272, 14), 
                                                                             to_signed(-3275, 14), to_signed(-3279, 14), to_signed(-3283, 14), to_signed(-3287, 14), 
                                                                             to_signed(-3290, 14), to_signed(-3294, 14), to_signed(-3298, 14), to_signed(-3302, 14), 
                                                                             to_signed(-3305, 14), to_signed(-3309, 14), to_signed(-3313, 14), to_signed(-3316, 14), 
                                                                             to_signed(-3320, 14), to_signed(-3324, 14), to_signed(-3327, 14), to_signed(-3331, 14), 
                                                                             to_signed(-3335, 14), to_signed(-3338, 14), to_signed(-3342, 14), to_signed(-3346, 14), 
                                                                             to_signed(-3349, 14), to_signed(-3353, 14), to_signed(-3357, 14), to_signed(-3360, 14), 
                                                                             to_signed(-3364, 14), to_signed(-3367, 14), to_signed(-3371, 14), to_signed(-3374, 14), 
                                                                             to_signed(-3378, 14), to_signed(-3382, 14), to_signed(-3385, 14), to_signed(-3389, 14), 
                                                                             to_signed(-3392, 14), to_signed(-3396, 14), to_signed(-3399, 14), to_signed(-3403, 14), 
                                                                             to_signed(-3406, 14), to_signed(-3410, 14), to_signed(-3413, 14), to_signed(-3417, 14), 
                                                                             to_signed(-3420, 14), to_signed(-3424, 14), to_signed(-3427, 14), to_signed(-3430, 14), 
                                                                             to_signed(-3434, 14), to_signed(-3437, 14), to_signed(-3441, 14), to_signed(-3444, 14), 
                                                                             to_signed(-3448, 14), to_signed(-3451, 14), to_signed(-3454, 14), to_signed(-3458, 14), 
                                                                             to_signed(-3461, 14), to_signed(-3464, 14), to_signed(-3468, 14), to_signed(-3471, 14), 
                                                                             to_signed(-3474, 14), to_signed(-3478, 14), to_signed(-3481, 14), to_signed(-3484, 14), 
                                                                             to_signed(-3488, 14), to_signed(-3491, 14), to_signed(-3494, 14), to_signed(-3498, 14), 
                                                                             to_signed(-3501, 14), to_signed(-3504, 14), to_signed(-3507, 14), to_signed(-3511, 14), 
                                                                             to_signed(-3514, 14), to_signed(-3517, 14), to_signed(-3520, 14), to_signed(-3523, 14), 
                                                                             to_signed(-3527, 14), to_signed(-3530, 14), to_signed(-3533, 14), to_signed(-3536, 14), 
                                                                             to_signed(-3539, 14), to_signed(-3542, 14), to_signed(-3546, 14), to_signed(-3549, 14), 
                                                                             to_signed(-3552, 14), to_signed(-3555, 14), to_signed(-3558, 14), to_signed(-3561, 14), 
                                                                             to_signed(-3564, 14), to_signed(-3567, 14), to_signed(-3571, 14), to_signed(-3574, 14), 
                                                                             to_signed(-3577, 14), to_signed(-3580, 14), to_signed(-3583, 14), to_signed(-3586, 14), 
                                                                             to_signed(-3589, 14), to_signed(-3592, 14), to_signed(-3595, 14), to_signed(-3598, 14), 
                                                                             to_signed(-3601, 14), to_signed(-3604, 14), to_signed(-3607, 14), to_signed(-3610, 14), 
                                                                             to_signed(-3613, 14), to_signed(-3616, 14), to_signed(-3619, 14), to_signed(-3622, 14), 
                                                                             to_signed(-3625, 14), to_signed(-3628, 14), to_signed(-3630, 14), to_signed(-3633, 14), 
                                                                             to_signed(-3636, 14), to_signed(-3639, 14), to_signed(-3642, 14), to_signed(-3645, 14), 
                                                                             to_signed(-3648, 14), to_signed(-3651, 14), to_signed(-3653, 14), to_signed(-3656, 14), 
                                                                             to_signed(-3659, 14), to_signed(-3662, 14), to_signed(-3665, 14), to_signed(-3668, 14), 
                                                                             to_signed(-3670, 14), to_signed(-3673, 14), to_signed(-3676, 14), to_signed(-3679, 14), 
                                                                             to_signed(-3681, 14), to_signed(-3684, 14), to_signed(-3687, 14), to_signed(-3690, 14), 
                                                                             to_signed(-3692, 14), to_signed(-3695, 14), to_signed(-3698, 14), to_signed(-3701, 14), 
                                                                             to_signed(-3703, 14), to_signed(-3706, 14), to_signed(-3709, 14), to_signed(-3711, 14), 
                                                                             to_signed(-3714, 14), to_signed(-3717, 14), to_signed(-3719, 14), to_signed(-3722, 14), 
                                                                             to_signed(-3724, 14), to_signed(-3727, 14), to_signed(-3730, 14), to_signed(-3732, 14), 
                                                                             to_signed(-3735, 14), to_signed(-3737, 14), to_signed(-3740, 14), to_signed(-3743, 14), 
                                                                             to_signed(-3745, 14), to_signed(-3748, 14), to_signed(-3750, 14), to_signed(-3753, 14), 
                                                                             to_signed(-3755, 14), to_signed(-3758, 14), to_signed(-3760, 14), to_signed(-3763, 14), 
                                                                             to_signed(-3765, 14), to_signed(-3768, 14), to_signed(-3770, 14), to_signed(-3773, 14), 
                                                                             to_signed(-3775, 14), to_signed(-3777, 14), to_signed(-3780, 14), to_signed(-3782, 14), 
                                                                             to_signed(-3785, 14), to_signed(-3787, 14), to_signed(-3790, 14), to_signed(-3792, 14), 
                                                                             to_signed(-3794, 14), to_signed(-3797, 14), to_signed(-3799, 14), to_signed(-3801, 14), 
                                                                             to_signed(-3804, 14), to_signed(-3806, 14), to_signed(-3808, 14), to_signed(-3811, 14), 
                                                                             to_signed(-3813, 14), to_signed(-3815, 14), to_signed(-3817, 14), to_signed(-3820, 14), 
                                                                             to_signed(-3822, 14), to_signed(-3824, 14), to_signed(-3827, 14), to_signed(-3829, 14), 
                                                                             to_signed(-3831, 14), to_signed(-3833, 14), to_signed(-3835, 14), to_signed(-3838, 14), 
                                                                             to_signed(-3840, 14), to_signed(-3842, 14), to_signed(-3844, 14), to_signed(-3846, 14), 
                                                                             to_signed(-3849, 14), to_signed(-3851, 14), to_signed(-3853, 14), to_signed(-3855, 14), 
                                                                             to_signed(-3857, 14), to_signed(-3859, 14), to_signed(-3861, 14), to_signed(-3863, 14), 
                                                                             to_signed(-3865, 14), to_signed(-3868, 14), to_signed(-3870, 14), to_signed(-3872, 14), 
                                                                             to_signed(-3874, 14), to_signed(-3876, 14), to_signed(-3878, 14), to_signed(-3880, 14), 
                                                                             to_signed(-3882, 14), to_signed(-3884, 14), to_signed(-3886, 14), to_signed(-3888, 14), 
                                                                             to_signed(-3890, 14), to_signed(-3892, 14), to_signed(-3894, 14), to_signed(-3896, 14), 
                                                                             to_signed(-3898, 14), to_signed(-3900, 14), to_signed(-3901, 14), to_signed(-3903, 14), 
                                                                             to_signed(-3905, 14), to_signed(-3907, 14), to_signed(-3909, 14), to_signed(-3911, 14), 
                                                                             to_signed(-3913, 14), to_signed(-3915, 14), to_signed(-3916, 14), to_signed(-3918, 14), 
                                                                             to_signed(-3920, 14), to_signed(-3922, 14), to_signed(-3924, 14), to_signed(-3926, 14), 
                                                                             to_signed(-3927, 14), to_signed(-3929, 14), to_signed(-3931, 14), to_signed(-3933, 14), 
                                                                             to_signed(-3934, 14), to_signed(-3936, 14), to_signed(-3938, 14), to_signed(-3940, 14), 
                                                                             to_signed(-3941, 14), to_signed(-3943, 14), to_signed(-3945, 14), to_signed(-3946, 14), 
                                                                             to_signed(-3948, 14), to_signed(-3950, 14), to_signed(-3951, 14), to_signed(-3953, 14), 
                                                                             to_signed(-3955, 14), to_signed(-3956, 14), to_signed(-3958, 14), to_signed(-3960, 14), 
                                                                             to_signed(-3961, 14), to_signed(-3963, 14), to_signed(-3964, 14), to_signed(-3966, 14), 
                                                                             to_signed(-3968, 14), to_signed(-3969, 14), to_signed(-3971, 14), to_signed(-3972, 14), 
                                                                             to_signed(-3974, 14), to_signed(-3975, 14), to_signed(-3977, 14), to_signed(-3978, 14), 
                                                                             to_signed(-3980, 14), to_signed(-3981, 14), to_signed(-3983, 14), to_signed(-3984, 14), 
                                                                             to_signed(-3986, 14), to_signed(-3987, 14), to_signed(-3989, 14), to_signed(-3990, 14), 
                                                                             to_signed(-3991, 14), to_signed(-3993, 14), to_signed(-3994, 14), to_signed(-3996, 14), 
                                                                             to_signed(-3997, 14), to_signed(-3998, 14), to_signed(-4000, 14), to_signed(-4001, 14), 
                                                                             to_signed(-4002, 14), to_signed(-4004, 14), to_signed(-4005, 14), to_signed(-4006, 14), 
                                                                             to_signed(-4008, 14), to_signed(-4009, 14), to_signed(-4010, 14), to_signed(-4012, 14), 
                                                                             to_signed(-4013, 14), to_signed(-4014, 14), to_signed(-4015, 14), to_signed(-4017, 14), 
                                                                             to_signed(-4018, 14), to_signed(-4019, 14), to_signed(-4020, 14), to_signed(-4021, 14), 
                                                                             to_signed(-4023, 14), to_signed(-4024, 14), to_signed(-4025, 14), to_signed(-4026, 14), 
                                                                             to_signed(-4027, 14), to_signed(-4028, 14), to_signed(-4030, 14), to_signed(-4031, 14), 
                                                                             to_signed(-4032, 14), to_signed(-4033, 14), to_signed(-4034, 14), to_signed(-4035, 14), 
                                                                             to_signed(-4036, 14), to_signed(-4037, 14), to_signed(-4038, 14), to_signed(-4039, 14), 
                                                                             to_signed(-4040, 14), to_signed(-4041, 14), to_signed(-4042, 14), to_signed(-4043, 14), 
                                                                             to_signed(-4044, 14), to_signed(-4045, 14), to_signed(-4046, 14), to_signed(-4047, 14), 
                                                                             to_signed(-4048, 14), to_signed(-4049, 14), to_signed(-4050, 14), to_signed(-4051, 14), 
                                                                             to_signed(-4052, 14), to_signed(-4053, 14), to_signed(-4054, 14), to_signed(-4055, 14), 
                                                                             to_signed(-4056, 14), to_signed(-4057, 14), to_signed(-4058, 14), to_signed(-4058, 14), 
                                                                             to_signed(-4059, 14), to_signed(-4060, 14), to_signed(-4061, 14), to_signed(-4062, 14), 
                                                                             to_signed(-4063, 14), to_signed(-4063, 14), to_signed(-4064, 14), to_signed(-4065, 14), 
                                                                             to_signed(-4066, 14), to_signed(-4066, 14), to_signed(-4067, 14), to_signed(-4068, 14), 
                                                                             to_signed(-4069, 14), to_signed(-4069, 14), to_signed(-4070, 14), to_signed(-4071, 14), 
                                                                             to_signed(-4072, 14), to_signed(-4072, 14), to_signed(-4073, 14), to_signed(-4074, 14), 
                                                                             to_signed(-4074, 14), to_signed(-4075, 14), to_signed(-4076, 14), to_signed(-4076, 14), 
                                                                             to_signed(-4077, 14), to_signed(-4077, 14), to_signed(-4078, 14), to_signed(-4079, 14), 
                                                                             to_signed(-4079, 14), to_signed(-4080, 14), to_signed(-4080, 14), to_signed(-4081, 14), 
                                                                             to_signed(-4081, 14), to_signed(-4082, 14), to_signed(-4082, 14), to_signed(-4083, 14), 
                                                                             to_signed(-4083, 14), to_signed(-4084, 14), to_signed(-4084, 14), to_signed(-4085, 14), 
                                                                             to_signed(-4085, 14), to_signed(-4086, 14), to_signed(-4086, 14), to_signed(-4087, 14), 
                                                                             to_signed(-4087, 14), to_signed(-4088, 14), to_signed(-4088, 14), to_signed(-4088, 14), 
                                                                             to_signed(-4089, 14), to_signed(-4089, 14), to_signed(-4090, 14), to_signed(-4090, 14), 
                                                                             to_signed(-4090, 14), to_signed(-4091, 14), to_signed(-4091, 14), to_signed(-4091, 14), 
                                                                             to_signed(-4092, 14), to_signed(-4092, 14), to_signed(-4092, 14), to_signed(-4092, 14), 
                                                                             to_signed(-4093, 14), to_signed(-4093, 14), to_signed(-4093, 14), to_signed(-4093, 14), 
                                                                             to_signed(-4094, 14), to_signed(-4094, 14), to_signed(-4094, 14), to_signed(-4094, 14), 
                                                                             to_signed(-4095, 14), to_signed(-4095, 14), to_signed(-4095, 14), to_signed(-4095, 14), 
                                                                             to_signed(-4095, 14), to_signed(-4095, 14), to_signed(-4096, 14), to_signed(-4096, 14), 
                                                                             to_signed(-4096, 14), to_signed(-4096, 14), to_signed(-4096, 14), to_signed(-4096, 14), 
                                                                             to_signed(-4096, 14), to_signed(-4096, 14), to_signed(-4096, 14), to_signed(-4096, 14), 
                                                                             to_signed(-4096, 14), to_signed(-4096, 14), to_signed(-4096, 14), to_signed(-4096, 14), 
                                                                             to_signed(-4096, 14), to_signed(-4096, 14), to_signed(-4096, 14), to_signed(-4096, 14), 
                                                                             to_signed(-4096, 14), to_signed(-4096, 14), to_signed(-4096, 14), to_signed(-4096, 14), 
                                                                             to_signed(-4096, 14), to_signed(-4096, 14), to_signed(-4096, 14), to_signed(-4096, 14), 
                                                                             to_signed(-4096, 14), to_signed(-4096, 14), to_signed(-4096, 14), to_signed(-4095, 14), 
                                                                             to_signed(-4095, 14), to_signed(-4095, 14), to_signed(-4095, 14), to_signed(-4095, 14), 
                                                                             to_signed(-4095, 14), to_signed(-4094, 14), to_signed(-4094, 14), to_signed(-4094, 14), 
                                                                             to_signed(-4094, 14), to_signed(-4093, 14), to_signed(-4093, 14), to_signed(-4093, 14), 
                                                                             to_signed(-4093, 14), to_signed(-4092, 14), to_signed(-4092, 14), to_signed(-4092, 14), 
                                                                             to_signed(-4092, 14), to_signed(-4091, 14), to_signed(-4091, 14), to_signed(-4091, 14), 
                                                                             to_signed(-4090, 14), to_signed(-4090, 14), to_signed(-4090, 14), to_signed(-4089, 14), 
                                                                             to_signed(-4089, 14), to_signed(-4088, 14), to_signed(-4088, 14), to_signed(-4088, 14), 
                                                                             to_signed(-4087, 14), to_signed(-4087, 14), to_signed(-4086, 14), to_signed(-4086, 14), 
                                                                             to_signed(-4085, 14), to_signed(-4085, 14), to_signed(-4084, 14), to_signed(-4084, 14), 
                                                                             to_signed(-4083, 14), to_signed(-4083, 14), to_signed(-4082, 14), to_signed(-4082, 14), 
                                                                             to_signed(-4081, 14), to_signed(-4081, 14), to_signed(-4080, 14), to_signed(-4080, 14), 
                                                                             to_signed(-4079, 14), to_signed(-4079, 14), to_signed(-4078, 14), to_signed(-4077, 14), 
                                                                             to_signed(-4077, 14), to_signed(-4076, 14), to_signed(-4076, 14), to_signed(-4075, 14), 
                                                                             to_signed(-4074, 14), to_signed(-4074, 14), to_signed(-4073, 14), to_signed(-4072, 14), 
                                                                             to_signed(-4072, 14), to_signed(-4071, 14), to_signed(-4070, 14), to_signed(-4069, 14), 
                                                                             to_signed(-4069, 14), to_signed(-4068, 14), to_signed(-4067, 14), to_signed(-4066, 14), 
                                                                             to_signed(-4066, 14), to_signed(-4065, 14), to_signed(-4064, 14), to_signed(-4063, 14), 
                                                                             to_signed(-4063, 14), to_signed(-4062, 14), to_signed(-4061, 14), to_signed(-4060, 14), 
                                                                             to_signed(-4059, 14), to_signed(-4058, 14), to_signed(-4058, 14), to_signed(-4057, 14), 
                                                                             to_signed(-4056, 14), to_signed(-4055, 14), to_signed(-4054, 14), to_signed(-4053, 14), 
                                                                             to_signed(-4052, 14), to_signed(-4051, 14), to_signed(-4050, 14), to_signed(-4049, 14), 
                                                                             to_signed(-4048, 14), to_signed(-4047, 14), to_signed(-4046, 14), to_signed(-4045, 14), 
                                                                             to_signed(-4044, 14), to_signed(-4043, 14), to_signed(-4042, 14), to_signed(-4041, 14), 
                                                                             to_signed(-4040, 14), to_signed(-4039, 14), to_signed(-4038, 14), to_signed(-4037, 14), 
                                                                             to_signed(-4036, 14), to_signed(-4035, 14), to_signed(-4034, 14), to_signed(-4033, 14), 
                                                                             to_signed(-4032, 14), to_signed(-4031, 14), to_signed(-4030, 14), to_signed(-4028, 14), 
                                                                             to_signed(-4027, 14), to_signed(-4026, 14), to_signed(-4025, 14), to_signed(-4024, 14), 
                                                                             to_signed(-4023, 14), to_signed(-4021, 14), to_signed(-4020, 14), to_signed(-4019, 14), 
                                                                             to_signed(-4018, 14), to_signed(-4017, 14), to_signed(-4015, 14), to_signed(-4014, 14), 
                                                                             to_signed(-4013, 14), to_signed(-4012, 14), to_signed(-4010, 14), to_signed(-4009, 14), 
                                                                             to_signed(-4008, 14), to_signed(-4006, 14), to_signed(-4005, 14), to_signed(-4004, 14), 
                                                                             to_signed(-4002, 14), to_signed(-4001, 14), to_signed(-4000, 14), to_signed(-3998, 14), 
                                                                             to_signed(-3997, 14), to_signed(-3996, 14), to_signed(-3994, 14), to_signed(-3993, 14), 
                                                                             to_signed(-3991, 14), to_signed(-3990, 14), to_signed(-3989, 14), to_signed(-3987, 14), 
                                                                             to_signed(-3986, 14), to_signed(-3984, 14), to_signed(-3983, 14), to_signed(-3981, 14), 
                                                                             to_signed(-3980, 14), to_signed(-3978, 14), to_signed(-3977, 14), to_signed(-3975, 14), 
                                                                             to_signed(-3974, 14), to_signed(-3972, 14), to_signed(-3971, 14), to_signed(-3969, 14), 
                                                                             to_signed(-3968, 14), to_signed(-3966, 14), to_signed(-3964, 14), to_signed(-3963, 14), 
                                                                             to_signed(-3961, 14), to_signed(-3960, 14), to_signed(-3958, 14), to_signed(-3956, 14), 
                                                                             to_signed(-3955, 14), to_signed(-3953, 14), to_signed(-3951, 14), to_signed(-3950, 14), 
                                                                             to_signed(-3948, 14), to_signed(-3946, 14), to_signed(-3945, 14), to_signed(-3943, 14), 
                                                                             to_signed(-3941, 14), to_signed(-3940, 14), to_signed(-3938, 14), to_signed(-3936, 14), 
                                                                             to_signed(-3934, 14), to_signed(-3933, 14), to_signed(-3931, 14), to_signed(-3929, 14), 
                                                                             to_signed(-3927, 14), to_signed(-3926, 14), to_signed(-3924, 14), to_signed(-3922, 14), 
                                                                             to_signed(-3920, 14), to_signed(-3918, 14), to_signed(-3916, 14), to_signed(-3915, 14), 
                                                                             to_signed(-3913, 14), to_signed(-3911, 14), to_signed(-3909, 14), to_signed(-3907, 14), 
                                                                             to_signed(-3905, 14), to_signed(-3903, 14), to_signed(-3901, 14), to_signed(-3900, 14), 
                                                                             to_signed(-3898, 14), to_signed(-3896, 14), to_signed(-3894, 14), to_signed(-3892, 14), 
                                                                             to_signed(-3890, 14), to_signed(-3888, 14), to_signed(-3886, 14), to_signed(-3884, 14), 
                                                                             to_signed(-3882, 14), to_signed(-3880, 14), to_signed(-3878, 14), to_signed(-3876, 14), 
                                                                             to_signed(-3874, 14), to_signed(-3872, 14), to_signed(-3870, 14), to_signed(-3868, 14), 
                                                                             to_signed(-3865, 14), to_signed(-3863, 14), to_signed(-3861, 14), to_signed(-3859, 14), 
                                                                             to_signed(-3857, 14), to_signed(-3855, 14), to_signed(-3853, 14), to_signed(-3851, 14), 
                                                                             to_signed(-3849, 14), to_signed(-3846, 14), to_signed(-3844, 14), to_signed(-3842, 14), 
                                                                             to_signed(-3840, 14), to_signed(-3838, 14), to_signed(-3835, 14), to_signed(-3833, 14), 
                                                                             to_signed(-3831, 14), to_signed(-3829, 14), to_signed(-3827, 14), to_signed(-3824, 14), 
                                                                             to_signed(-3822, 14), to_signed(-3820, 14), to_signed(-3817, 14), to_signed(-3815, 14), 
                                                                             to_signed(-3813, 14), to_signed(-3811, 14), to_signed(-3808, 14), to_signed(-3806, 14), 
                                                                             to_signed(-3804, 14), to_signed(-3801, 14), to_signed(-3799, 14), to_signed(-3797, 14), 
                                                                             to_signed(-3794, 14), to_signed(-3792, 14), to_signed(-3790, 14), to_signed(-3787, 14), 
                                                                             to_signed(-3785, 14), to_signed(-3782, 14), to_signed(-3780, 14), to_signed(-3777, 14), 
                                                                             to_signed(-3775, 14), to_signed(-3773, 14), to_signed(-3770, 14), to_signed(-3768, 14), 
                                                                             to_signed(-3765, 14), to_signed(-3763, 14), to_signed(-3760, 14), to_signed(-3758, 14), 
                                                                             to_signed(-3755, 14), to_signed(-3753, 14), to_signed(-3750, 14), to_signed(-3748, 14), 
                                                                             to_signed(-3745, 14), to_signed(-3743, 14), to_signed(-3740, 14), to_signed(-3737, 14), 
                                                                             to_signed(-3735, 14), to_signed(-3732, 14), to_signed(-3730, 14), to_signed(-3727, 14), 
                                                                             to_signed(-3724, 14), to_signed(-3722, 14), to_signed(-3719, 14), to_signed(-3717, 14), 
                                                                             to_signed(-3714, 14), to_signed(-3711, 14), to_signed(-3709, 14), to_signed(-3706, 14), 
                                                                             to_signed(-3703, 14), to_signed(-3701, 14), to_signed(-3698, 14), to_signed(-3695, 14), 
                                                                             to_signed(-3692, 14), to_signed(-3690, 14), to_signed(-3687, 14), to_signed(-3684, 14), 
                                                                             to_signed(-3681, 14), to_signed(-3679, 14), to_signed(-3676, 14), to_signed(-3673, 14), 
                                                                             to_signed(-3670, 14), to_signed(-3668, 14), to_signed(-3665, 14), to_signed(-3662, 14), 
                                                                             to_signed(-3659, 14), to_signed(-3656, 14), to_signed(-3653, 14), to_signed(-3651, 14), 
                                                                             to_signed(-3648, 14), to_signed(-3645, 14), to_signed(-3642, 14), to_signed(-3639, 14), 
                                                                             to_signed(-3636, 14), to_signed(-3633, 14), to_signed(-3630, 14), to_signed(-3628, 14), 
                                                                             to_signed(-3625, 14), to_signed(-3622, 14), to_signed(-3619, 14), to_signed(-3616, 14), 
                                                                             to_signed(-3613, 14), to_signed(-3610, 14), to_signed(-3607, 14), to_signed(-3604, 14), 
                                                                             to_signed(-3601, 14), to_signed(-3598, 14), to_signed(-3595, 14), to_signed(-3592, 14), 
                                                                             to_signed(-3589, 14), to_signed(-3586, 14), to_signed(-3583, 14), to_signed(-3580, 14), 
                                                                             to_signed(-3577, 14), to_signed(-3574, 14), to_signed(-3571, 14), to_signed(-3567, 14), 
                                                                             to_signed(-3564, 14), to_signed(-3561, 14), to_signed(-3558, 14), to_signed(-3555, 14), 
                                                                             to_signed(-3552, 14), to_signed(-3549, 14), to_signed(-3546, 14), to_signed(-3542, 14), 
                                                                             to_signed(-3539, 14), to_signed(-3536, 14), to_signed(-3533, 14), to_signed(-3530, 14), 
                                                                             to_signed(-3527, 14), to_signed(-3523, 14), to_signed(-3520, 14), to_signed(-3517, 14), 
                                                                             to_signed(-3514, 14), to_signed(-3511, 14), to_signed(-3507, 14), to_signed(-3504, 14), 
                                                                             to_signed(-3501, 14), to_signed(-3498, 14), to_signed(-3494, 14), to_signed(-3491, 14), 
                                                                             to_signed(-3488, 14), to_signed(-3484, 14), to_signed(-3481, 14), to_signed(-3478, 14), 
                                                                             to_signed(-3474, 14), to_signed(-3471, 14), to_signed(-3468, 14), to_signed(-3464, 14), 
                                                                             to_signed(-3461, 14), to_signed(-3458, 14), to_signed(-3454, 14), to_signed(-3451, 14), 
                                                                             to_signed(-3448, 14), to_signed(-3444, 14), to_signed(-3441, 14), to_signed(-3437, 14), 
                                                                             to_signed(-3434, 14), to_signed(-3430, 14), to_signed(-3427, 14), to_signed(-3424, 14), 
                                                                             to_signed(-3420, 14), to_signed(-3417, 14), to_signed(-3413, 14), to_signed(-3410, 14), 
                                                                             to_signed(-3406, 14), to_signed(-3403, 14), to_signed(-3399, 14), to_signed(-3396, 14), 
                                                                             to_signed(-3392, 14), to_signed(-3389, 14), to_signed(-3385, 14), to_signed(-3382, 14), 
                                                                             to_signed(-3378, 14), to_signed(-3374, 14), to_signed(-3371, 14), to_signed(-3367, 14), 
                                                                             to_signed(-3364, 14), to_signed(-3360, 14), to_signed(-3357, 14), to_signed(-3353, 14), 
                                                                             to_signed(-3349, 14), to_signed(-3346, 14), to_signed(-3342, 14), to_signed(-3338, 14), 
                                                                             to_signed(-3335, 14), to_signed(-3331, 14), to_signed(-3327, 14), to_signed(-3324, 14), 
                                                                             to_signed(-3320, 14), to_signed(-3316, 14), to_signed(-3313, 14), to_signed(-3309, 14), 
                                                                             to_signed(-3305, 14), to_signed(-3302, 14), to_signed(-3298, 14), to_signed(-3294, 14), 
                                                                             to_signed(-3290, 14), to_signed(-3287, 14), to_signed(-3283, 14), to_signed(-3279, 14), 
                                                                             to_signed(-3275, 14), to_signed(-3272, 14), to_signed(-3268, 14), to_signed(-3264, 14), 
                                                                             to_signed(-3260, 14), to_signed(-3256, 14), to_signed(-3253, 14), to_signed(-3249, 14), 
                                                                             to_signed(-3245, 14), to_signed(-3241, 14), to_signed(-3237, 14), to_signed(-3233, 14), 
                                                                             to_signed(-3230, 14), to_signed(-3226, 14), to_signed(-3222, 14), to_signed(-3218, 14), 
                                                                             to_signed(-3214, 14), to_signed(-3210, 14), to_signed(-3206, 14), to_signed(-3202, 14), 
                                                                             to_signed(-3198, 14), to_signed(-3194, 14), to_signed(-3191, 14), to_signed(-3187, 14), 
                                                                             to_signed(-3183, 14), to_signed(-3179, 14), to_signed(-3175, 14), to_signed(-3171, 14), 
                                                                             to_signed(-3167, 14), to_signed(-3163, 14), to_signed(-3159, 14), to_signed(-3155, 14), 
                                                                             to_signed(-3151, 14), to_signed(-3147, 14), to_signed(-3143, 14), to_signed(-3139, 14), 
                                                                             to_signed(-3135, 14), to_signed(-3131, 14), to_signed(-3127, 14), to_signed(-3122, 14), 
                                                                             to_signed(-3118, 14), to_signed(-3114, 14), to_signed(-3110, 14), to_signed(-3106, 14), 
                                                                             to_signed(-3102, 14), to_signed(-3098, 14), to_signed(-3094, 14), to_signed(-3090, 14), 
                                                                             to_signed(-3086, 14), to_signed(-3081, 14), to_signed(-3077, 14), to_signed(-3073, 14), 
                                                                             to_signed(-3069, 14), to_signed(-3065, 14), to_signed(-3061, 14), to_signed(-3056, 14), 
                                                                             to_signed(-3052, 14), to_signed(-3048, 14), to_signed(-3044, 14), to_signed(-3040, 14), 
                                                                             to_signed(-3035, 14), to_signed(-3031, 14), to_signed(-3027, 14), to_signed(-3023, 14), 
                                                                             to_signed(-3019, 14), to_signed(-3014, 14), to_signed(-3010, 14), to_signed(-3006, 14), 
                                                                             to_signed(-3001, 14), to_signed(-2997, 14), to_signed(-2993, 14), to_signed(-2989, 14), 
                                                                             to_signed(-2984, 14), to_signed(-2980, 14), to_signed(-2976, 14), to_signed(-2971, 14), 
                                                                             to_signed(-2967, 14), to_signed(-2963, 14), to_signed(-2958, 14), to_signed(-2954, 14), 
                                                                             to_signed(-2950, 14), to_signed(-2945, 14), to_signed(-2941, 14), to_signed(-2937, 14), 
                                                                             to_signed(-2932, 14), to_signed(-2928, 14), to_signed(-2923, 14), to_signed(-2919, 14), 
                                                                             to_signed(-2915, 14), to_signed(-2910, 14), to_signed(-2906, 14), to_signed(-2901, 14), 
                                                                             to_signed(-2897, 14), to_signed(-2892, 14), to_signed(-2888, 14), to_signed(-2883, 14), 
                                                                             to_signed(-2879, 14), to_signed(-2875, 14), to_signed(-2870, 14), to_signed(-2866, 14), 
                                                                             to_signed(-2861, 14), to_signed(-2857, 14), to_signed(-2852, 14), to_signed(-2848, 14), 
                                                                             to_signed(-2843, 14), to_signed(-2838, 14), to_signed(-2834, 14), to_signed(-2829, 14), 
                                                                             to_signed(-2825, 14), to_signed(-2820, 14), to_signed(-2816, 14), to_signed(-2811, 14), 
                                                                             to_signed(-2807, 14), to_signed(-2802, 14), to_signed(-2797, 14), to_signed(-2793, 14), 
                                                                             to_signed(-2788, 14), to_signed(-2784, 14), to_signed(-2779, 14), to_signed(-2774, 14), 
                                                                             to_signed(-2770, 14), to_signed(-2765, 14), to_signed(-2761, 14), to_signed(-2756, 14), 
                                                                             to_signed(-2751, 14), to_signed(-2747, 14), to_signed(-2742, 14), to_signed(-2737, 14), 
                                                                             to_signed(-2733, 14), to_signed(-2728, 14), to_signed(-2723, 14), to_signed(-2718, 14), 
                                                                             to_signed(-2714, 14), to_signed(-2709, 14), to_signed(-2704, 14), to_signed(-2700, 14), 
                                                                             to_signed(-2695, 14), to_signed(-2690, 14), to_signed(-2685, 14), to_signed(-2681, 14), 
                                                                             to_signed(-2676, 14), to_signed(-2671, 14), to_signed(-2666, 14), to_signed(-2662, 14), 
                                                                             to_signed(-2657, 14), to_signed(-2652, 14), to_signed(-2647, 14), to_signed(-2642, 14), 
                                                                             to_signed(-2638, 14), to_signed(-2633, 14), to_signed(-2628, 14), to_signed(-2623, 14), 
                                                                             to_signed(-2618, 14), to_signed(-2614, 14), to_signed(-2609, 14), to_signed(-2604, 14), 
                                                                             to_signed(-2599, 14), to_signed(-2594, 14), to_signed(-2589, 14), to_signed(-2584, 14), 
                                                                             to_signed(-2579, 14), to_signed(-2575, 14), to_signed(-2570, 14), to_signed(-2565, 14), 
                                                                             to_signed(-2560, 14), to_signed(-2555, 14), to_signed(-2550, 14), to_signed(-2545, 14), 
                                                                             to_signed(-2540, 14), to_signed(-2535, 14), to_signed(-2530, 14), to_signed(-2525, 14), 
                                                                             to_signed(-2520, 14), to_signed(-2516, 14), to_signed(-2511, 14), to_signed(-2506, 14), 
                                                                             to_signed(-2501, 14), to_signed(-2496, 14), to_signed(-2491, 14), to_signed(-2486, 14), 
                                                                             to_signed(-2481, 14), to_signed(-2476, 14), to_signed(-2471, 14), to_signed(-2466, 14), 
                                                                             to_signed(-2461, 14), to_signed(-2456, 14), to_signed(-2451, 14), to_signed(-2446, 14), 
                                                                             to_signed(-2440, 14), to_signed(-2435, 14), to_signed(-2430, 14), to_signed(-2425, 14), 
                                                                             to_signed(-2420, 14), to_signed(-2415, 14), to_signed(-2410, 14), to_signed(-2405, 14), 
                                                                             to_signed(-2400, 14), to_signed(-2395, 14), to_signed(-2390, 14), to_signed(-2385, 14), 
                                                                             to_signed(-2380, 14), to_signed(-2374, 14), to_signed(-2369, 14), to_signed(-2364, 14), 
                                                                             to_signed(-2359, 14), to_signed(-2354, 14), to_signed(-2349, 14), to_signed(-2344, 14), 
                                                                             to_signed(-2338, 14), to_signed(-2333, 14), to_signed(-2328, 14), to_signed(-2323, 14), 
                                                                             to_signed(-2318, 14), to_signed(-2313, 14), to_signed(-2307, 14), to_signed(-2302, 14), 
                                                                             to_signed(-2297, 14), to_signed(-2292, 14), to_signed(-2287, 14), to_signed(-2281, 14), 
                                                                             to_signed(-2276, 14), to_signed(-2271, 14), to_signed(-2266, 14), to_signed(-2260, 14), 
                                                                             to_signed(-2255, 14), to_signed(-2250, 14), to_signed(-2245, 14), to_signed(-2239, 14), 
                                                                             to_signed(-2234, 14), to_signed(-2229, 14), to_signed(-2224, 14), to_signed(-2218, 14), 
                                                                             to_signed(-2213, 14), to_signed(-2208, 14), to_signed(-2202, 14), to_signed(-2197, 14), 
                                                                             to_signed(-2192, 14), to_signed(-2187, 14), to_signed(-2181, 14), to_signed(-2176, 14), 
                                                                             to_signed(-2171, 14), to_signed(-2165, 14), to_signed(-2160, 14), to_signed(-2155, 14), 
                                                                             to_signed(-2149, 14), to_signed(-2144, 14), to_signed(-2139, 14), to_signed(-2133, 14), 
                                                                             to_signed(-2128, 14), to_signed(-2122, 14), to_signed(-2117, 14), to_signed(-2112, 14), 
                                                                             to_signed(-2106, 14), to_signed(-2101, 14), to_signed(-2095, 14), to_signed(-2090, 14), 
                                                                             to_signed(-2085, 14), to_signed(-2079, 14), to_signed(-2074, 14), to_signed(-2068, 14), 
                                                                             to_signed(-2063, 14), to_signed(-2058, 14), to_signed(-2052, 14), to_signed(-2047, 14), 
                                                                             to_signed(-2041, 14), to_signed(-2036, 14), to_signed(-2030, 14), to_signed(-2025, 14), 
                                                                             to_signed(-2019, 14), to_signed(-2014, 14), to_signed(-2008, 14), to_signed(-2003, 14), 
                                                                             to_signed(-1998, 14), to_signed(-1992, 14), to_signed(-1987, 14), to_signed(-1981, 14), 
                                                                             to_signed(-1976, 14), to_signed(-1970, 14), to_signed(-1965, 14), to_signed(-1959, 14), 
                                                                             to_signed(-1953, 14), to_signed(-1948, 14), to_signed(-1942, 14), to_signed(-1937, 14), 
                                                                             to_signed(-1931, 14), to_signed(-1926, 14), to_signed(-1920, 14), to_signed(-1915, 14), 
                                                                             to_signed(-1909, 14), to_signed(-1904, 14), to_signed(-1898, 14), to_signed(-1892, 14), 
                                                                             to_signed(-1887, 14), to_signed(-1881, 14), to_signed(-1876, 14), to_signed(-1870, 14), 
                                                                             to_signed(-1865, 14), to_signed(-1859, 14), to_signed(-1853, 14), to_signed(-1848, 14), 
                                                                             to_signed(-1842, 14), to_signed(-1836, 14), to_signed(-1831, 14), to_signed(-1825, 14), 
                                                                             to_signed(-1820, 14), to_signed(-1814, 14), to_signed(-1808, 14), to_signed(-1803, 14), 
                                                                             to_signed(-1797, 14), to_signed(-1791, 14), to_signed(-1786, 14), to_signed(-1780, 14), 
                                                                             to_signed(-1774, 14), to_signed(-1769, 14), to_signed(-1763, 14), to_signed(-1757, 14), 
                                                                             to_signed(-1752, 14), to_signed(-1746, 14), to_signed(-1740, 14), to_signed(-1735, 14), 
                                                                             to_signed(-1729, 14), to_signed(-1723, 14), to_signed(-1718, 14), to_signed(-1712, 14), 
                                                                             to_signed(-1706, 14), to_signed(-1700, 14), to_signed(-1695, 14), to_signed(-1689, 14), 
                                                                             to_signed(-1683, 14), to_signed(-1678, 14), to_signed(-1672, 14), to_signed(-1666, 14), 
                                                                             to_signed(-1660, 14), to_signed(-1655, 14), to_signed(-1649, 14), to_signed(-1643, 14), 
                                                                             to_signed(-1637, 14), to_signed(-1632, 14), to_signed(-1626, 14), to_signed(-1620, 14), 
                                                                             to_signed(-1614, 14), to_signed(-1609, 14), to_signed(-1603, 14), to_signed(-1597, 14), 
                                                                             to_signed(-1591, 14), to_signed(-1585, 14), to_signed(-1580, 14), to_signed(-1574, 14), 
                                                                             to_signed(-1568, 14), to_signed(-1562, 14), to_signed(-1556, 14), to_signed(-1551, 14), 
                                                                             to_signed(-1545, 14), to_signed(-1539, 14), to_signed(-1533, 14), to_signed(-1527, 14), 
                                                                             to_signed(-1521, 14), to_signed(-1516, 14), to_signed(-1510, 14), to_signed(-1504, 14), 
                                                                             to_signed(-1498, 14), to_signed(-1492, 14), to_signed(-1486, 14), to_signed(-1480, 14), 
                                                                             to_signed(-1475, 14), to_signed(-1469, 14), to_signed(-1463, 14), to_signed(-1457, 14), 
                                                                             to_signed(-1451, 14), to_signed(-1445, 14), to_signed(-1439, 14), to_signed(-1434, 14), 
                                                                             to_signed(-1428, 14), to_signed(-1422, 14), to_signed(-1416, 14), to_signed(-1410, 14), 
                                                                             to_signed(-1404, 14), to_signed(-1398, 14), to_signed(-1392, 14), to_signed(-1386, 14), 
                                                                             to_signed(-1380, 14), to_signed(-1374, 14), to_signed(-1369, 14), to_signed(-1363, 14), 
                                                                             to_signed(-1357, 14), to_signed(-1351, 14), to_signed(-1345, 14), to_signed(-1339, 14), 
                                                                             to_signed(-1333, 14), to_signed(-1327, 14), to_signed(-1321, 14), to_signed(-1315, 14), 
                                                                             to_signed(-1309, 14), to_signed(-1303, 14), to_signed(-1297, 14), to_signed(-1291, 14), 
                                                                             to_signed(-1285, 14), to_signed(-1279, 14), to_signed(-1273, 14), to_signed(-1267, 14), 
                                                                             to_signed(-1261, 14), to_signed(-1255, 14), to_signed(-1249, 14), to_signed(-1244, 14), 
                                                                             to_signed(-1238, 14), to_signed(-1232, 14), to_signed(-1226, 14), to_signed(-1220, 14), 
                                                                             to_signed(-1214, 14), to_signed(-1208, 14), to_signed(-1202, 14), to_signed(-1196, 14), 
                                                                             to_signed(-1190, 14), to_signed(-1183, 14), to_signed(-1177, 14), to_signed(-1171, 14), 
                                                                             to_signed(-1165, 14), to_signed(-1159, 14), to_signed(-1153, 14), to_signed(-1147, 14), 
                                                                             to_signed(-1141, 14), to_signed(-1135, 14), to_signed(-1129, 14), to_signed(-1123, 14), 
                                                                             to_signed(-1117, 14), to_signed(-1111, 14), to_signed(-1105, 14), to_signed(-1099, 14), 
                                                                             to_signed(-1093, 14), to_signed(-1087, 14), to_signed(-1081, 14), to_signed(-1075, 14), 
                                                                             to_signed(-1069, 14), to_signed(-1063, 14), to_signed(-1057, 14), to_signed(-1051, 14), 
                                                                             to_signed(-1044, 14), to_signed(-1038, 14), to_signed(-1032, 14), to_signed(-1026, 14), 
                                                                             to_signed(-1020, 14), to_signed(-1014, 14), to_signed(-1008, 14), to_signed(-1002, 14), 
                                                                             to_signed(-996, 14), to_signed(-990, 14), to_signed(-984, 14), to_signed(-977, 14), 
                                                                             to_signed(-971, 14), to_signed(-965, 14), to_signed(-959, 14), to_signed(-953, 14), 
                                                                             to_signed(-947, 14), to_signed(-941, 14), to_signed(-935, 14), to_signed(-929, 14), 
                                                                             to_signed(-922, 14), to_signed(-916, 14), to_signed(-910, 14), to_signed(-904, 14), 
                                                                             to_signed(-898, 14), to_signed(-892, 14), to_signed(-886, 14), to_signed(-880, 14), 
                                                                             to_signed(-873, 14), to_signed(-867, 14), to_signed(-861, 14), to_signed(-855, 14), 
                                                                             to_signed(-849, 14), to_signed(-843, 14), to_signed(-837, 14), to_signed(-830, 14), 
                                                                             to_signed(-824, 14), to_signed(-818, 14), to_signed(-812, 14), to_signed(-806, 14), 
                                                                             to_signed(-800, 14), to_signed(-793, 14), to_signed(-787, 14), to_signed(-781, 14), 
                                                                             to_signed(-775, 14), to_signed(-769, 14), to_signed(-763, 14), to_signed(-756, 14), 
                                                                             to_signed(-750, 14), to_signed(-744, 14), to_signed(-738, 14), to_signed(-732, 14), 
                                                                             to_signed(-726, 14), to_signed(-719, 14), to_signed(-713, 14), to_signed(-707, 14), 
                                                                             to_signed(-701, 14), to_signed(-695, 14), to_signed(-688, 14), to_signed(-682, 14), 
                                                                             to_signed(-676, 14), to_signed(-670, 14), to_signed(-664, 14), to_signed(-657, 14), 
                                                                             to_signed(-651, 14), to_signed(-645, 14), to_signed(-639, 14), to_signed(-633, 14), 
                                                                             to_signed(-626, 14), to_signed(-620, 14), to_signed(-614, 14), to_signed(-608, 14), 
                                                                             to_signed(-602, 14), to_signed(-595, 14), to_signed(-589, 14), to_signed(-583, 14), 
                                                                             to_signed(-577, 14), to_signed(-570, 14), to_signed(-564, 14), to_signed(-558, 14), 
                                                                             to_signed(-552, 14), to_signed(-546, 14), to_signed(-539, 14), to_signed(-533, 14), 
                                                                             to_signed(-527, 14), to_signed(-521, 14), to_signed(-514, 14), to_signed(-508, 14), 
                                                                             to_signed(-502, 14), to_signed(-496, 14), to_signed(-489, 14), to_signed(-483, 14), 
                                                                             to_signed(-477, 14), to_signed(-471, 14), to_signed(-464, 14), to_signed(-458, 14), 
                                                                             to_signed(-452, 14), to_signed(-446, 14), to_signed(-439, 14), to_signed(-433, 14), 
                                                                             to_signed(-427, 14), to_signed(-421, 14), to_signed(-414, 14), to_signed(-408, 14), 
                                                                             to_signed(-402, 14), to_signed(-396, 14), to_signed(-389, 14), to_signed(-383, 14), 
                                                                             to_signed(-377, 14), to_signed(-371, 14), to_signed(-364, 14), to_signed(-358, 14), 
                                                                             to_signed(-352, 14), to_signed(-346, 14), to_signed(-339, 14), to_signed(-333, 14), 
                                                                             to_signed(-327, 14), to_signed(-321, 14), to_signed(-314, 14), to_signed(-308, 14), 
                                                                             to_signed(-302, 14), to_signed(-296, 14), to_signed(-289, 14), to_signed(-283, 14), 
                                                                             to_signed(-277, 14), to_signed(-270, 14), to_signed(-264, 14), to_signed(-258, 14), 
                                                                             to_signed(-252, 14), to_signed(-245, 14), to_signed(-239, 14), to_signed(-233, 14), 
                                                                             to_signed(-227, 14), to_signed(-220, 14), to_signed(-214, 14), to_signed(-208, 14), 
                                                                             to_signed(-201, 14), to_signed(-195, 14), to_signed(-189, 14), to_signed(-183, 14), 
                                                                             to_signed(-176, 14), to_signed(-170, 14), to_signed(-164, 14), to_signed(-158, 14), 
                                                                             to_signed(-151, 14), to_signed(-145, 14), to_signed(-139, 14), to_signed(-132, 14), 
                                                                             to_signed(-126, 14), to_signed(-120, 14), to_signed(-114, 14), to_signed(-107, 14), 
                                                                             to_signed(-101, 14), to_signed(-95, 14), to_signed(-88, 14), to_signed(-82, 14), to_signed(-76, 14), 
                                                                             to_signed(-70, 14), to_signed(-63, 14), to_signed(-57, 14), to_signed(-51, 14), to_signed(-44, 14), 
                                                                             to_signed(-38, 14), to_signed(-32, 14), to_signed(-26, 14), to_signed(-19, 14), to_signed(-13, 14), 
                                                                             to_signed(-7, 14), to_signed(0, 14), to_signed(6, 14), to_signed(12, 14), to_signed(18, 14), 
                                                                             to_signed(25, 14), to_signed(31, 14), to_signed(37, 14), to_signed(43, 14), to_signed(50, 14), 
                                                                             to_signed(56, 14), to_signed(62, 14), to_signed(69, 14), to_signed(75, 14), to_signed(81, 14), 
                                                                             to_signed(87, 14), to_signed(94, 14), to_signed(100, 14), to_signed(106, 14), to_signed(113, 14), 
                                                                             to_signed(119, 14), to_signed(125, 14), to_signed(131, 14), to_signed(138, 14), to_signed(144, 14), 
                                                                             to_signed(150, 14), to_signed(157, 14), to_signed(163, 14), to_signed(169, 14), to_signed(175, 14), 
                                                                             to_signed(182, 14), to_signed(188, 14), to_signed(194, 14), to_signed(200, 14), to_signed(207, 14), 
                                                                             to_signed(213, 14), to_signed(219, 14), to_signed(226, 14), to_signed(232, 14), to_signed(238, 14), 
                                                                             to_signed(244, 14), to_signed(251, 14), to_signed(257, 14), to_signed(263, 14), to_signed(269, 14), 
                                                                             to_signed(276, 14), to_signed(282, 14), to_signed(288, 14), to_signed(295, 14), to_signed(301, 14), 
                                                                             to_signed(307, 14), to_signed(313, 14), to_signed(320, 14), to_signed(326, 14), to_signed(332, 14), 
                                                                             to_signed(338, 14), to_signed(345, 14), to_signed(351, 14), to_signed(357, 14), to_signed(363, 14), 
                                                                             to_signed(370, 14), to_signed(376, 14), to_signed(382, 14), to_signed(388, 14), to_signed(395, 14), 
                                                                             to_signed(401, 14), to_signed(407, 14), to_signed(413, 14), to_signed(420, 14), to_signed(426, 14), 
                                                                             to_signed(432, 14), to_signed(438, 14), to_signed(445, 14), to_signed(451, 14), to_signed(457, 14), 
                                                                             to_signed(463, 14), to_signed(470, 14), to_signed(476, 14), to_signed(482, 14), to_signed(488, 14), 
                                                                             to_signed(495, 14), to_signed(501, 14), to_signed(507, 14), to_signed(513, 14), to_signed(520, 14), 
                                                                             to_signed(526, 14), to_signed(532, 14), to_signed(538, 14), to_signed(545, 14), to_signed(551, 14), 
                                                                             to_signed(557, 14), to_signed(563, 14), to_signed(569, 14), to_signed(576, 14), to_signed(582, 14), 
                                                                             to_signed(588, 14), to_signed(594, 14), to_signed(601, 14), to_signed(607, 14), to_signed(613, 14), 
                                                                             to_signed(619, 14), to_signed(625, 14), to_signed(632, 14), to_signed(638, 14), to_signed(644, 14), 
                                                                             to_signed(650, 14), to_signed(656, 14), to_signed(663, 14), to_signed(669, 14), to_signed(675, 14), 
                                                                             to_signed(681, 14), to_signed(687, 14), to_signed(694, 14), to_signed(700, 14), to_signed(706, 14), 
                                                                             to_signed(712, 14), to_signed(718, 14), to_signed(725, 14), to_signed(731, 14), to_signed(737, 14), 
                                                                             to_signed(743, 14), to_signed(749, 14), to_signed(755, 14), to_signed(762, 14), to_signed(768, 14), 
                                                                             to_signed(774, 14), to_signed(780, 14), to_signed(786, 14), to_signed(792, 14), to_signed(799, 14), 
                                                                             to_signed(805, 14), to_signed(811, 14), to_signed(817, 14), to_signed(823, 14), to_signed(829, 14), 
                                                                             to_signed(836, 14), to_signed(842, 14), to_signed(848, 14), to_signed(854, 14), to_signed(860, 14), 
                                                                             to_signed(866, 14), to_signed(872, 14), to_signed(879, 14), to_signed(885, 14), to_signed(891, 14), 
                                                                             to_signed(897, 14), to_signed(903, 14), to_signed(909, 14), to_signed(915, 14), to_signed(921, 14), 
                                                                             to_signed(928, 14), to_signed(934, 14), to_signed(940, 14), to_signed(946, 14), to_signed(952, 14), 
                                                                             to_signed(958, 14), to_signed(964, 14), to_signed(970, 14), to_signed(976, 14), to_signed(983, 14), 
                                                                             to_signed(989, 14), to_signed(995, 14), to_signed(1001, 14), to_signed(1007, 14), to_signed(1013, 14), 
                                                                             to_signed(1019, 14), to_signed(1025, 14), to_signed(1031, 14), to_signed(1037, 14), 
                                                                             to_signed(1043, 14), to_signed(1050, 14), to_signed(1056, 14), to_signed(1062, 14), 
                                                                             to_signed(1068, 14), to_signed(1074, 14), to_signed(1080, 14), to_signed(1086, 14), 
                                                                             to_signed(1092, 14), to_signed(1098, 14), to_signed(1104, 14), to_signed(1110, 14), 
                                                                             to_signed(1116, 14), to_signed(1122, 14), to_signed(1128, 14), to_signed(1134, 14), 
                                                                             to_signed(1140, 14), to_signed(1146, 14), to_signed(1152, 14), to_signed(1158, 14), 
                                                                             to_signed(1164, 14), to_signed(1170, 14), to_signed(1176, 14), to_signed(1182, 14), 
                                                                             to_signed(1189, 14), to_signed(1195, 14), to_signed(1201, 14), to_signed(1207, 14), 
                                                                             to_signed(1213, 14), to_signed(1219, 14), to_signed(1225, 14), to_signed(1231, 14), 
                                                                             to_signed(1237, 14), to_signed(1243, 14), to_signed(1248, 14), to_signed(1254, 14), 
                                                                             to_signed(1260, 14), to_signed(1266, 14), to_signed(1272, 14), to_signed(1278, 14), 
                                                                             to_signed(1284, 14), to_signed(1290, 14), to_signed(1296, 14), to_signed(1302, 14), 
                                                                             to_signed(1308, 14), to_signed(1314, 14), to_signed(1320, 14), to_signed(1326, 14), 
                                                                             to_signed(1332, 14), to_signed(1338, 14), to_signed(1344, 14), to_signed(1350, 14), 
                                                                             to_signed(1356, 14), to_signed(1362, 14), to_signed(1368, 14), to_signed(1373, 14), 
                                                                             to_signed(1379, 14), to_signed(1385, 14), to_signed(1391, 14), to_signed(1397, 14), 
                                                                             to_signed(1403, 14), to_signed(1409, 14), to_signed(1415, 14), to_signed(1421, 14), 
                                                                             to_signed(1427, 14), to_signed(1433, 14), to_signed(1438, 14), to_signed(1444, 14), 
                                                                             to_signed(1450, 14), to_signed(1456, 14), to_signed(1462, 14), to_signed(1468, 14), 
                                                                             to_signed(1474, 14), to_signed(1479, 14), to_signed(1485, 14), to_signed(1491, 14), 
                                                                             to_signed(1497, 14), to_signed(1503, 14), to_signed(1509, 14), to_signed(1515, 14), 
                                                                             to_signed(1520, 14), to_signed(1526, 14), to_signed(1532, 14), to_signed(1538, 14), 
                                                                             to_signed(1544, 14), to_signed(1550, 14), to_signed(1555, 14), to_signed(1561, 14), 
                                                                             to_signed(1567, 14), to_signed(1573, 14), to_signed(1579, 14), to_signed(1584, 14), 
                                                                             to_signed(1590, 14), to_signed(1596, 14), to_signed(1602, 14), to_signed(1608, 14), 
                                                                             to_signed(1613, 14), to_signed(1619, 14), to_signed(1625, 14), to_signed(1631, 14), 
                                                                             to_signed(1636, 14), to_signed(1642, 14), to_signed(1648, 14), to_signed(1654, 14), 
                                                                             to_signed(1659, 14), to_signed(1665, 14), to_signed(1671, 14), to_signed(1677, 14), 
                                                                             to_signed(1682, 14), to_signed(1688, 14), to_signed(1694, 14), to_signed(1699, 14), 
                                                                             to_signed(1705, 14), to_signed(1711, 14), to_signed(1717, 14), to_signed(1722, 14), 
                                                                             to_signed(1728, 14), to_signed(1734, 14), to_signed(1739, 14), to_signed(1745, 14), 
                                                                             to_signed(1751, 14), to_signed(1756, 14), to_signed(1762, 14), to_signed(1768, 14), 
                                                                             to_signed(1773, 14), to_signed(1779, 14), to_signed(1785, 14), to_signed(1790, 14), 
                                                                             to_signed(1796, 14), to_signed(1802, 14), to_signed(1807, 14), to_signed(1813, 14), 
                                                                             to_signed(1819, 14), to_signed(1824, 14), to_signed(1830, 14), to_signed(1835, 14), 
                                                                             to_signed(1841, 14), to_signed(1847, 14), to_signed(1852, 14), to_signed(1858, 14), 
                                                                             to_signed(1864, 14), to_signed(1869, 14), to_signed(1875, 14), to_signed(1880, 14), 
                                                                             to_signed(1886, 14), to_signed(1891, 14), to_signed(1897, 14), to_signed(1903, 14), 
                                                                             to_signed(1908, 14), to_signed(1914, 14), to_signed(1919, 14), to_signed(1925, 14), 
                                                                             to_signed(1930, 14), to_signed(1936, 14), to_signed(1941, 14), to_signed(1947, 14), 
                                                                             to_signed(1952, 14), to_signed(1958, 14), to_signed(1964, 14), to_signed(1969, 14), 
                                                                             to_signed(1975, 14), to_signed(1980, 14), to_signed(1986, 14), to_signed(1991, 14), 
                                                                             to_signed(1997, 14), to_signed(2002, 14), to_signed(2007, 14), to_signed(2013, 14), 
                                                                             to_signed(2018, 14), to_signed(2024, 14), to_signed(2029, 14), to_signed(2035, 14), 
                                                                             to_signed(2040, 14), to_signed(2046, 14), to_signed(2051, 14), to_signed(2057, 14), 
                                                                             to_signed(2062, 14), to_signed(2067, 14), to_signed(2073, 14), to_signed(2078, 14), 
                                                                             to_signed(2084, 14), to_signed(2089, 14), to_signed(2094, 14), to_signed(2100, 14), 
                                                                             to_signed(2105, 14), to_signed(2111, 14), to_signed(2116, 14), to_signed(2121, 14), 
                                                                             to_signed(2127, 14), to_signed(2132, 14), to_signed(2138, 14), to_signed(2143, 14), 
                                                                             to_signed(2148, 14), to_signed(2154, 14), to_signed(2159, 14), to_signed(2164, 14), 
                                                                             to_signed(2170, 14), to_signed(2175, 14), to_signed(2180, 14), to_signed(2186, 14), 
                                                                             to_signed(2191, 14), to_signed(2196, 14), to_signed(2201, 14), to_signed(2207, 14), 
                                                                             to_signed(2212, 14), to_signed(2217, 14), to_signed(2223, 14), to_signed(2228, 14), 
                                                                             to_signed(2233, 14), to_signed(2238, 14), to_signed(2244, 14), to_signed(2249, 14), 
                                                                             to_signed(2254, 14), to_signed(2259, 14), to_signed(2265, 14), to_signed(2270, 14), 
                                                                             to_signed(2275, 14), to_signed(2280, 14), to_signed(2286, 14), to_signed(2291, 14), 
                                                                             to_signed(2296, 14), to_signed(2301, 14), to_signed(2306, 14), to_signed(2312, 14), 
                                                                             to_signed(2317, 14), to_signed(2322, 14), to_signed(2327, 14), to_signed(2332, 14), 
                                                                             to_signed(2337, 14), to_signed(2343, 14), to_signed(2348, 14), to_signed(2353, 14), 
                                                                             to_signed(2358, 14), to_signed(2363, 14), to_signed(2368, 14), to_signed(2373, 14), 
                                                                             to_signed(2379, 14), to_signed(2384, 14), to_signed(2389, 14), to_signed(2394, 14), 
                                                                             to_signed(2399, 14), to_signed(2404, 14), to_signed(2409, 14), to_signed(2414, 14), 
                                                                             to_signed(2419, 14), to_signed(2424, 14), to_signed(2429, 14), to_signed(2434, 14), 
                                                                             to_signed(2439, 14), to_signed(2445, 14), to_signed(2450, 14), to_signed(2455, 14), 
                                                                             to_signed(2460, 14), to_signed(2465, 14), to_signed(2470, 14), to_signed(2475, 14), 
                                                                             to_signed(2480, 14), to_signed(2485, 14), to_signed(2490, 14), to_signed(2495, 14), 
                                                                             to_signed(2500, 14), to_signed(2505, 14), to_signed(2510, 14), to_signed(2515, 14), 
                                                                             to_signed(2519, 14), to_signed(2524, 14), to_signed(2529, 14), to_signed(2534, 14), 
                                                                             to_signed(2539, 14), to_signed(2544, 14), to_signed(2549, 14), to_signed(2554, 14), 
                                                                             to_signed(2559, 14), to_signed(2564, 14), to_signed(2569, 14), to_signed(2574, 14), 
                                                                             to_signed(2578, 14), to_signed(2583, 14), to_signed(2588, 14), to_signed(2593, 14), 
                                                                             to_signed(2598, 14), to_signed(2603, 14), to_signed(2608, 14), to_signed(2613, 14), 
                                                                             to_signed(2617, 14), to_signed(2622, 14), to_signed(2627, 14), to_signed(2632, 14), 
                                                                             to_signed(2637, 14), to_signed(2641, 14), to_signed(2646, 14), to_signed(2651, 14), 
                                                                             to_signed(2656, 14), to_signed(2661, 14), to_signed(2665, 14), to_signed(2670, 14), 
                                                                             to_signed(2675, 14), to_signed(2680, 14), to_signed(2684, 14), to_signed(2689, 14), 
                                                                             to_signed(2694, 14), to_signed(2699, 14), to_signed(2703, 14), to_signed(2708, 14), 
                                                                             to_signed(2713, 14), to_signed(2717, 14), to_signed(2722, 14), to_signed(2727, 14), 
                                                                             to_signed(2732, 14), to_signed(2736, 14), to_signed(2741, 14), to_signed(2746, 14), 
                                                                             to_signed(2750, 14), to_signed(2755, 14), to_signed(2760, 14), to_signed(2764, 14), 
                                                                             to_signed(2769, 14), to_signed(2773, 14), to_signed(2778, 14), to_signed(2783, 14), 
                                                                             to_signed(2787, 14), to_signed(2792, 14), to_signed(2796, 14), to_signed(2801, 14), 
                                                                             to_signed(2806, 14), to_signed(2810, 14), to_signed(2815, 14), to_signed(2819, 14), 
                                                                             to_signed(2824, 14), to_signed(2828, 14), to_signed(2833, 14), to_signed(2837, 14), 
                                                                             to_signed(2842, 14), to_signed(2847, 14), to_signed(2851, 14), to_signed(2856, 14), 
                                                                             to_signed(2860, 14), to_signed(2865, 14), to_signed(2869, 14), to_signed(2874, 14), 
                                                                             to_signed(2878, 14), to_signed(2882, 14), to_signed(2887, 14), to_signed(2891, 14), 
                                                                             to_signed(2896, 14), to_signed(2900, 14), to_signed(2905, 14), to_signed(2909, 14), 
                                                                             to_signed(2914, 14), to_signed(2918, 14), to_signed(2922, 14), to_signed(2927, 14), 
                                                                             to_signed(2931, 14), to_signed(2936, 14), to_signed(2940, 14), to_signed(2944, 14), 
                                                                             to_signed(2949, 14), to_signed(2953, 14), to_signed(2957, 14), to_signed(2962, 14), 
                                                                             to_signed(2966, 14), to_signed(2970, 14), to_signed(2975, 14), to_signed(2979, 14), 
                                                                             to_signed(2983, 14), to_signed(2988, 14), to_signed(2992, 14), to_signed(2996, 14), 
                                                                             to_signed(3000, 14), to_signed(3005, 14), to_signed(3009, 14), to_signed(3013, 14), 
                                                                             to_signed(3018, 14), to_signed(3022, 14), to_signed(3026, 14), to_signed(3030, 14), 
                                                                             to_signed(3034, 14), to_signed(3039, 14), to_signed(3043, 14), to_signed(3047, 14), 
                                                                             to_signed(3051, 14), to_signed(3055, 14), to_signed(3060, 14), to_signed(3064, 14), 
                                                                             to_signed(3068, 14), to_signed(3072, 14), to_signed(3076, 14), to_signed(3080, 14), 
                                                                             to_signed(3085, 14), to_signed(3089, 14), to_signed(3093, 14), to_signed(3097, 14), 
                                                                             to_signed(3101, 14), to_signed(3105, 14), to_signed(3109, 14), to_signed(3113, 14), 
                                                                             to_signed(3117, 14), to_signed(3121, 14), to_signed(3126, 14), to_signed(3130, 14), 
                                                                             to_signed(3134, 14), to_signed(3138, 14), to_signed(3142, 14), to_signed(3146, 14), 
                                                                             to_signed(3150, 14), to_signed(3154, 14), to_signed(3158, 14), to_signed(3162, 14), 
                                                                             to_signed(3166, 14), to_signed(3170, 14), to_signed(3174, 14), to_signed(3178, 14), 
                                                                             to_signed(3182, 14), to_signed(3186, 14), to_signed(3190, 14), to_signed(3193, 14), 
                                                                             to_signed(3197, 14), to_signed(3201, 14), to_signed(3205, 14), to_signed(3209, 14), 
                                                                             to_signed(3213, 14), to_signed(3217, 14), to_signed(3221, 14), to_signed(3225, 14), 
                                                                             to_signed(3229, 14), to_signed(3232, 14), to_signed(3236, 14), to_signed(3240, 14), 
                                                                             to_signed(3244, 14), to_signed(3248, 14), to_signed(3252, 14), to_signed(3255, 14), 
                                                                             to_signed(3259, 14), to_signed(3263, 14), to_signed(3267, 14), to_signed(3271, 14), 
                                                                             to_signed(3274, 14), to_signed(3278, 14), to_signed(3282, 14), to_signed(3286, 14), 
                                                                             to_signed(3289, 14), to_signed(3293, 14), to_signed(3297, 14), to_signed(3301, 14), 
                                                                             to_signed(3304, 14), to_signed(3308, 14), to_signed(3312, 14), to_signed(3315, 14), 
                                                                             to_signed(3319, 14), to_signed(3323, 14), to_signed(3326, 14), to_signed(3330, 14), 
                                                                             to_signed(3334, 14), to_signed(3337, 14), to_signed(3341, 14), to_signed(3345, 14), 
                                                                             to_signed(3348, 14), to_signed(3352, 14), to_signed(3356, 14), to_signed(3359, 14), 
                                                                             to_signed(3363, 14), to_signed(3366, 14), to_signed(3370, 14), to_signed(3373, 14), 
                                                                             to_signed(3377, 14), to_signed(3381, 14), to_signed(3384, 14), to_signed(3388, 14), 
                                                                             to_signed(3391, 14), to_signed(3395, 14), to_signed(3398, 14), to_signed(3402, 14), 
                                                                             to_signed(3405, 14), to_signed(3409, 14), to_signed(3412, 14), to_signed(3416, 14), 
                                                                             to_signed(3419, 14), to_signed(3423, 14), to_signed(3426, 14), to_signed(3429, 14), 
                                                                             to_signed(3433, 14), to_signed(3436, 14), to_signed(3440, 14), to_signed(3443, 14), 
                                                                             to_signed(3447, 14), to_signed(3450, 14), to_signed(3453, 14), to_signed(3457, 14), 
                                                                             to_signed(3460, 14), to_signed(3463, 14), to_signed(3467, 14), to_signed(3470, 14), 
                                                                             to_signed(3473, 14), to_signed(3477, 14), to_signed(3480, 14), to_signed(3483, 14), 
                                                                             to_signed(3487, 14), to_signed(3490, 14), to_signed(3493, 14), to_signed(3497, 14), 
                                                                             to_signed(3500, 14), to_signed(3503, 14), to_signed(3506, 14), to_signed(3510, 14), 
                                                                             to_signed(3513, 14), to_signed(3516, 14), to_signed(3519, 14), to_signed(3522, 14), 
                                                                             to_signed(3526, 14), to_signed(3529, 14), to_signed(3532, 14), to_signed(3535, 14), 
                                                                             to_signed(3538, 14), to_signed(3541, 14), to_signed(3545, 14), to_signed(3548, 14), 
                                                                             to_signed(3551, 14), to_signed(3554, 14), to_signed(3557, 14), to_signed(3560, 14), 
                                                                             to_signed(3563, 14), to_signed(3566, 14), to_signed(3570, 14), to_signed(3573, 14), 
                                                                             to_signed(3576, 14), to_signed(3579, 14), to_signed(3582, 14), to_signed(3585, 14), 
                                                                             to_signed(3588, 14), to_signed(3591, 14), to_signed(3594, 14), to_signed(3597, 14), 
                                                                             to_signed(3600, 14), to_signed(3603, 14), to_signed(3606, 14), to_signed(3609, 14), 
                                                                             to_signed(3612, 14), to_signed(3615, 14), to_signed(3618, 14), to_signed(3621, 14), 
                                                                             to_signed(3624, 14), to_signed(3627, 14), to_signed(3629, 14), to_signed(3632, 14), 
                                                                             to_signed(3635, 14), to_signed(3638, 14), to_signed(3641, 14), to_signed(3644, 14), 
                                                                             to_signed(3647, 14), to_signed(3650, 14), to_signed(3652, 14), to_signed(3655, 14), 
                                                                             to_signed(3658, 14), to_signed(3661, 14), to_signed(3664, 14), to_signed(3667, 14), 
                                                                             to_signed(3669, 14), to_signed(3672, 14), to_signed(3675, 14), to_signed(3678, 14), 
                                                                             to_signed(3680, 14), to_signed(3683, 14), to_signed(3686, 14), to_signed(3689, 14), 
                                                                             to_signed(3691, 14), to_signed(3694, 14), to_signed(3697, 14), to_signed(3700, 14), 
                                                                             to_signed(3702, 14), to_signed(3705, 14), to_signed(3708, 14), to_signed(3710, 14), 
                                                                             to_signed(3713, 14), to_signed(3716, 14), to_signed(3718, 14), to_signed(3721, 14), 
                                                                             to_signed(3723, 14), to_signed(3726, 14), to_signed(3729, 14), to_signed(3731, 14), 
                                                                             to_signed(3734, 14), to_signed(3736, 14), to_signed(3739, 14), to_signed(3742, 14), 
                                                                             to_signed(3744, 14), to_signed(3747, 14), to_signed(3749, 14), to_signed(3752, 14), 
                                                                             to_signed(3754, 14), to_signed(3757, 14), to_signed(3759, 14), to_signed(3762, 14), 
                                                                             to_signed(3764, 14), to_signed(3767, 14), to_signed(3769, 14), to_signed(3772, 14), 
                                                                             to_signed(3774, 14), to_signed(3776, 14), to_signed(3779, 14), to_signed(3781, 14), 
                                                                             to_signed(3784, 14), to_signed(3786, 14), to_signed(3789, 14), to_signed(3791, 14), 
                                                                             to_signed(3793, 14), to_signed(3796, 14), to_signed(3798, 14), to_signed(3800, 14), 
                                                                             to_signed(3803, 14), to_signed(3805, 14), to_signed(3807, 14), to_signed(3810, 14), 
                                                                             to_signed(3812, 14), to_signed(3814, 14), to_signed(3816, 14), to_signed(3819, 14), 
                                                                             to_signed(3821, 14), to_signed(3823, 14), to_signed(3826, 14), to_signed(3828, 14), 
                                                                             to_signed(3830, 14), to_signed(3832, 14), to_signed(3834, 14), to_signed(3837, 14), 
                                                                             to_signed(3839, 14), to_signed(3841, 14), to_signed(3843, 14), to_signed(3845, 14), 
                                                                             to_signed(3848, 14), to_signed(3850, 14), to_signed(3852, 14), to_signed(3854, 14), 
                                                                             to_signed(3856, 14), to_signed(3858, 14), to_signed(3860, 14), to_signed(3862, 14), 
                                                                             to_signed(3864, 14), to_signed(3867, 14), to_signed(3869, 14), to_signed(3871, 14), 
                                                                             to_signed(3873, 14), to_signed(3875, 14), to_signed(3877, 14), to_signed(3879, 14), 
                                                                             to_signed(3881, 14), to_signed(3883, 14), to_signed(3885, 14), to_signed(3887, 14), 
                                                                             to_signed(3889, 14), to_signed(3891, 14), to_signed(3893, 14), to_signed(3895, 14), 
                                                                             to_signed(3897, 14), to_signed(3899, 14), to_signed(3900, 14), to_signed(3902, 14), 
                                                                             to_signed(3904, 14), to_signed(3906, 14), to_signed(3908, 14), to_signed(3910, 14), 
                                                                             to_signed(3912, 14), to_signed(3914, 14), to_signed(3915, 14), to_signed(3917, 14), 
                                                                             to_signed(3919, 14), to_signed(3921, 14), to_signed(3923, 14), to_signed(3925, 14), 
                                                                             to_signed(3926, 14), to_signed(3928, 14), to_signed(3930, 14), to_signed(3932, 14), 
                                                                             to_signed(3933, 14), to_signed(3935, 14), to_signed(3937, 14), to_signed(3939, 14), 
                                                                             to_signed(3940, 14), to_signed(3942, 14), to_signed(3944, 14), to_signed(3945, 14), 
                                                                             to_signed(3947, 14), to_signed(3949, 14), to_signed(3950, 14), to_signed(3952, 14), 
                                                                             to_signed(3954, 14), to_signed(3955, 14), to_signed(3957, 14), to_signed(3959, 14), 
                                                                             to_signed(3960, 14), to_signed(3962, 14), to_signed(3963, 14), to_signed(3965, 14), 
                                                                             to_signed(3967, 14), to_signed(3968, 14), to_signed(3970, 14), to_signed(3971, 14), 
                                                                             to_signed(3973, 14), to_signed(3974, 14), to_signed(3976, 14), to_signed(3977, 14), 
                                                                             to_signed(3979, 14), to_signed(3980, 14), to_signed(3982, 14), to_signed(3983, 14), 
                                                                             to_signed(3985, 14), to_signed(3986, 14), to_signed(3988, 14), to_signed(3989, 14), 
                                                                             to_signed(3990, 14), to_signed(3992, 14), to_signed(3993, 14), to_signed(3995, 14), 
                                                                             to_signed(3996, 14), to_signed(3997, 14), to_signed(3999, 14), to_signed(4000, 14), 
                                                                             to_signed(4001, 14), to_signed(4003, 14), to_signed(4004, 14), to_signed(4005, 14), 
                                                                             to_signed(4007, 14), to_signed(4008, 14), to_signed(4009, 14), to_signed(4011, 14), 
                                                                             to_signed(4012, 14), to_signed(4013, 14), to_signed(4014, 14), to_signed(4016, 14), 
                                                                             to_signed(4017, 14), to_signed(4018, 14), to_signed(4019, 14), to_signed(4020, 14), 
                                                                             to_signed(4022, 14), to_signed(4023, 14), to_signed(4024, 14), to_signed(4025, 14), 
                                                                             to_signed(4026, 14), to_signed(4027, 14), to_signed(4029, 14), to_signed(4030, 14), 
                                                                             to_signed(4031, 14), to_signed(4032, 14), to_signed(4033, 14), to_signed(4034, 14), 
                                                                             to_signed(4035, 14), to_signed(4036, 14), to_signed(4037, 14), to_signed(4038, 14), 
                                                                             to_signed(4039, 14), to_signed(4040, 14), to_signed(4041, 14), to_signed(4042, 14), 
                                                                             to_signed(4043, 14), to_signed(4044, 14), to_signed(4045, 14), to_signed(4046, 14), 
                                                                             to_signed(4047, 14), to_signed(4048, 14), to_signed(4049, 14), to_signed(4050, 14), 
                                                                             to_signed(4051, 14), to_signed(4052, 14), to_signed(4053, 14), to_signed(4054, 14), 
                                                                             to_signed(4055, 14), to_signed(4056, 14), to_signed(4057, 14), to_signed(4057, 14), 
                                                                             to_signed(4058, 14), to_signed(4059, 14), to_signed(4060, 14), to_signed(4061, 14), 
                                                                             to_signed(4062, 14), to_signed(4062, 14), to_signed(4063, 14), to_signed(4064, 14), 
                                                                             to_signed(4065, 14), to_signed(4065, 14), to_signed(4066, 14), to_signed(4067, 14), 
                                                                             to_signed(4068, 14), to_signed(4068, 14), to_signed(4069, 14), to_signed(4070, 14), 
                                                                             to_signed(4071, 14), to_signed(4071, 14), to_signed(4072, 14), to_signed(4073, 14), 
                                                                             to_signed(4073, 14), to_signed(4074, 14), to_signed(4075, 14), to_signed(4075, 14), 
                                                                             to_signed(4076, 14), to_signed(4076, 14), to_signed(4077, 14), to_signed(4078, 14), 
                                                                             to_signed(4078, 14), to_signed(4079, 14), to_signed(4079, 14), to_signed(4080, 14), 
                                                                             to_signed(4080, 14), to_signed(4081, 14), to_signed(4081, 14), to_signed(4082, 14), 
                                                                             to_signed(4082, 14), to_signed(4083, 14), to_signed(4083, 14), to_signed(4084, 14), 
                                                                             to_signed(4084, 14), to_signed(4085, 14), to_signed(4085, 14), to_signed(4086, 14), 
                                                                             to_signed(4086, 14), to_signed(4087, 14), to_signed(4087, 14), to_signed(4087, 14), 
                                                                             to_signed(4088, 14), to_signed(4088, 14), to_signed(4089, 14), to_signed(4089, 14), 
                                                                             to_signed(4089, 14), to_signed(4090, 14), to_signed(4090, 14), to_signed(4090, 14), 
                                                                             to_signed(4091, 14), to_signed(4091, 14), to_signed(4091, 14), to_signed(4091, 14), 
                                                                             to_signed(4092, 14), to_signed(4092, 14), to_signed(4092, 14), to_signed(4092, 14), 
                                                                             to_signed(4093, 14), to_signed(4093, 14), to_signed(4093, 14), to_signed(4093, 14), 
                                                                             to_signed(4094, 14), to_signed(4094, 14), to_signed(4094, 14), to_signed(4094, 14), 
                                                                             to_signed(4094, 14), to_signed(4094, 14), to_signed(4095, 14), to_signed(4095, 14), 
                                                                             to_signed(4095, 14), to_signed(4095, 14), to_signed(4095, 14), to_signed(4095, 14), 
                                                                             to_signed(4095, 14), to_signed(4095, 14), to_signed(4095, 14), to_signed(4095, 14), 
                                                                             to_signed(4095, 14), to_signed(4095, 14), to_signed(4095, 14), to_signed(4095, 14) );  -- sfix14 [4096]
  CONSTANT nc                             : vector_of_signed13(0 TO 16) := ( to_signed(27, 13), to_signed(-24, 13), to_signed(-49, 13), to_signed(84, 13), to_signed(68, 13), 
                                                                           to_signed(-220, 13), to_signed(-83, 13), to_signed(802, 13), to_signed(1379, 13), to_signed(802, 13), 
                                                                           to_signed(-83, 13), to_signed(-220, 13), to_signed(68, 13), to_signed(84, 13), to_signed(-49, 13), 
                                                                           to_signed(-24, 13), to_signed(27, 13) );  -- sfix13 [17]
  CONSTANT nc_2                           : vector_of_signed13(0 TO 16) := ( to_signed(27, 13), to_signed(-24, 13), to_signed(-49, 13), to_signed(84, 13), to_signed(68, 13), 
                                                                           to_signed(-220, 13), to_signed(-83, 13), to_signed(802, 13), to_signed(1379, 13), to_signed(802, 13), 
                                                                           to_signed(-83, 13), to_signed(-220, 13), to_signed(68, 13), to_signed(84, 13), to_signed(-49, 13), 
                                                                           to_signed(-24, 13), to_signed(27, 13) );  -- sfix13 [17]

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL i_in_signed                      : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL q_in_signed                      : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL r_in_re                          : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL r_in_im                          : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL r_out_1                          : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL r_out_2                          : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL mu_foc_in_unsigned               : unsigned(11 DOWNTO 0);  -- ufix12
  SIGNAL mu                               : unsigned(11 DOWNTO 0);  -- ufix12_En12
  SIGNAL p39mu_cast                       : unsigned(23 DOWNTO 0);  -- ufix24_En12
  SIGNAL p39mu_cast_1                     : unsigned(23 DOWNTO 0);  -- ufix24_En12
  SIGNAL c                                : signed(27 DOWNTO 0);  -- sfix28_En12
  SIGNAL tmp                              : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL p33tmp_sub_cast                  : signed(17 DOWNTO 0);  -- sfix18_En1
  SIGNAL p33tmp_sub_temp                  : signed(17 DOWNTO 0);  -- sfix18_En1
  SIGNAL p33tmp_cast                      : signed(17 DOWNTO 0);  -- sfix18
  SIGNAL tmp_1                            : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL tmp_2                            : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL p32tmp_add_cast                  : signed(17 DOWNTO 0);  -- sfix18_En1
  SIGNAL p32tmp_add_temp                  : signed(17 DOWNTO 0);  -- sfix18_En1
  SIGNAL tmp_3                            : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL tmp_4                            : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL phi                              : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL tmp_5                            : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL z_q                              : signed(25 DOWNTO 0);  -- sfix26_En12
  SIGNAL tmp_6                            : signed(25 DOWNTO 0);  -- sfix26_En12
  SIGNAL p22tmp_cast                      : signed(26 DOWNTO 0);  -- sfix27_En12
  SIGNAL p22tmp_cast_1                    : signed(27 DOWNTO 0);  -- sfix28_En12
  SIGNAL p22tmp_cast_2                    : signed(27 DOWNTO 0);  -- sfix28_En12
  SIGNAL p22tmp_cast_3                    : signed(26 DOWNTO 0);  -- sfix27_En12
  SIGNAL tmp_7                            : signed(25 DOWNTO 0);  -- sfix26_En12
  SIGNAL z_i                              : signed(25 DOWNTO 0);  -- sfix26_En12
  SIGNAL tmp_8                            : signed(25 DOWNTO 0);  -- sfix26_En12
  SIGNAL tmp_9                            : signed(25 DOWNTO 0);  -- sfix26_En12
  SIGNAL p25tmp_cast                      : signed(26 DOWNTO 0);  -- sfix27_En12
  SIGNAL p25tmp_cast_1                    : signed(27 DOWNTO 0);  -- sfix28_En12
  SIGNAL p25tmp_cast_2                    : signed(27 DOWNTO 0);  -- sfix28_En12
  SIGNAL p25tmp_cast_3                    : signed(26 DOWNTO 0);  -- sfix27_En12
  SIGNAL tmp_10                           : signed(25 DOWNTO 0);  -- sfix26_En12
  SIGNAL tmp_11                           : unsigned(12 DOWNTO 0);  -- ufix13
  SIGNAL f_q                              : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL p27f_q_add_temp                  : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL p27f_q_sub_cast                  : signed(31 DOWNTO 0);  -- int32
  SIGNAL f_i                              : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL p23z_q_mul_temp                  : signed(25 DOWNTO 0);  -- sfix26_En12
  SIGNAL p23z_q_1                         : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL p23z_q_cast                      : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL p23z_q_mul_temp_1                : signed(26 DOWNTO 0);  -- sfix27_En12
  SIGNAL p23z_q_add_cast                  : signed(25 DOWNTO 0);  -- sfix26_En12
  SIGNAL tmp_12                           : signed(25 DOWNTO 0);  -- sfix26_En12
  SIGNAL time_diff                        : signed(25 DOWNTO 0);  -- sfix26_En12
  SIGNAL tmp_13                           : signed(1 DOWNTO 0);  -- sfix2
  SIGNAL phiNew                           : signed(25 DOWNTO 0);  -- sfix26_En12
  SIGNAL p16phiNew_sub_cast               : signed(14 DOWNTO 0);  -- sfix15_En12
  SIGNAL p16phiNew_cast                   : signed(12 DOWNTO 0);  -- sfix13_En12
  SIGNAL p16phiNew_mul_temp               : signed(14 DOWNTO 0);  -- sfix15_En12
  SIGNAL p16phiNew_sub_cast_1             : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL p16phiNew_sub_cast_2             : signed(11 DOWNTO 0);  -- sfix12_En12
  SIGNAL p16phiNew_sub_cast_3             : signed(14 DOWNTO 0);  -- sfix15_En12
  SIGNAL p16phiNew_sub_temp               : signed(14 DOWNTO 0);  -- sfix15_En12
  SIGNAL tmp_14                           : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL phi_1                            : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL tmp_15                           : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL tmp_16                           : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL p31_cast                         : signed(27 DOWNTO 0);  -- sfix28_En12
  SIGNAL phi12                            : unsigned(12 DOWNTO 0);  -- ufix13
  SIGNAL p30phi12_add_temp                : signed(17 DOWNTO 0);  -- sfix18
  SIGNAL p28f_i_add_temp                  : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL p28f_i_sub_cast                  : signed(31 DOWNTO 0);  -- int32
  SIGNAL p26z_i_mul_temp                  : signed(25 DOWNTO 0);  -- sfix26_En12
  SIGNAL p26z_i_mul_temp_1                : signed(25 DOWNTO 0);  -- sfix26_En12
  SIGNAL s_f_i                            : signed(25 DOWNTO 0);  -- sfix26_En12
  SIGNAL s_f_q                            : signed(25 DOWNTO 0);  -- sfix26_En12
  SIGNAL s_f_out_re_1                     : signed(25 DOWNTO 0);  -- sfix26_En12
  SIGNAL s_f_out_im_1                     : signed(25 DOWNTO 0);  -- sfix26_En12
  SIGNAL s_f_out_re_2                     : signed(25 DOWNTO 0);  -- sfix26_En12
  SIGNAL s_f_out_im_2                     : signed(25 DOWNTO 0);  -- sfix26_En12
  SIGNAL c_1                              : signed(43 DOWNTO 0);  -- sfix44_En24
  SIGNAL buf_i                            : vector_of_signed26(0 TO 16);  -- sfix26_En12 [17]
  SIGNAL buf_i_1                          : vector_of_signed26(0 TO 16);  -- sfix26_En12 [17]
  SIGNAL tmp_17                           : vector_of_signed26(0 TO 16);  -- sfix26_En12 [17]
  SIGNAL c_2                              : signed(43 DOWNTO 0);  -- sfix44_En24
  SIGNAL buf_q                            : vector_of_signed26(0 TO 16);  -- sfix26_En12 [17]
  SIGNAL buf_q_1                          : vector_of_signed26(0 TO 16);  -- sfix26_En12 [17]
  SIGNAL tmp_18                           : vector_of_signed26(0 TO 16);  -- sfix26_En12 [17]
  SIGNAL c_3                              : signed(43 DOWNTO 0);  -- sfix44_En24
  SIGNAL s_c_i                            : signed(25 DOWNTO 0);  -- sfix26_En12
  SIGNAL c_4                              : signed(43 DOWNTO 0);  -- sfix44_En24
  SIGNAL s_c_q                            : signed(25 DOWNTO 0);  -- sfix26_En12
  SIGNAL s_c_out_re_1                     : signed(25 DOWNTO 0);  -- sfix26_En12
  SIGNAL s_c_out_im_1                     : signed(25 DOWNTO 0);  -- sfix26_En12
  SIGNAL s_c_out_re_2                     : signed(25 DOWNTO 0);  -- sfix26_En12
  SIGNAL s_c_out_im_2                     : signed(25 DOWNTO 0);  -- sfix26_En12
  SIGNAL fe                               : signed(25 DOWNTO 0);  -- sfix26_En12
  SIGNAL f_est_out_1                      : signed(25 DOWNTO 0);  -- sfix26_En12
  SIGNAL f_est_out_2                      : signed(25 DOWNTO 0);  -- sfix26_En12

BEGIN
  i_in_signed <= signed(i_in);

  q_in_signed <= signed(q_in);

  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  --                                                                          %
  --        Generated by MATLAB 8.1, MATLAB Coder 2.4 and HDL Coder 3.2      %
  --                                                                          %
  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  -- QPSK demonstration packet-based transceiver for Chilipepper
  -- Toyon Research Corp.
  -- http://www.toyon.com/chilipepper.php
  -- Created 10/17/2012
  -- embedded@toyon.com
  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  -- This file is the top level entry function for the receiver portion of the
  -- example. The entire receiver is designed to run at Rate=1 (one clock
  -- cycle per iteration of the core.
  -- We follow standard receive practice with frequency offset estimation,
  -- pulse-shape filtering, time estimateion, and correlation to determine
  -- start of packet.
  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  -- scale input data coming from the Chilipepper ADC to be purely fractional
  -- to avoid scaling issues
  r_in_re <= i_in_signed;
  r_in_im <= q_in_signed;

  -- original signal out (real version)
  r_out_1 <= r_in_re;

  r_out_2 <= r_out_1;

  r_out <= std_logic_vector(r_out_2);

  mu_foc_in_unsigned <= unsigned(mu_foc_in);

  -- frequency offset estimation. Note that time constant is input as integer
  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  -- QPSK demonstration packet-based transceiver for Chilipepper
  -- Toyon Research Corp.
  -- http://www.toyon.com/chilipepper.php
  -- Created 10/17/2012
  -- embedded@toyon.com
  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  -- Demonstration of a Costas Loop. Refer to:
  -- Telecommunications Breakdown: Concepts of Communication Transmitted via
  -- Software-Defined Radio C. Richard Johnson
  -- We employ a hard-decision feedback in order to get rid of the loop
  -- filters.
  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  p39mu_cast <= mu_foc_in_unsigned & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0';
  p39mu_cast_1 <= p39mu_cast srl 12;
  mu <= p39mu_cast_1(11 DOWNTO 0);

  enb <= ce;

  p33tmp_sub_cast <= (resize(c(27 DOWNTO 11), 18)) + ('0' & (c(10) OR c(9) OR c(8) OR c(7) OR c(6) OR c(5) OR c(4) OR c(3) OR c(2) OR c(1) OR c(0)));
  p33tmp_sub_temp <= p33tmp_sub_cast - 1;
  p33tmp_cast <= (resize(p33tmp_sub_temp(17 DOWNTO 1), 18)) + ('0' & p33tmp_sub_temp(0));
  tmp <= p33tmp_cast(16 DOWNTO 0);

  c <= resize(tmp_1 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 28);

  p32tmp_add_cast <= resize(c(27 DOWNTO 11), 18);
  p32tmp_add_temp <= p32tmp_add_cast + 1;
  tmp_2 <= p32tmp_add_temp(17 DOWNTO 1);

  tmp_4 <= tmp_3 + 4096;

  --spssa
  tmp_5 <= phi - 4096;

  p22tmp_cast <= resize(z_q, 27);
  p22tmp_cast_1 <= resize(p22tmp_cast, 28);
  p22tmp_cast_2 <=  - (p22tmp_cast_1);
  p22tmp_cast_3 <= p22tmp_cast_2(26 DOWNTO 0);
  tmp_6 <= p22tmp_cast_3(25 DOWNTO 0);

  tmp_7 <= z_q;

  
  tmp_8 <= tmp_6 WHEN z_i < 0 ELSE
      tmp_7;

  p25tmp_cast <= resize(z_i, 27);
  p25tmp_cast_1 <= resize(p25tmp_cast, 28);
  p25tmp_cast_2 <=  - (p25tmp_cast_1);
  p25tmp_cast_3 <= p25tmp_cast_2(26 DOWNTO 0);
  tmp_9 <= p25tmp_cast_3(25 DOWNTO 0);

  tmp_10 <= z_i;

  p27f_q_add_temp <= resize(tmp_11, 14) + 1;
  p27f_q_sub_cast <= signed(resize(p27f_q_add_temp, 32));
  f_q <= lSin(to_integer(p27f_q_sub_cast - 1));

  p23z_q_mul_temp <= q_in_signed * f_i;
  p23z_q_1 <=  - (resize(i_in_signed, 14));
  p23z_q_cast <= p23z_q_1(12 DOWNTO 0);
  p23z_q_mul_temp_1 <= p23z_q_cast * f_q;
  p23z_q_add_cast <= p23z_q_mul_temp_1(25 DOWNTO 0);
  z_q <= p23z_q_mul_temp + p23z_q_add_cast;

  
  tmp_12 <= tmp_9 WHEN z_q < 0 ELSE
      tmp_10;

  -- using sign of error in order to make it gain invariant
  time_diff <= tmp_12 - tmp_8;

  
  tmp_13 <= to_signed(-1, 2) WHEN time_diff < 0 ELSE
      to_signed(1, 2);

  p16phiNew_sub_cast <= resize(tmp_1, 15);
  p16phiNew_cast <= signed(resize(mu, 13));
  p16phiNew_mul_temp <= p16phiNew_cast * tmp_13;
  p16phiNew_sub_cast_1 <= p16phiNew_mul_temp(13 DOWNTO 0);
  p16phiNew_sub_cast_2 <= p16phiNew_sub_cast_1(11 DOWNTO 0);
  p16phiNew_sub_cast_3 <= resize(p16phiNew_sub_cast_2, 15);
  p16phiNew_sub_temp <= p16phiNew_sub_cast - p16phiNew_sub_cast_3;
  phiNew <= resize(p16phiNew_sub_temp, 26);

  tmp_14 <= phiNew(13 DOWNTO 0);

  phi_1 <= tmp_14;

  phi_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      phi <= to_signed(0, 14);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        phi <= phi_1;
      END IF;
    END IF;
  END PROCESS phi_reg_process;


  -- create the VCO signal
  tmp_15 <= phi;

  
  tmp_3 <= tmp_5 WHEN tmp_15 >= 4096 ELSE
      phi;

  
  tmp_1 <= tmp_4 WHEN tmp_3 < 0 ELSE
      tmp_3;

  p31_cast <= resize(tmp_1 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 28);
  
  tmp_16 <= tmp WHEN p31_cast < 0 ELSE
      tmp_2;

  p30phi12_add_temp <= resize(tmp_16, 18) + 1;
  phi12 <= unsigned(p30phi12_add_temp(12 DOWNTO 0));

  
  tmp_11 <= to_unsigned(1, 13) WHEN phi12 >= 4096 ELSE
      phi12;

  p28f_i_add_temp <= resize(tmp_11, 14) + 1;
  p28f_i_sub_cast <= signed(resize(p28f_i_add_temp, 32));
  f_i <= lCos(to_integer(p28f_i_sub_cast - 1));

  p26z_i_mul_temp <= i_in_signed * f_i;
  p26z_i_mul_temp_1 <= q_in_signed * f_q;
  z_i <= p26z_i_mul_temp + p26z_i_mul_temp_1;

  s_f_i <= z_i;

  s_f_q <= z_q;

  -- incremental signal outputs after frequency estimation and filtering
  s_f_out_re_1 <= s_f_i;
  s_f_out_im_1 <= s_f_q;

  s_f_out_re_2 <= s_f_out_re_1;
  s_f_out_im_2 <= s_f_out_im_1;

  s_f_out_re <= std_logic_vector(s_f_out_re_2);

  s_f_out_im <= std_logic_vector(s_f_out_im_2);

  c_1 <= to_signed(0, 44);

  buf_i_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      buf_i_1 <= (OTHERS => to_signed(0, 26));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        buf_i_1 <= buf_i;
      END IF;
    END IF;
  END PROCESS buf_i_reg_process;


  -- Square-root raised-cosine band-limited filtering
  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  -- QPSK demonstration packet-based transceiver for Chilipepper
  -- Toyon Research Corp.
  -- http://www.toyon.com/chilipepper.php
  -- Created 10/17/2012
  -- embedded@toyon.com
  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  tmp_17(0 TO 15) <= buf_i_1(1 TO 16);
  tmp_17(16) <= s_f_i;

  buf_i <= tmp_17;

  c_2 <= to_signed(0, 44);

  buf_q_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      buf_q_1 <= (OTHERS => to_signed(0, 26));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        buf_q_1 <= buf_q;
      END IF;
    END IF;
  END PROCESS buf_q_reg_process;


  tmp_18(0 TO 15) <= buf_q_1(1 TO 16);
  tmp_18(16) <= s_f_q;

  buf_q <= tmp_18;

  p5_output : PROCESS (c_1, buf_i)
    VARIABLE tmp19 : signed(43 DOWNTO 0);
    VARIABLE c1 : signed(43 DOWNTO 0);
    VARIABLE tmp_0 : signed(43 DOWNTO 0);
    VARIABLE add_cast : vector_of_signed45(0 TO 16);
    VARIABLE mul_temp : vector_of_signed39(0 TO 16);
    VARIABLE add_cast_0 : vector_of_signed45(0 TO 16);
    VARIABLE add_temp : vector_of_signed45(0 TO 16);
  BEGIN
    c1 := c_1;
    tmp19 := c_1;

    FOR k IN 0 TO 16 LOOP
      add_cast(k) := resize(tmp19, 45);
      mul_temp(k) := buf_i(k) * nc(k);
      add_cast_0(k) := resize(mul_temp(k), 45);
      add_temp(k) := add_cast(k) + add_cast_0(k);
      tmp_0 := add_temp(k)(43 DOWNTO 0);
      c1 := tmp_0;
      tmp19 := tmp_0;
    END LOOP;

    c_3 <= c1;
  END PROCESS p5_output;


  s_c_i <= c_3(37 DOWNTO 12);

  p3_output : PROCESS (c_2, buf_q)
    VARIABLE tmp20 : signed(43 DOWNTO 0);
    VARIABLE c2 : signed(43 DOWNTO 0);
    VARIABLE tmp_01 : signed(43 DOWNTO 0);
    VARIABLE add_cast1 : vector_of_signed45(0 TO 16);
    VARIABLE mul_temp1 : vector_of_signed39(0 TO 16);
    VARIABLE add_cast_01 : vector_of_signed45(0 TO 16);
    VARIABLE add_temp1 : vector_of_signed45(0 TO 16);
  BEGIN
    c2 := c_2;
    tmp20 := c_2;

    FOR k1 IN 0 TO 16 LOOP
      add_cast1(k1) := resize(tmp20, 45);
      mul_temp1(k1) := buf_q(k1) * nc_2(k1);
      add_cast_01(k1) := resize(mul_temp1(k1), 45);
      add_temp1(k1) := add_cast1(k1) + add_cast_01(k1);
      tmp_01 := add_temp1(k1)(43 DOWNTO 0);
      c2 := tmp_01;
      tmp20 := tmp_01;
    END LOOP;

    c_4 <= c2;
  END PROCESS p3_output;


  s_c_q <= c_4(37 DOWNTO 12);

  s_c_out_re_1 <= s_c_i;
  s_c_out_im_1 <= s_c_q;

  s_c_out_re_2 <= s_c_out_re_1;
  s_c_out_im_2 <= s_c_out_im_1;

  s_c_out_re <= std_logic_vector(s_c_out_re_2);

  s_c_out_im <= std_logic_vector(s_c_out_im_2);

  fe <= phiNew;

  -- frequency estimation value
  f_est_out_1 <= fe;

  f_est_out_2 <= f_est_out_1;

  f_est_out <= std_logic_vector(f_est_out_2);

  ce_out <= ce;

END rtl;


-------------------------------------------------------------------
-- System Generator version 14.3 VHDL source file.
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
	trig0 : in std_logic_vector(12-1 downto 0);
	trig1 : in std_logic_vector(26-1 downto 0);
	trig2 : in std_logic_vector(26-1 downto 0);
	trig3 : in std_logic_vector(26-1 downto 0);


          ce       : in std_logic;
          clr      : in std_logic;
          clk      : in std_logic);
end xlchipscope;
architecture behavior of xlchipscope is
    attribute syn_noprune : boolean;
    attribute syn_black_box : boolean;
    attribute box_type : string;
    attribute syn_noprune of behavior : architecture is true;
    signal data     : std_logic_vector (90-1 downto 0);
    signal control  : std_logic_vector (35 downto 0);
    component ila_1_05_a_cc04612f5deda358
    port (control     : inout std_logic_vector(35 downto 0);
	trig0 : in std_logic_vector(12-1 downto 0);
	trig1 : in std_logic_vector(26-1 downto 0);
	trig2 : in std_logic_vector(26-1 downto 0);
	trig3 : in std_logic_vector(26-1 downto 0);

          clk         : in    std_logic
    );
    end component;
    attribute syn_black_box of ila_1_05_a_cc04612f5deda358 : component is TRUE;
    attribute box_type of ila_1_05_a_cc04612f5deda358 : component  is "black_box";
    attribute syn_noprune of ila_1_05_a_cc04612f5deda358 : component is TRUE;
    component icon_1_06_a_a814991b9aa9824e
    port (control0    :  inout std_logic_vector(35 downto 0)
    );
    end component;
    attribute syn_black_box of icon_1_06_a_a814991b9aa9824e : component is TRUE;
    attribute box_type of icon_1_06_a_a814991b9aa9824e : component  is "black_box";
    attribute syn_noprune of icon_1_06_a_a814991b9aa9824e : component is TRUE;

begin

 i_ila : ila_1_05_a_cc04612f5deda358
    port map
    (   control   => control,
        trig0     => trig0,
        trig1     => trig1,
        trig2     => trig2,
        trig3     => trig3,
        clk       => clk
    );
  i_icon_for_syn : icon_1_06_a_a814991b9aa9824e
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

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.conv_pkg.all;

entity constant_344c36122f is
  port (
    op : out std_logic_vector((12 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end constant_344c36122f;


architecture behavior of constant_344c36122f is
begin
  op <= "000000101000";
end behavior;


-------------------------------------------------------------------
-- System Generator version 14.3 VHDL source file.
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
entity xlregister is
   generic (d_width          : integer := 5;
            init_value       : bit_vector := b"00");
   port (d   : in std_logic_vector (d_width-1 downto 0);
         rst : in std_logic_vector(0 downto 0) := "0";
         en  : in std_logic_vector(0 downto 0) := "1";
         ce  : in std_logic;
         clk : in std_logic;
         q   : out std_logic_vector (d_width-1 downto 0));
end xlregister;
architecture behavior of xlregister is
   component synth_reg_w_init
      generic (width      : integer;
               init_index : integer;
               init_value : bit_vector;
               latency    : integer);
      port (i   : in std_logic_vector(width-1 downto 0);
            ce  : in std_logic;
            clr : in std_logic;
            clk : in std_logic;
            o   : out std_logic_vector(width-1 downto 0));
   end component;
   -- synopsys translate_off
   signal real_d, real_q           : real;
   -- synopsys translate_on
   signal internal_clr             : std_logic;
   signal internal_ce              : std_logic;
begin
   internal_clr <= rst(0) and ce;
   internal_ce  <= en(0) and ce;
   synth_reg_inst : synth_reg_w_init
      generic map (width      => d_width,
                   init_index => 2,
                   init_value => init_value,
                   latency    => 1)
      port map (i   => d,
                ce  => internal_ce,
                clr => internal_clr,
                clk => clk,
                o   => q);
end architecture behavior;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "rx/EDK Processor"

entity edk_processor_entity_b6dc80b1d4 is
  port (
    axi_aresetn: in std_logic; 
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
    memmap_x0: out std_logic; 
    memmap_x1: out std_logic; 
    memmap_x10: out std_logic; 
    memmap_x2: out std_logic_vector(7 downto 0); 
    memmap_x3: out std_logic_vector(1 downto 0); 
    memmap_x4: out std_logic; 
    memmap_x5: out std_logic_vector(31 downto 0); 
    memmap_x6: out std_logic_vector(7 downto 0); 
    memmap_x7: out std_logic; 
    memmap_x8: out std_logic_vector(1 downto 0); 
    memmap_x9: out std_logic
  );
end edk_processor_entity_b6dc80b1d4;

architecture structural of edk_processor_entity_b6dc80b1d4 is
  signal axi_aresetn_net_x0: std_logic;
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

begin
  axi_aresetn_net_x0 <= axi_aresetn;
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
  memmap_x0 <= memmap_s_axi_arready_net_x0;
  memmap_x1 <= memmap_s_axi_awready_net_x0;
  memmap_x10 <= memmap_s_axi_wready_net_x0;
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
      s_axi_wready => memmap_s_axi_wready_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "rx"

entity rx is
  port (
    axi_aresetn: in std_logic; 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    i_in: in std_logic_vector(11 downto 0); 
    plb_ce_1: in std_logic; 
    plb_clk_1: in std_logic; 
    q_in: in std_logic_vector(11 downto 0); 
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
end rx;

architecture structural of rx is
  attribute core_generation_info: string;
  attribute core_generation_info of structural : architecture is "rx,sysgen_core,{clock_period=10.00000000,clocking=Clock_Enables,sample_periods=1.00000000000 1.00000000000,testbench=0,total_blocks=89,xilinx_black_box_block=1,xilinx_chipscope_block=1,xilinx_constant_block_block=2,xilinx_edk_core_block=1,xilinx_edk_processor_block=1,xilinx_gateway_in_block=27,xilinx_gateway_out_block=11,xilinx_register_block=4,xilinx_system_generator_block=1,}";

  signal axi_aresetn_net: std_logic;
  signal black_box_ce_out_net: std_logic;
  signal black_box_f_est_out_net: std_logic_vector(25 downto 0);
  signal black_box_r_out_net: std_logic_vector(11 downto 0);
  signal black_box_s_c_out_im_net: std_logic_vector(25 downto 0);
  signal black_box_s_c_out_re_net: std_logic_vector(25 downto 0);
  signal black_box_s_f_out_im_net: std_logic_vector(25 downto 0);
  signal black_box_s_f_out_re_net: std_logic_vector(25 downto 0);
  signal ce_1_sg_x0: std_logic;
  signal clk_1_sg_x0: std_logic;
  signal constant1_op_net: std_logic_vector(11 downto 0);
  signal constant_op_net: std_logic;
  signal i_in_net: std_logic_vector(11 downto 0);
  signal plb_ce_1_sg_x1: std_logic;
  signal plb_clk_1_sg_x1: std_logic;
  signal q_in_net: std_logic_vector(11 downto 0);
  signal register1_q_net: std_logic_vector(11 downto 0);
  signal register2_q_net: std_logic_vector(11 downto 0);
  signal register3_q_net: std_logic_vector(11 downto 0);
  signal register_q_net: std_logic;
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

begin
  axi_aresetn_net <= axi_aresetn;
  ce_1_sg_x0 <= ce_1;
  clk_1_sg_x0 <= clk_1;
  i_in_net <= i_in;
  plb_ce_1_sg_x1 <= plb_ce_1;
  plb_clk_1_sg_x1 <= plb_clk_1;
  q_in_net <= q_in;
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

  black_box: entity work.qpsk_rx_FixPt
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      i_in => register1_q_net,
      mu_foc_in => register3_q_net,
      q_in => register2_q_net,
      reset => register_q_net,
      ce_out => black_box_ce_out_net,
      f_est_out => black_box_f_est_out_net,
      r_out => black_box_r_out_net,
      s_c_out_im => black_box_s_c_out_im_net,
      s_c_out_re => black_box_s_c_out_re_net,
      s_f_out_im => black_box_s_f_out_im_net,
      s_f_out_re => black_box_s_f_out_re_net
    );

  chipscope: entity work.xlchipscope
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      trig0 => black_box_r_out_net,
      trig1 => black_box_s_c_out_re_net,
      trig2 => black_box_s_c_out_im_net,
      trig3 => black_box_f_est_out_net
    );

  constant1: entity work.constant_344c36122f
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant_x0: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant_op_net
    );

  edk_processor_b6dc80b1d4: entity work.edk_processor_entity_b6dc80b1d4
    port map (
      axi_aresetn => axi_aresetn_net,
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
      memmap_x0 => s_axi_arready_net,
      memmap_x1 => s_axi_awready_net,
      memmap_x10 => s_axi_wready_net,
      memmap_x2 => s_axi_bid_net,
      memmap_x3 => s_axi_bresp_net,
      memmap_x4 => s_axi_bvalid_net,
      memmap_x5 => s_axi_rdata_net,
      memmap_x6 => s_axi_rid_net,
      memmap_x7 => s_axi_rlast_net,
      memmap_x8 => s_axi_rresp_net,
      memmap_x9 => s_axi_rvalid_net
    );

  register1: entity work.xlregister
    generic map (
      d_width => 12,
      init_value => b"000000000000"
    )
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      d => i_in_net,
      en => "1",
      rst => "0",
      q => register1_q_net
    );

  register2: entity work.xlregister
    generic map (
      d_width => 12,
      init_value => b"000000000000"
    )
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      d => q_in_net,
      en => "1",
      rst => "0",
      q => register2_q_net
    );

  register3: entity work.xlregister
    generic map (
      d_width => 12,
      init_value => b"000000000000"
    )
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      d => constant1_op_net,
      en => "1",
      rst => "0",
      q => register3_q_net
    );

  register_x0: entity work.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      d(0) => constant_op_net,
      en => "1",
      rst => "0",
      q(0) => register_q_net
    );

end structural;
