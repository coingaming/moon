defmodule Moon.Components.ErrorTag do
  @moduledoc false

  use Moon.StatelessComponent

  prop(field, :any)

  def render(assigns) do
    ~F"""
    <div class="text-chichi">
      <Surface.Components.Form.ErrorTag field={@field} />
    </div>
    """
  end
end
