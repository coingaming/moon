defmodule Moon.Design.Form.Field.Error do
  @moduledoc false

  use Moon.StatelessComponent

  def render(assigns) do
    ~F"""
    <div class="text-chichi ps-4" role="alert">
      <Surface.Components.Form.ErrorTag />
    </div>
    """
  end
end
