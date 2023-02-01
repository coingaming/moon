defmodule Moon.Design.Tabs do
  @moduledoc false

  use Moon.StatefulComponent

  prop(selected_index, :integer, default: 0)
  prop(on_change, :event)
  prop(size, :string, values!: ~w(sm md), default: "md")
  prop(class, :css_class)

  prop(tab_titles, :list, default: [])
  prop(tab_module, :atom, default: __MODULE__.Tab)

  slot(tabs)
  slot(panels)

  def handle_event("clicked_tab_default", %{"value" => tab_id}, socket) do
    {:noreply, assign(socket, selected_index: String.to_integer("#{tab_id}"))}
  end

  def render(assigns) do
    ~F"""
    <div class="flex flex-wrap items-center justify-around gap-2 w-full">
      <div
        class={merge(["flex items-center justify-center", (@size == "sm" && "gap-1") || "gap-2", @class])}
        role="tablist"
        aria-orientation="horizontal"
      >
        {#if slot_assigned?(:tabs)}
          {#for {tab, tabindex} <- Enum.with_index(make_list(@tabs))}
            {!-- IO.puts "Here is tab content " <> inspect tab, structs: false, pretty: true --}
            {!--
              TODO: try to use
                Map.merge(tab, %{selected: "#{tabindex}" == "#{@selected_index}", size: @size, on_change: @on_change, tabindex: "#{tabindex}"})
              instead bc context is expensive )))))
            --}
            <#slot
              {tab}
              context_put={
                selected: "#{tabindex}" == "#{@selected_index}",
                size: @size,
                on_change: @on_change || %{name: "clicked_tab_default", target: @myself},
                tabindex: "#{tabindex}"
              }
            />
          {/for}
        {#else}
          <.moon
            :for={{title, tabindex} <- Enum.with_index(@tab_titles)}
            module={@tab_module}
            selected={"#{tabindex}" == "#{@selected_index}"}
            {=@size}
            on_change={@on_change || %{name: "clicked_tab_default", target: @myself}}
            {=tabindex}
          >{title}</.moon>
        {/if}
      </div>
      {#if slot_assigned?(:panels) && Enum.at(make_list(@panels), @selected_index)}
        <div role="tabpanel" tabindex={@selected_index} class="w-full">
          <#slot {Enum.at(make_list(@panels), @selected_index)} />
        </div>
      {/if}
    </div>
    """
  end

  defp make_list(l) when is_list(l), do: l
  defp make_list(l), do: [l]
end
