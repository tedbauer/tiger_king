(lang dune 3.4)

(name tiger_king)

(generate_opam_files true)

(source
 (github username/reponame))

(authors "Author Name")

(maintainers "Maintainer Name")

(license LICENSE)

(documentation https://url/to/documentation)

(package
 (name tiger_king)
 (synopsis "A short synopsis")
 (description "A longer description")
 (depends ocaml dune base stdio ppx_deriving ppx_sexp_conv)
 (tags
  (topics "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
