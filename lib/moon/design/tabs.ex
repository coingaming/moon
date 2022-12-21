defmodule Moon.Design.Tabs do
  @moduledoc false

  use Moon.StatelessComponent

  alias Surface.Components.Context

  import Moon.Helpers.MoonRender, only: [moon: 1]

  prop(selected_index, :integer, default: 0)
  prop(on_change, :event)
  prop(size, :string, values!: ~w(sm md), default: "md")

  prop(tab_titles, :list, default: [])
  prop(tab_module, :atom, default: __MODULE__.Tab)

  slot(tabs)
  slot(panels)

  def render(assigns) do
    ~F"""
    <div class="flex flex-wrap items-center justify-around gap-2 w-full">
      <div class="flex items-center justify-center gap-2" role="tablist" aria-orientation="horizontal">
        {#if slot_assigned?(:tabs) && is_list(@tabs)}
          {#for {tab, tabindex} <- Enum.with_index(@tabs)}
            {!-- IO.puts "Here is tab content " <> inspect tab, structs: false, pretty: true --}
            {!--
              TODO: try to use
                Map.merge(tab, %{selected: "#{tabindex}" == "#{@selected_index}", size: @size, on_change: @on_change, tabindex: "#{tabindex}"})
              instead bc context is expensive )))))
            --}
            <Context put={
              selected: "#{tabindex}" == "#{@selected_index}",
              size: @size,
              on_change: @on_change,
              tabindex: "#{tabindex}"
            }>
              <#slot {tab} />
            </Context>
          {/for}
        {#else}
          <.moon
            :for={{title, tabindex} <- Enum.with_index(@tab_titles)}
            module={@tab_module}
            selected={"#{tabindex}" == "#{@selected_index}"}
            {=@size}
            {=@on_change}
            {=tabindex}
          >{title}</.moon>
        {/if}
      </div>
      {#if slot_assigned?(:panels) && is_list(@panels) && Enum.at(@panels, @selected_index)}
        <div role="tabpanel" tabindex={@selected_index} class="w-full">
          <#slot {Enum.at(@panels, @selected_index)} />
        </div>
      {/if}
    </div>
    """
  end
end
