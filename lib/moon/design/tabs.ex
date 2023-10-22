defmodule Moon.Design.Tabs do
  @moduledoc false

  use Moon.StatefulComponent

  @doc "Id attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class, default: "justify-around gap-2")
  @doc "Index of seleted tab"
  prop(selected, :integer, default: 0)
  @doc "Event to happen when non-disabled tab is clicked"
  prop(on_change, :event)
  @doc "Tab header slot"
  slot(header, required: true)
  @doc "Tab content slot"
  slot(content)
  @doc "Default slot"
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
