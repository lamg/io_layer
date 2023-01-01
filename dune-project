(lang dune 3.6)

(name io_layer)

(generate_opam_files true)

(source
 (github lamg/io_layer))

(authors "Luis Ángel Méndez Gort")

(maintainers "Luis Ángel Méndez Gort")

(license GPLv3)

(documentation https://github.com/lamg/io_layer)

(package
 (name io_layer)
 (synopsis "Input/Output layer for OCaml projects")
 (description "Input/Output layer for OCaml projects")
 (depends ocaml dune cohttp-lwt-unix lwt_ssl tls alcotest core caqti-lwt caqti-driver-sqlite3)
 (tags
  (topics IO)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
