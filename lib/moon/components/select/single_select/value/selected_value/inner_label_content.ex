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
        "text-trunks-100",
        SelectHelpers.innerlabel_font_class(@size),
        "col-[_span_2_/_span_2] row-[_span_2_/_span_2]": @has_icons
      }

    >
      {@label}
    </div>
    """
  end
end
