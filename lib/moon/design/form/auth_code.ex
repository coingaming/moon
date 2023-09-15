defmodule Moon.Design.Form.AuthCode do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Number of inputs for inserting single values"
  prop(length, :integer, default: 6)
  @doc "Puts element in error state"
  prop(error, :boolean)
  @doc "If true, disables whole AuthCode component"
  prop(disabled, :boolean)
  @doc "Default placeholder for input elements"
  prop(placeholder, :string, default: " ")
  @doc "Form info, usually should be taken from context"
  prop(form, :form, from_context: {Surface.Components.Form, :form})
  @doc "Specifies the type of input characters"
  prop(allowed_characters, :string,
    values!: ["numeric", "alpha", "alphanumeric"],
    default: "alphanumeric"
  )

  @doc "HTML5 type of the input"
  prop(type, :string,
    values!: [
      "password",
      "text"
    ],
    default: "text"
  )

  @doc "Value of input field(s)"
  prop(value, :string)
  @doc "Input fields of AuthCode component"
  slot(input, required: true)
  @doc "Hint message of AuthCode component"
  slot(hint)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      phx-hook="Authcode"
      data-has_form={assigns[:form] != nil}
      class={merge([
        "flex gap-2",
        @class
      ])}
      data-testid={@testid}
    >
      <#slot
        {@input}
        context_put={
          length: @length,
          error: @error,
          placeholder: @placeholder,
          allowed_characters: @allowed_characters,
          type: @type,
          value: @value,
          disabled: @disabled,
          id: "#{@id}-hidden"
        }
      />
    </div>
    <#slot {@hint} />
    """
  end
end
