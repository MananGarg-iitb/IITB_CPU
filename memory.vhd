library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory is 
	port (
		mem_addr, mem_addr_init, mem_data_in, mem_data_init : in std_logic_vector(15 downto 0); 
		mem_data_out : out std_logic_vector(15 downto 0); 
		mem_read, mem_write, mem_clk, rst, init : in std_logic
	); 
end entity memory;

architecture behav of memory is
	type memory_array is array (0 to 31) of std_logic_vector(15 downto 0);
	signal memory : memory_array;
begin
	mem_wr : process (mem_clk, rst)
	begin
		if rst = '1' then
			for i in 0 to 31 loop
				memory(i) <= (others => '0');
			end loop;

		elsif rising_edge(mem_clk) then
			if mem_write = '1' then
				if init = '1' then
					memory(to_integer(unsigned(mem_addr_init(4 downto 0)))) <= mem_data_init;
				else
					memory(to_integer(unsigned(mem_addr(4 downto 0)))) <= mem_data_in;
				end if;
			end if;
		end if;
	end process;

	mem_rd: process (mem_addr, mem_read)
	begin
		if mem_read = '1' then
			mem_data_out <= memory(to_integer(unsigned(mem_addr(4 downto 0))));
		else
			mem_data_out <= (others => '0');
		end if;
	end process;

end behav;
