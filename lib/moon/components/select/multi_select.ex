defmodule Moon.Components.Select.MultiSelect.Labels.SelectedLabel do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.Label
  alias Moon.Components.Select.Helpers, as: SelectHelpers
  alias Moon.Icons.ControlsClose
  alias Phoenix.LiveView.JS

  prop select_id, :string
  prop option, :any
  prop size, :string
  prop background_color_class, :string, default: "hit-100"

  def render(assigns) do
    ~F"""
    {#if @option}
      <Label
        class={SelectHelpers.innerlabel_font_class(@size)}
        background_color={@background_color_class}
        color="text-trunks-100"
      >
        {@option.label}
        <:right_icon>
          <div
            class="cursor-pointer"
            :on-click={JS.dispatch("moon:update-select",
              detail: %{value: @option.value, selected: false},
              to: "##{@select_id}"
            )}
          ><ControlsClose /></div>
        </:right_icon>
      </Label>
    {/if}
    """
  end
end

defmodule Moon.Components.Select.MultiSelect.Labels do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.Select.Helpers, as: SelectHelpers
  alias __MODULE__.SelectedLabel

  prop select_id, :string
  prop options, :list, default: []
  prop value, :list, default: []
  prop size, :string
  prop prompt, :string

  def render(assigns) do
    ~F"""
    {#if @value && @value != []}
      <div
        class={"gap-1", "grid grid-cols-1": @prompt}
        style={get_style("grid-auto-flow": if(@prompt, do: "row"))}
      >
        {#if @prompt}
          <div
            class={
              "text-trunks-100",
              SelectHelpers.innerlabel_font_class(@size)
            }
            style="grid-col: span 2 / span 2;"
          >
            {@prompt}
          </div>
        {/if}
        <div
          class="flex justify-start gap-1"
          style={get_style("grid-col": if(@prompt, do: "span 2 / span 2"))}
        >
          {#for v <- @value}
            <SelectedLabel {=@select_id} {=@size} option={SelectHelpers.get_option(@options, v)} />
          {/for}
        </div>
      </div>
    {#else}
      <div class={
        "text-trunks-100",
        SelectHelpers.prompt_font_class(@size)
      }>
        {@prompt}
      </div>
    {/if}
    """
  end
end

# https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Moon---Components?node-id=22819%3A17501
defmodule Moon.Components.Select.MultiSelect do
  @moduledoc false

  use Moon.StatefulComponent

  alias Moon.Autolayouts.PullAside
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.FieldBorder
  alias Moon.Components.Popover
  alias Moon.Components.Select.Dropdown
  alias Moon.Components.Select.Helpers, as: SelectHelpers
  alias __MODULE__.Labels
  alias Surface.Components.Form.Input.InputContext

  prop field, :atom
  prop label, :string
  prop options, :any, default: []
  prop value, :any
  prop prompt, :string
  prop error, :string
  prop disabled, :boolean
  prop required, :boolean
  prop class, :string
  prop size, :string, values: ~w(small medium large xlarge), default: "medium"
  prop popover_placement, :string, default: "bottom-start"
  prop popover_class, :string
  prop field_border_class, :string, default: FieldBorder.get_default_states_class()
  prop field_border_color_class, :string

  data open, :boolean, default: false

  slot default

  def render(assigns) do
    ~F"""
    <InputContext {=assigns} :let={form: form, field: field}>
      <Popover placement={@popover_placement} show={@open} on_close="close" class={@popover_class}>
        {Phoenix.HTML.Form.multiple_select(form, field, SelectHelpers.get_formatted_options(@options),
          class: "hidden",
          id: @id
        )}
        <FieldBorder
          states_class={@field_border_class}
          border_color_class={if @open,
            do: SelectHelpers.get_active_border_color(@field_border_class),
            else: @field_border_color_class}
          click="toggle_open"
        >
          <PullAside class={"px-4", SelectHelpers.get_padding(@size)}>
            <:left>
              <Labels
                select_id={@id}
                value={SelectHelpers.get_value(form, field, value: @value)}
                {=@options}
                {=@prompt}
                {=@size}
              />
            </:left>
            <:right>
              <Moon.Icons.ControlsChevronDown />
            </:right>
          </PullAside>
        </FieldBorder>
        <:content>
          <TopToDown class="rounded bg-gohan-100 min-w-[20px]">
            <div
              class="overflow-y-scroll rounded box-border border border-solid border-beerus-100"
              style="min-height: 20px; max-height: 200px"
            >
              <Dropdown class="w-auto" id={"#{@id}-dropdown"} select_id={@id} {=@options} is_multi />
            </div>
          </TopToDown>
        </:content>
      </Popover>
    </InputContext>
    """
  end

  def handle_event("close", _params, socket) do
    socket = assign(socket, open: false)
    {:noreply, socket}
  end

  def handle_event("toggle_open", _params, socket) do
    socket = assign(socket, open: !socket.assigns.open)
    {:noreply, socket}
  end
end
