LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Bin7SegDec IS
	PORT (
		enable : IN STD_LOGIC;
		binInput : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		binOutput : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END Bin7SegDec;

ARCHITECTURE Behavioral OF Bin7SegDec IS
BEGIN
	binOutput <= "1111111" WHEN (enable = '0') ELSE -- OFF
		"1111001" WHEN (binInput = "0001") ELSE -- 1
		"0100100" WHEN (binInput = "0010") ELSE -- 2
		"0110000" WHEN (binInput = "0011") ELSE -- 3
		"0011001" WHEN (binInput = "0100") ELSE -- 4
		"0010010" WHEN (binInput = "0101") ELSE -- 5
		"0000010" WHEN (binInput = "0110") ELSE -- 6
		"1111000" WHEN (binInput = "0111") ELSE -- 7
		"0000000" WHEN (binInput = "1000") ELSE -- 8
		"0010000" WHEN (binInput = "1001") ELSE -- 9
		"0001000" WHEN (binInput = "1010") ELSE -- A
		"0000011" WHEN (binInput = "1011") ELSE -- b
		"1000110" WHEN (binInput = "1100") ELSE -- C
		"0100001" WHEN (binInput = "1101") ELSE -- d
		"0000110" WHEN (binInput = "1110") ELSE -- E
		"0001110" WHEN (binInput = "1111") ELSE -- F
		"1000000"; -- 0
END Behavioral;