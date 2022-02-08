defmodule Moon.Components.CheckboxMultiselect do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.Checkbox
  alias Moon.Components.ListItems.SingleLineItem

  alias Surface.Components.Form.Input.InputContext

  prop options, :list, required: true
  prop values, :list
  prop on_select, :event
  prop testid, :string

  def render(assigns) do
    ~F"""
    <div data-testid={@testid}>
      {#for option <- @options}
        <SingleLineItem
          on_select={@on_select}
          values={toggled_item_id: get_value(option)}
          testid={"#{@testid}-value-#{get_value(option)}"}
          size="large"
        >
          <:right_icon>
            <InputContext assigns={assigns} :let={form: form, field: field}>
              <Checkbox
                id={get_checkbox_id(form, field, option)}
                name={get_checkbox_name(form, field, option)}
                value={get_value(option)}
                checked={is_checked(@values, option)}
              />
            </InputContext>
          </:right_icon>
          {get_label(option)}
        </SingleLineItem>
      {/for}
    </div>
    """
  end

  def get_checkbox_id(form, field, option) do
    if form && field && option do
      "#{form.id}-#{field}-#{get_value(option)}"
    else
      nil
    end
  end

  def get_checkbox_name(form, field, option) do
    if form && field && option do
      "#{form.id}[#{field}][#{get_value(option)}]"
    else
      nil
    end
  end

  def is_checked(values, option) do
    values && (Enum.member?(values, get_value(option)) || Enum.member?(values, "#{get_value(option)}"))
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
