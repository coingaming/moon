[
  import_deps: [:phoenix, :surface],
  inputs: ["*.{ex,exs}", "{config,lib,test}/**/*.{ex,exs}"],
  surface_inputs: ["{lib,test}/**/*.{ex,exs,sface}", "priv/catalogue/**/*.{ex,exs,sface}"]
]
