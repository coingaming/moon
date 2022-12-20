defmodule Moon.Components.SingeItemSelect.Item do
  @moduledoc false

  use Moon.StatelessComponent

  prop(on_click, :event)
  prop(item_id, :string)
  prop(selected, :boolean)
  slot(default)

  def render(assigns) do
    ~F"""
    <div
      class={"p-2 pl-3 pr-3 hover:#{(@selected && "bg-piccolo") || "bg-hover"} rounded-md relative #{@selected && "bg-piccolo"}"}
      :on-click={@on_click}
      phx-value-selected_item_id={@item_id}
    >
      <#slot />
    </div>
    """
  end
end

defmodule Moon.Components.SingeItemSelect do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.SingeItemSelect.Item

  prop(on_change, :event)

  # this is list of Maps of label and value keys,
  # for example: [%{ label: 'Game 1', value: 1 }, %{ label: 'Game 2', value: 2 }]
  prop(options, :list)
  # this is list of numeric ids, for example: [1, 2]
  prop(value, :string)
  prop(class, :string)
  prop(style, :string)
  slot(default)

  def render(assigns) do
    ~F"""
    <div class={"bg-gohan shadow rounded-lg p-1 overflow-y-scroll #{@class}"} style={@style || ""}>
      <#slot />
      <div :for={option <- @options}>
        <Item item_id={option.value} selected={@value == option.value} on_click={@on_change}>
          {option.label}
        </Item>
      </div>
    </div>
    """
  end
end
