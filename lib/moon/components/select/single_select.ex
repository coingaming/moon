defmodule Moon.Components.Select.SelectedValue.Container do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.Label
  alias Moon.Components.Select.Helpers, as: SelectHelpers
  alias Moon.Components.Select.Dropdown.Icon

  prop option, :any
  prop label, :string
  prop size, :string
  prop is_icon, :boolean, default: false
  prop is_label, :boolean, default: false
  prop selected_label_background_color_class, :css_class
  prop selected_label_text_color_class, :css_class

  def render(assigns) do
    is_inner_label = assigns.is_label and assigns.size in ~w(large xlarge)

    ~F"""
    {#if is_inner_label or @is_icon}
      <div
        class={"grid grid-rows-1": @is_icon}
        style={get_style("grid-auto-flow": if(@is_icon, do: "column"))}
      >
        {#if @is_icon}
          <Icon
            class="grid place-content-center pr-2"
            icon={@option[:left_icon]}
            style="grid-row: span 3 / span 3;"
          />
        {/if}
        {#if is_inner_label}
          <div
            class={
              "text-trunks-100",
              SelectHelpers.innerlabel_font_class(@size)
            }
            style={get_style("grid-col": if(@is_icon, do: "span 2 / span 2"))}
          >
            {@label}
          </div>
        {/if}
        <div style={get_style(
          "grid-col": if(@is_icon, do: "span 2 / span 2"),
          "grid-row": if(@is_icon, do: "span 2 / span 2")
        )}>
          <Label
            class={SelectHelpers.label_font_class(@size)}
            background_color={@selected_label_background_color_class}
            color={@selected_label_text_color_class}
          >
            {@option.label}
          </Label>
        </div>
      </div>
    {#else}
      <Label
        class={SelectHelpers.label_font_class(@size)}
        background_color={@selected_label_background_color_class}
        color={@selected_label_text_color_class}
      >
        {@option.label}
      </Label>
    {/if}
    """
  end
end

defmodule Moon.Components.Select.SingleSelect.Value.SelectedValue do
  @moduledoc false

  use Moon.StatelessComponent

  alias Phoenix.LiveView.JS

  prop select_id, :string
  prop option, :any
  prop label, :string
  prop size, :string
  prop selected_label_background_color_class, :css_class
  prop selected_label_text_color_class, :css_class

  def render(assigns) do
    is_icon = not is_nil(assigns.option[:left_icon])
    is_label = not is_nil(assigns.label)

    ~F"""
    {#if @option}
      <div
        class="cursor-pointer"
        :on-click={JS.dispatch("moon:update-select",
          detail: %{value: @option.value, selected: false},
          to: "##{@select_id}"
        )}
      >
        <Moon.Components.Select.SelectedValue.Container
          {=@option}
          {=@size}
          {=@label}
          {=@selected_label_background_color_class}
          {=@selected_label_text_color_class}
          {=is_icon}
          {=is_label}
        />
      </div>
    {/if}
    """
  end
end

defmodule Moon.Components.Select.SingleSelect.Value do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.Select.Helpers, as: SelectHelpers
  alias __MODULE__.SelectedValue

  prop select_id, :string
  prop class, :any
  prop options, :any
  prop value, :any
  prop label, :string
  prop size, :string
  prop selected_label_background_color_class, :css_class
  prop selected_label_text_color_class, :css_class

  def render(assigns) do
    ~F"""
    {#if @value && @value != ""}
      <SelectedValue
        {=@select_id}
        option={SelectHelpers.get_option(@options, @value)}
        {=@size}
        {=@label}
        {=@selected_label_background_color_class}
        {=@selected_label_text_color_class}
      />
    {#elseif @size in ~w(large xlarge)}
      <div class={
        "text-trunks-100",
        SelectHelpers.label_font_class(@size)
      }>
        {@label}
      </div>
    {#else}
    {/if}
    """
  end
end

# https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Moon---Components?node-id=22819%3A17501
defmodule Moon.Components.Select.SingleSelect do
  @moduledoc false

  use Moon.StatefulComponent

  alias Moon.Autolayouts.PullAside
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.FieldBorder
  alias Moon.Components.FieldLabel
  alias Moon.Components.Popover
  alias Moon.Components.Select.Dropdown
  alias Moon.Components.Select.Helpers, as: SelectHelpers
  alias __MODULE__.Value
  alias Surface.Components.Form.Input.InputContext

  prop field, :atom
  prop label, :string
  prop options, :any, default: []
  prop value, :any
  prop error, :string
  prop disabled, :boolean, default: false
  prop required, :boolean
  prop class, :string
  prop size, :string, values: ~w(small medium large xlarge), default: "medium"
  prop popover_placement, :string, default: "bottom-start"
  prop popover_class, :string
  prop field_border_class, :string, default: FieldBorder.get_default_states_class()
  prop field_border_color_class, :string
  prop selected_label_background_color_class, :css_class
  prop selected_label_text_color_class, :css_class, default: "text-bulma-100"

  data open, :boolean, default: false

  slot default

  def render(assigns) do
    ~F"""
    {#if @size not in ~w(large xlarge)}
      <FieldLabel class={
        "text-trunks-100",
        SelectHelpers.label_font_class(@size)
      }>
        {@label}
      </FieldLabel>
    {/if}
    <InputContext {=assigns} :let={form: form, field: field}>
      <Popover placement={@popover_placement} show={@open} on_close="close" class={@popover_class}>
        {Phoenix.HTML.Form.select(
          form,
          field,
          SelectHelpers.get_formatted_options(
            @options,
            SelectHelpers.get_normalized_value(form, field, false, value: @value)
          ),
          class: "hidden",
          id: @id,
          prompt: @label
        )}
        <FieldBorder
          states_class={if @disabled, do: FieldBorder.get_default_class(), else: @field_border_class}
          border_color_class={if @open,
            do: SelectHelpers.get_active_border_color(@field_border_class),
            else: @field_border_color_class}
          click="toggle_open"
        >
          <PullAside class={"px-4", SelectHelpers.get_padding(@size), get_disabled_class(@disabled)}>
            <:left>
              <Value
                select_id={@id}
                value={SelectHelpers.get_normalized_value(form, field, false, value: @value)}
                {=@options}
                {=@label}
                {=@size}
                {=@selected_label_background_color_class}
                {=@selected_label_text_color_class}
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
              <Dropdown id={"#{@id}-dropdown"} select_id={@id} {=@options} disabled={@disabled} />
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
    if socket.assigns.disabled == false do
      {:noreply, assign(socket, open: !socket.assigns.open)}
    else
      {:noreply, socket}
    end
  end

  defp get_disabled_class(disabled) do
    if disabled do
      "opacity-30 cursor-not-allowed"
    end
  end
end
