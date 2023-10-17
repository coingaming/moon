defmodule Moon.Parts.IconButton.Gray do
  @moduledoc false

  use Moon.StatelessComponent
  use Moon.Design.Button.IconButtonProperties

  @doc "Background tailwind class(es)"
  prop(bg_class, :css_class, default: "bg-gohan text-bulma border border-beerus")

  defdelegate render(assigns), to: Moon.Parts.IconButton
end
