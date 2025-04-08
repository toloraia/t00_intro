From refinedc.typing Require Import typing.
From refinedc.project.t00_intro.src.code Require Import generated_code.
From caesium Require Import builtins_specs.
From refinedc.project.t00_intro Require Import my_lemmas.
Set Default Proof Using "Type".

(* Generated from [src/code.c]. *)
Section spec.
  Context `{!typeG Σ} `{!globalG Σ}.

  (* Specifications for function [__builtin_ffsll]. *)
  Definition type_of___builtin_ffsll :=
    fn(∀ x : Z; (x @ (int (u64))); True)
      → ∃ () : (), (((Z_least_significant_one x + 1)%Z) @ (int (i32))); True.

  (* Specifications for function [binary_search]. *)
  Definition type_of_binary_search :=
    fn(∀ (ls, x, p) : (list Z) * Z * loc; (p @ (&own (array (i32) (ls `at_type` int i32)))), ((length ls) @ (int (i32))), (x @ (int (i32))); ⌜StronglySorted (≤) ls⌝)
      → ∃ () : (), ((x ∈ ls) @ (optional (∃ₜ i : nat, constrained (i @ (int (i32))) ⌜ls !! i = Some x⌝) ((-1) @ (int (i32))))); (p ◁ₗ (array (i32) (ls `at_type` int i32))).
End spec.
