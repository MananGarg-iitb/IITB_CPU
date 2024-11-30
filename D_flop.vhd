library ieee;
use ieee.std_logic_1164.all;

entity D_flop is
    Port (clk, rst, D, en : in  std_logic; Q : out std_logic);
end D_flop;

signal clock: std_logic;

architecture Bhv of D_flop is
begin
	clock = en and clk
    process (clock, rst)
    begin
        if rst = '1' then
            Q <= '0';
        elsif rising_edge(clock) then
            Q <= D;
        end if;
    end process;
end Bhv;