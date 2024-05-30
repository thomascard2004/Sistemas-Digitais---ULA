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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Unidade_Logica_Aritmetica is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
          op : in  STD_LOGIC_VECTOR (2 downto 0);
           S : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end Unidade_Logica_Aritmetica;

architecture Behavioral of Unidade_Logica_Aritmetica is

component soma is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  Cin : in  STD_LOGIC;
			  Cout : in  STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
	end component;


	begin


	process(A, B, op)
	begin
		case op is
			when "000" => 
				S <= A and B;
			when "001"=>
				S <= A or B;
			when "010"=>
				S <= not A;
			when "011" => 
				S <= A xor B;
			when "100" => 
				S <= somador_4bits;
			when "101" => 
				S <= subtracao;
			when "110" => 
				S <= multiplicacao;
			when others => 
				S <= comparacao;
		end case;
	end process;
end Behavioral;


