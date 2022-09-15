defmodule Moon.Components.Select.SingleSelect.Value.SelectedValue.InnerLabelContent do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.Select.Helpers, as: SelectHelpers

  prop label, :string, default: ""
  prop has_left_icon, :boolean
  prop size, :string

  def render(assigns) do
    ~F"""
    <div
      class={
        "text-trunks-100",
        SelectHelpers.innerlabel_font_class(@size)
      }
      style={get_style("grid-col": if(@has_left_icon, do: "span 2 / span 2"))}
    >
      {@label}
    </div>
    """
  end
end
