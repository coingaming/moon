defmodule Moon.Design.Drawer.Backdrop do
  @moduledoc false

  use Moon.StatelessComponent, slot: "backdrop"

  prop(class, :css_class)

  prop(testid, :string)
  prop(id, :string)

  defdelegate render(assigns), to: Moon.Design.Modal.Backdrop
end
