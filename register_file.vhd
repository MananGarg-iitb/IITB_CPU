library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Register_File is
    Port (
        RF_enable : in STD_LOGIC;                -- Enable signal
        RF_A1, RF_A2, RF_A3 : in STD_LOGIC_VECTOR(2 downto 0);  -- 3-bit register addresses
        RF_D3 : in STD_LOGIC_VECTOR(15 downto 0); -- Data input
        RF_D1, RF_D2 : out STD_LOGIC_VECTOR(15 downto 0); -- Data outputs
        clk : in STD_LOGIC;                      -- Clock signal
        reset : in STD_LOGIC                     -- Reset signal
    );
end Register_File;

architecture Behavioral of Register_File is
    -- Declare 8 registers, each 16 bits wide
    type register_array is array (0 to 7) of STD_LOGIC_VECTOR(15 downto 0);
    signal registers : register_array;
begin
    -- Process for synchronous reset and register operations
    process(clk, reset)
    begin
        if reset = '1' then
            -- Reset all registers to 0
            for i in 0 to 7 loop
                registers(i) <= (others => '0');
            end loop;
        elsif rising_edge(clk) then
            if RF_enable = '1' then
                -- Write operation: Load RF_D3 into the register addressed by RF_A3
                registers(to_integer(unsigned(RF_A3))) <= RF_D3;
            end if;
        end if;
    end process;

    -- Assign outputs for read operation
    RF_D1 <= registers(to_integer(unsigned(RF_A1)));
    RF_D2 <= registers(to_integer(unsigned(RF_A2)));
end Behavioral;
