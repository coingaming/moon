defmodule Moon.Design.Form.Field.Error do
  @moduledoc false

  use Moon.StatelessComponent

  prop(class, :css_class)

  def render(assigns) do
    ~F"""
    <div class={merge(["text-chichi ps-4", @class])} role="alert">
      <Surface.Components.Form.ErrorTag />
    </div>
    """
  end
end
