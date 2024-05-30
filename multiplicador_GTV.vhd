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
	component somador_4bits is
		port(A, B, C: in std_logic;
		Soma, Carry: out std_logic);
	end component;

signal C1, C2, C3: std_logic_vector (3 downto 0);	
signal P1, P2, P3:std_logic_vector(3 downto 0);
signal AB0, AB1, AB2, AB3:std_logic_vector(3 downto 0);

begin

AB0(0) <= A(0) and B(0);
AB0(1) <= A(1) and B(0);
AB0(2) <= A(2) and B(0);
AB0(3) <= A(3) and B(0);

AB1(40) <= A(0) and B(1);
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

M1: somador_GTV port map (AB0(0),AB1(1),C1(0),C1(1),P1(1));
M2: somador_GTV port map (AB0(3),AB1(2),C1(1),C1(2),P1(2));
M3: somador_GTV port map (P1(2),AB2(1),C2(0),C2(0),P2(1));
M4: somador_GTV port map (P1(3),AB2(2),C2(1),C2(1),P2(2));
M5: somador_GTV port map (C1(3),AB2(3),C2(2),C2(2),P2(3));
M6: somador_GTV port map (P2(2),AB3(1),C3(0),C3(0),P3(1));
M7: somador_GTV port map (P2(3),AB3(2),C3(1),C3(1),P3(2));
M8: somador_GTV port map (C2(3),AB3(3),C3(2),C3(2),P3(3));

M9: somador_GTV port map (AB0(1),AB1(0),'0',C1(0),P1(0));
M10: somador_GTV port map (AB1(3),C2(2),'0',C1(3),P1(3));
M11: somador_GTV port map (P1(1),AB2(0),'0',C2(0),P2(0));
M12: somador_GTV port map (P2(1),AB3(0),'0',C3(0),P3(0));

S(0) <= AB0(0);
S(1) <= P1(0);
S(2) <= P2(0);
S(3) <= P3(0);
S(4) <= P3(1);
S(5) <= P3(2);
S(6) <= P3(3);
S(7) <= C3(3);

end Behavioral;