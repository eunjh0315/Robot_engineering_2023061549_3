LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY d_flipflop IS
  PORT (
    clk : IN  std_logic;
    d   : IN  std_logic;
    q   : OUT std_logic;
    nq  : OUT std_logic
  );
END d_flipflop;

ARCHITECTURE bhv OF d_flipflop IS
  SIGNAL q_int : std_logic := '0';
BEGIN
  PROCESS(clk)
  BEGIN
    IF rising_edge(clk) THEN
      q_int <= d;
    END IF;
  END PROCESS;

  q  <= q_int;
  nq <= NOT q_int;
END bhv;
