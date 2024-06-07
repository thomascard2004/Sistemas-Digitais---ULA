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
    Port (A : in  STD_LOGIC_VECTOR (3 downto 0);
	B : in  STD_LOGIC_VECTOR (3 downto 0);
        S : out  STD_LOGIC_VECTOR(7 downto 0);
	operacao : in STD_LOGIC_VECTOR(2 downto 0));
			
end Unidade_Logica;

architecture Behavioral of Unidade_Logica is

--Somador 4Bits
component somador_4bits is
port (A, B: in std_logic_vector(3 downto 0);
	Cin : in std_logic;
	Soma: out std_logic_vector (3 downto 0);
	Cout, S: out std_logic);
end component;

component subtrator_4bits is
    Port ( A : in  std_logic_vector(3 downto 0);
           B : in  std_logic_vector(3 downto 0);
           S : out  std_logic_vector(3 downto 0));
end component;

component multiplicador_GTV is
    Port ( A : in  std_logic_vector (3 downto 0);
           B : in  std_logic_vector (3 downto 0);
           S : out  std_logic_vector (7 downto 0));
end component;

component complemento2 is
    Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
			Soma: out std_logic_vector (3 downto 0);
			Cout, S: out std_logic);
end component;

signal auxcoutsoma: STD_LOGIC_VECTOR (3 downto 0);
signal auxSsoma: STD_LOGIC_VECTOR (3 downto 0);
signal auxsoma: STD_LOGIC_VECTOR (3 downto 0);


signal auxsub: STD_LOGIC_VECTOR (3 downto 0);
signal auxmult: STD_LOGIC_VECTOR (7 downto 0);

signal auxcoutcomp: STD_LOGIC_VECTOR (3 downto 0);
signal auxScomp: STD_LOGIC_VECTOR (3 downto 0);
signal auxcomp: STD_LOGIC_VECTOR (3 downto 0);


begin

	SOMADOR: somador_4bits port map (A, B, '0', auxsoma, auxcoutsoma, auxSsoma);

	SUBTRATOR: subtrator_4bits port map (A, B, auxsub);

	COMPLEMENTO2: complemento2 port map (A, auxcomp, auxcoutcomp, auxscomp);

	MULTIPLICADOR: multiplicador_GTV port map (A, B, auxmult);

	process (A, B, seletor)
	begin
		case seletor is
			--AND
			when "000" => result <= A and B;
			--OR
			when "001" => result <= A or B;
			--NOT
			when "010" => result <= not A ;
			--XOR
			when "011" => result <= A xor B;
			--ADD
			when "100" => result <= auxsoma;
			--SUB
			when "101" => result <= auxsub;
			--MULT
			when "110" => result <= auxmult;
			--COMP
			when "111" => result <= auxcomp;

			--when others => ;
		end case;
	end process;	


end Behavioral;
