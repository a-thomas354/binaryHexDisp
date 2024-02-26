----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2024 07:20:15 PM
-- Design Name: 
-- Module Name: sevenSegDecoder_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenSegDecoder_tb is
end sevenSegDecoder_tb;


architecture Behavioral of sevenSegDecoder_tb is
component sevenSegDecoder is 
port(
    i_D : in std_logic_vector (3 downto 0);
    o_S : out std_logic_vector (6 downto 0)
    );
    end component;
signal sw : std_logic_vector (3 downto 0);
signal w_seg : std_logic_vector (6 downto 0);

begin
sevenSegDecoder_inst : sevenSegDecoder
port map (
i_D (3 downto 0) => sw (3 downto 0),
o_S (6 downto 0) => w_seg (6 downto 0)
);

	test_process : process 
	begin
	sw <= x"0"; wait for 10 ns;
    assert w_seg(6) = '1' report "bad x0" severity failure;
    sw <= x"1"; wait for 10 ns;
    assert (w_seg(2) = '0' and w_seg(1)= '0') report "bad x1" severity failure;
    sw <= x"2"; wait for 10 ns;
    assert (w_seg(2) = '1' and w_seg(5)= '1') report "bad x2" severity failure;
    sw <= x"3"; wait for 10 ns;
    assert (w_seg(4) = '1' and w_seg(5) = '1') report "bad x3" severity failure;
    sw <= x"4"; wait for 10 ns;
    assert (w_seg(4) = '1' and w_seg(3) = '1' and w_seg(0) = '1') report "bad x4" severity failure;
    sw <= x"5"; wait for 10 ns;
    assert (w_seg(1) = '1' and w_seg(4)= '1') report "bad x5" severity failure;
    sw <= x"6"; wait for 10 ns;
    assert w_seg(1) = '1' report "bad x6" severity failure;
    sw <= x"7"; wait for 10 ns;
    assert (w_seg(1) = '0' and w_seg(2) = '0' and w_seg(0)= '0') report "bad x7" severity failure;
    sw <= x"8"; wait for 10 ns;
    assert w_seg(6) = '0' report "bad x8" severity failure;
    sw <= x"9"; wait for 10 ns;
    assert(w_seg(3) = '1' and w_seg(4)= '1') report "bad x9" severity failure;
    sw <= x"A"; wait for 10 ns;
    assert w_seg(3) = '1' report "bad xA" severity failure;
    sw <= x"B"; wait for 10 ns;
    assert ( w_seg(1) = '1' and w_seg(0)= '1') report "bad xB" severity failure;
    sw <= x"C"; wait for 10 ns;
    assert w_seg(3) = '0' and w_seg(4) = '0' and w_seg(6)= '0' report "bad xC" severity failure;
    sw <= x"D"; wait for 10 ns;
    assert w_seg(0) = '1' and w_seg(5)= '1' report "bad xD" severity failure;
    sw <= x"E"; wait for 10 ns;
    assert w_seg(2) = '1' and w_seg(1)= '1' report "bad xE" severity failure;
    sw <= x"F"; wait for 10 ns;
    assert w_seg(1) = '1' and w_seg(2) = '1' and w_seg(3)= '1' report "bad xF" severity failure;

    
	wait; -- wait forever
    end process;
end Behavioral;
