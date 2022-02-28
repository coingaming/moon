defmodule Moon.Components.Select.MultiSelect.Chips.ChipOption do
  use Moon.StatelessComponent
  alias Moon.Autolayouts.LeftToRight
  alias Moon.Components.Chip
  alias Moon.Icons.ControlsClose
  prop multiple_select_id, :string
  prop option, :any

  def render(assigns) do
    ~F"""
    <span>
      <Chip>
        <LeftToRight>
          <span>{@option.label}</span>
          <span click={"MultiSelect_Unselect('#{@multiple_select_id}', '#{@option.value})'"}><ControlsClose /></span>
        </LeftToRight>
      </Chip>
    </span>
    """
  end
end

defmodule Moon.Components.Select.MultiSelect.Chips do
  use Moon.StatelessComponent
  alias __MODULE__.ChipOption

  prop multiple_select_id, :string
  prop options, :list, default: []
  prop value, :list, default: []
  prop form, :any
  prop field, :atom

  def render(assigns) do
    # {Phoenix.HTML.Form.text_input @form, :permissions}
    ~F"""
    <div class="flex flex-wrap gap-2">
      {#for v <- @value}
        <ChipOption multiple_select_id={@multiple_select_id} option={get_option(@options, v)} />
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

defmodule Moon.Components.Select.MultiSelect do
  @moduledoc false

  use Moon.StatelessComponent
  alias Surface.Components.Form.Input.InputContext
  alias __MODULE__.Chips

  prop id, :string
  prop field, :atom
  prop label, :string
  prop options, :any, default: []
  prop value, :any
  prop prompt, :string
  prop error, :string
  prop rounded, :boolean, default: true
  prop disabled, :boolean
  prop required, :boolean
  prop class, :string

  def render(assigns) do
    ~F"""
    <InputContext assigns={assigns} :let={form: form, field: field}>
      {Phoenix.HTML.Form.multiple_select(form, field, get_formatted_options(@options), class: "w-full", id: @id)}
      <Chips
        multiple_select_id={@id}
        options={@options}
        value={@value || Phoenix.HTML.Form.input_value(form, field)}
        form={form}
        field={field}
      />
    </InputContext>
    """
  end

  def get_formatted_options(options) do
    Enum.map(options, fn option ->
      {option.label, option.value}
    end)
  end
end
