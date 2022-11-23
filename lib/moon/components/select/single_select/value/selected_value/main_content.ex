defmodule Moon.Components.Select.SingleSelect.Value.SelectedValue.MainContent do
  @moduledoc false

  use Moon.StatelessComponent

  prop(label, :string, default: "")
  prop(has_icons, :boolean)
  prop(is_inner_label, :boolean)

  def render(assigns) do
    ~F"""
    <div class="text-bulma text-moon-16 text-left h-full w-full">
      {@label}
    </div>
    """
  end
end
