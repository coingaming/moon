defmodule Moon.Components.Select.Dropdown.Option do
  @moduledoc false

  use Moon.StatelessComponent
  alias Surface.Components.Context
  alias __MODULE__.Renderer

  prop class, :css_class
  prop select_id, :string
  prop value, :any
  prop select_value, :any
  prop is_multi, :boolean
  prop left_icon, :any
  prop right_icon, :any

  slot default, args: [:is_selected]

  def render(assigns) do
    ~F"""
    <Context get={
      Moon.Components.Select.Dropdown,
      select_id: select_id,
      select_value: select_value,
      value: value,
      is_multi: is_multi
    }>
      <Renderer
        is_selected={get_is_selected(%{
          select_value: @select_value || select_value,
          is_multi: @is_multi || is_multi,
          value: @value || value
        })}
        {=@left_icon}
        {=@right_icon}
        select_id={@select_id || select_id}
        value={@value || value}
        select_value={@select_value || select_value}
        is_multi={@is_multi || is_multi}
        :let={is_selected: is_selected}
      >
        <#slot {@default, is_selected: is_selected} />
      </Renderer>
    </Context>
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
