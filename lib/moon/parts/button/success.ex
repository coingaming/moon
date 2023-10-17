defmodule Moon.Parts.Button.Success do
  @moduledoc false

  use Moon.StatelessComponent
  use Moon.Design.Button.Properties

  @doc "Background tailwind class(es)"
  prop(bg_class, :css_class, default: "bg-roshi-10 text-roshi")

  defdelegate render(assigns), to: Moon.Parts.Button
end
