defmodule Moon.Parts.IconButton.Success do
  @moduledoc false

  use Moon.StatelessComponent
  use Moon.Design.Button.IconButtonProperties

  @doc "Background tailwind class(es)"
  prop(bg_class, :css_class, default: "bg-roshi-10 text-roshi")

  defdelegate render(assigns), to: Moon.Parts.IconButton
end
