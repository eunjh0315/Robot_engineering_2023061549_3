LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY dff_async_sc IS
  PORT (
    clk : IN  std_logic;
    d   : IN  std_logic;
    set : IN  std_logic;
    clr : IN  std_logic;
    q   : OUT std_logic;
    nq  : OUT std_logic
  );
END dff_async_sc;

ARCHITECTURE bhv OF dff_async_sc IS
  SIGNAL q_int : std_logic := '0';
BEGIN
  PROCESS(clk, clr, set)
  BEGIN
    IF (clr = '1') THEN
      q_int <= '0';
    ELSIF (set = '1') THEN
      q_int <= '1';
    ELSIF rising_edge(clk) THEN
      q_int <= d;
    END IF;
  END PROCESS;

  q  <= q_int;
  nq <= NOT q_int;
END bhv;
