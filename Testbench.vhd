library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Testbench is
end entity Testbench;

architecture bhv of Testbench is
    -- Component declaration for the memory module
    component top is
	port (
		clk, reset, init : in std_logic;
		mem_init_data, mem_init_addr : in std_logic_vector(15 downto 0);
		c_out, z_out : out std_logic;
		y_presentt : out std_logic_vector(4 downto 0);
		T1_qt, T2_qt, IR_qt, PC_qt, SE_outt, RF_d1t, RF_d2t, RF_d3t, ALU_at, ALU_bt, ALU_ct, mem_data_outt : out std_logic_vector(15 downto 0)
		) ;
end component top;

    -- Signals to connect to the DUT
    signal clk_t, reset_t, init_t, c_out_t, z_out_t : std_logic;
    signal mem_init_data_t, mem_init_addr_t : std_logic_vector(15 downto 0);
    signal T1_qt_t, T2_qt_t, IR_qt_t, PC_qt_t, SE_outt_t : std_logic_vector(15 downto 0);
    signal RF_d1t_t, RF_d2t_t, RF_d3t_t : std_logic_vector(15 downto 0);
	 signal y_presentt_t : std_logic_vector(4 downto 0);
    signal ALU_at_t, ALU_bt_t, ALU_ct_t, mem_data_outt_t : std_logic_vector(15 downto 0);

begin
    -- Instantiate the memory module
    DUT : top
        port map (
            clk => clk_t, 
            reset => reset_t, 
            init => init_t, 
            mem_init_data => mem_init_data_t, 
            mem_init_addr => mem_init_addr_t, 
            c_out => c_out_t, 
            z_out => z_out_t,
            T1_qt => T1_qt_t, 
            T2_qt => T2_qt_t, 
            IR_qt => IR_qt_t, 
            PC_qt => PC_qt_t, 
            SE_outt => SE_outt_t, 
            RF_d1t => RF_d1t_t, 
            RF_d2t => RF_d2t_t, 
            RF_d3t => RF_d3t_t, 
            ALU_at => ALU_at_t, 
            ALU_bt => ALU_bt_t, 
            ALU_ct => ALU_ct_t, 
            mem_data_outt => mem_data_outt_t,
				y_presentt => y_presentt_t
        );

    -- Clock generation process
    clk_gen: process
    begin
        while true loop
            clk_t <= '0';
            wait for 10 ns;
            clk_t <= '1';
            wait for 10 ns;
        end loop;
    end process;

    -- Stimulus process for testing the memory
    stimulus: process
    begin
        -- Step 1: Reset the memory
        reset_t <= '1';
		  init_t <= '1';
		  mem_init_data_t <= x"0000";
		  mem_init_addr_t <= x"0000";
        wait for 20 ns;
        reset_t <= '0';
		  wait for 20 ns;
		  mem_init_data_t <= "0000000001010000";
		  mem_init_addr_t <= x"0002";
		  wait for 20 ns;
        mem_init_data_t <= "0101010001100001";
		  mem_init_addr_t <= x"000A";
		  wait for 20 ns;
        mem_init_data_t <= "0110000000001011";
		  mem_init_addr_t <= x"000B";
		  wait for 20 ns;
        mem_init_data_t <= "1010001011001011";
		  mem_init_addr_t <= x"0001";
		  wait for 20 ns;
        mem_init_data_t <= "1010000011001010";
		  mem_init_addr_t <= x"0000";
		  wait for 20 ns;
		  mem_init_data_t <= "1011010011001100";
		  mem_init_addr_t <= x"0003";
		  wait for 20 ns;
		  init_t <= '0';
        wait;
    end process;
end bhv;
