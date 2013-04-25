
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
        -- 'dir'
        sm_dir_dout : in std_logic_vector(2-1 downto 0);
        -- 'rssi'
        sm_rssi_dout : in std_logic_vector(24-1 downto 0);
        -- 'To Register'
        -- 'rx_en'
        sm_rx_en_dout : in std_logic_vector(1-1 downto 0);
        sm_rx_en_din  : out std_logic_vector(1-1 downto 0);
        sm_rx_en_en   : out std_logic;
        -- 'rssi_high_goal'
        sm_rssi_high_goal_dout : in std_logic_vector(24-1 downto 0);
        sm_rssi_high_goal_din  : out std_logic_vector(24-1 downto 0);
        sm_rssi_high_goal_en   : out std_logic;
        -- 'rssi_low_goal'
        sm_rssi_low_goal_dout : in std_logic_vector(24-1 downto 0);
        sm_rssi_low_goal_din  : out std_logic_vector(24-1 downto 0);
        sm_rssi_low_goal_en   : out std_logic;
        -- 'agc_en'
        sm_agc_en_dout : in std_logic_vector(1-1 downto 0);
        sm_agc_en_din  : out std_logic_vector(1-1 downto 0);
        sm_agc_en_en   : out std_logic;
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
-- 'dir'
signal sm_dir_dout_i  : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
-- 'rssi'
signal sm_rssi_dout_i  : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
-- 'To Register'
-- 'rx_en'
signal sm_rx_en_din_i   : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
signal sm_rx_en_en_i    : std_logic;
signal sm_rx_en_dout_i  : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
-- 'rssi_high_goal'
signal sm_rssi_high_goal_din_i   : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
signal sm_rssi_high_goal_en_i    : std_logic;
signal sm_rssi_high_goal_dout_i  : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
-- 'rssi_low_goal'
signal sm_rssi_low_goal_din_i   : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
signal sm_rssi_low_goal_en_i    : std_logic;
signal sm_rssi_low_goal_dout_i  : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
-- 'agc_en'
signal sm_agc_en_din_i   : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
signal sm_agc_en_en_i    : std_logic;
signal sm_agc_en_dout_i  : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
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
-- 'dir'
gen_sm_dir_dout_i: if (2 < C_S_AXI_DATA_WIDTH) generate
    sm_dir_dout_i(C_S_AXI_DATA_WIDTH-1 downto 2) <= (others => '0');
end generate gen_sm_dir_dout_i;
sm_dir_dout_i(2-1 downto 0) <= sm_dir_dout;
-- 'rssi'
gen_sm_rssi_dout_i: if (24 < C_S_AXI_DATA_WIDTH) generate
    sm_rssi_dout_i(C_S_AXI_DATA_WIDTH-1 downto 24) <= (others => '0');
end generate gen_sm_rssi_dout_i;
sm_rssi_dout_i(24-1 downto 0) <= sm_rssi_dout;
-- 'To Register'
-- 'rx_en'
sm_rx_en_din     <= sm_rx_en_din_i(1-1 downto 0);
sm_rx_en_en      <= sm_rx_en_en_i;
gen_sm_rx_en_dout_i: if (1 < C_S_AXI_DATA_WIDTH) generate
    sm_rx_en_dout_i(C_S_AXI_DATA_WIDTH-1 downto 1) <= (others => '0');
end generate gen_sm_rx_en_dout_i;
sm_rx_en_dout_i(1-1 downto 0) <= sm_rx_en_dout;
-- 'rssi_high_goal'
sm_rssi_high_goal_din     <= sm_rssi_high_goal_din_i(24-1 downto 0);
sm_rssi_high_goal_en      <= sm_rssi_high_goal_en_i;
gen_sm_rssi_high_goal_dout_i: if (24 < C_S_AXI_DATA_WIDTH) generate
    sm_rssi_high_goal_dout_i(C_S_AXI_DATA_WIDTH-1 downto 24) <= (others => '0');
end generate gen_sm_rssi_high_goal_dout_i;
sm_rssi_high_goal_dout_i(24-1 downto 0) <= sm_rssi_high_goal_dout;
-- 'rssi_low_goal'
sm_rssi_low_goal_din     <= sm_rssi_low_goal_din_i(24-1 downto 0);
sm_rssi_low_goal_en      <= sm_rssi_low_goal_en_i;
gen_sm_rssi_low_goal_dout_i: if (24 < C_S_AXI_DATA_WIDTH) generate
    sm_rssi_low_goal_dout_i(C_S_AXI_DATA_WIDTH-1 downto 24) <= (others => '0');
end generate gen_sm_rssi_low_goal_dout_i;
sm_rssi_low_goal_dout_i(24-1 downto 0) <= sm_rssi_low_goal_dout;
-- 'agc_en'
sm_agc_en_din     <= sm_agc_en_din_i(1-1 downto 0);
sm_agc_en_en      <= sm_agc_en_en_i;
gen_sm_agc_en_dout_i: if (1 < C_S_AXI_DATA_WIDTH) generate
    sm_agc_en_dout_i(C_S_AXI_DATA_WIDTH-1 downto 1) <= (others => '0');
end generate gen_sm_agc_en_dout_i;
sm_agc_en_dout_i(1-1 downto 0) <= sm_agc_en_dout;
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
            -- rx_en din/en
            sm_rx_en_din_i <= (others => '0');
            sm_rx_en_en_i <= '0';
            -- rssi_high_goal din/en
            sm_rssi_high_goal_din_i <= (others => '0');
            sm_rssi_high_goal_en_i <= '0';
            -- rssi_low_goal din/en
            sm_rssi_low_goal_din_i <= (others => '0');
            sm_rssi_low_goal_en_i <= '0';
            -- agc_en din/en
            sm_agc_en_din_i <= (others => '0');
            sm_agc_en_en_i <= '0';
            -- 'To FIFO'
            -- 'Shared Memory'
        else
            -- default assignments

            -- 'To Register'
            if (unsigned(write_bank_addr_i) = 2) then
                if (unsigned(write_linear_addr_i) = 0) then
                    -- rx_en din/en
                    sm_rx_en_din_i <= S_AXI_WDATA;
                    sm_rx_en_en_i  <= write_addr_valid;
                elsif (unsigned(write_linear_addr_i) = 1) then
                    -- rssi_high_goal din/en
                    sm_rssi_high_goal_din_i <= S_AXI_WDATA;
                    sm_rssi_high_goal_en_i  <= write_addr_valid;
                elsif (unsigned(write_linear_addr_i) = 2) then
                    -- rssi_low_goal din/en
                    sm_rssi_low_goal_din_i <= S_AXI_WDATA;
                    sm_rssi_low_goal_en_i  <= write_addr_valid;
                elsif (unsigned(write_linear_addr_i) = 3) then
                    -- agc_en din/en
                    sm_agc_en_din_i <= S_AXI_WDATA;
                    sm_agc_en_en_i  <= write_addr_valid;
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
                    -- 'dir' dout
                    reg_bank_out_i <= sm_dir_dout_i;
                elsif (unsigned(read_linear_addr_i) = 1) then
                    -- 'rssi' dout
                    reg_bank_out_i <= sm_rssi_dout_i;
                end if;

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
-- File Name: C:\GIT\Chilipepper\Labs\Lab_5\Matlab\codegen\dc_offset_correction\hdlsrc\dc_offset_correction_FixPt_pkg.vhd
-- Created: 2013-04-23 13:11:39
-- 
-- Generated by MATLAB 8.1, MATLAB Coder 2.4 and HDL Coder 3.2
-- 
-- 
-- -------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE dc_offset_correction_FixPt_pkg IS
  TYPE vector_of_signed12 IS ARRAY (NATURAL RANGE <>) OF signed(11 DOWNTO 0);
  TYPE vector_of_unsigned24 IS ARRAY (NATURAL RANGE <>) OF unsigned(23 DOWNTO 0);
  TYPE vector_of_signed49 IS ARRAY (NATURAL RANGE <>) OF signed(48 DOWNTO 0);
  TYPE vector_of_unsigned2 IS ARRAY (NATURAL RANGE <>) OF unsigned(1 DOWNTO 0);
END dc_offset_correction_FixPt_pkg;

-- -------------------------------------------------------------
-- 
-- File Name: C:\GIT\Chilipepper\Labs\Lab_5\Matlab\codegen\dc_offset_correction\hdlsrc\dc_offset_correction_FixPt.vhd
-- Created: 2013-04-23 13:11:39
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
-- i_out                         ce_out        1
-- q_out                         ce_out        1
-- rssi_out                      ce_out        1
-- rssi_en_out                   ce_out        1
-- dir_out                       ce_out        1
-- dir_en_out                    ce_out        1
-- -------------------------------------------------------------
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: dc_offset_correction_FixPt
-- Source Path: dc_offset_correction_FixPt
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.dc_offset_correction_FixPt_pkg.ALL;

ENTITY dc_offset_correction_FixPt IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        ce                                :   IN    std_logic;
        i_in                              :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        q_in                              :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        alpha_in                          :   IN    std_logic_vector(11 DOWNTO 0);  -- ufix12
        gain_en_in                        :   IN    std_logic;  -- ufix1
        rssi_low_goal_in                  :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix24
        rssi_high_goal_in                 :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix24
        rx_en_in                          :   IN    std_logic;
        ce_out                            :   OUT   std_logic;
        i_out                             :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        q_out                             :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        rssi_out                          :   OUT   std_logic_vector(23 DOWNTO 0);  -- ufix24
        rssi_en_out                       :   OUT   std_logic;  -- ufix1
        dir_out                           :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        dir_en_out                        :   OUT   std_logic  -- ufix1
        );
END dc_offset_correction_FixPt;


ARCHITECTURE rtl OF dc_offset_correction_FixPt IS

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL i_in_signed                      : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL i_in_1                           : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL tmp                              : std_logic;
  SIGNAL tmp_1                            : std_logic;
  SIGNAL tmp_2                            : std_logic;
  SIGNAL tmp_3                            : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL tmp_4                            : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL p209tmp_1                        : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL tmp_5                            : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL tmp_6                            : std_logic;
  SIGNAL alpha_in_unsigned                : unsigned(11 DOWNTO 0);  -- ufix12
  SIGNAL alpha                            : unsigned(11 DOWNTO 0);  -- ufix12_En12
  SIGNAL p205alpha_cast                   : unsigned(23 DOWNTO 0);  -- ufix24_En12
  SIGNAL p205alpha_cast_1                 : unsigned(23 DOWNTO 0);  -- ufix24_En12
  SIGNAL tmp_7                            : unsigned(13 DOWNTO 0);  -- ufix14_En12
  SIGNAL p189tmp_sub_cast                 : unsigned(13 DOWNTO 0);  -- ufix14_En12
  SIGNAL tmp_8                            : unsigned(11 DOWNTO 0);  -- ufix12_En12
  SIGNAL multiplier_cast                  : signed(12 DOWNTO 0);  -- sfix13_En12
  SIGNAL multiplier_mul_temp              : signed(24 DOWNTO 0);  -- sfix25_En12
  SIGNAL tmp_9                            : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_10                           : signed(38 DOWNTO 0);  -- sfix39_En24
  SIGNAL tmp_11                           : std_logic;
  SIGNAL tmp_12                           : signed(38 DOWNTO 0);  -- sfix39_En24
  SIGNAL tmp_13                           : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_14                           : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL p182tmp_cast                     : signed(24 DOWNTO 0);  -- sfix25_En12
  SIGNAL p182tmp_cast_1                   : signed(24 DOWNTO 0);  -- sfix25_En12
  SIGNAL tmp_15                           : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_16                           : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_17                           : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_18                           : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL multiplier_cast_1                : signed(14 DOWNTO 0);  -- sfix15_En12
  SIGNAL multiplier_mul_temp_1            : signed(38 DOWNTO 0);  -- sfix39_En24
  SIGNAL tmp_19                           : signed(37 DOWNTO 0);  -- sfix38_En24
  SIGNAL tmp_20                           : signed(38 DOWNTO 0);  -- sfix39_En24
  SIGNAL tmp_21                           : signed(38 DOWNTO 0);  -- sfix39_En24
  SIGNAL tmp_22                           : signed(38 DOWNTO 0);  -- sfix39_En24
  SIGNAL tmp_23                           : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_24                           : std_logic;
  SIGNAL tmp_25                           : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_26                           : std_logic;
  SIGNAL tmp_27                           : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_28                           : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL i_out_1                          : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL p152i_out_sub_cast               : signed(24 DOWNTO 0);  -- sfix25_En12
  SIGNAL p152i_out_sub_cast_1             : signed(24 DOWNTO 0);  -- sfix25_En12
  SIGNAL p152i_out_sub_temp               : signed(24 DOWNTO 0);  -- sfix25_En12
  SIGNAL i_out_2                          : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL rd_46_reg                        : vector_of_signed12(0 TO 2);  -- sfix12 [3]
  SIGNAL i_out_tmp                        : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL q_in_signed                      : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL q_in_1                           : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL tmp_29                           : std_logic;
  SIGNAL tmp_30                           : std_logic;
  SIGNAL tmp_31                           : std_logic;
  SIGNAL tmp_32                           : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL tmp_33                           : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL p213tmp_1                        : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL tmp_34                           : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL tmp_35                           : std_logic;
  SIGNAL tmp_36                           : unsigned(13 DOWNTO 0);  -- ufix14_En12
  SIGNAL p203tmp_sub_cast                 : unsigned(13 DOWNTO 0);  -- ufix14_En12
  SIGNAL tmp_37                           : unsigned(11 DOWNTO 0);  -- ufix12_En12
  SIGNAL multiplier_cast_2                : signed(12 DOWNTO 0);  -- sfix13_En12
  SIGNAL multiplier_mul_temp_2            : signed(24 DOWNTO 0);  -- sfix25_En12
  SIGNAL tmp_38                           : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_39                           : signed(38 DOWNTO 0);  -- sfix39_En24
  SIGNAL tmp_40                           : std_logic;
  SIGNAL tmp_41                           : signed(38 DOWNTO 0);  -- sfix39_En24
  SIGNAL tmp_42                           : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_43                           : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL p196tmp_cast                     : signed(24 DOWNTO 0);  -- sfix25_En12
  SIGNAL p196tmp_cast_1                   : signed(24 DOWNTO 0);  -- sfix25_En12
  SIGNAL tmp_44                           : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_45                           : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_46                           : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_47                           : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL multiplier_cast_3                : signed(14 DOWNTO 0);  -- sfix15_En12
  SIGNAL multiplier_mul_temp_3            : signed(38 DOWNTO 0);  -- sfix39_En24
  SIGNAL tmp_48                           : signed(37 DOWNTO 0);  -- sfix38_En24
  SIGNAL tmp_49                           : signed(38 DOWNTO 0);  -- sfix39_En24
  SIGNAL tmp_50                           : signed(38 DOWNTO 0);  -- sfix39_En24
  SIGNAL tmp_51                           : signed(38 DOWNTO 0);  -- sfix39_En24
  SIGNAL tmp_52                           : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_53                           : std_logic;
  SIGNAL tmp_54                           : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_55                           : std_logic;
  SIGNAL tmp_56                           : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_57                           : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL q_out_1                          : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL p151q_out_sub_cast               : signed(24 DOWNTO 0);  -- sfix25_En12
  SIGNAL p151q_out_sub_cast_1             : signed(24 DOWNTO 0);  -- sfix25_En12
  SIGNAL p151q_out_sub_temp               : signed(24 DOWNTO 0);  -- sfix25_En12
  SIGNAL q_out_2                          : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL rd_47_reg                        : vector_of_signed12(0 TO 2);  -- sfix12 [3]
  SIGNAL q_out_tmp                        : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL tmp_58                           : std_logic;
  SIGNAL tmp_59                           : std_logic;
  SIGNAL rd_27_reg                        : std_logic_vector(0 TO 2);  -- ufix1 [3]
  SIGNAL tmp_60                           : std_logic;
  SIGNAL i_out_3                          : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL q_out_3                          : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL tmp_61                           : signed(23 DOWNTO 0);  -- sfix24
  SIGNAL tmp_62                           : signed(24 DOWNTO 0);  -- sfix25
  SIGNAL tmp_63                           : signed(23 DOWNTO 0);  -- sfix24
  SIGNAL tmp_64                           : signed(24 DOWNTO 0);  -- sfix25
  SIGNAL tmp_65                           : signed(24 DOWNTO 0);  -- sfix25
  SIGNAL rssi_inst                        : unsigned(22 DOWNTO 0);  -- ufix23
  SIGNAL tmp_66                           : std_logic;
  SIGNAL tmp_67                           : std_logic;
  SIGNAL tmp_68                           : std_logic;
  SIGNAL tmp_69                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_70                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_71                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL counter                          : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_72                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL p126_tmp                         : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_73                           : std_logic;
  SIGNAL tmp_74                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_75                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_76                           : std_logic;
  SIGNAL tmp_77                           : std_logic;
  SIGNAL tmp_78                           : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tmp_79                           : std_logic;
  SIGNAL tmp_80                           : std_logic;
  SIGNAL tmp_81                           : std_logic;
  SIGNAL tmp_82                           : std_logic;
  SIGNAL tmp_83                           : std_logic;
  SIGNAL tmp_84                           : std_logic;
  SIGNAL tmp_85                           : std_logic;
  SIGNAL rd_28_reg                        : std_logic_vector(0 TO 2);  -- ufix1 [3]
  SIGNAL tmp_86                           : std_logic;
  SIGNAL tmp_87                           : std_logic;
  SIGNAL tmp_88                           : std_logic;
  SIGNAL tmp_89                           : std_logic;
  SIGNAL tmp_90                           : unsigned(32 DOWNTO 0);  -- ufix33
  SIGNAL tmp_91                           : unsigned(32 DOWNTO 0);  -- ufix33
  SIGNAL tmp_92                           : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL tmp_93                           : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL tmp_94                           : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL tmp_95                           : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL tmp_96                           : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL tmp_97                           : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL tmp_98                           : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL tmp_99                           : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL tmp_100                          : unsigned(32 DOWNTO 0);  -- ufix33
  SIGNAL tmp_101                          : unsigned(32 DOWNTO 0);  -- ufix33
  SIGNAL tmp_102                          : unsigned(32 DOWNTO 0);  -- ufix33
  SIGNAL rssi_out_1                       : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL delayMatch_reg                   : vector_of_unsigned24(0 TO 1);  -- ufix24 [2]
  SIGNAL rssi_out_2                       : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL tmp_103                          : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL p132_tmp                         : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL p132_cast                        : unsigned(39 DOWNTO 0);  -- ufix40_En8
  SIGNAL p132_cast_1                      : unsigned(39 DOWNTO 0);  -- ufix40_En8
  SIGNAL p132_add_cast                    : unsigned(33 DOWNTO 0);  -- ufix34_En1
  SIGNAL p132_add_temp                    : unsigned(33 DOWNTO 0);  -- ufix34_En1
  SIGNAL p132_cast_2                      : unsigned(32 DOWNTO 0);  -- ufix33
  SIGNAL rd_30_reg                        : std_logic_vector(0 TO 2);  -- ufix1 [3]
  SIGNAL tmp_104                          : std_logic;
  SIGNAL delayMatch_reg_1                 : vector_of_unsigned24(0 TO 1);  -- ufix24 [2]
  SIGNAL rssi_out_3                       : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL tmp_105                          : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL delayMatch_reg_2                 : vector_of_unsigned24(0 TO 1);  -- ufix24 [2]
  SIGNAL rssi_out_4                       : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL tmp_106                          : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL rssi_out_5                       : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL rssi_out_tmp                     : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL tmp_107                          : std_logic;
  SIGNAL tmp_108                          : std_logic;
  SIGNAL tmp_109                          : std_logic;
  SIGNAL tmp_110                          : std_logic;
  SIGNAL rssi_en_out_1                    : std_logic;  -- ufix1
  SIGNAL delayMatch_reg_3                 : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL rssi_en_out_2                    : std_logic;  -- ufix1
  SIGNAL tmp_111                          : std_logic;  -- ufix1
  SIGNAL p130_tmp                         : std_logic;  -- ufix1
  SIGNAL rd_29_reg                        : std_logic_vector(0 TO 2);  -- ufix1 [3]
  SIGNAL tmp_112                          : std_logic;
  SIGNAL delayMatch_reg_4                 : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL rssi_en_out_3                    : std_logic;  -- ufix1
  SIGNAL tmp_113                          : std_logic;  -- ufix1
  SIGNAL delayMatch_reg_5                 : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL rssi_en_out_4                    : std_logic;  -- ufix1
  SIGNAL tmp_114                          : std_logic;  -- ufix1
  SIGNAL rssi_en_out_5                    : std_logic;  -- ufix1
  SIGNAL tmp_115                          : std_logic;
  SIGNAL tmp_116                          : std_logic;
  SIGNAL rd_8_reg                         : std_logic_vector(0 TO 3);  -- ufix1 [4]
  SIGNAL tmp_117                          : std_logic;
  SIGNAL tmp_118                          : std_logic;
  SIGNAL rd_15_reg                        : std_logic_vector(0 TO 3);  -- ufix1 [4]
  SIGNAL tmp_119                          : std_logic;
  SIGNAL tmp_120                          : std_logic;
  SIGNAL tmp_121                          : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL tmp_122                          : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL p215tmp_1                        : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL tmp_123                          : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL ai                               : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tmp_124                          : std_logic;
  SIGNAL tmp_125                          : std_logic;
  SIGNAL tmp_126                          : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL tmp_127                          : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL p217tmp_1                        : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL tmp_128                          : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL aq                               : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL tmp_129                          : std_logic;
  SIGNAL tmp_130                          : std_logic;
  SIGNAL rd_5_reg                         : std_logic_vector(0 TO 3);  -- ufix1 [4]
  SIGNAL tmp_131                          : std_logic;
  SIGNAL tmp_132                          : std_logic;
  SIGNAL tmp_133                          : std_logic;
  SIGNAL tmp_134                          : std_logic;
  SIGNAL rd_31_reg                        : std_logic_vector(0 TO 2);  -- ufix1 [3]
  SIGNAL tmp_135                          : std_logic;
  SIGNAL tmp_136                          : std_logic;
  SIGNAL tmp_137                          : std_logic;
  SIGNAL tmp_138                          : std_logic;
  SIGNAL tmp_139                          : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL rssiHold                         : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL tmp_140                          : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL p134_tmp                         : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL p134_cast                        : unsigned(39 DOWNTO 0);  -- ufix40_En8
  SIGNAL p134_cast_1                      : unsigned(39 DOWNTO 0);  -- ufix40_En8
  SIGNAL p134_add_cast                    : unsigned(33 DOWNTO 0);  -- ufix34_En1
  SIGNAL p134_add_temp                    : unsigned(33 DOWNTO 0);  -- ufix34_En1
  SIGNAL p134_cast_2                      : unsigned(32 DOWNTO 0);  -- ufix33
  SIGNAL tmp_141                          : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL tmp_142                          : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL tmp_143                          : unsigned(13 DOWNTO 0);  -- ufix14_En12
  SIGNAL p169tmp_sub_cast                 : unsigned(13 DOWNTO 0);  -- ufix14_En12
  SIGNAL tmp_144                          : unsigned(11 DOWNTO 0);  -- ufix12_En12
  SIGNAL tmp_145                          : std_logic;
  SIGNAL multiplier_cast_4                : signed(12 DOWNTO 0);  -- sfix13_En12
  SIGNAL multiplier_mul_temp_4            : signed(24 DOWNTO 0);  -- sfix25_En12
  SIGNAL tmp_146                          : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_147                          : signed(38 DOWNTO 0);  -- sfix39_En24
  SIGNAL tmp_148                          : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_149                          : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_150                          : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_151                          : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL multiplier_cast_5                : signed(14 DOWNTO 0);  -- sfix15_En12
  SIGNAL multiplier_mul_temp_5            : signed(38 DOWNTO 0);  -- sfix39_En24
  SIGNAL tmp_152                          : signed(37 DOWNTO 0);  -- sfix38_En24
  SIGNAL tmp_153                          : signed(38 DOWNTO 0);  -- sfix39_En24
  SIGNAL tmp_154                          : signed(38 DOWNTO 0);  -- sfix39_En24
  SIGNAL tmp_155                          : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_156                          : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_157                          : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_158                          : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_159                          : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_160                          : unsigned(13 DOWNTO 0);  -- ufix14_En12
  SIGNAL p175tmp_sub_cast                 : unsigned(13 DOWNTO 0);  -- ufix14_En12
  SIGNAL tmp_161                          : unsigned(11 DOWNTO 0);  -- ufix12_En12
  SIGNAL tmp_162                          : std_logic;
  SIGNAL multiplier_cast_6                : signed(12 DOWNTO 0);  -- sfix13_En12
  SIGNAL multiplier_mul_temp_6            : signed(24 DOWNTO 0);  -- sfix25_En12
  SIGNAL tmp_163                          : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_164                          : signed(38 DOWNTO 0);  -- sfix39_En24
  SIGNAL tmp_165                          : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_166                          : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_167                          : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_168                          : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL multiplier_cast_7                : signed(14 DOWNTO 0);  -- sfix15_En12
  SIGNAL multiplier_mul_temp_7            : signed(38 DOWNTO 0);  -- sfix39_En24
  SIGNAL tmp_169                          : signed(37 DOWNTO 0);  -- sfix38_En24
  SIGNAL tmp_170                          : signed(38 DOWNTO 0);  -- sfix39_En24
  SIGNAL tmp_171                          : signed(38 DOWNTO 0);  -- sfix39_En24
  SIGNAL tmp_172                          : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_173                          : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_174                          : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_175                          : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_176                          : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_177                          : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_178                          : signed(47 DOWNTO 0);  -- sfix48_En24
  SIGNAL tmp_179                          : signed(48 DOWNTO 0);  -- sfix49_En24
  SIGNAL tmp_180                          : signed(23 DOWNTO 0);  -- sfix24_En12
  SIGNAL tmp_181                          : signed(47 DOWNTO 0);  -- sfix48_En24
  SIGNAL tmp_182                          : signed(48 DOWNTO 0);  -- sfix49_En24
  SIGNAL tmp_183                          : signed(48 DOWNTO 0);  -- sfix49_En24
  SIGNAL rd_4_reg                         : vector_of_signed49(0 TO 1);  -- sfix49 [2]
  SIGNAL tmp_184                          : signed(48 DOWNTO 0);  -- sfix49_En24
  SIGNAL c                                : signed(49 DOWNTO 0);  -- sfix50_En24
  SIGNAL p82c_sub_cast                    : signed(49 DOWNTO 0);  -- sfix50_En24
  SIGNAL p82c_sub_cast_1                  : signed(49 DOWNTO 0);  -- sfix50_En24
  SIGNAL tmp_185                          : std_logic;
  SIGNAL tmp_186                          : signed(49 DOWNTO 0);  -- sfix50_En24
  SIGNAL tmp_187                          : signed(49 DOWNTO 0);  -- sfix50_En24
  SIGNAL p81tmp_cast                      : signed(50 DOWNTO 0);  -- sfix51_En24
  SIGNAL p81tmp_cast_1                    : signed(50 DOWNTO 0);  -- sfix51_En24
  SIGNAL tmp_188                          : signed(49 DOWNTO 0);  -- sfix50_En24
  SIGNAL rssi_diff                        : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL rssi_diff_1                      : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL rssi_high_goal_in_unsigned       : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL rd_3_reg                         : vector_of_unsigned24(0 TO 3);  -- ufix24 [4]
  SIGNAL rssi_high_goal_in_1              : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL alpha_relop1                     : std_logic;
  SIGNAL rssi_low_goal_in_unsigned        : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL rd_2_reg                         : vector_of_unsigned24(0 TO 3);  -- ufix24 [4]
  SIGNAL rssi_low_goal_in_1               : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL alpha_relop1_1                   : std_logic;
  SIGNAL tmp_189                          : std_logic;
  SIGNAL rd_26_reg                        : std_logic_vector(0 TO 2);  -- ufix1 [3]
  SIGNAL tmp_190                          : std_logic;
  SIGNAL tmp_191                          : std_logic;  -- ufix1
  SIGNAL tmp_192                          : std_logic;  -- ufix1
  SIGNAL tmp_193                          : std_logic;  -- ufix1
  SIGNAL tmp_194                          : std_logic;  -- ufix1
  SIGNAL tmp_195                          : std_logic;  -- ufix1
  SIGNAL tmp_196                          : std_logic;  -- ufix1
  SIGNAL tmp_197                          : std_logic;  -- ufix1
  SIGNAL tmp_198                          : std_logic;  -- ufix1
  SIGNAL tmp_199                          : std_logic;  -- ufix1
  SIGNAL tmp_200                          : std_logic;  -- ufix1
  SIGNAL tmp_201                          : std_logic;  -- ufix1
  SIGNAL tmp_203                          : std_logic;  -- ufix1
  SIGNAL tmp_204                          : std_logic;  -- ufix1
  SIGNAL tmp_205                          : std_logic;  -- ufix1
  SIGNAL tmp_206                          : std_logic;
  SIGNAL tmp_207                          : std_logic;
  SIGNAL tmp_208                          : std_logic;
  SIGNAL tmp_209                          : std_logic;
  SIGNAL tmp_210                          : std_logic;
  SIGNAL alpha_relop1_2                   : std_logic;
  SIGNAL dir_out_1                        : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL tmp_211                          : std_logic;
  SIGNAL alpha_relop1_3                   : std_logic;
  SIGNAL delayMatch_reg_6                 : vector_of_unsigned2(0 TO 1);  -- ufix2 [2]
  SIGNAL dir_out_2                        : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL tmp_212                          : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL tmp_213                          : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL rd_13_reg                        : std_logic_vector(0 TO 3);  -- ufix1 [4]
  SIGNAL tmp_214                          : std_logic;
  SIGNAL rd_7_reg                         : std_logic_vector(0 TO 3);  -- ufix1 [4]
  SIGNAL tmp_215                          : std_logic;
  SIGNAL delayMatch_reg_7                 : vector_of_unsigned2(0 TO 1);  -- ufix2 [2]
  SIGNAL dir_out_3                        : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL tmp_216                          : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL tmp_217                          : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL tmp_218                          : std_logic;  -- ufix1
  SIGNAL delayMatch_reg_8                 : vector_of_unsigned2(0 TO 1);  -- ufix2 [2]
  SIGNAL dir_out_4                        : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL tmp_219                          : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL tmp_220                          : std_logic;
  SIGNAL delayMatch_reg_9                 : vector_of_unsigned2(0 TO 1);  -- ufix2 [2]
  SIGNAL dir_out_5                        : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL tmp_221                          : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL rd_24_reg                        : vector_of_unsigned2(0 TO 3);  -- ufix2 [4]
  SIGNAL tmp_222                          : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL rd_9_reg                         : std_logic_vector(0 TO 3);  -- ufix1 [4]
  SIGNAL tmp_223                          : std_logic;
  SIGNAL delayMatch_reg_10                : vector_of_unsigned2(0 TO 1);  -- ufix2 [2]
  SIGNAL dir_out_6                        : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL tmp_225                          : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL delayMatch_reg_11                : vector_of_unsigned2(0 TO 1);  -- ufix2 [2]
  SIGNAL dir_out_7                        : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL tmp_226                          : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL dir_out_8                        : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL tmp_227                          : std_logic;
  SIGNAL tmp_228                          : std_logic;  -- ufix1
  SIGNAL tmp_229                          : std_logic;
  SIGNAL tmp_230                          : std_logic;
  SIGNAL tmp_231                          : std_logic;
  SIGNAL tmp_232                          : std_logic;
  SIGNAL tmp_233                          : std_logic;
  SIGNAL alpha_relop1_4                   : std_logic;
  SIGNAL dir_en_out_1                     : std_logic;  -- ufix1
  SIGNAL tmp_234                          : std_logic;
  SIGNAL alpha_relop1_5                   : std_logic;
  SIGNAL delayMatch_reg_12                : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL dir_en_out_2                     : std_logic;  -- ufix1
  SIGNAL tmp_235                          : std_logic;  -- ufix1
  SIGNAL tmp_236                          : std_logic;  -- ufix1
  SIGNAL rd_14_reg                        : std_logic_vector(0 TO 3);  -- ufix1 [4]
  SIGNAL tmp_237                          : std_logic;
  SIGNAL rd_6_reg                         : std_logic_vector(0 TO 3);  -- ufix1 [4]
  SIGNAL tmp_238                          : std_logic;
  SIGNAL delayMatch_reg_13                : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL dir_en_out_3                     : std_logic;  -- ufix1
  SIGNAL tmp_239                          : std_logic;  -- ufix1
  SIGNAL tmp_240                          : std_logic;  -- ufix1
  SIGNAL tmp_241                          : std_logic;  -- ufix1
  SIGNAL delayMatch_reg_14                : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL dir_en_out_4                     : std_logic;  -- ufix1
  SIGNAL tmp_242                          : std_logic;  -- ufix1
  SIGNAL tmp_243                          : std_logic;
  SIGNAL delayMatch_reg_15                : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL dir_en_out_5                     : std_logic;  -- ufix1
  SIGNAL tmp_244                          : std_logic;  -- ufix1
  SIGNAL rd_25_reg                        : std_logic_vector(0 TO 3);  -- ufix1 [4]
  SIGNAL tmp_245                          : std_logic;  -- ufix1
  SIGNAL rd_10_reg                        : std_logic_vector(0 TO 3);  -- ufix1 [4]
  SIGNAL tmp_246                          : std_logic;
  SIGNAL delayMatch_reg_16                : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL dir_en_out_6                     : std_logic;  -- ufix1
  SIGNAL tmp_248                          : std_logic;  -- ufix1
  SIGNAL delayMatch_reg_17                : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL dir_en_out_7                     : std_logic;  -- ufix1
  SIGNAL tmp_249                          : std_logic;  -- ufix1
  SIGNAL dir_en_out_8                     : std_logic;  -- ufix1

BEGIN
  i_in_signed <= signed(i_in);

  enb <= ce;

  rd_0_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      i_in_1 <= to_signed(0, 12);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        i_in_1 <= i_in_signed;
      END IF;
    END IF;
  END PROCESS rd_0_process;


  
  tmp <= '1' WHEN rx_en_in = '1' ELSE
      '0';

  rd_40_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_1 <= tmp;
      END IF;
    END IF;
  END PROCESS rd_40_process;


  
  tmp_2 <= '1' WHEN i_in_signed < 0 ELSE
      '0';

  tmp_3 <= i_in_signed;

  p209tmp_1 <=  - (resize(i_in_signed, 13));
  tmp_4 <= p209tmp_1(11 DOWNTO 0);

  
  tmp_5 <= tmp_4 WHEN tmp_2 = '1' ELSE
      tmp_3;

  
  tmp_6 <= '1' WHEN tmp_5 < 250 ELSE
      '0';

  alpha_in_unsigned <= unsigned(alpha_in);

  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  --                                                                          %
  --        Generated by MATLAB 8.1, MATLAB Coder 2.4 and HDL Coder 3.2      %
  --                                                                          %
  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  p205alpha_cast <= alpha_in_unsigned & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0';
  p205alpha_cast_1 <= p205alpha_cast srl 12;
  alpha <= p205alpha_cast_1(11 DOWNTO 0);

  p189tmp_sub_cast <= resize(alpha, 14);
  tmp_7 <= 4096 - p189tmp_sub_cast;

  tmp_8 <= alpha;

  multiplier_cast <= signed(resize(tmp_8, 13));
  multiplier_mul_temp <= multiplier_cast * i_in_signed;
  tmp_9 <= multiplier_mul_temp(23 DOWNTO 0);

  tmp_10 <= resize(tmp_9 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 39);

  rd_42_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_11 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_11 <= tmp_6;
      END IF;
    END IF;
  END PROCESS rd_42_process;


  rd_43_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_12 <= to_signed(0, 39);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_12 <= tmp_10;
      END IF;
    END IF;
  END PROCESS rd_43_process;


  p182tmp_cast <= resize(tmp_13, 25);
  p182tmp_cast_1 <=  - (p182tmp_cast);
  tmp_14 <= p182tmp_cast_1(23 DOWNTO 0);

  tmp_15 <= tmp_13;

  rd_51_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_17 <= to_signed(0, 24);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_17 <= tmp_16;
      END IF;
    END IF;
  END PROCESS rd_51_process;


  tmp_18 <= tmp_16;

  multiplier_cast_1 <= signed(resize(tmp_7, 15));
  multiplier_mul_temp_1 <= multiplier_cast_1 * tmp_18;
  tmp_19 <= multiplier_mul_temp_1(37 DOWNTO 0);

  tmp_20 <= resize(tmp_19, 39);

  rd_50_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_21 <= to_signed(0, 39);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_21 <= tmp_20;
      END IF;
    END IF;
  END PROCESS rd_50_process;


  tmp_22 <= tmp_21 + tmp_12;

  tmp_23 <= tmp_22(35 DOWNTO 12);

  
  tmp_13 <= tmp_23 WHEN tmp_11 = '1' ELSE
      tmp_17;

  
  tmp_24 <= '1' WHEN tmp_13 < 0 ELSE
      '0';

  
  tmp_25 <= tmp_14 WHEN tmp_24 = '1' ELSE
      tmp_15;

  
  tmp_26 <= '1' WHEN tmp_25 > 204800 ELSE
      '0';

  
  tmp_27 <= to_signed(0, 24) WHEN tmp_26 = '1' ELSE
      tmp_13;

  
  tmp_28 <= tmp_27 WHEN tmp_1 = '1' ELSE
      tmp_17;

  tmp_16 <= tmp_28;

  p152i_out_sub_cast <= resize(i_in_1 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 25);
  p152i_out_sub_cast_1 <= resize(tmp_16, 25);
  p152i_out_sub_temp <= p152i_out_sub_cast - p152i_out_sub_cast_1;
  i_out_1 <= p152i_out_sub_temp(23 DOWNTO 12);

  i_out_2 <= i_out_1;

  rd_46_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_46_reg <= (OTHERS => to_signed(0, 12));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_46_reg(0) <= i_out_2;
        rd_46_reg(1 TO 2) <= rd_46_reg(0 TO 1);
      END IF;
    END IF;
  END PROCESS rd_46_process;

  i_out_tmp <= rd_46_reg(2);

  i_out <= std_logic_vector(i_out_tmp);

  q_in_signed <= signed(q_in);

  rd_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      q_in_1 <= to_signed(0, 12);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        q_in_1 <= q_in_signed;
      END IF;
    END IF;
  END PROCESS rd_1_process;


  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  -- DC Correction section
  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  tmp_29 <= '1' WHEN rx_en_in = '1' ELSE
      '0';

  rd_41_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_30 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_30 <= tmp_29;
      END IF;
    END IF;
  END PROCESS rd_41_process;


  
  tmp_31 <= '1' WHEN q_in_signed < 0 ELSE
      '0';

  tmp_32 <= q_in_signed;

  p213tmp_1 <=  - (resize(q_in_signed, 13));
  tmp_33 <= p213tmp_1(11 DOWNTO 0);

  
  tmp_34 <= tmp_33 WHEN tmp_31 = '1' ELSE
      tmp_32;

  
  tmp_35 <= '1' WHEN tmp_34 < 250 ELSE
      '0';

  p203tmp_sub_cast <= resize(alpha, 14);
  tmp_36 <= 4096 - p203tmp_sub_cast;

  tmp_37 <= alpha;

  multiplier_cast_2 <= signed(resize(tmp_37, 13));
  multiplier_mul_temp_2 <= multiplier_cast_2 * q_in_signed;
  tmp_38 <= multiplier_mul_temp_2(23 DOWNTO 0);

  tmp_39 <= resize(tmp_38 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 39);

  rd_44_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_40 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_40 <= tmp_35;
      END IF;
    END IF;
  END PROCESS rd_44_process;


  rd_45_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_41 <= to_signed(0, 39);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_41 <= tmp_39;
      END IF;
    END IF;
  END PROCESS rd_45_process;


  p196tmp_cast <= resize(tmp_42, 25);
  p196tmp_cast_1 <=  - (p196tmp_cast);
  tmp_43 <= p196tmp_cast_1(23 DOWNTO 0);

  tmp_44 <= tmp_42;

  rd_53_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_46 <= to_signed(0, 24);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_46 <= tmp_45;
      END IF;
    END IF;
  END PROCESS rd_53_process;


  tmp_47 <= tmp_45;

  multiplier_cast_3 <= signed(resize(tmp_36, 15));
  multiplier_mul_temp_3 <= multiplier_cast_3 * tmp_47;
  tmp_48 <= multiplier_mul_temp_3(37 DOWNTO 0);

  tmp_49 <= resize(tmp_48, 39);

  rd_52_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_50 <= to_signed(0, 39);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_50 <= tmp_49;
      END IF;
    END IF;
  END PROCESS rd_52_process;


  tmp_51 <= tmp_50 + tmp_41;

  tmp_52 <= tmp_51(35 DOWNTO 12);

  
  tmp_42 <= tmp_52 WHEN tmp_40 = '1' ELSE
      tmp_46;

  
  tmp_53 <= '1' WHEN tmp_42 < 0 ELSE
      '0';

  
  tmp_54 <= tmp_43 WHEN tmp_53 = '1' ELSE
      tmp_44;

  
  tmp_55 <= '1' WHEN tmp_54 > 204800 ELSE
      '0';

  
  tmp_56 <= to_signed(0, 24) WHEN tmp_55 = '1' ELSE
      tmp_42;

  
  tmp_57 <= tmp_56 WHEN tmp_30 = '1' ELSE
      tmp_46;

  tmp_45 <= tmp_57;

  p151q_out_sub_cast <= resize(q_in_1 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 25);
  p151q_out_sub_cast_1 <= resize(tmp_45, 25);
  p151q_out_sub_temp <= p151q_out_sub_cast - p151q_out_sub_cast_1;
  q_out_1 <= p151q_out_sub_temp(23 DOWNTO 12);

  q_out_2 <= q_out_1;

  rd_47_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_47_reg <= (OTHERS => to_signed(0, 12));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_47_reg(0) <= q_out_2;
        rd_47_reg(1 TO 2) <= rd_47_reg(0 TO 1);
      END IF;
    END IF;
  END PROCESS rd_47_process;

  q_out_tmp <= rd_47_reg(2);

  q_out <= std_logic_vector(q_out_tmp);

  
  tmp_58 <= '1' WHEN rx_en_in = '1' ELSE
      '0';

  
  tmp_59 <= '1' WHEN rx_en_in = '1' ELSE
      '0';

  rd_27_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_27_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_27_reg(0) <= tmp_59;
        rd_27_reg(1 TO 2) <= rd_27_reg(0 TO 1);
      END IF;
    END IF;
  END PROCESS rd_27_process;

  tmp_60 <= rd_27_reg(2);

  rd_39_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      i_out_3 <= to_signed(0, 12);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        i_out_3 <= i_out_1;
      END IF;
    END IF;
  END PROCESS rd_39_process;


  rd_38_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      q_out_3 <= to_signed(0, 12);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        q_out_3 <= q_out_1;
      END IF;
    END IF;
  END PROCESS rd_38_process;


  -- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  -- 
  -- RSSI Estimation
  -- 
  -- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  tmp_61 <= i_out_3 * i_out_3;

  tmp_62 <= resize(tmp_61, 25);

  tmp_63 <= q_out_3 * q_out_3;

  tmp_64 <= resize(tmp_63, 25);

  tmp_65 <= tmp_62 + tmp_64;

  rssi_inst <= unsigned(tmp_65(22 DOWNTO 0));

  
  tmp_66 <= '1' WHEN rssi_inst < 5000 ELSE
      '0';

  rd_32_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_67 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_67 <= tmp_66;
      END IF;
    END IF;
  END PROCESS rd_32_process;


  
  tmp_68 <= '1' WHEN rssi_inst > 5000 ELSE
      '0';

  rd_54_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_70 <= to_unsigned(0, 9);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_70 <= tmp_69;
      END IF;
    END IF;
  END PROCESS rd_54_process;


  counter <= tmp_71 + 1;

  
  p126_tmp <= to_unsigned(0, 9) WHEN counter >= 256 ELSE
      counter;
  
  tmp_72 <= to_unsigned(0, 9) WHEN tmp_67 = '1' ELSE
      p126_tmp;

  
  tmp_73 <= '1' WHEN tmp_71 /= 0 ELSE
      '0';

  
  tmp_74 <= tmp_72 WHEN tmp_73 = '1' ELSE
      tmp_71;

  
  tmp_75 <= tmp_74 WHEN tmp_60 = '1' ELSE
      tmp_70;

  tmp_69 <= tmp_75;

  
  tmp_76 <= '1' WHEN tmp_69 = 0 ELSE
      '0';

  tmp_77 <= tmp_76 AND tmp_68;

  
  tmp_78 <= to_unsigned(1, 9) WHEN tmp_77 = '1' ELSE
      tmp_69;

  rd_55_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_71 <= to_unsigned(0, 9);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_71 <= tmp_78;
      END IF;
    END IF;
  END PROCESS rd_55_process;


  
  tmp_79 <= '1' WHEN tmp_71 /= 0 ELSE
      '0';

  
  tmp_80 <= '1' WHEN rssi_inst < 5000 ELSE
      '0';

  rd_35_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_81 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_81 <= tmp_80;
      END IF;
    END IF;
  END PROCESS rd_35_process;


  
  tmp_82 <= '1' WHEN tmp_69 = 0 ELSE
      '0';

  
  tmp_83 <= '1' WHEN rssi_inst > 5000 ELSE
      '0';

  tmp_84 <= tmp_82 AND tmp_83;

  
  tmp_85 <= '1' WHEN rx_en_in = '1' ELSE
      '0';

  rd_28_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_28_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_28_reg(0) <= tmp_85;
        rd_28_reg(1 TO 2) <= rd_28_reg(0 TO 1);
      END IF;
    END IF;
  END PROCESS rd_28_process;

  tmp_86 <= rd_28_reg(2);

  
  tmp_87 <= '1' WHEN tmp_71 /= 0 ELSE
      '0';

  
  tmp_88 <= '1' WHEN rssi_inst < 5000 ELSE
      '0';

  rd_33_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_89 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_89 <= tmp_88;
      END IF;
    END IF;
  END PROCESS rd_33_process;


  tmp_90 <= resize(rssi_inst, 33);

  rd_37_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_91 <= to_unsigned(0, 33);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_91 <= tmp_90;
      END IF;
    END IF;
  END PROCESS rd_37_process;


  rd_56_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_93 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_93 <= tmp_92;
      END IF;
    END IF;
  END PROCESS rd_56_process;


  rd_57_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_95 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_95 <= tmp_94;
      END IF;
    END IF;
  END PROCESS rd_57_process;


  
  tmp_97 <= tmp_95 WHEN tmp_89 = '1' ELSE
      tmp_96;

  
  tmp_98 <= tmp_97 WHEN tmp_87 = '1' ELSE
      tmp_95;

  
  tmp_99 <= tmp_98 WHEN tmp_86 = '1' ELSE
      tmp_93;

  tmp_92 <= tmp_99;

  
  tmp_94 <= to_unsigned(0, 32) WHEN tmp_84 = '1' ELSE
      tmp_92;

  tmp_100 <= resize(tmp_94, 33);

  rd_58_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_101 <= to_unsigned(0, 33);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_101 <= tmp_100;
      END IF;
    END IF;
  END PROCESS rd_58_process;


  tmp_102 <= tmp_101 + tmp_91;

  tmp_96 <= tmp_102(31 DOWNTO 0);

  rssi_out_1 <= to_unsigned(0, 24);

  delayMatch_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayMatch_reg <= (OTHERS => to_unsigned(0, 24));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        delayMatch_reg(0) <= rssi_out_1;
        delayMatch_reg(1) <= delayMatch_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch_process;

  rssi_out_2 <= delayMatch_reg(1);

  p132_cast <= tmp_96 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0';
  p132_cast_1 <= p132_cast srl 8;
  p132_add_cast <= resize(p132_cast_1(39 DOWNTO 7), 34);
  p132_add_temp <= p132_add_cast + to_unsigned(1, 34);
  p132_cast_2 <= p132_add_temp(33 DOWNTO 1);
  
  p132_tmp <= p132_cast_2(23 DOWNTO 0) WHEN counter >= 256 ELSE
      rssi_out_2;
  
  tmp_103 <= rssi_out_2 WHEN tmp_81 = '1' ELSE
      p132_tmp;

  rd_30_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_30_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_30_reg(0) <= tmp_58;
        rd_30_reg(1 TO 2) <= rd_30_reg(0 TO 1);
      END IF;
    END IF;
  END PROCESS rd_30_process;

  tmp_104 <= rd_30_reg(2);

  delayMatch_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayMatch_reg_1 <= (OTHERS => to_unsigned(0, 24));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        delayMatch_reg_1(0) <= rssi_out_1;
        delayMatch_reg_1(1) <= delayMatch_reg_1(0);
      END IF;
    END IF;
  END PROCESS delayMatch_1_process;

  rssi_out_3 <= delayMatch_reg_1(1);

  
  tmp_105 <= tmp_103 WHEN tmp_79 = '1' ELSE
      rssi_out_3;

  delayMatch_2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayMatch_reg_2 <= (OTHERS => to_unsigned(0, 24));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        delayMatch_reg_2(0) <= rssi_out_1;
        delayMatch_reg_2(1) <= delayMatch_reg_2(0);
      END IF;
    END IF;
  END PROCESS delayMatch_2_process;

  rssi_out_4 <= delayMatch_reg_2(1);

  
  tmp_106 <= tmp_105 WHEN tmp_104 = '1' ELSE
      rssi_out_4;

  rssi_out_5 <= tmp_106;

  rd_49_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rssi_out_tmp <= to_unsigned(0, 24);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rssi_out_tmp <= rssi_out_5;
      END IF;
    END IF;
  END PROCESS rd_49_process;


  rssi_out <= std_logic_vector(rssi_out_tmp);

  
  tmp_107 <= '1' WHEN rx_en_in = '1' ELSE
      '0';

  
  tmp_108 <= '1' WHEN tmp_71 /= 0 ELSE
      '0';

  
  tmp_109 <= '1' WHEN rssi_inst < 5000 ELSE
      '0';

  rd_34_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_110 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_110 <= tmp_109;
      END IF;
    END IF;
  END PROCESS rd_34_process;


  rssi_en_out_1 <= '0';

  delayMatch_3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayMatch_reg_3 <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        delayMatch_reg_3(0) <= rssi_en_out_1;
        delayMatch_reg_3(1) <= delayMatch_reg_3(0);
      END IF;
    END IF;
  END PROCESS delayMatch_3_process;

  rssi_en_out_2 <= delayMatch_reg_3(1);

  
  p130_tmp <= '1' WHEN counter >= 256 ELSE
      rssi_en_out_2;
  
  tmp_111 <= rssi_en_out_2 WHEN tmp_110 = '1' ELSE
      p130_tmp;

  rd_29_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_29_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_29_reg(0) <= tmp_107;
        rd_29_reg(1 TO 2) <= rd_29_reg(0 TO 1);
      END IF;
    END IF;
  END PROCESS rd_29_process;

  tmp_112 <= rd_29_reg(2);

  delayMatch_4_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayMatch_reg_4 <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        delayMatch_reg_4(0) <= rssi_en_out_1;
        delayMatch_reg_4(1) <= delayMatch_reg_4(0);
      END IF;
    END IF;
  END PROCESS delayMatch_4_process;

  rssi_en_out_3 <= delayMatch_reg_4(1);

  
  tmp_113 <= tmp_111 WHEN tmp_108 = '1' ELSE
      rssi_en_out_3;

  delayMatch_5_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayMatch_reg_5 <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        delayMatch_reg_5(0) <= rssi_en_out_1;
        delayMatch_reg_5(1) <= delayMatch_reg_5(0);
      END IF;
    END IF;
  END PROCESS delayMatch_5_process;

  rssi_en_out_4 <= delayMatch_reg_5(1);

  
  tmp_114 <= tmp_113 WHEN tmp_112 = '1' ELSE
      rssi_en_out_4;

  rssi_en_out_5 <= tmp_114;

  rd_48_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rssi_en_out <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rssi_en_out <= rssi_en_out_5;
      END IF;
    END IF;
  END PROCESS rd_48_process;


  
  tmp_115 <= '1' WHEN rx_en_in = '1' ELSE
      '0';

  
  tmp_116 <= '1' WHEN rx_en_in = '1' ELSE
      '0';

  rd_8_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_8_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_8_reg(0) <= tmp_116;
        rd_8_reg(1 TO 3) <= rd_8_reg(0 TO 2);
      END IF;
    END IF;
  END PROCESS rd_8_process;

  tmp_117 <= rd_8_reg(3);

  
  tmp_118 <= '1' WHEN gain_en_in = '0' ELSE
      '0';

  rd_15_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_15_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_15_reg(0) <= tmp_118;
        rd_15_reg(1 TO 3) <= rd_15_reg(0 TO 2);
      END IF;
    END IF;
  END PROCESS rd_15_process;

  tmp_119 <= rd_15_reg(3);

  -- dir_out = 0 - do nothing
  -- dir_out = 1 - increase
  -- dir_out = 2 - decrease
  
  tmp_120 <= '1' WHEN i_in_signed < 0 ELSE
      '0';

  tmp_121 <= i_in_signed;

  p215tmp_1 <=  - (resize(i_in_signed, 13));
  tmp_122 <= p215tmp_1(11 DOWNTO 0);

  
  tmp_123 <= tmp_122 WHEN tmp_120 = '1' ELSE
      tmp_121;

  ai <= unsigned(tmp_123(10 DOWNTO 0));

  
  tmp_124 <= '1' WHEN ai > 1500 ELSE
      '0';

  
  tmp_125 <= '1' WHEN q_in_signed < 0 ELSE
      '0';

  tmp_126 <= q_in_signed;

  --spssa
  -- see if the MCU has done something and if so reset
  -- decrease
  -- this overrides anything else
  -- we're saturating the ADC so decrease gain
  --too high - decrease
  --too low - increase
  -- wait for some action and the processor is done
  p217tmp_1 <=  - (resize(q_in_signed, 13));
  tmp_127 <= p217tmp_1(11 DOWNTO 0);

  
  tmp_128 <= tmp_127 WHEN tmp_125 = '1' ELSE
      tmp_126;

  aq <= unsigned(tmp_128(10 DOWNTO 0));

  
  tmp_129 <= '1' WHEN aq > 1500 ELSE
      '0';

  tmp_130 <= tmp_124 OR tmp_129;

  rd_5_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_5_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_5_reg(0) <= tmp_130;
        rd_5_reg(1 TO 3) <= rd_5_reg(0 TO 2);
      END IF;
    END IF;
  END PROCESS rd_5_process;

  tmp_131 <= rd_5_reg(3);

  
  tmp_132 <= '1' WHEN tmp_114 = '1' ELSE
      '0';

  rd_18_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_133 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_133 <= tmp_132;
      END IF;
    END IF;
  END PROCESS rd_18_process;


  
  tmp_134 <= '1' WHEN rx_en_in = '1' ELSE
      '0';

  rd_31_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_31_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_31_reg(0) <= tmp_134;
        rd_31_reg(1 TO 2) <= rd_31_reg(0 TO 1);
      END IF;
    END IF;
  END PROCESS rd_31_process;

  tmp_135 <= rd_31_reg(2);

  
  tmp_136 <= '1' WHEN tmp_71 /= 0 ELSE
      '0';

  
  tmp_137 <= '1' WHEN rssi_inst < 5000 ELSE
      '0';

  rd_36_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_138 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_138 <= tmp_137;
      END IF;
    END IF;
  END PROCESS rd_36_process;


  rssiHold_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rssiHold <= to_unsigned(0, 24);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rssiHold <= tmp_139;
      END IF;
    END IF;
  END PROCESS rssiHold_reg_process;


  p134_cast <= tmp_96 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0';
  p134_cast_1 <= p134_cast srl 8;
  p134_add_cast <= resize(p134_cast_1(39 DOWNTO 7), 34);
  p134_add_temp <= p134_add_cast + to_unsigned(1, 34);
  p134_cast_2 <= p134_add_temp(33 DOWNTO 1);
  
  p134_tmp <= p134_cast_2(23 DOWNTO 0) WHEN counter >= 256 ELSE
      rssiHold;
  
  tmp_140 <= rssiHold WHEN tmp_138 = '1' ELSE
      p134_tmp;

  
  tmp_141 <= tmp_140 WHEN tmp_136 = '1' ELSE
      rssiHold;

  
  tmp_142 <= tmp_141 WHEN tmp_135 = '1' ELSE
      rssiHold;

  tmp_139 <= tmp_142;

  p169tmp_sub_cast <= resize(alpha, 14);
  tmp_143 <= 4096 - p169tmp_sub_cast;

  tmp_144 <= alpha;

  
  tmp_145 <= '1' WHEN rx_en_in = '1' ELSE
      '0';

  multiplier_cast_4 <= signed(resize(tmp_144, 13));
  multiplier_mul_temp_4 <= multiplier_cast_4 * i_in_signed;
  tmp_146 <= multiplier_mul_temp_4(23 DOWNTO 0);

  tmp_147 <= resize(tmp_146 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 39);

  rd_60_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_149 <= to_signed(0, 24);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_149 <= tmp_148;
      END IF;
    END IF;
  END PROCESS rd_60_process;


  tmp_150 <= tmp_148;

  rd_59_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_151 <= to_signed(0, 24);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_151 <= tmp_150;
      END IF;
    END IF;
  END PROCESS rd_59_process;


  multiplier_cast_5 <= signed(resize(tmp_143, 15));
  multiplier_mul_temp_5 <= multiplier_cast_5 * tmp_151;
  tmp_152 <= multiplier_mul_temp_5(37 DOWNTO 0);

  tmp_153 <= resize(tmp_152, 39);

  tmp_154 <= tmp_153 + tmp_147;

  tmp_155 <= tmp_154(35 DOWNTO 12);

  
  tmp_156 <= tmp_155 WHEN tmp_145 = '1' ELSE
      tmp_149;

  tmp_148 <= tmp_156;

  tmp_157 <= tmp_148;

  rd_23_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_158 <= to_signed(0, 24);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_158 <= tmp_157;
      END IF;
    END IF;
  END PROCESS rd_23_process;


  tmp_159 <= tmp_148;

  p175tmp_sub_cast <= resize(alpha, 14);
  tmp_160 <= 4096 - p175tmp_sub_cast;

  tmp_161 <= alpha;

  
  tmp_162 <= '1' WHEN rx_en_in = '1' ELSE
      '0';

  multiplier_cast_6 <= signed(resize(tmp_161, 13));
  multiplier_mul_temp_6 <= multiplier_cast_6 * q_in_signed;
  tmp_163 <= multiplier_mul_temp_6(23 DOWNTO 0);

  tmp_164 <= resize(tmp_163 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 39);

  rd_62_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_166 <= to_signed(0, 24);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_166 <= tmp_165;
      END IF;
    END IF;
  END PROCESS rd_62_process;


  tmp_167 <= tmp_165;

  rd_61_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_168 <= to_signed(0, 24);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_168 <= tmp_167;
      END IF;
    END IF;
  END PROCESS rd_61_process;


  multiplier_cast_7 <= signed(resize(tmp_160, 15));
  multiplier_mul_temp_7 <= multiplier_cast_7 * tmp_168;
  tmp_169 <= multiplier_mul_temp_7(37 DOWNTO 0);

  tmp_170 <= resize(tmp_169, 39);

  tmp_171 <= tmp_170 + tmp_164;

  tmp_172 <= tmp_171(35 DOWNTO 12);

  
  tmp_173 <= tmp_172 WHEN tmp_162 = '1' ELSE
      tmp_166;

  tmp_165 <= tmp_173;

  tmp_174 <= tmp_165;

  rd_21_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_175 <= to_signed(0, 24);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_175 <= tmp_174;
      END IF;
    END IF;
  END PROCESS rd_21_process;


  tmp_176 <= tmp_165;

  rd_22_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_177 <= to_signed(0, 24);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_177 <= tmp_159;
      END IF;
    END IF;
  END PROCESS rd_22_process;


  tmp_178 <= tmp_158 * tmp_177;

  tmp_179 <= resize(tmp_178, 49);

  rd_20_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_180 <= to_signed(0, 24);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_180 <= tmp_176;
      END IF;
    END IF;
  END PROCESS rd_20_process;


  tmp_181 <= tmp_175 * tmp_180;

  tmp_182 <= resize(tmp_181, 49);

  tmp_183 <= tmp_179 + tmp_182;

  rd_4_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_4_reg <= (OTHERS => to_signed(0, 49));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_4_reg(0) <= tmp_183;
        rd_4_reg(1) <= rd_4_reg(0);
      END IF;
    END IF;
  END PROCESS rd_4_process;

  tmp_184 <= rd_4_reg(1);

  -- only increase power if the rssi is away from the mean
  p82c_sub_cast <= signed(resize(tmp_139 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 50));
  p82c_sub_cast_1 <= resize(tmp_184, 50);
  c <= p82c_sub_cast - p82c_sub_cast_1;

  
  tmp_185 <= '1' WHEN c < to_signed(0, 50) ELSE
      '0';

  tmp_186 <= c;

  p81tmp_cast <= resize(c, 51);
  p81tmp_cast_1 <=  - (p81tmp_cast);
  tmp_187 <= p81tmp_cast_1(49 DOWNTO 0);

  
  tmp_188 <= tmp_187 WHEN tmp_185 = '1' ELSE
      tmp_186;

  rssi_diff <= unsigned(tmp_188(47 DOWNTO 24));

  rd_19_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rssi_diff_1 <= to_unsigned(0, 24);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rssi_diff_1 <= rssi_diff;
      END IF;
    END IF;
  END PROCESS rd_19_process;


  rssi_high_goal_in_unsigned <= unsigned(rssi_high_goal_in);

  rd_3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_3_reg <= (OTHERS => to_unsigned(0, 24));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_3_reg(0) <= rssi_high_goal_in_unsigned;
        rd_3_reg(1 TO 3) <= rd_3_reg(0 TO 2);
      END IF;
    END IF;
  END PROCESS rd_3_process;

  rssi_high_goal_in_1 <= rd_3_reg(3);

  
  alpha_relop1 <= '1' WHEN rssi_diff_1 > rssi_high_goal_in_1 ELSE
      '0';

  rssi_low_goal_in_unsigned <= unsigned(rssi_low_goal_in);

  rd_2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_2_reg <= (OTHERS => to_unsigned(0, 24));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_2_reg(0) <= rssi_low_goal_in_unsigned;
        rd_2_reg(1 TO 3) <= rd_2_reg(0 TO 2);
      END IF;
    END IF;
  END PROCESS rd_2_process;

  rssi_low_goal_in_1 <= rd_2_reg(3);

  
  alpha_relop1_1 <= '1' WHEN rssi_diff_1 < rssi_low_goal_in_1 ELSE
      '0';

  
  tmp_189 <= '1' WHEN gain_en_in = '1' ELSE
      '0';

  rd_26_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_26_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_26_reg(0) <= tmp_189;
        rd_26_reg(1 TO 2) <= rd_26_reg(0 TO 1);
      END IF;
    END IF;
  END PROCESS rd_26_process;

  tmp_190 <= rd_26_reg(2);

  
  tmp_192 <= '0' WHEN tmp_190 = '1' ELSE
      tmp_191;

  rd_63_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_193 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_193 <= tmp_192;
      END IF;
    END IF;
  END PROCESS rd_63_process;


  rd_65_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_194 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_194 <= tmp_191;
      END IF;
    END IF;
  END PROCESS rd_65_process;


  
  tmp_195 <= '1' WHEN alpha_relop1_1 = '1' ELSE
      tmp_194;

  
  tmp_196 <= '1' WHEN alpha_relop1 = '1' ELSE
      tmp_195;

  
  tmp_197 <= tmp_196 WHEN tmp_133 = '1' ELSE
      tmp_194;

  
  tmp_198 <= '1' WHEN tmp_131 = '1' ELSE
      tmp_197;

  
  tmp_199 <= tmp_198 WHEN tmp_119 = '1' ELSE
      tmp_194;

  tmp_200 <= tmp_191;

  rd_64_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_201 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_201 <= tmp_200;
      END IF;
    END IF;
  END PROCESS rd_64_process;


  p44_output : PROCESS (tmp_201, tmp_199, tmp_193)
    VARIABLE tmp202 : std_logic;
  BEGIN

    CASE tmp_201 IS
      WHEN '0' =>
        tmp202 := tmp_199;
      WHEN '1' =>
        tmp202 := tmp_193;
      WHEN OTHERS => 
        tmp202 := '0';
    END CASE;

    tmp_203 <= tmp202;
  END PROCESS p44_output;


  
  tmp_204 <= tmp_203 WHEN tmp_117 = '1' ELSE
      tmp_194;

  tmp_191 <= tmp_204;

  tmp_205 <= tmp_191;

  
  tmp_206 <= '1' WHEN gain_en_in = '0' ELSE
      '0';

  
  tmp_207 <= '1' WHEN ai > 1500 ELSE
      '0';

  
  tmp_208 <= '1' WHEN aq > 1500 ELSE
      '0';

  tmp_209 <= tmp_207 OR tmp_208;

  
  tmp_210 <= '1' WHEN tmp_114 = '1' ELSE
      '0';

  
  alpha_relop1_2 <= '1' WHEN rssi_diff_1 < rssi_low_goal_in_1 ELSE
      '0';

  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  -- Gain Correction
  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  dir_out_1 <= to_unsigned(0, 2);

  rd_16_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_211 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_211 <= tmp_210;
      END IF;
    END IF;
  END PROCESS rd_16_process;


  
  alpha_relop1_3 <= '1' WHEN rssi_diff_1 > rssi_high_goal_in_1 ELSE
      '0';

  delayMatch_6_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayMatch_reg_6 <= (OTHERS => to_unsigned(0, 2));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        delayMatch_reg_6(0) <= dir_out_1;
        delayMatch_reg_6(1) <= delayMatch_reg_6(0);
      END IF;
    END IF;
  END PROCESS delayMatch_6_process;

  dir_out_2 <= delayMatch_reg_6(1);

  
  tmp_212 <= to_unsigned(1, 2) WHEN alpha_relop1_2 = '1' ELSE
      dir_out_2;

  
  tmp_213 <= to_unsigned(2, 2) WHEN alpha_relop1_3 = '1' ELSE
      tmp_212;

  rd_13_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_13_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_13_reg(0) <= tmp_206;
        rd_13_reg(1 TO 3) <= rd_13_reg(0 TO 2);
      END IF;
    END IF;
  END PROCESS rd_13_process;

  tmp_214 <= rd_13_reg(3);

  rd_7_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_7_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_7_reg(0) <= tmp_209;
        rd_7_reg(1 TO 3) <= rd_7_reg(0 TO 2);
      END IF;
    END IF;
  END PROCESS rd_7_process;

  tmp_215 <= rd_7_reg(3);

  delayMatch_7_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayMatch_reg_7 <= (OTHERS => to_unsigned(0, 2));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        delayMatch_reg_7(0) <= dir_out_1;
        delayMatch_reg_7(1) <= delayMatch_reg_7(0);
      END IF;
    END IF;
  END PROCESS delayMatch_7_process;

  dir_out_3 <= delayMatch_reg_7(1);

  
  tmp_216 <= tmp_213 WHEN tmp_211 = '1' ELSE
      dir_out_3;

  
  tmp_217 <= to_unsigned(2, 2) WHEN tmp_215 = '1' ELSE
      tmp_216;

  rd_11_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_218 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_218 <= tmp_205;
      END IF;
    END IF;
  END PROCESS rd_11_process;


  delayMatch_8_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayMatch_reg_8 <= (OTHERS => to_unsigned(0, 2));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        delayMatch_reg_8(0) <= dir_out_1;
        delayMatch_reg_8(1) <= delayMatch_reg_8(0);
      END IF;
    END IF;
  END PROCESS delayMatch_8_process;

  dir_out_4 <= delayMatch_reg_8(1);

  
  tmp_219 <= tmp_217 WHEN tmp_214 = '1' ELSE
      dir_out_4;

  
  tmp_220 <= '1' WHEN gain_en_in = '1' ELSE
      '0';

  delayMatch_9_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayMatch_reg_9 <= (OTHERS => to_unsigned(0, 2));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        delayMatch_reg_9(0) <= dir_out_1;
        delayMatch_reg_9(1) <= delayMatch_reg_9(0);
      END IF;
    END IF;
  END PROCESS delayMatch_9_process;

  dir_out_5 <= delayMatch_reg_9(1);

  
  tmp_221 <= to_unsigned(0, 2) WHEN tmp_220 = '1' ELSE
      dir_out_5;

  rd_24_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_24_reg <= (OTHERS => to_unsigned(0, 2));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_24_reg(0) <= tmp_221;
        rd_24_reg(1 TO 3) <= rd_24_reg(0 TO 2);
      END IF;
    END IF;
  END PROCESS rd_24_process;

  tmp_222 <= rd_24_reg(3);

  rd_9_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_9_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_9_reg(0) <= tmp_115;
        rd_9_reg(1 TO 3) <= rd_9_reg(0 TO 2);
      END IF;
    END IF;
  END PROCESS rd_9_process;

  tmp_223 <= rd_9_reg(3);

  delayMatch_10_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayMatch_reg_10 <= (OTHERS => to_unsigned(0, 2));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        delayMatch_reg_10(0) <= dir_out_1;
        delayMatch_reg_10(1) <= delayMatch_reg_10(0);
      END IF;
    END IF;
  END PROCESS delayMatch_10_process;

  dir_out_6 <= delayMatch_reg_10(1);

  p46_output : PROCESS (tmp_218, tmp_219, tmp_222, dir_out_6)
    VARIABLE tmp224 : unsigned(1 DOWNTO 0);
  BEGIN

    CASE tmp_218 IS
      WHEN '0' =>
        tmp224 := tmp_219;
      WHEN '1' =>
        tmp224 := tmp_222;
      WHEN OTHERS => 
        tmp224 := dir_out_6;
    END CASE;

    tmp_225 <= tmp224;
  END PROCESS p46_output;


  delayMatch_11_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayMatch_reg_11 <= (OTHERS => to_unsigned(0, 2));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        delayMatch_reg_11(0) <= dir_out_1;
        delayMatch_reg_11(1) <= delayMatch_reg_11(0);
      END IF;
    END IF;
  END PROCESS delayMatch_11_process;

  dir_out_7 <= delayMatch_reg_11(1);

  
  tmp_226 <= tmp_225 WHEN tmp_223 = '1' ELSE
      dir_out_7;

  dir_out_8 <= tmp_226;

  dir_out <= std_logic_vector(dir_out_8);

  
  tmp_227 <= '1' WHEN rx_en_in = '1' ELSE
      '0';

  tmp_228 <= tmp_191;

  
  tmp_229 <= '1' WHEN gain_en_in = '0' ELSE
      '0';

  
  tmp_230 <= '1' WHEN ai > 1500 ELSE
      '0';

  
  tmp_231 <= '1' WHEN aq > 1500 ELSE
      '0';

  tmp_232 <= tmp_230 OR tmp_231;

  
  tmp_233 <= '1' WHEN tmp_114 = '1' ELSE
      '0';

  
  alpha_relop1_4 <= '1' WHEN rssi_diff_1 < rssi_low_goal_in_1 ELSE
      '0';

  dir_en_out_1 <= '0';

  rd_17_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_234 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_234 <= tmp_233;
      END IF;
    END IF;
  END PROCESS rd_17_process;


  
  alpha_relop1_5 <= '1' WHEN rssi_diff_1 > rssi_high_goal_in_1 ELSE
      '0';

  delayMatch_12_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayMatch_reg_12 <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        delayMatch_reg_12(0) <= dir_en_out_1;
        delayMatch_reg_12(1) <= delayMatch_reg_12(0);
      END IF;
    END IF;
  END PROCESS delayMatch_12_process;

  dir_en_out_2 <= delayMatch_reg_12(1);

  
  tmp_235 <= '1' WHEN alpha_relop1_4 = '1' ELSE
      dir_en_out_2;

  
  tmp_236 <= '1' WHEN alpha_relop1_5 = '1' ELSE
      tmp_235;

  rd_14_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_14_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_14_reg(0) <= tmp_229;
        rd_14_reg(1 TO 3) <= rd_14_reg(0 TO 2);
      END IF;
    END IF;
  END PROCESS rd_14_process;

  tmp_237 <= rd_14_reg(3);

  rd_6_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_6_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_6_reg(0) <= tmp_232;
        rd_6_reg(1 TO 3) <= rd_6_reg(0 TO 2);
      END IF;
    END IF;
  END PROCESS rd_6_process;

  tmp_238 <= rd_6_reg(3);

  delayMatch_13_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayMatch_reg_13 <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        delayMatch_reg_13(0) <= dir_en_out_1;
        delayMatch_reg_13(1) <= delayMatch_reg_13(0);
      END IF;
    END IF;
  END PROCESS delayMatch_13_process;

  dir_en_out_3 <= delayMatch_reg_13(1);

  
  tmp_239 <= tmp_236 WHEN tmp_234 = '1' ELSE
      dir_en_out_3;

  
  tmp_240 <= '1' WHEN tmp_238 = '1' ELSE
      tmp_239;

  rd_12_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tmp_241 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tmp_241 <= tmp_228;
      END IF;
    END IF;
  END PROCESS rd_12_process;


  delayMatch_14_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayMatch_reg_14 <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        delayMatch_reg_14(0) <= dir_en_out_1;
        delayMatch_reg_14(1) <= delayMatch_reg_14(0);
      END IF;
    END IF;
  END PROCESS delayMatch_14_process;

  dir_en_out_4 <= delayMatch_reg_14(1);

  
  tmp_242 <= tmp_240 WHEN tmp_237 = '1' ELSE
      dir_en_out_4;

  
  tmp_243 <= '1' WHEN gain_en_in = '1' ELSE
      '0';

  delayMatch_15_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayMatch_reg_15 <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        delayMatch_reg_15(0) <= dir_en_out_1;
        delayMatch_reg_15(1) <= delayMatch_reg_15(0);
      END IF;
    END IF;
  END PROCESS delayMatch_15_process;

  dir_en_out_5 <= delayMatch_reg_15(1);

  
  tmp_244 <= '1' WHEN tmp_243 = '1' ELSE
      dir_en_out_5;

  rd_25_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_25_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_25_reg(0) <= tmp_244;
        rd_25_reg(1 TO 3) <= rd_25_reg(0 TO 2);
      END IF;
    END IF;
  END PROCESS rd_25_process;

  tmp_245 <= rd_25_reg(3);

  rd_10_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      rd_10_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        rd_10_reg(0) <= tmp_227;
        rd_10_reg(1 TO 3) <= rd_10_reg(0 TO 2);
      END IF;
    END IF;
  END PROCESS rd_10_process;

  tmp_246 <= rd_10_reg(3);

  delayMatch_16_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayMatch_reg_16 <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        delayMatch_reg_16(0) <= dir_en_out_1;
        delayMatch_reg_16(1) <= delayMatch_reg_16(0);
      END IF;
    END IF;
  END PROCESS delayMatch_16_process;

  dir_en_out_6 <= delayMatch_reg_16(1);

  p48_output : PROCESS (tmp_241, tmp_242, tmp_245, dir_en_out_6)
    VARIABLE tmp247 : std_logic;
  BEGIN

    CASE tmp_241 IS
      WHEN '0' =>
        tmp247 := tmp_242;
      WHEN '1' =>
        tmp247 := tmp_245;
      WHEN OTHERS => 
        tmp247 := dir_en_out_6;
    END CASE;

    tmp_248 <= tmp247;
  END PROCESS p48_output;


  delayMatch_17_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayMatch_reg_17 <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        delayMatch_reg_17(0) <= dir_en_out_1;
        delayMatch_reg_17(1) <= delayMatch_reg_17(0);
      END IF;
    END IF;
  END PROCESS delayMatch_17_process;

  dir_en_out_7 <= delayMatch_reg_17(1);

  
  tmp_249 <= tmp_248 WHEN tmp_246 = '1' ELSE
      dir_en_out_7;

  dir_en_out_8 <= tmp_249;

  dir_en_out <= dir_en_out_8;

  ce_out <= ce;

END rtl;

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

entity constant_7c91b1b314 is
  port (
    op : out std_logic_vector((12 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end constant_7c91b1b314;


architecture behavior of constant_7c91b1b314 is
begin
  op <= "000000000001";
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

entity mux_175fce8e06 is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((12 - 1) downto 0);
    y : out std_logic_vector((12 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end mux_175fce8e06;


architecture behavior of mux_175fce8e06 is
  signal sel_1_20: std_logic_vector((1 - 1) downto 0);
  signal d0_1_24: std_logic_vector((1 - 1) downto 0);
  signal d1_1_27: std_logic_vector((12 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((12 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "0" =>
        unregy_join_6_1 <= cast(d0_1_24, 0, 12, 0, xlUnsigned);
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "dc_offset/EDK Processor"

entity edk_processor_entity_008f3c3482 is
  port (
    axi_aresetn: in std_logic; 
    from_register: in std_logic_vector(1 downto 0); 
    from_register1: in std_logic_vector(23 downto 0); 
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
    to_register: in std_logic; 
    to_register1: in std_logic_vector(23 downto 0); 
    to_register2: in std_logic_vector(23 downto 0); 
    to_register3: in std_logic; 
    memmap_x0: out std_logic; 
    memmap_x1: out std_logic; 
    memmap_x10: out std_logic; 
    memmap_x11: out std_logic; 
    memmap_x12: out std_logic; 
    memmap_x13: out std_logic_vector(23 downto 0); 
    memmap_x14: out std_logic; 
    memmap_x15: out std_logic_vector(23 downto 0); 
    memmap_x16: out std_logic; 
    memmap_x17: out std_logic; 
    memmap_x18: out std_logic; 
    memmap_x2: out std_logic_vector(7 downto 0); 
    memmap_x3: out std_logic_vector(1 downto 0); 
    memmap_x4: out std_logic; 
    memmap_x5: out std_logic_vector(31 downto 0); 
    memmap_x6: out std_logic_vector(7 downto 0); 
    memmap_x7: out std_logic; 
    memmap_x8: out std_logic_vector(1 downto 0); 
    memmap_x9: out std_logic
  );
end edk_processor_entity_008f3c3482;

architecture structural of edk_processor_entity_008f3c3482 is
  signal axi_aresetn_net_x0: std_logic;
  signal from_register1_data_out_net_x0: std_logic_vector(23 downto 0);
  signal from_register_data_out_net_x0: std_logic_vector(1 downto 0);
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
  signal memmap_sm_agc_en_din_net_x0: std_logic;
  signal memmap_sm_agc_en_en_net_x0: std_logic;
  signal memmap_sm_rssi_high_goal_din_net_x0: std_logic_vector(23 downto 0);
  signal memmap_sm_rssi_high_goal_en_net_x0: std_logic;
  signal memmap_sm_rssi_low_goal_din_net_x0: std_logic_vector(23 downto 0);
  signal memmap_sm_rssi_low_goal_en_net_x0: std_logic;
  signal memmap_sm_rx_en_din_net_x0: std_logic;
  signal memmap_sm_rx_en_en_net_x0: std_logic;
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
  signal to_register1_dout_net_x0: std_logic_vector(23 downto 0);
  signal to_register2_dout_net_x0: std_logic_vector(23 downto 0);
  signal to_register3_dout_net_x0: std_logic;
  signal to_register_dout_net_x0: std_logic;

begin
  axi_aresetn_net_x0 <= axi_aresetn;
  from_register_data_out_net_x0 <= from_register;
  from_register1_data_out_net_x0 <= from_register1;
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
  to_register_dout_net_x0 <= to_register;
  to_register1_dout_net_x0 <= to_register1;
  to_register2_dout_net_x0 <= to_register2;
  to_register3_dout_net_x0 <= to_register3;
  memmap_x0 <= memmap_s_axi_arready_net_x0;
  memmap_x1 <= memmap_s_axi_awready_net_x0;
  memmap_x10 <= memmap_s_axi_wready_net_x0;
  memmap_x11 <= memmap_sm_rx_en_din_net_x0;
  memmap_x12 <= memmap_sm_rx_en_en_net_x0;
  memmap_x13 <= memmap_sm_rssi_high_goal_din_net_x0;
  memmap_x14 <= memmap_sm_rssi_high_goal_en_net_x0;
  memmap_x15 <= memmap_sm_rssi_low_goal_din_net_x0;
  memmap_x16 <= memmap_sm_rssi_low_goal_en_net_x0;
  memmap_x17 <= memmap_sm_agc_en_din_net_x0;
  memmap_x18 <= memmap_sm_agc_en_en_net_x0;
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
      sm_agc_en_dout(0) => to_register3_dout_net_x0,
      sm_dir_dout => from_register_data_out_net_x0,
      sm_rssi_dout => from_register1_data_out_net_x0,
      sm_rssi_high_goal_dout => to_register1_dout_net_x0,
      sm_rssi_low_goal_dout => to_register2_dout_net_x0,
      sm_rx_en_dout(0) => to_register_dout_net_x0,
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
      sm_agc_en_din(0) => memmap_sm_agc_en_din_net_x0,
      sm_agc_en_en => memmap_sm_agc_en_en_net_x0,
      sm_rssi_high_goal_din => memmap_sm_rssi_high_goal_din_net_x0,
      sm_rssi_high_goal_en => memmap_sm_rssi_high_goal_en_net_x0,
      sm_rssi_low_goal_din => memmap_sm_rssi_low_goal_din_net_x0,
      sm_rssi_low_goal_en => memmap_sm_rssi_low_goal_en_net_x0,
      sm_rx_en_din(0) => memmap_sm_rx_en_din_net_x0,
      sm_rx_en_en => memmap_sm_rx_en_en_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "dc_offset"

entity dc_offset is
  port (
    axi_aresetn: in std_logic; 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    data_out: in std_logic; 
    data_out_x0: in std_logic_vector(23 downto 0); 
    data_out_x1: in std_logic_vector(23 downto 0); 
    data_out_x2: in std_logic; 
    data_out_x3: in std_logic_vector(1 downto 0); 
    data_out_x4: in std_logic_vector(23 downto 0); 
    dout_x1: in std_logic; 
    dout_x2: in std_logic_vector(23 downto 0); 
    dout_x3: in std_logic_vector(23 downto 0); 
    dout_x4: in std_logic; 
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
    data_in: out std_logic_vector(23 downto 0); 
    data_in_x0: out std_logic_vector(1 downto 0); 
    data_in_x1: out std_logic; 
    data_in_x2: out std_logic_vector(23 downto 0); 
    data_in_x3: out std_logic_vector(23 downto 0); 
    data_in_x4: out std_logic; 
    en: out std_logic; 
    en_x0: out std_logic; 
    en_x1: out std_logic; 
    en_x2: out std_logic; 
    en_x3: out std_logic; 
    en_x4: out std_logic; 
    i_out: out std_logic_vector(11 downto 0); 
    q_out: out std_logic_vector(11 downto 0); 
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
end dc_offset;

architecture structural of dc_offset is
  attribute core_generation_info: string;
  attribute core_generation_info of structural : architecture is "dc_offset,sysgen_core,{clock_period=10.00000000,clocking=Clock_Enables,sample_periods=1.00000000000 1.00000000000,testbench=0,total_blocks=103,xilinx_black_box_block=1,xilinx_bus_multiplexer_block=2,xilinx_constant_block_block=3,xilinx_edk_core_block=1,xilinx_edk_processor_block=1,xilinx_gateway_in_block=27,xilinx_gateway_out_block=13,xilinx_shared_memory_based_from_register_block=6,xilinx_shared_memory_based_to_register_block=6,xilinx_system_generator_block=1,xilinx_type_converter_block=2,}";

  signal axi_aresetn_net: std_logic;
  signal black_box_ce_out_net: std_logic;
  signal black_box_dir_en_out_net: std_logic;
  signal black_box_i_out_net: std_logic_vector(11 downto 0);
  signal black_box_q_out_net: std_logic_vector(11 downto 0);
  signal black_box_rssi_en_out_net: std_logic;
  signal ce_1_sg_x0: std_logic;
  signal clk_1_sg_x0: std_logic;
  signal constant1_op_net: std_logic_vector(11 downto 0);
  signal constant2_op_net: std_logic;
  signal constant_op_net: std_logic;
  signal data_in_net: std_logic_vector(23 downto 0);
  signal data_in_x0_net: std_logic_vector(1 downto 0);
  signal data_in_x1_net: std_logic;
  signal data_in_x2_net: std_logic_vector(23 downto 0);
  signal data_in_x3_net: std_logic_vector(23 downto 0);
  signal data_in_x4_net: std_logic;
  signal data_out_net: std_logic;
  signal data_out_x0_net: std_logic_vector(23 downto 0);
  signal data_out_x1_net: std_logic_vector(23 downto 0);
  signal data_out_x2_net: std_logic;
  signal data_out_x3_net: std_logic_vector(1 downto 0);
  signal data_out_x4_net: std_logic_vector(23 downto 0);
  signal dout_x1_net: std_logic;
  signal dout_x2_net: std_logic_vector(23 downto 0);
  signal dout_x3_net: std_logic_vector(23 downto 0);
  signal dout_x4_net: std_logic;
  signal en_net: std_logic;
  signal en_x0_net: std_logic;
  signal en_x1_net: std_logic;
  signal en_x2_net: std_logic;
  signal en_x3_net: std_logic;
  signal en_x4_net: std_logic;
  signal i_in_net: std_logic_vector(11 downto 0);
  signal i_out_net: std_logic_vector(11 downto 0);
  signal plb_ce_1_sg_x1: std_logic;
  signal plb_clk_1_sg_x1: std_logic;
  signal q_in_net: std_logic_vector(11 downto 0);
  signal q_out_net: std_logic_vector(11 downto 0);
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
  data_out_net <= data_out;
  data_out_x0_net <= data_out_x0;
  data_out_x1_net <= data_out_x1;
  data_out_x2_net <= data_out_x2;
  data_out_x3_net <= data_out_x3;
  data_out_x4_net <= data_out_x4;
  dout_x1_net <= dout_x1;
  dout_x2_net <= dout_x2;
  dout_x3_net <= dout_x3;
  dout_x4_net <= dout_x4;
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
  data_in <= data_in_net;
  data_in_x0 <= data_in_x0_net;
  data_in_x1 <= data_in_x1_net;
  data_in_x2 <= data_in_x2_net;
  data_in_x3 <= data_in_x3_net;
  data_in_x4 <= data_in_x4_net;
  en <= en_net;
  en_x0 <= en_x0_net;
  en_x1 <= en_x1_net;
  en_x2 <= en_x2_net;
  en_x3 <= en_x3_net;
  en_x4 <= en_x4_net;
  i_out <= i_out_net;
  q_out <= q_out_net;
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

  black_box: entity work.dc_offset_correction_FixPt
    port map (
      alpha_in => constant1_op_net,
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      gain_en_in => data_out_net,
      i_in => i_in_net,
      q_in => q_in_net,
      reset => constant_op_net,
      rssi_high_goal_in => data_out_x1_net,
      rssi_low_goal_in => data_out_x0_net,
      rx_en_in => data_out_x2_net,
      ce_out => black_box_ce_out_net,
      dir_en_out => black_box_dir_en_out_net,
      dir_out => data_in_x0_net,
      i_out => black_box_i_out_net,
      q_out => black_box_q_out_net,
      rssi_en_out => black_box_rssi_en_out_net,
      rssi_out => data_in_net
    );

  constant1: entity work.constant_7c91b1b314
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant2: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant2_op_net
    );

  constant_x0: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant_op_net
    );

  convert: entity work.xlconvert
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
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      din(0) => black_box_rssi_en_out_net,
      en => "1",
      dout(0) => en_net
    );

  convert1: entity work.xlconvert
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
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      din(0) => black_box_dir_en_out_net,
      en => "1",
      dout(0) => en_x0_net
    );

  edk_processor_008f3c3482: entity work.edk_processor_entity_008f3c3482
    port map (
      axi_aresetn => axi_aresetn_net,
      from_register => data_out_x3_net,
      from_register1 => data_out_x4_net,
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
      to_register => dout_x1_net,
      to_register1 => dout_x2_net,
      to_register2 => dout_x3_net,
      to_register3 => dout_x4_net,
      memmap_x0 => s_axi_arready_net,
      memmap_x1 => s_axi_awready_net,
      memmap_x10 => s_axi_wready_net,
      memmap_x11 => data_in_x1_net,
      memmap_x12 => en_x1_net,
      memmap_x13 => data_in_x2_net,
      memmap_x14 => en_x2_net,
      memmap_x15 => data_in_x3_net,
      memmap_x16 => en_x3_net,
      memmap_x17 => data_in_x4_net,
      memmap_x18 => en_x4_net,
      memmap_x2 => s_axi_bid_net,
      memmap_x3 => s_axi_bresp_net,
      memmap_x4 => s_axi_bvalid_net,
      memmap_x5 => s_axi_rdata_net,
      memmap_x6 => s_axi_rid_net,
      memmap_x7 => s_axi_rlast_net,
      memmap_x8 => s_axi_rresp_net,
      memmap_x9 => s_axi_rvalid_net
    );

  mux: entity work.mux_175fce8e06
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => constant2_op_net,
      d1 => black_box_i_out_net,
      sel(0) => data_out_x2_net,
      y => i_out_net
    );

  mux1: entity work.mux_175fce8e06
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => constant2_op_net,
      d1 => black_box_q_out_net,
      sel(0) => data_out_x2_net,
      y => q_out_net
    );

end structural;
