defmodule Moon.Design.Accordion do
  @moduledoc false

  use Moon.StatefulComponent

  import Moon.Helpers.MakeList

  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Size of the item, header mostly"
  prop(item_size, :string, values!: ["sm", "md", "lg", "xl"], default: "md")
  @doc "Content looks outside"
  prop(has_content_outside, :boolean, default: false)
  @doc "Value (List of values) items to be open"
  prop(value, :any, default: [])
  @doc "Handler for open/close of the item"
  prop(on_change, :event)
  @doc "Close other items if true"
  prop(is_single_open, :boolean, default: false)
  @doc "Accordion item, see Accordion.Item"
  slot(item, required: true)

  def handle_event("on_change_default", _params = %{"value" => index}, socket) do
    list = make_list(socket.assigns[:value])

    {:noreply,
     assign(socket,
       value:
         (Enum.member?(list, index) &&
            Enum.filter(list, &(&1 != index))) ||
           ((socket.assigns.is_single_open && [index]) || [index | list])
     )}
  end

  def render(assigns) do
    ~F"""
    <div class={merge(["flex w-full gap-2 flex-col", @class])} {=@id} data-testid={@testid}>
      {#for {item, index} <- Enum.with_index(make_list(@item))}
        <#slot
          {item}
          context_put={
            is_open: Enum.member?(make_list(@value), item.value || to_string(index)),
            size: @item_size,
            value: to_string(index),
            on_change: @on_change || %{name: "on_change_default", target: @myself},
            has_content_outside: @has_content_outside
          }
        />
      {/for}
    </div>
    """
  end
end
