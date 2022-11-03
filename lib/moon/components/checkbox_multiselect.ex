defmodule Moon.Components.CheckboxMultiselect do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.Checkbox
  alias Moon.Components.ListItems.SingleLineItem

  prop(options, :list, required: true)
  prop(values, :list, required: true)
  prop(on_select, :event)
  prop(testid, :string)

  def render(assigns) do
    ~F"""
    {#for option <- @options}
      <div
        :on-click={@on_select}
        phx-value-toggled_item_id={get_value(option)}
        data-testid={"#{@testid}-value-#{get_value(option)}"}
      >
        <SingleLineItem size="large">
          <:right_icon>
            <Checkbox class="pointer-events-none" checked={is_checked(@values, option)} />
          </:right_icon>
          {get_label(option)}
        </SingleLineItem>
      </div>
    {/for}
    """
  end

  def is_checked(values, option) do
    Enum.member?(values, get_value(option)) || Enum.member?(values, "#{get_value(option)}")
  end

  def get_value(option) do
    Map.get(option, :value) || Map.get(option, :id)
  end

  def get_label(option) do
    Map.get(option, :label) || Map.get(option, :name)
  end

  def toggle_list_value(list, value) do
    case Enum.member?(list, value) do
      true ->
        List.delete(list, value)

      false ->
        list ++ [value]
    end
  end
end
