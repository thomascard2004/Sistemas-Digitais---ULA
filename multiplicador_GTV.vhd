----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:28:34 05/29/2024 
-- Design Name: 
-- Module Name:    multiplicador_GTV - Behavioral 
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

entity multiplicador_GTV is
    Port ( A : in  std_logic_vector (3 downto 0);
           B : in  std_logic_vector (3 downto 0);
           S : out  std_logic_vector (7 downto 0));
end multiplicador_GTV;

architecture Behavioral of multiplicador_GTV is

component somador_GTV is
	port(A, B, C: in std_logic;
	Soma, Carry: out std_logic);
end component;

signal Cy:std_logic_vector (11 downto 0);	
signal P:std_logic_vector(11 downto 0);
signal AB0, AB1, AB2, AB3:std_logic_vector(3 downto 0);

begin

AB0(0) <= A(0) and B(0);
AB0(1) <= A(1) and B(0);
AB0(2) <= A(2) and B(0);
AB0(3) <= A(3) and B(0);

AB1(0) <= A(0) and B(1);
AB1(1) <= A(1) and B(1);
AB1(2) <= A(2) and B(1);
AB1(3) <= A(3) and B(1);

AB2(0) <= A(0) and B(2);
AB2(1) <= A(1) and B(2);
AB2(2) <= A(2) and B(2);
AB2(3) <= A(3) and B(2);

AB3(0) <= A(0) and B(3);
AB3(1) <= A(1) and B(3);
AB3(2) <= A(2) and B(3);
AB3(3) <= A(3) and B(3);

--S1
M1: somador_GTV port map (AB0(1),AB1(0),'0',P(0),Cy(0));
--S2
M2: somador_GTV port map (AB0(2),AB1(1),Cy(0),P(1),Cy(1));
M3: somador_GTV port map (P(1),AB2(0),'0',P(2),Cy(2));
--S3
M4: somador_GTV port map (AB0(3),AB1(2),Cy(1),P(3),Cy(3));
M5: somador_GTV port map (P(3),AB2(1),Cy(2),P(4),Cy(4));
M6: somador_GTV port map (P(4),AB3(0),'0',P(5),Cy(5));
--S4
M7: somador_GTV port map (AB1(3),AB2(2),Cy(3),P(6),Cy(6));
M8: somador_GTV port map (AB3(1),P(6),Cy(4),P(7),Cy(7));
M9: somador_GTV port map (P(7),'0',Cy(5),P(8),Cy(8));

--S5
M10: somador_GTV port map (AB2(3),AB3(2),Cy(6),P(9),Cy(9));
M11: somador_GTV port map (P(9),Cy(7),Cy(8),P(10),Cy(10));
--S6
M12: somador_GTV port map (AB3(3),Cy(9),Cy(10),P(11),Cy(11));

S(0) <= AB0(0);
S(1) <= P(0);
S(2) <= P(2);
S(3) <= P(5);
S(4) <= P(8);
S(5) <= P(10);
S(6) <= P(11);
S(7) <= Cy(11);

end Behavioral;