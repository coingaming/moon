defmodule Moon.Components.Select.SingleSelect.Value.SelectedValue.RightIconContent do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.Select.Dropdown.Icon

  prop icon, :any

  def render(assigns) do
    ~F"""
    <div class="justify-self-end">
      <Icon {=@icon}/>
    </div>
    """
  end
end
