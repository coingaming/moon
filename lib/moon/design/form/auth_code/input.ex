defmodule Moon.Design.Form.AuthCode.Input do
  @moduledoc false

  use Moon.StatelessComponent, slot: "input"

  import Phoenix.HTML.Form
  import Moon.Helpers.Form

  @doc "Id attribute for DOM element"
  prop(id, :string)

  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)

  @doc "Additional Tailwind classes"
  prop(class, :css_class)

  @doc "TBD"
  prop(size, :string, from_context: :string)

  @doc "TBD"
  prop(disabled, :boolean)

  @doc "TBD"
  prop(placeholder, :string, default: "")

  @doc "TBD"
  prop(length, :integer, from_context: :length)

  @doc "TBD"
  prop(field, :atom, from_context: {Surface.Components.Form.Field, :field})

  @doc "TBD"
  prop(form, :form, from_context: {Surface.Components.Form, :form})

  @doc "TBD"
  prop(error, :boolean, from_context: :error)

  @doc "TBD"
  prop(allowed_characters, :string,
    values!: ["numeric", "alpha", "alphanumeric"],
    default: "alphanumeric"
  )

  def render(assigns) do
    ~F"""
    {#for _ <- 1..@length}
      <input
        class={merge([
          "h-14 w-[2.875rem] rounded-xl border-0",
          "m-0 py-3 px-4 appearance-none text-bulma box-border text-center",
          "shadow-input hover:shadow-input-hov focus:shadow-input-focus focus:outline-none focus:ring-0",
          "focus-visible::shadow-input-focus focus-visible::outline-none",
          "moon-error:focus:ring-0 moon-error:text-chichi moon-error:shadow-input-err moon-error:hover:shadow-input-err moon-error:focus:shadow-input-err",
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
        {=@placeholder}
        data-testid={@testid}
        error={@error || has_error(@form, @field)}
        {...input_attributes(@allowed_characters)}
        value={input_value(@form, @field)}
        id={@id || input_id(@form, @field)}
      />
    {/for}
    """
  end

  defp input_attributes("alpha") do
    [type: "text", inputmode: "text", pattern: "[\\w]{1}"]
  end

  defp input_attributes("alphanumeric") do
    [type: "text", inputmode: "text", pattern: "[\\w\\d]{1}"]
  end

  defp input_attributes("numeric") do
    [type: "tel", inputmode: "numeric", pattern: "[0-9]{1}", min: "0", max: "9"]
  end
end
