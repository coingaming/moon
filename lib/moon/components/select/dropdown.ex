defmodule Moon.Components.Select.Dropdown.Option do
  @moduledoc false

  use Moon.StatelessComponent
  alias Phoenix.LiveView.JS

  prop class, :css_class
  prop select_id, :string
  prop label, :any
  prop value, :any
  prop select_value, :any
  prop is_multi, :boolean

  slot default
  slot right_icon
  slot left_icon

  def render(assigns) do
    is_selected = get_is_selected(assigns)

    ~F"""
    <li
      class={
        "relative p-3 py-2 pl-3 text-sm leading-6 rounded-sm cursor-pointer text-bulma-100 hover:bg-goku-100",
        "bg-goku-100": is_selected
      }
      role="option"
      :on-click={JS.dispatch("moon:update-select",
        detail: %{
          value: @value,
          selected: !is_selected
        },
        to: "##{@select_id}"
      )}
    >
      <#slot />
    </li>
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

# https://www.figma.com/file/aMBmdNX4cfv885xchXHIHo/Partners---Components-%7BMDS%7D?node-id=23443%3A818
defmodule Moon.Components.Select.Dropdown do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.Select.Dropdown.Option

  prop class, :css_class
  prop select_id, :string
  prop options, :any
  prop value, :any
  prop is_multi, :boolean

  def render(assigns) do
    ~F"""
    <ul
      class={
        "z-10 w-full px-1 py-2 space-y-1 rounded-lg shadow-lg bg-gohan-100 focus:outline-none",
        "#{@class}": true
      }
      tabindex="-1"
      role="listbox"
      id={"#{@select_id}-dropdown"}
    >
      {#for option <- @options}
        <Option select_id={@select_id} select_value={@value} is_multi={@is_multi} value={option.value}>
          {option.label}
        </Option>
      {/for}
    </ul>
    """
  end
end
