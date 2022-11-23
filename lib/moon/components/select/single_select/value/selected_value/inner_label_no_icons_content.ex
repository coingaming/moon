defmodule Moon.Components.Select.SingleSelect.Value.SelectedValue.InnerLabelNoIconsContent do
  @moduledoc false

  use Moon.StatelessComponent

  prop(label, :string, default: "")

  def render(assigns) do
    ~F"""
    <div class="text-bulma text-moon-16 text-left h-full w-full pe-4">
      {@label}
    </div>
    """
  end
end
