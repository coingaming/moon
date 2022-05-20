defmodule Moon.Components.Select.SingleSelect.Value.SelectedValue do
  @moduledoc false

  use Moon.StatelessComponent
  alias Phoenix.LiveView.JS
  alias Moon.Icon

  prop select_id, :string
  prop option, :any
  prop prompt, :string
  prop mode, :string
  prop icon_class, :string
  prop prompt_text_size_class, :string
  prop prompt_text_color_class, :string
  prop label_text_size_class, :string
  prop label_text_color_class, :string
  prop flaged, :boolean

  def render(assigns) do
    ~F"""
    {#if @option}
      <div>
        {#case @mode}
          {#match "icon"}
            <div class="relative top-2 flex items-center">
              {#if @flaged}
                <Icon class={@icon_class} name={@option.icon} />
              {#else}
                <span class={"flag-icon #{@option.icon} flag-icon-squared rounded-md"} />
              {/if}
            </div>
          {#match "single"}
        {/case}
        <div class={@prompt_text_size_class, @prompt_text_color_class, "relative left-6 bottom-4": @mode == "icon"}>
          {@prompt}
        </div>
        <div class={@label_text_size_class, @label_text_color_class, "relative left-6 bottom-4": @mode == "icon"}>
          {@option.label}
        </div>
        <div
          class="cursor-pointer"
          :on-click={JS.dispatch("moon:update-select",
            detail: %{value: @option.value, selected: false},
            to: "##{@select_id}"
          )}
        />
      </div>
    {/if}
    """
  end
end

defmodule Moon.Components.Select.SingleSelect.Value do
  @moduledoc false

  use Moon.StatelessComponent
  alias __MODULE__.SelectedValue

  prop select_id, :string
  prop options, :list, default: []
  prop value, :any
  prop prompt, :string
  prop mode, :string
  prop icon_class, :string
  prop prompt_text_size_class, :string
  prop prompt_text_color_class, :string
  prop label_text_size_class, :string
  prop label_text_color_class, :string
  prop flaged, :boolean

  def render(assigns) do
    ~F"""
    <div class="flex flex-wrap gap-2">
      {#if @value && @value != ""}
        <SelectedValue
          {=@select_id}
          option={get_option(@options, @value)}
          {=@mode}
          {=@icon_class}
          {=@prompt}
          {=@prompt_text_size_class}
          {=@prompt_text_color_class}
          {=@label_text_size_class}
          {=@label_text_color_class}
          {=@flaged}
        />
      {#else}
        <div class={@prompt_text_color_class}>
          {@prompt}
        </div>
      {/if}
    </div>
    """
  end

  def get_option(options, v) do
    Enum.find(options, fn option -> "#{option.value}" == "#{v}" end)
  end
end

# https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Moon---Components?node-id=22819%3A17501
defmodule Moon.Components.Select.SingleSelect do
  @moduledoc false

  use Moon.StatefulComponent
  alias Moon.Autolayouts.PullAside
  alias Moon.Components.FieldBorder
  alias Moon.Components.Popover
  alias Moon.Components.Select.Dropdown
  alias Moon.Components.Select.Helpers, as: SelectHelpers
  alias Surface.Components.Form.Input.InputContext
  alias __MODULE__.Value

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
  prop mode, :string, default: "single"
  prop icon_class, :string, default: ""
  prop prompt_text_size_class, :string, default: "text-moon-12"
  prop prompt_text_color_class, :string, default: "text-trunks-100"
  prop label_text_size_class, :string, default: "text-moon-14"
  prop label_text_color_class, :string, default: "text-bulma-100"
  prop popover_class, :string, default: "pt-2"
  prop flaged, :boolean, default: false

  data open, :boolean, default: false

  slot default

  def render(assigns) do
    ~F"""
    <InputContext {=assigns} :let={form: form, field: field}>
      <Popover placement={@popover_placement} show={@open} on_close="close" class={@popover_class}>
        {Phoenix.HTML.Form.select(form, field, SelectHelpers.get_formatted_options(@options),
          class: "w-full hidden",
          id: @id,
          prompt: [key: ""]
        )}
        <FieldBorder click="toggle_open">
          <PullAside class="p-4 align-middle">
            <:left>
              <Value
                select_id={@id}
                {=@options}
                value={SelectHelpers.get_normalized_value(form, field, false, value: @value)}
                {=@mode}
                {=@icon_class}
                {=@prompt}
                {=@prompt_text_size_class}
                {=@prompt_text_color_class}
                {=@label_text_size_class}
                {=@label_text_color_class}
                {=@flaged}
              />
            </:left>
            <:right>
              <Moon.Icons.ControlsChevronDown />
            </:right>
          </PullAside>
        </FieldBorder>
        <:content>
          <Dropdown class="w-auto" id={"#{@id}-dropdown"} select_id={@id} {=@options} />
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
