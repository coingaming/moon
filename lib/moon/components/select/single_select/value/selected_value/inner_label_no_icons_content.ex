defmodule Moon.Components.Select.SingleSelect.Value.SelectedValue.InnerLabelNoIconsContent do
  @moduledoc false

  use Moon.StatelessComponent

  prop label, :string, default: ""

  def render(assigns) do
    ~F"""
    <div class="text-bulma-100 text-moon-16">
      {@label}
    </div>
    """
  end
end
