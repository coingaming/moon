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
  prop(disabled, :boolean, from_context: :disabled)
  @doc "Will be got from AuthCode in most cases"
  prop(placeholder, :string, from_context: :placeholder)
  @doc "Will be got from AuthCode in most cases"
  prop(type, :string, from_context: :type)
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
          merge(
            input_classes(assigns) ++
              [
                "h-[72px] w-full max-w-[48px] rounded-moon-i-sm text-moon-24",
                "px-0",
                "focus:ring-0",
                "focus-visible::shadow-input-focus focus-visible::outline-none",
                "moon-error:focus:ring-0 moon-error:text-chichi  ",
                "invalid:text-chichi ",
                "leading-[3.5rem] text-moon-24",
                [
                  "shadow-input focus:shadow-input hover:shadow-input cursor-not-allowed": @disabled
                ],
                @class
              ]
          ),
          "text-center"
        ]}
        maxlength={1}
        {=@type}
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
