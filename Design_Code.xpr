library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity traffic is
    Port (
        clk : in STD_LOGIC;
        clr : in STD_LOGIC; 
        red1, yellow1, green1 : out STD_LOGIC;
        red2, yellow2, green2 : out STD_LOGIC;
        red3, yellow3, green3 : out STD_LOGIC;
        red4, yellow4, green4 : out STD_LOGIC
    );
end entity traffic;

architecture trafficA of traffic is
    type state_type is (s0, s1, s2, s3, s4, s5, s6, s7);
    signal state : state_type := s0;
    signal count : integer := 0;
    signal lights : STD_LOGIC_VECTOR (11 downto 0);

begin
    STATEpro: process (state)
    begin
        case state is
            when s0 => lights <= "001100100100";
            when s1 => lights <= "010100100100";
            when s2 => lights <= "100001100100";
            when s3 => lights <= "100010100100";
            when s4 => lights <= "100100001100";
            when s5 => lights <= "100100010100";
            when s6 => lights <= "100100100001";
            when s7 => lights <= "100100100010";
            when others => lights <= lights;
        end case;
    end process STATEpro;

    LT: process (clk)
    begin
        case count is
            when 0 =>
                state <= s0; count <= count + 1;
            when 20 =>
                state <= s1; count <= count + 1; -- 1st green ends
            when 25 =>
                state <= s2; count <= count + 1; -- 1st yellow ends
            when 45 =>
                state <= s3; count <= count + 1; -- 2nd green ends
            when 50 =>
                state <= s4; count <= count + 1; -- 2nd yellow ends
            when 70 =>
                state <= s5; count <= count + 1; -- 3rd green ends
            when 75 =>
                state <= s6; count <= count + 1; -- 3rd yellow ends
            when 95 =>
                state <= s7; count <= count + 1; -- 4th green ends
            when 100 =>
                count <= 0; -- 4th yellow ends
            when others =>
                count <= count + 1;
        end case;

        green4 <= lights(0); 
        yellow4 <= lights(1); 
        red4 <= lights(2); 
        green3 <= lights(3);
        yellow3 <= lights(4);
        red3 <= lights(5);
        green2 <= lights(6); 
        yellow2 <= lights(7);
        red2 <= lights(8);
        green1 <= lights(9);
        yellow1 <= lights(10);
        red1 <= lights(11);
    end process LT;
end architecture trafficA;
