defmodule Moon.Design.Dropdown do
  @moduledoc false

  use Moon.StatefulComponent

  prop(value, :any)
  prop(on_change, :event)
  prop(on_trigger, :event)
  prop(is_open, :boolean)
  prop(size, :string, values!: ~w(sm md lg), default: "md")
  prop(class, :css_class)

  prop(option_titles, :list, default: [])
  prop(option_module, :atom, default: __MODULE__.Option)

  slot(trigger, required: true)
  slot(option)

  def handle_event("on_change_default", params = %{"value" => value}, socket) do
    IO.puts("ON_CHAGE_DEFAULT #{inspect(params)}")
    {:noreply, assign(socket, value: value)}
  end

  def handle_event("on_trigger_default", _, socket) do
    {:noreply, assign(socket, is_open: !socket.assigns.is_open)}
  end

  def handle_event("close_me", _, socket) do
    {:noreply, assign(socket, is_open: false)}
  end

  def render(assigns) do
    ~F"""
    <div class="relative">
      <div class={merge([
        "flex flex-col absolute w-full top-full z-5",
        "p-1 my-2 rounded-moon-s-md box-border bg-gohan shadow-moon-lg overflow-y-auto focus:outline-none",
        (@is_open && "") || "hidden",
        @class
      ])}>
        {#if slot_assigned?(:option)}
          {#for {option, index} <- Enum.with_index(make_list(@option))}
            <#slot
              {option}
              context_put={
                selected: (option.value || "#{index}") == @value,
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
            selected={title == @value}
            {=@size}
            on_click={@on_change || %{name: "on_change_default", target: @myself}}
            value={title}
          >{title}</.moon>
        {/if}
      </div>

      <div
        :on-click={@on_trigger || %{name: "on_trigger_default", target: @myself}}
        :on-click-away="close_me"
        aria-haspopup="true"
        aria-expanded={@is_open}
      >
        <#slot {@trigger, value: @value} />
      </div>
    </div>
    """
  end

  defp make_list(l) when is_list(l), do: l
  defp make_list(l), do: [l]
end
