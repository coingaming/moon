defmodule Moon.Design.Form.AuthCode.Input do
  @moduledoc false

  use Moon.StatelessComponent, slot: "input"

  import Phoenix.HTML.Form
  import Moon.Helpers.Form

  alias Surface.Components.Form.HiddenInput

  @doc "Id attribute for DOM element"
  prop(id, :string, from_context: :id)

  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)

  @doc "Additional Tailwind classes"
  prop(class, :css_class)

  @doc "Will be got from AuthCode in most cases"
  prop(size, :string, from_context: :size)

  @doc "Will be got from AuthCode in most cases"
  prop(disabled, :boolean, from_context: :disabled)

  @doc "Will be got from AuthCode in most cases"
  prop(placeholder, :string, from_context: :placeholder)

  @doc "Will be got from AuthCode in most cases"
  prop(length, :integer, from_context: :length)

  @doc "Name of the field, usually should be taken from context"
  prop(field, :atom, from_context: {Surface.Components.Form.Field, :field})

  @doc "Form info, usually should be taken from context"
  prop(form, :form, from_context: {Surface.Components.Form, :form})

  @doc "Will be got from AuthCode in most cases"
  prop(error, :boolean, from_context: :error)

  @doc "Will be got from AuthCode in most cases"
  prop(allowed_characters, :string, from_context: :allowed_characters)

  @doc "Will be got from AuthCode in most cases"
  prop(value, :string, from_context: :value)

  def render(assigns) do
    ~F"""
    {#for index <- 0..(@length - 1)}
      <input
        class={[
          merge([
            "h-14 w-[2.875rem] rounded-xl border-0",
            "m-0 py-3 appearance-none text-bulma box-border",
            "shadow-input hover:shadow-input-hov focus:shadow-input-focus focus:outline-none focus:ring-0",
            "focus-visible::shadow-input-focus focus-visible::outline-none",
            "placeholder:text-trunks placeholder:opacity-100 placeholder:transition-opacity placeholder:delay-75",
            "moon-error:focus:ring-0 moon-error:text-chichi moon-error:shadow-input-err moon-error:hover:shadow-input-err moon-error:focus:shadow-input-err",
            "invalid:text-chichi invalid:shadow-input-err invalid:hover:shadow-input-err invalid:focus:shadow-input-err",
            "moon-auth-input",
            [
              "leading-8 text-sm": @size == "sm",
              "leading-10 text-base": @size == "md",
              "leading-12 text-lg": @size == "lg",
              "leading-14 text-xl": @size == "xl",
              "opacity-30 shadow-input focus:shadow-input hover:shadow-input cursor-not-allowed":
                @disabled
            ],
            @class
          ]),
          "text-center"
        ]}
        maxlength={1}
        autocomplete="off"
        placeholder={String.at(@placeholder, index)}
        data-testid={@testid}
        error={@error || has_error(@form, @field)}
        {...input_attributes(@allowed_characters)}
        value={String.at(@value || input_value(@form, @field) || "", index)}
        {=@disabled}
        aria-label={"Character #{index + 1}"}
      />
    {/for}

    <HiddenInput {=@id} value={@value} />
    """
  end

  defp input_attributes("alpha") do
    [type: "text", inputmode: "text", pattern: "[a-zA-Z]{1}"]
  end

  defp input_attributes("alphanumeric") do
    [type: "text", inputmode: "text", pattern: "[a-zA-Z0-9]{1}"]
  end

  defp input_attributes("numeric") do
    [type: "tel", inputmode: "numeric", pattern: "[0-9]{1}", min: "0", max: "9"]
  end
end
