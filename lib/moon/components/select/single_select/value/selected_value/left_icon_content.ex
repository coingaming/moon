defmodule Moon.Components.Select.SingleSelect.Value.SelectedValue.LeftIconContent do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.Select.Dropdown.Icon

  prop icon, :any

  def render(assigns) do
    ~F"""
    <div class="justify-self-start">
      <Icon {=@icon}/>
    </div>
    """
  end
end
