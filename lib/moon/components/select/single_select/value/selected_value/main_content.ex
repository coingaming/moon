defmodule Moon.Components.Select.SingleSelect.Value.SelectedValue.MainContent do
  @moduledoc false

  use Moon.StatelessComponent

  prop label, :string, default: ""
  prop has_icons, :boolean
  prop is_inner_label, :boolean

  def render(assigns) do
    ~F"""
    <div
      class={
        "text-bulma-100 text-moon-16",
        "mt-[-4px]": @has_icons and @is_inner_label,
        "col-[_span_3_/_span_2] row-[_span_3_/_span_2]": @has_icons and !@is_inner_label
      }
    >
      {@label}
    </div>
    """
  end
end
