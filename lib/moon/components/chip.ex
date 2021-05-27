defmodule Moon.Components.Chip do
  use Moon.StatelessComponent

  alias Moon.Components.Button

  slot(default)
  prop class, :css_class
  prop left_icon, :string
  prop right_icon, :string
  prop on_click, :event
  prop value, :string

  def render(assigns) do
    ~H"""
    {{ asset_import @socket, "js/tailwind" }}

    <Button
      class="bg-gohan-100 {{ @class }}"
      left_icon={{ @left_icon }}
      right_icon={{ @right_icon }}
      on_click={{ @on_click }}
      value={{ @value }}
    ><slot /></Button>
    """
  end
end
