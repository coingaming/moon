defmodule Moon.Components.Select.SingleSelect.Value.SelectedValue do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Autolayouts.LeftToRight
  alias Moon.Icons.ControlsClose
  alias Phoenix.LiveView.JS
  prop select_id, :string
  prop option, :any

  def render(assigns) do
    ~F"""
    {#if @option}
      <span>
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
      </span>
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

  def render(assigns) do
    ~F"""
    <div class="flex flex-wrap gap-2">
      {#if @value}
        <SelectedValue select_id={@select_id} option={get_option(@options, @value)} />
      {#else}
        {@prompt}
      {/if}
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
defmodule Moon.Components.Select.SingleSelect do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.Select.Dropdown
  alias Surface.Components.Form.Input.InputContext
  alias __MODULE__.Value

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
      {Phoenix.HTML.Form.select(form, field, get_formatted_options(@options),
        class: "w-full",
        id: @id
      )}
      {#if @options}
        <Value
          select_id={@id}
          options={@options}
          value={@value || Phoenix.HTML.Form.input_value(form, field)}
          prompt={@prompt}
        />
        <Dropdown
          select_id={@id}
          options={@options}
          value={@value || Phoenix.HTML.Form.input_value(form, field)}
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
