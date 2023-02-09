defmodule Moon.Design.Snackbar.Content do
  @moduledoc false

  use Moon.StatelessComponent, slot: "content"

  prop(class, :css_class)

  slot(header)
  slot(message)

  def render(assigns) do
    ~F"""
    <div class="w-full">
      <#slot {@header} />
      <#slot {@message} />
    </div>
    """
  end
end
