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

entity Unidade_Logica is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           S : out  STD_LOGIC_VECTOR (3 downto 0);
end Unidade_Logica;

architecture Behavioral of Unidade_Logica is

component AND_LOGICO
	part(a, b: in std_logic;
			c: out std_logic;)

begin

A0:AND_LOGICO port_map (a(0), b(0), c(0));
A1:AND_LOGICO port_map (a(1), b(1), c(1));
A2:AND_LOGICO port_map (a(2), b(2), c(2));
A3:AND_LOGICO port_map (a(3), b(3), c(3));

end Behavioral;

