--
-- IP: heartbeat
-- Problem generator: Sean Griffin 
-- Core usage: Use to step down a clock signal. 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity heartbeat_pulser is
    generic (
        PERIOD: positive := 100000000
    );
    port (
        clk       : in std_logic  := '0';
        rst_n     : in std_logic  := '1';
        heartbeat : out std_logic := '0'
    );

end entity;

architecture rtl of heartbeat_pulser is

    signal counter : unsigned(32-1 downto 0) := (others=>'0');

begin

    count : process( rst_n, clk )
    begin
        if rst_n = '1' then
            counter <= (others=>'0');
            heartbeat <= '0';
        elsif rising_edge(clk) then

            if counter < (PERIOD / 2) then
                heartbeat <= '0';
            else
                heartbeat <= '1';
            end if;

            if counter >= PERIOD-1 then 
                counter <= (others=>'0');
            else 
                counter <= counter + 1;
            end if;

        end if;          
    end process ; -- count


end architecture ; -- rtl