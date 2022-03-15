defmodule Moon.Components.Select.MultiSelect.Labels.SelectedLabel do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Autolayouts.LeftToRight
  alias Moon.Components.Label
  alias Moon.Icons.ControlsClose
  alias Phoenix.LiveView.JS
  prop select_id, :string
  prop option, :any

  def render(assigns) do
    ~F"""
    {#if @option}
      <Label>
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

  def render(assigns) do
    ~F"""
    <div>
      {#if @value && @value != []}
        {#for v <- @value}
          <SelectedLabel select_id={@select_id} option={get_option(@options, v)} />
        {/for}
      {#else}
        {@prompt}
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

  use Moon.StatelessComponent
  alias Moon.Autolayouts.PullAside
  alias Moon.Components.FieldBorder
  alias Moon.Components.Select.Dropdown
  alias Surface.Components.Form.Input.InputContext
  alias __MODULE__.Labels

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
    <div class="relative">
      <InputContext assigns={assigns} :let={form: form, field: field}>
        {Phoenix.HTML.Form.multiple_select(form, field, get_formatted_options(@options),
          class: "hidden",
          id: @id
        )}
        {#if @options}
          <FieldBorder click={Dropdown.toggle_open("#{@id}-dropdown")}>
            <PullAside class="align-middle">
              <:left>
                <Labels
                  select_id={@id}
                  options={@options}
                  value={get_value(form, field, value: @value)}
                  prompt={@prompt}
                />
              </:left>
              <:right>
                <Moon.Icons.ControlsChevronDown />
              </:right>
            </PullAside>
          </FieldBorder>
          <Dropdown
            class="w-auto absolute hidden max-h-screen overflow-y-auto"
            select_id={@id}
            options={@options}
            value={get_value(form, field, value: @value)}
            is_multi
          />
        {/if}
      </InputContext>
    </div>
    """
  end

  def get_formatted_options(options) do
    Enum.map(options, fn option ->
      {option.label, option.value}
    end)
  end

  # this is copy-paste and a bit modified from: https://github.com/phoenixframework/phoenix_html/blob/v3.2.0/lib/phoenix_html/form.ex#L1272
  def get_value(form, field, opts) do
    {value, _opts} = Keyword.pop(opts, :value)

    if value != nil do
      value
    else
      param = "#{field}"

      case form do
        %{params: %{^param => sent}} ->
          sent

        _ ->
          Phoenix.HTML.Form.input_value(form, field)
      end
    end
  end
end
