# Used by "mix format"
locals_without_parens = [
  # Surface.Component
  property: 3,
  property: 2,
  data: 3,
  data: 2,
  slot: 1,
  slot: 2
]

[
  import_deps: [:phoenix],
  locals_without_parens: locals_without_parens,
  export: [locals_without_parens: locals_without_parens],
  inputs: ["*.{ex,exs}", "{mix,.formatter}.exs", "{config,lib,test}/**/*.{ex,exs}"]
]
