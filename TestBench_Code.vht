library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity traffic_tb is
end traffic_tb;

architecture testbench of traffic_tb is
    -- Constants
    constant CLK_PERIOD : time := 10 ns; -- Clock period

    -- Signals
    signal clk : std_logic := '0'; -- Clock signal
    signal clr : std_logic := '0'; -- Clear signal
    signal red1, yellow1, green1 : std_logic; -- Signals for direction 1
    signal red2, yellow2, green2 : std_logic; -- Signals for direction 2
    signal red3, yellow3, green3 : std_logic; -- Signals for direction 3
    signal red4, yellow4, green4 : std_logic; -- Signals for direction 4

begin
    -- Instantiate the traffic light controller
    uut : entity work.traffic
        port map (
            clk => clk,
            clr => clr,
            red1 => red1, yellow1 => yellow1, green1 => green1,
            red2 => red2, yellow2 => yellow2, green2 => green2,
            red3 => red3, yellow3 => yellow3, green3 => green3,
            red4 => red4, yellow4 => yellow4, green4 => green4
        );

    -- Clock process
    clk_process : process
    begin
        while now < 1000 ns loop -- Simulation duration
            clk <= not clk;
            wait for CLK_PERIOD / 2;
        end loop;
        wait; -- Stop simulation
    end process clk_process;

    -- Stimulus process
    stimulus_process : process
    begin
        -- Apply reset
        clr <= '1';
        wait for 20 ns;
        clr <= '0';

        -- Wait for a few clock cycles for stabilization
        wait for CLK_PERIOD * 5;

        -- Your testbench stimuli here, if needed

        wait; -- Stop simulation
    end process stimulus_process;

end testbench;


