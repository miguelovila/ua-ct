library ieee;
use ieee.std_logic_1164.all;

entity adder4 is
	port(a, b : in std_logic_vector(3 downto 0);
		   cin : in std_logic;
			  s : out std_logic_vector(3 downto 0);
		  cout : out std_logic);
end adder4;

architecture structural of adder4 is
	signal carryout : std_logic_vector(2 downto 0);
begin
	bit0: entity work.fulladder(behavioral)
	port map(a => a(0),
				b => b(0),
				cin => cin,
				s => s(0),
				cout => carryout(0));
	bit1: entity work.fulladder(behavioral)
	port map(a => a(1),
				b => b(1),
				cin => carryout(0),
				s => s(1),
				cout => carryout(1));
	bit2: entity work.fulladder(behavioral)
	port map(a => a(2),
				b => b(2),
				cin => carryout(1),
				s => s(2),
				cout => carryout(2));
	bit3: entity work.fulladder(behavioral)
	port map(a => a(3),
				b => b(3),
				cin => carryout(2),
				s => s(3),
				cout => cout);
	--cout <= carryout(3);
end structural;