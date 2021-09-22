defmodule Moon.Components.CheckboxMultiselectV2 do
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
      <div :on-click={@on_select} phx-value-toggled_item_id={option.value}>
        <SingleLineItem size="large">
          <:right_icon>
            <Checkbox class="pointer-events-none" checked={Enum.member?(@values, option.value)} />
          </:right_icon>
          {option.label}
        </SingleLineItem>
      </div>
    {/for}
    """
  end
end
