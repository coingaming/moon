defmodule MoonWeb.Pages.ExamplePages.AffiliatesPage.Components.MultiFilterPopover do
  use MoonWeb, :stateless_component

  alias Moon.Components.PopoverV2
  alias Moon.Components.CheckboxMultiselectV2
  alias Moon.Components.Form
  alias Moon.Components.TextInput
  alias Moon.Components.Button
  alias Moon.Components.Divider
  alias Moon.Autolayouts.LeftToRight

  prop show_filter, :boolean, required: true
  prop search_text, :string, required: true
  prop all_items, :list, required: true
  prop selected_items, :list, required: true

  prop on_apply, :event, required: true
  prop on_toggle, :event, required: true
  prop on_clear, :event, required: true
  prop on_search, :event, required: true
  prop on_select, :event, required: true

  slot default, required: true

  def render(assigns) do
    ~F"""
    <PopoverV2 show={@show_filter}>
      <#slot/>

      <:content>
        <div class="w-80 bg-gohan-100 shadow rounded">
          <Form for={:search} change={@on_search} autocomplete="off">
            <TextInput
              right_icon="icon_zoom"
              placeholder="Search..."
              field={:search_text}
              value={@search_text}
              class="border-none"
            />
          </Form>

          <Divider/>
          <div class="h-64 overflow-y-auto no-scrollbar">
            {#if @search_text != "" and length(@all_items) > 0}
              <CheckboxMultiselectV2
                values={@selected_items |> Enum.map(&(&1.value))}
                options={@all_items}
                on_select={@on_select}
              />

            {#elseif @search_text != "" and length(@all_items) == 0}
              <div class="h-full flex items-center justify-around">
                <div>No results found</div>
              </div>

            {#elseif length(@selected_items) > 0}
              <CheckboxMultiselectV2
                values={@selected_items |> Enum.map(&(&1.value))}
                options={@selected_items}
                on_select={@on_select}
              />

            {#else}
              <div class="h-full flex items-center justify-around">
                <div>No filters applied</div>
              </div>

            {/if}
          </div>
          <Divider/>

          <LeftToRight class="justify-between p-2">
            <Button variant="danger" size="xsmall" class="rounded" on_click={@on_clear}>
              Clear
            </Button>

            <LeftToRight>
              <Button variant="danger" size="xsmall" class="rounded border-beerus-100" on_click={@on_toggle}>
                Discard
              </Button>
              <Button variant="primary" size="xsmall" class="rounded" on_click={@on_apply}>
                Apply
              </Button>
            </LeftToRight>
          </LeftToRight>
        </div>
      </:content>
    </PopoverV2>
    """
  end
end
