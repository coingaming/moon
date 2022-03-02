defmodule Moon.Components.Select.MultiSelect.Chips.SelectedChip do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Autolayouts.LeftToRight
  alias Moon.Components.Chip
  alias Moon.Icons.ControlsClose
  alias Phoenix.LiveView.JS
  prop select_id, :string
  prop option, :any

  def render(assigns) do
    ~F"""
    {#if @option}
      <span>
        <Chip active>
          <LeftToRight>
            <span>{@option.label}</span>
            <span
              class="cursor-pointer"
              :on-click={JS.dispatch("moon:update-select",
                detail: %{value: @option.value, selected: false},
                to: "##{@select_id}"
              )}
            ><ControlsClose /></span>
          </LeftToRight>
        </Chip>
      </span>
    {/if}
    """
  end
end

defmodule Moon.Components.Select.MultiSelect.Chips do
  @moduledoc false

  use Moon.StatelessComponent
  alias __MODULE__.SelectedChip

  prop select_id, :string
  prop options, :list, default: []
  prop value, :list, default: []

  def render(assigns) do
    ~F"""
    <div class="flex flex-wrap gap-2">
      {#for v <- @value}
        <SelectedChip select_id={@select_id} option={get_option(@options, v)} />
      {/for}
    </div>
    """
  end

  def get_option(options, v) do
    Enum.find(options, fn option ->
      option.value == v
    end)
  end
end

# https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Moon---Components?node-id=22819%3A17501
defmodule Moon.Components.Select.MultiSelect do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Autolayouts.PullAside
  alias Moon.Components.FieldBorder
  alias Moon.Components.Select.Dropdown
  alias Surface.Components.Form.Input.InputContext
  alias Phoenix.LiveView.JS
  alias __MODULE__.Chips

  prop id, :string
  prop field, :atom
  prop label, :string
  prop options, :any, default: []
  prop value, :any
  prop prompt, :string
  prop error, :string
  prop disabled, :boolean
  prop required, :boolean
  prop class, :string

  slot default

  def render(assigns) do
    ~F"""
    <InputContext assigns={assigns} :let={form: form, field: field}>
      {Phoenix.HTML.Form.multiple_select(form, field, get_formatted_options(@options),
        class: "w-full hidden",
        id: @id
      )}
      {#if @options}
        <FieldBorder click={JS.dispatch("moon:toggle-dropdown",
          detail: %{select_id: @id},
          to: "##{@id}"
        )}>
          <PullAside class="align-middle">
            <:left>
              <Chips
                select_id={@id}
                options={@options}
                value={@value || Phoenix.HTML.Form.input_value(form, field)}
              />
            </:left>
            <:right>
              <Moon.Icons.ControlsChevronDown />
            </:right>
          </PullAside>
        </FieldBorder>
        <Dropdown
          class="hidden"
          select_id={@id}
          options={@options}
          value={@value || Phoenix.HTML.Form.input_value(form, field)}
          is_multi
        />
      {/if}
    </InputContext>
    """
  end

  def get_formatted_options(options) do
    Enum.map(options, fn option ->
      {option.label, option.value}
    end)
  end
end
