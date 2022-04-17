defmodule Moon.Components.Radiobutton do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.FieldLabel
  alias Surface.Components.Form.RadioButton

  prop id, :string
  prop field, :atom
  prop click, :event
  prop checked, :boolean, default: false
  prop disabled, :boolean
  prop class, :string
  prop value, :string
  slot default

  def is_true(val) do
    Enum.member?([true, "true"], val)
  end

  def render(assigns) do
    ~F"""
    <label class={"flex flex-row items-center cursor-pointer", @class}>
      <RadioButton
        field={@field}
        click={@click}
        class="hide-visually radio-button disabled:opacity-[35]"
        value={@value}
        opts={
          disabled: @disabled
        }
      />
      <span class={
        "radio-button-icon text-trunks-100 hover:hover-piccolo flex items-center
                                                                justify-center circular w-6 h-6 min-w-[24px] min-h-[24px] relative mr-1 z-2
                                                                transition-[background-color] duration-[400ms]",
        get_before_pseudo_styles(),
        get_after_pseudo_styles(),
        "opacity-[.35] cursor-not-allowed": @disabled,
        "hover:brighten-[143] hover:bg-piccolo-100": @checked
      } />
      <FieldLabel
        field={@field}
        class={"bg-rochi-100 pl-2", "opacity-[.35] cursor-not-allowed": @disabled}
      ><#slot /></FieldLabel>
    </label>
    """
  end

  defp get_before_pseudo_styles() do
    "before:content-[''] before:bg-piccolo-100 before:h-2 before:w-2 before:absolute
    before:top-1/2 before:left-1/2 before:circular before:z-[2]
    before:-translate-x-1/2 before:-translate-y-1/2 before:scale-0
    before:transition-all duration-300"
  end

  defp get_after_pseudo_styles() do
    "after:content-[''] after:h-4 after:w-4 after:bg-transparent after:absolute
    after:top-1/2 after:left-1/2 after:circular
    after:-translate-x-1/2 after:-translate-y-1/2
    after:transition-[border-color] after:ease-in-out after:duration-200"
  end
end
