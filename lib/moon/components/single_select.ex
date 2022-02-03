defmodule Moon.Components.SingleSelect.Item do
  @moduledoc false

  use Surface.Component, slot: "items"
end

defmodule Moon.Components.SingleSelect do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.SelectTrigger
  alias Phoenix.LiveView.JS

  prop id, :string
  prop on_select, :string
  prop target, :string
  prop size, :string, values: ~w(md lg xl), default: "md"
  prop class, :string
  prop trigger_class, :string
  prop placeholder, :string, default: "Choose"

  # options={[%{label: 'Option 1', value: 1}]}
  prop options, :list, required: true
  prop selected_option, :any
  slot items, args: [item: ^options]

  def render(assigns) do
    ~F"""
    <div class={"relative #{@class}"} phx-click-away={hide_listbox(@id)}>
      <SelectTrigger
        id={"#{@id}-trigger"}
        on_click={toggle_listbox(%JS{}, @id)}
        class={@trigger_class}
        {=@selected_option}
        {=@size}
      >
        <#slot name="items" :args={item: @selected_option} :if={@selected_option}>
          {@selected_option.label}
        </#slot>
      </SelectTrigger>

      <ul
        class="absolute z-10 w-full px-1 py-2 mt-2 space-y-1 overflow-auto rounded-lg shadow-lg bg-gohan-100 max-h-56 focus:outline-none"
        tabindex="-1"
        role="listbox"
        id={"#{@id}-listbox"}
        style="display: none;"
      >
        {#for option <- @options}
          <li
            class="relative p-3 py-2 pl-3 text-sm leading-6 rounded-sm cursor-pointer text-bulma-100 hover:bg-goku-100"
            role="option"
            :on-click={select_option(@id, @on_select, @target, option.value)}
          >
            <#slot name="items" :args={item: option}>
              {option.label}
            </#slot>
          </li>
        {/for}
      </ul>
    </div>
    """
  end

  defp toggle_listbox(js, id) do
    js
    |> JS.toggle(to: "##{id}-listbox")
    |> SelectTrigger.toggle_icons(id)
  end

  defp hide_listbox(id) do
    %JS{}
    |> JS.hide(to: "##{id}-listbox")
    |> SelectTrigger.reset_icons(id)
  end

  defp select_option(id, event, target, value) do
    event
    |> JS.push(target: target, value: %{option_value: value})
    |> toggle_listbox(id)
  end
end
