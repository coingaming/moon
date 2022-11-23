defmodule Moon.Components.Select.SingleSelect.Value.SelectedValue.InnerLabelContent do
  @moduledoc false

  use Moon.StatelessComponent

  prop(label, :string, default: "")
  prop(has_icons, :boolean)

  def render(assigns) do
    ~F"""
    <div class="text-trunks text-moon-12 text-left h-full w-full pe-4">
      {@label}
    </div>
    """
  end
end
