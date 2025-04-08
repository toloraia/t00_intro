From refinedc.typing Require Import typing.
From refinedc.project.t00_intro.src.code Require Import generated_code.
From refinedc.project.t00_intro.src.code Require Import generated_spec.
From caesium Require Import builtins_specs.
From refinedc.project.t00_intro Require Import my_lemmas.
Set Default Proof Using "Type".

(* Generated from [src/code.c]. *)
Section proof_binary_search.
  Context `{!typeG Σ} `{!globalG Σ}.

  (* Typing proof for [binary_search]. *)
  Lemma type_binary_search :
    ⊢ typed_function impl_binary_search type_of_binary_search.
  Proof.
    Local Open Scope printing_sugar.
    start_function "binary_search" ([[ls x] p]) => arg_xs arg_n arg_x local_r local_l local_k.
    prepare_parameters (ls x p).
    split_blocks ((
      <[ "#1" :=
        ∃ vl : nat,
        ∃ vr : nat,
        arg_xs ◁ₗ (p @ (&own (array (i32) (ls `at_type` int i32)))) ∗
        arg_n ◁ₗ ((length ls) @ (int (i32))) ∗
        arg_x ◁ₗ (x @ (int (i32))) ∗
        local_k ◁ₗ uninit (it_layout i32) ∗
        local_l ◁ₗ (vl @ (int (i32))) ∗
        local_r ◁ₗ (vr @ (int (i32))) ∗
        ⌜vl <= vr⌝ ∗
        ⌜vr <= length ls⌝ ∗
        ⌜must_be_in_range ls vl vr x⌝
    ]> $
      ∅
    )%I : gmap label (iProp Σ)) (
      @nil Prop
    ).
    - repeat liRStep; liShow.
      all: print_typesystem_goal "binary_search" "#0".
    - repeat liRStep; liShow.
      all: print_typesystem_goal "binary_search" "#1".
    Unshelve. all: unshelve_sidecond; sidecond_hook; prepare_sideconditions; normalize_and_simpl_goal; try solve_goal; unsolved_sidecond_hook.
    all: try by apply: elem_of_list_lookup_2; solve_goal.
    all: try by apply: must_be_in_range_full; solve_goal.
    all: try by apply: must_be_in_range_not_in; solve_goal.
    all: try by apply: must_be_in_range_sorted_r; solve_goal.
    all: try by apply: must_be_in_range_sorted_l; solve_goal.
    all: print_sidecondition_goal "binary_search".
    Unshelve. all: try done; try apply: inhabitant; print_remaining_shelved_goal "binary_search".
  Qed.
End proof_binary_search.
