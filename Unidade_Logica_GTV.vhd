----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:44:02 04/26/2024 
-- Design Name: 
-- Module Name:    Unidade_Logica - Behavioral 
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
use IEEE.NUMERIC_STD.ALL; 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Unidade_Logica is
    Port (
			A : in  STD_LOGIC_VECTOR (3 downto 0);
			B : in  STD_LOGIC_VECTOR (3 downto 0);
         S : out  STD_LOGIC_VECTOR(3 downto 0);
			operacao : in STD_LOGIC_VECTOR(2 downto 0);
			
end Unidade_Logica;

architecture Behavioral of Unidade_Logica is

begin
	process (A, B, sel)
	begin
		case operacao is
			when "000" => result <= A and B;
			
			when "001" => result <= A or B;
			
			when "010" => result <= A xor B;
			
			when "011" => result <= not A;
			
			when "100" => result <= not B;
		end case;
	end process;	


end Behavioral;

