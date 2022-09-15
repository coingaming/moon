defmodule Moon.Components.Select.SingleSelect.Value.SelectedValue.LeftIconContent do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.Select.Helpers, as: SelectHelpers
  alias Moon.Components.Select.Dropdown.Icon

  prop icon, :any

  def render(assigns) do
    ~F"""
    <Icon
      class="grid place-content-center pr-2"
      {=@icon}
      style="grid-row: span 3 / span 3;"
    />
    """
  end
end
