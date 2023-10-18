defmodule Moon.Parts.Button.Error do
  @moduledoc false

  use Moon.StatelessComponent
  use Moon.Design.Button.Properties

  @doc "Background tailwind class(es)"
  prop(bg_class, :css_class, default: "bg-chichi-10 text-chichi")

  defdelegate render(assigns), to: Moon.Parts.Button
end
