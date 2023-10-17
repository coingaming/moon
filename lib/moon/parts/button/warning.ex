defmodule Moon.Parts.Button.Warning do
  @moduledoc false

  use Moon.StatelessComponent
  use Moon.Design.Button.Properties

  @doc "Background tailwind class(es)"
  prop(bg_class, :css_class, default: "bg-krillin-10 text-krillin")

  defdelegate render(assigns), to: Moon.Parts.Button
end
