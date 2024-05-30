----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:30:34 05/17/2024 
-- Design Name: 
-- Module Name:    complemento2 - Behavioral 
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

entity complemento2 is
    Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
--			  Cin : in std_logic;
			Soma: out std_logic_vector (3 downto 0);
			Cout, S: out std_logic
			);
	
end complemento2;

architecture Behavioral of complemento2 is

signal C: std_logic_vector (4 downto 0);

component somador_GTV
		port(A, B, C: in std_logic;
		Soma, Carry: out std_logic);
	end component;

begin
	
	Cii0: somador_GTV port map (not A(0), '0', '1', Soma(0), C(1));
	Cii1: somador_GTV port map (not A(1), '0', c(1), Soma(1), C(2));
	Cii2: somador_GTV port map (not A(2), '0', c(2), Soma(2), C(3));
	Cii3: somador_GTV port map (not A(3), '0', c(3), Soma(3), C(4));
   
   S <= C(3) xor C(4);
	Cout <= C(4);
	
end Behavioral;

