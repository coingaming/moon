defmodule Moon.Components.MenuItem.Checkbox do
  @moduledoc false

  use Moon.StatelessComponent

  import Moon.Components.Checkbox, only: [fake_checkbox: 1]

  prop(is_selected, :boolean, from_context: {Moon.Components.MenuItem, :is_selected})

  def render(assigns) do
    ~F"""
    <span class="flex w-6 h-6 justify-center items-center">
      <.fake_checkbox selected={@is_selected} />
    </span>
    """
  end
end
