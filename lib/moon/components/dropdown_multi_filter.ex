defmodule Moon.Components.DropdownMultiFilter do
  use MoonWeb, :stateless_component

  alias Moon.Assets.Icons.IconZoom
  alias Moon.Autolayouts.LeftToRight
  alias Moon.Components.Button
  alias Moon.Components.CheckboxMultiselectV2
  alias Moon.Components.Divider
  alias Moon.Components.Form
  alias Moon.Components.PopoverV2
  alias Moon.Components.TextInput

  prop show_filter, :boolean, required: true
  prop search_text, :string
  prop all_items, :list, required: true
  prop selected_items, :list, required: true
  prop active_items, :list, required: true

  prop on_apply, :event, required: true
  prop on_discard, :event, required: true
  prop on_clear, :event, required: true
  prop on_search, :event
  prop on_select, :event, required: true
  prop on_close, :event, required: true

  slot default, required: true

  def render(assigns) do
    ~F"""
    <PopoverV2 show={@show_filter} on_close={@on_close}>
      <#slot />

      <:content>
        <div class="w-80 bg-gohan-100 shadow rounded">
          <div :if={@on_search != nil} class="p-3">
            <Form for={:search} change={@on_search} autocomplete="off">
              <TextInput
                placeholder="Type here..."
                field={:search_text}
                value={@search_text}
                class="border-none bg-goku-100"
              >
                <:left_icon><IconZoom /></:left_icon>
              </TextInput>
            </Form>
          </div>

          <div class={"h-80 pl-2 pr-1 overflow-y-auto no-scrollbar #{is_nil(@on_search) && "pt-4"}"}>
            {#if length(@all_items) > 0}
              <CheckboxMultiselectV2
                values={@selected_items |> Enum.map(& &1.value)}
                options={@all_items}
                on_select={@on_select}
              />
            {#elseif @search_text != "" and length(@all_items) == 0}
              <div class="h-full flex items-center justify-around">
                <div>No results found</div>
              </div>
            {#elseif length(@selected_items) > 0}
              <CheckboxMultiselectV2
                values={@selected_items |> Enum.map(& &1.value)}
                options={@selected_items}
                on_select={@on_select}
              />
            {#else}
              <div class="h-full flex items-center beerus-100 justify-around">
                <div>No filters applied</div>
              </div>
            {/if}
          </div>

          <Divider class="mt-2" />
          <LeftToRight class="justify-between p-2">
            {#if can_clear_filters?(@selected_items)}
              <Button variant="danger" size="xsmall" class="rounded" on_click={@on_clear}>
                Clear
              </Button>
            {#else}
              <Button variant="danger" size="xsmall" class="rounded">
                <span class="text-beerus-100">Clear</span>
              </Button>
            {/if}

            <LeftToRight>
              <Button variant="danger" size="xsmall" class="rounded border-bulma-100" on_click={@on_discard}>
                Discard
              </Button>

              {#if can_apply_filters?(@selected_items, @active_items)}
                <Button variant="primary" size="xsmall" class="rounded" on_click={@on_apply}>
                  &nbspApply&nbsp
                </Button>
              {#else}
                <Button size="xsmall" class="rounded bg-piccolo-100 opacity-30">
                  <span class="text-goten-100">&nbspApply&nbsp</span>
                </Button>
              {/if}
            </LeftToRight>
          </LeftToRight>
        </div>
      </:content>
    </PopoverV2>
    """
  end

  defp can_clear_filters?(selected_items) do
    length(selected_items) > 0
  end

  defp can_apply_filters?([], []), do: false

  defp can_apply_filters?(selected_items, active_items)
       when length(selected_items) != length(active_items),
       do: true

  defp can_apply_filters?(selected_items, active_items) do
    selected_items_sorted = Enum.sort(selected_items, &(&1.value < &2.value))
    active_items_sorted = Enum.sort(active_items, &(&1.value < &2.value))

    selected_items_sorted
    |> Enum.zip(active_items_sorted)
    |> Enum.any?(fn {a, b} -> a.value != b.value end)
  end
end
