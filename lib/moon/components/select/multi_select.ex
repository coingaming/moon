defmodule Moon.Components.Select.MultiSelect.Labels.SelectedLabel do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Autolayouts.LeftToRight
  alias Moon.Components.Label
  alias Moon.Icons.ControlsClose
  alias Phoenix.LiveView.JS

  prop select_id, :string
  prop option, :any
  prop label_text_size_class, :string
  prop label_text_color_class, :string
  prop label_border_radius_class, :string

  def render(assigns) do
    ~F"""
    {#if @option}
      <Label
        class={"#{@label_text_size_class} #{@label_text_color_class}"}
        border_radius_class={@label_border_radius_class}
      >
        <LeftToRight>
          <div>{@option.label}</div>
          <div
            class="cursor-pointer"
            :on-click={JS.dispatch("moon:update-select",
              detail: %{value: @option.value, selected: false},
              to: "##{@select_id}"
            )}
          ><ControlsClose /></div>
        </LeftToRight>
      </Label>
    {/if}
    """
  end
end

defmodule Moon.Components.Select.MultiSelect.Labels do
  @moduledoc false

  use Moon.StatelessComponent
  alias __MODULE__.SelectedLabel

  prop select_id, :string
  prop options, :list, default: []
  prop value, :list, default: []
  prop prompt, :string
  prop prompt_text_size_class, :string
  prop prompt_text_color_class, :string
  prop label_text_size_class, :string
  prop label_text_color_class, :string
  prop label_border_radius_class, :string

  def render(assigns) do
    ~F"""
    <div>
      {#if @value && @value != []}
        <div class={@prompt_text_size_class, @prompt_text_color_class}>
          {@prompt}
        </div>
        {#for v <- @value}
          <SelectedLabel
            {=@select_id}
            option={get_option(@options, v)}
            {=@label_text_size_class}
            {=@label_text_color_class}
            {=@label_border_radius_class}
          />
        {/for}
      {#else}
        <div class={@prompt_text_color_class}>
          {@prompt}
        </div>
      {/if}
    </div>
    """
  end

  def get_option(options, v) do
    Enum.find(options, fn option ->
      "#{option.value}" == "#{v}"
    end)
  end
end

# https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Moon---Components?node-id=22819%3A17501
defmodule Moon.Components.Select.MultiSelect do
  @moduledoc false

  use Moon.StatefulComponent
  alias Moon.Autolayouts.PullAside
  alias Moon.Components.FieldBorder
  alias Moon.Components.Popover
  alias Moon.Components.Select.Dropdown
  alias Moon.Components.Select.Helpers, as: SelectHelpers
  alias Surface.Components.Form.Input.InputContext
  alias __MODULE__.Labels

  prop field, :atom
  prop label, :string
  prop options, :any, default: []
  prop value, :any
  prop prompt, :string
  prop error, :string
  prop disabled, :boolean
  prop required, :boolean
  prop class, :string
  prop popover_placement, :string, default: "bottom-start"
  prop prompt_text_size_class, :string, default: "text-xs"
  prop prompt_text_color_class, :string, default: "text-trunks-100"
  prop label_text_size_class, :string, default: "text-sm"
  prop label_text_color_class, :string, default: "text-bulma-100"
  prop label_border_radius_class, :string

  data open, :boolean, default: false

  slot default

  def render(assigns) do
    ~F"""
    <InputContext assigns={assigns} :let={form: form, field: field}>
      <Popover placement={@popover_placement} show={@open} on_close="close" class="p-4">
        {Phoenix.HTML.Form.multiple_select(form, field, SelectHelpers.get_formatted_options(@options),
          class: "hidden",
          id: @id
        )}
        <FieldBorder click="toggle_open">
          <PullAside class="p-4 align-middle">
            <:left>
              <Labels
                select_id={@id}
                {=@options}
                value={SelectHelpers.get_value(form, field, value: @value)}
                {=@prompt}
                {=@prompt_text_size_class}
                {=@prompt_text_color_class}
                {=@label_text_size_class}
                {=@label_text_color_class}
                {=@label_border_radius_class}
              />
            </:left>
            <:right>
              <Moon.Icons.ControlsChevronDown />
            </:right>
          </PullAside>
        </FieldBorder>
        <:content>
          <Dropdown class="w-auto" id={"#{@id}-dropdown"} select_id={@id} {=@options} is_multi />
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
