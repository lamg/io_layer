open! Core

let ok = Alcotest.(check bool) "" true
let dummy_test _ = ok true

let suite_gen =
  [ "dummy_test", `Quick, dummy_test
  ]
;;

let () = Alcotest.run "io_layer" [ "io_layer", suite_gen ]
