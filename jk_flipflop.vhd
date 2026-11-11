LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY jk_flipflop IS
  PORT (
    clk : IN  std_logic;
    clr : IN  std_logic;
    j   : IN  std_logic;
    k   : IN  std_logic;
    q   : OUT std_logic;
    nq  : OUT std_logic
  );
END jk_flipflop;

ARCHITECTURE bhv OF jk_flipflop IS
  SIGNAL q_internal : std_logic := '0';
BEGIN
  PROCESS(clk, clr)
  BEGIN
    IF (clr = '1') THEN
      q_internal <= '0';
    ELSIF rising_edge(clk) THEN
      IF (j = '0' AND k = '0') THEN
        q_internal <= q_internal;
      ELSIF (j = '0' AND k = '1') THEN
        q_internal <= '0';
      ELSIF (j = '1' AND k = '0') THEN
        q_internal <= '1';
      ELSIF (j = '1' AND k = '1') THEN
        q_internal <= NOT q_internal;
      END IF;
    END IF;
  END PROCESS;

  q  <= q_internal;
  nq <= NOT q_internal;
END bhv;
