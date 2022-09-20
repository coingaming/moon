defmodule Moon.Components.Select.SingleSelect.Value.SelectedValue.NoInnerLabelNoIconsContent do
  @moduledoc false

  use Moon.StatelessComponent

  prop placeholder, :string, default: ""

  def render(assigns) do
    ~F"""
    <div class="text-trunks-100 text-moon-16 text-left h-full w-full">
      {@placeholder}
    </div>
    """
  end
end
