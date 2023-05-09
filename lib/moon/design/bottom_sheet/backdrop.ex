defmodule Moon.Design.BottomSheet.Backdrop do
  @moduledoc false

  use Moon.StatelessComponent, slot: "backdrop"

  @doc "Tailwind classes for customization"
  prop(class, :css_class)

  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)

  @doc "Id attribute for DOM element"
  prop(id, :string)

  defdelegate render(assigns), to: Moon.Design.Modal.Backdrop
end
