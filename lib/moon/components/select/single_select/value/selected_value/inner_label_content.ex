defmodule Moon.Components.Select.SingleSelect.Value.SelectedValue.InnerLabelContent do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.Select.Helpers, as: SelectHelpers

  prop label, :string, default: ""
  prop has_icons, :boolean
  prop size, :string

  def render(assigns) do
    ~F"""
    <div
      class={
        "text-trunks-100 text-left h-full w-full",
        SelectHelpers.innerlabel_font_class(@size)
      }>
      {@label}
    </div>
    """
  end
end
