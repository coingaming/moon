defmodule Moon.Design.Form.InsetField.Error do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.Form.Field.Error

  def render(assigns) do
    ~F"""
    <Error />
    """
  end
end
