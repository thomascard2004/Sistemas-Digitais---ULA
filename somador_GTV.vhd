----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:26:30 05/10/2024 
-- Design Name: 
-- Module Name:    somador_GTV - Behavioral 
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

entity somador_GTV is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           Soma : out  STD_LOGIC;
           Carry : out  STD_LOGIC);
end somador_GTV;

architecture somador_GTV_behavioral of somador_GTV is
begin
Soma <= (A xor B) xor C ;
Carry <= (A and B) or (C and (A xor B));

end somador_GTV_behavioral;

