defmodule Moon.Components.ErrorTag do
  @moduledoc false

  use Moon.StatelessComponent

  prop(field, :any)

  def render(assigns) do
    ~F"""
    <Surface.Components.Form.ErrorTag
      field={@field && String.to_atom("#{@field}")}
    />
    """
  end
end
