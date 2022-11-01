defmodule Moon.Components.Select.Dropdown.Option do
  @moduledoc false

  use Moon.StatelessComponent
  alias __MODULE__.Renderer

  prop class, :css_class
  prop select_id, :string, from_context: {Moon.Components.Select.Dropdown, :select_id}
  prop value, :any, from_context: {Moon.Components.Select.Dropdown, :value}
  prop select_value, :any, from_context: {Moon.Components.Select.Dropdown, :select_value}
  prop is_multi, :boolean, from_context: {Moon.Components.Select.Dropdown, :is_multi}
  prop left_icon, :any
  prop right_icon, :any

  slot default, arg: %{is_selected: :boolean}

  def render(assigns) do
    ~F"""
    <Renderer
      is_selected={get_is_selected(%{
        select_value: @select_value,
        is_multi: @is_multi,
        value: @value
      })}
      {=@left_icon}
      {=@right_icon}
      {=@select_id}
      {=@value}
      {=@select_value}
      {=@is_multi}
      :let={is_selected: is_selected}
    >
      <#slot {@default, is_selected: is_selected} />
    </Renderer>
    """
  end

  def get_is_selected(%{select_value: select_value, is_multi: is_multi, value: value}) do
    if is_multi do
      Enum.member?(select_value, value)
    else
      select_value == value
    end
  end
end
