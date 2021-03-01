-- IP: heartbeat
-- Problem generator: Sean Griffin 
-- Core usage: Testbench for heartbeat IP.  



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity heartbeat_tb is
--  Port ( );
end heartbeat_tb;

architecture Behavioral of heartbeat_tb is

    constant PERIOD : positive := 50;
    
    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal heartbeat : std_logic := '0';

begin

    HB : entity work.heartbeat(rtl)
    generic map (PERIOD)
    port map (clk, rst, heartbeat);
    
    clk <= not clk after 5 ns;

end Behavioral;
