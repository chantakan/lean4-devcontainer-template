import Lake
open Lake DSL

package «lean4-project» where
  -- add package configuration options here

lean_lib «Lean4Project» where
  -- add library configuration options here

@[default_target]
lean_exe «lean4-project» where
  root := `Main
