defmodule Moon.Design.Tabs do
  @moduledoc false

  use Moon.StatefulComponent

  prop(testid, :string)
  prop(class, :css_class, default: "justify-around gap-2")

  prop(selected, :integer, default: 0)
  prop(on_change, :event)

  slot(header, required: true)
  slot(content)
  slot(default)

  def handle_event("on_change_default", %{"value" => tabindex}, socket) do
    {:noreply, assign(socket, selected: String.to_integer(tabindex))}
  end

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      data-testid={@testid}
      class={merge([
        "flex flex-wrap items-center w-full",
        @class
      ])}
    >
      <#slot />
      <#slot
        {@header}
        context_put={
          selected: @selected,
          on_change: @on_change || %{name: "on_change_default", target: @myself}
        }
      />
      <#slot {@content} context_put={selected: @selected} />
    </div>
    """
  end
end
