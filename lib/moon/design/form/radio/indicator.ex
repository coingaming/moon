defmodule Moon.Design.Form.Radio.Indicator do
  @moduledoc "Radio round mark to be shown"

  use Moon.StatelessComponent

  @doc "Additional CSS classes for the mark"
  prop(class, :css_class)
  @doc "Id attribute to be given to the HTML tag"
  prop(id, :string)
  @doc "Data-testid attribute value"
  prop(testid, :string)
  @doc "If the mark should be checked "
  prop(is_selected, :boolean, from_context: :is_selected)

  defdelegate render(assigns), to: Moon.Lego.Radio
end
