defmodule Moon.Parts.Button.White do
  @moduledoc false

  use Moon.StatelessComponent
  use Moon.Design.Button.Properties

  @doc "Background tailwind class(es)"
  prop(bg_class, :css_class, default: "bg-goku text-bulma border border-beerus")

  defdelegate render(assigns), to: Moon.Parts.Button
end
