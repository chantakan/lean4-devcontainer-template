def main : IO Unit :=
  IO.println "Hello, Lean 4!"

-- Example of a Simple Theorem Proving Commutativity of Addition
theorem add_comm (a b : Nat) : a + b = b + a := by
  induction a with
  | zero =>
    -- Demonstrate 0 + b = b + 0
    rw [Nat.zero_add]  -- 0 + b is rewritten to b
    rw [Nat.add_zero]  -- b + 0 is rewritten to b
  | succ n ih =>
    rw [Nat.succ_add, Nat.add_succ, ih]

-- A more concise proof (using omega tactic)
theorem add_comm_simple (a b : Nat) : a + b = b + a := by
  omega

-- Example of a Simple Equation Using Omega Tactic
example (x y : Nat) : x + y = y + x := by
  omega

example (x : Nat) : x + 0 = x := by
  omega

#check add_comm
#check add_comm_simple
#eval main
