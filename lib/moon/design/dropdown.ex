defmodule Moon.Design.Dropdown do
  @moduledoc false

  use Moon.StatefulComponent

  import Moon.Helpers.Positions

  prop(value, :any)
  prop(on_change, :event)
  prop(on_trigger, :event)
  prop(is_open, :boolean)
  prop(size, :string, values!: ~w(sm md lg), default: "md")
  prop(class, :css_class)
  prop(position, :string, values: position_list())

  prop(option_titles, :list, default: [])
  prop(option_module, :atom, default: __MODULE__.Option)

  slot(trigger, required: true)
  slot(option)
  slot(default)

  prop(testid, :string)

  def handle_event("on_change_default", %{"value" => value}, socket) do
    {:noreply, assign(socket, value: value, is_open: false)}
  end

  def handle_event("on_trigger_default", _, socket) do
    {:noreply, assign(socket, is_open: !socket.assigns.is_open)}
  end

  def handle_event("close_me", _, socket) do
    {:noreply, assign(socket, is_open: false)}
  end

  def render(assigns) do
    ~F"""
    <div class="relative" :on-click-away="close_me" {=@id}>
      <div
        class={merge([
          "flex flex-col absolute z-[99]",
          "p-1 rounded-moon-s-md box-border bg-gohan shadow-moon-lg overflow-y-auto focus:outline-none",
          (@position && position_class(@position)) || "w-full top-full my-2",
          @class,
          hidden: !@is_open
        ])}
        data-testid={@testid}
      >
        {#if slot_assigned?(:option)}
          {#for {option, index} <- Enum.with_index(make_list(@option))}
            <#slot
              {option}
              context_put={
                is_selected: Enum.member?(make_list(@value), option.value || "#{index}"),
                size: @size,
                on_click: @on_change || %{name: "on_change_default", target: @myself},
                value: index
              }
            />
          {/for}
        {#else}
          <.moon
            :for={title <- @option_titles}
            module={@option_module}
            is_selected={Enum.member?(make_list(@value), title)}
            {=@size}
            on_click={@on_change || %{name: "on_change_default", target: @myself}}
            value={title}
          >{title}</.moon>
        {/if}
        <#slot />
      </div>

      <div
        :on-click={@on_trigger || %{name: "on_trigger_default", target: @myself}}
        aria-haspopup="true"
        aria-expanded={@is_open}
      >
        <#slot {@trigger, value: @value, is_open: @is_open} />
      </div>
    </div>
    """
  end

  defp make_list(l) when is_list(l), do: l
  defp make_list(l), do: [l]
end
