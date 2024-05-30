----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:58:28 05/10/2024 
-- Design Name: 
-- Module Name:    somador_4bit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
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

entity somador_4bits is
port (A, B: in std_logic_vector(3 downto 0);
Cin : in std_logic;
Soma: out std_logic_vector (3 downto 0);
Cout, S: out std_logic);
end somador_4bits;

architecture somador_4bits_structure of somador_4bits is
signal C: std_logic_vector (4 downto 0);
component somador_GTV
port(A, B, C: in std_logic;
Soma, Carry: out std_logic);

end component;
begin
FA0: somador_GTV port map (A(0), B(0), cin, Soma(0), C(1));
FA1: somador_GTV port map (A(1), B(1), c(1), Soma(1), C(2));
FA2: somador_GTV port map (A(2), B(2), c(2), Soma(2), C(3));
FA3: somador_GTV port map (A(3), B(3), c(3), Soma(3), C(4));
S <= C(3) xor C(4);
Cout <= C(4);
end somador_4bits_structure;



