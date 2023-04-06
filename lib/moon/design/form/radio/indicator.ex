defmodule Moon.Design.Form.Radio.Indicator do
  @moduledoc false

  use Moon.StatelessComponent

  prop(class, :css_class)
  prop(id, :string)
  prop(testid, :string)
  prop(is_selected, :boolean, from_context: :is_selected)

  defdelegate render(assigns), to: Moon.Lego.Radio
end
