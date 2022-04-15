library ieee; 
use ieee.std_logic_1164.all; 
 
entity alu16_tb is 
end alu16_tb; 
 
architecture stimulus of alu16_tb is 
   -- sinais para ligar às entradas da uut 
   signal s_op  : std_logic_vector(2 downto 0); 
   signal s_op0 : std_logic_vector(15 downto 0); 
   signal s_op1 : std_logic_vector(15 downto 0); 
   -- sinais para ligar às saídas da uut 
   signal s_res : std_logic_vector(15 downto 0); 
   signal s_mhi : std_logic_vector(15 downto 0); 
begin 
   uut: entity work.alu16(structure) 
        port map(op  => s_op, 
                 op0 => s_op0, 
                 op1 => s_op1, 
                 res => s_res, 
                 mhi => s_mhi); 
   --process stim 
   stim_proc : process 
   begin 
      s_op0 <= x"fedc"; 
      s_op1 <= x"0123"; 
      s_op  <= "000"; -- + 
      wait for 100 ns; 
      s_op  <= "001"; -- - 
      wait for 100 ns; 
      s_op  <= "010"; -- * 
      s_op1 <= x"89ab"; 
      wait for 100 ns; 
      s_op  <= "011"; -- / 
      s_op1 <= x"4567"; 
      wait for 100 ns; 
      s_op  <= "100"; -- rem 
      wait for 100 ns; 
      s_op0 <= x"f30c"; 
      s_op1 <= x"f50a"; 
      s_op  <= "101"; -- and 
      wait for 100 ns; 
      s_op  <= "110"; -- or 
      s_op1 <= x"0fa5"; 
      wait for 100 ns; 
      s_op  <= "111"; -- xor 
      wait for 100 ns; 
      wait; 
   end process; 
end stimulus;