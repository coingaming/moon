defmodule Moon.Design.Form.AuthCode.Input do
  @moduledoc false

  use Moon.StatelessComponent, slot: "input"

  @doc "Id attribute for DOM element"
  prop(id, :string)

  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)

  @doc "Additional Tailwind classes"
  prop(class, :css_class)

  @doc "TBD"
  prop(size, :string, values!: ["sm", "md", "lg", "xl"], default: "lg")

  @doc "TBD"
  prop(disabled, :boolean)

  @doc "TBD"
  prop(type, :string,
    values: [
      "number",
      "text"
    ],
    default: "text"
  )

  @doc "TBD"
  prop(placeholder, :string, default: "")

  @doc "TBD"
  prop(code_length, :integer, default: 6)

  @doc "Inner content of the component"
  slot(default, required: true)

  @doc "TBD"
  prop(field, :atom, from_context: {Surface.Components.Form.Field, :field})

  @doc "TBD"
  prop(form, :form, from_context: {Surface.Components.Form, :form})

  @doc "TBD"
  prop(error, :boolean, from_context: :error)

  def render(assigns) do

    ~F"""
    {#for _ <- 1..@code_length}
    <input
      class={merge([
        "h-14 w-[2.875rem] rounded-xl border-0",
        "m-0 py-3 px-4 appearance-none text-bulma box-border text-center",
        "shadow-input hover:shadow-input-hov focus:shadow-input-focus focus:outline-none",
        "focus-visible::shadow-input-focus focus-visible::outline-none",
        "invalid:text-chichi invalid:shadow-input-err invalid:hover:shadow-input-err invalid:focus:shadow-input-err",
        [
          "leading-8 text-sm": @size == "sm",
          "leading-10 text-base": @size == "md",
          "leading-12 text-lg": @size == "lg",
          "leading-14 text-xl": @size == "xl",
          "opacity-30 shadow-input focus:shadow-input hover:shadow-input cursor-not-allowed": @disabled
        ],
        @class
      ])}
      {=@type}
      {=@placeholder}
      data-testid={@testid}
    />
    {/for}
    """
  end

  # value={input_value(@form, @field)}
  # id={@id || input_id(@form, @field)}
  # error={@error || has_error(@form, @field)}
end
