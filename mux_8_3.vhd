library ieee;
use ieee.std_logic_1164.all;

library work;
use work.Gates.all;

entity mux_8_3 is
	port ( In8, In7, In6, In5, In4, In3, In2, In1, S3, S2, S1 : in std_logic; Y : out std_logic);
end entity mux_8_3;

architecture struct of mux_8_3 is
	signal w_1, w_2 : std_logic;
	component mux_2_1 is
		port ( I1, I0, S : in std_logic; Y : out std_logic);
	end component;
	component mux_4_2 is
		port ( In4, In3, In2, In1, S2, S1 : in std_logic; Y : out std_logic);
	end component mux_4_2;
	
begin

M0 : mux_4_2 port map (In4 => In8, In3 => In7, In2 => In6, In1 => In5, S2 => S2, S1 => S1, Y => w_1);
M1 : mux_4_2 port map (In4 => In4, In3 => In3, In2 => In2, In1 => In1, S2 => S2, S1 => S1, Y => w_2);
M2 : mux_2_1 port map (I1 => w_1, I0 => w_2, S => S3, Y => Y);

end struct;