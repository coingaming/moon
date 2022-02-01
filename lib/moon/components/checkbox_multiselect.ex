defmodule Moon.Components.CheckboxMultiselect do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.Checkbox
  alias Moon.Components.ListItems.SingleLineItem

  # [%{ label: :string, value: :string }, ...]
  prop options, :list, required: true
  # [:string]
  prop values, :list, required: true
  prop on_select, :event

  def render(assigns) do
    ~F"""
    {#for option <- @options}
      <div :on-click={@on_select} phx-value-toggled_item_id={get_value(option)}>
        <SingleLineItem size="large">
          <:right_icon>
            <Checkbox class="pointer-events-none" checked={get_value(option)} />
          </:right_icon>
          {get_label(option)}
        </SingleLineItem>
      </div>
    {/for}
    """
  end

  def get_value(option) do
    Map.get(option, :value) || Map.get(option, :id)
  end

  def get_label(option) do
    Map.get(option, :label) || Map.get(option, :name)
  end
end
