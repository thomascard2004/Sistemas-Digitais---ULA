----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:29:34 05/10/2024 
-- Design Name: 
-- Module Name:    subtrator_4bits - Behavioral 
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

entity subtrator_4bits is
    Port ( A : in  std_logic_vector(3 downto 0);
           B : in  std_logic_vector(3 downto 0);
           S : out  std_logic_vector(3 downto 0));
end subtrator_4bits;

architecture Behavioral of subtrator_4bits is

	component somador_GTV
		port(A, B, C: in std_logic;
		Soma, Carry: out std_logic);
	end component;
	
signal C: std_logic_vector (4 downto 0);	
signal InvB :std_logic_vector( 3 downto 0);
--signal Saida :std_logic_vector( 3 downto 0);


begin

InvB <= not(B);

FS1: somador_GTV port map (A(0),InvB(0),'1',S(0),C(1));
FS2: somador_GTV port map (A(1),InvB(1),c(1),S(1),C(2));
FS3: somador_GTV port map (A(2),InvB(2),c(2),S(2),C(3));
FS4: somador_GTV port map (A(3),InvB(3),c(3),S(3),C(4));

--S(3 downto 0) <= Saida;

end Behavioral;

