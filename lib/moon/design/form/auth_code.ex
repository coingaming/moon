defmodule Moon.Design.Form.AuthCode do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "Id attribute for DOM element"
  prop(id, :string)

  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)

  @doc "Additional Tailwind classes"
  prop(class, :css_class)

  @doc "TBD"
  prop(length, :integer, default: 6)

  @doc "TBD"
  prop(error, :boolean)

  @doc "TBD"
  prop(disabled, :boolean)

  @doc "TBD"
  prop(size, :string, values!: ["sm", "md", "lg", "xl"], default: "lg")

  @doc "TBD"
  prop(placeholder, :string, default: "")

  @doc "TBD"
  prop(form, :form, from_context: {Surface.Components.Form, :form})

  @doc "TBD"
  prop(allowed_characters, :string,
    values!: ["numeric", "alpha", "alphanumeric"],
    default: "alphanumeric"
  )

  @doc "TBD"
  prop(value, :string)

  @doc "Inner content of the component"
  slot(input, required: true)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      phx-hook="Authcode"
      data-has_form={assigns[:form] != nil}
      class={merge([
        "flex flex-row justify-center gap-2",
        @class
      ])}
      data-testid={@testid}
    >
      <#slot
        {@input}
        context_put={
          length: @length,
          error: @error,
          size: @size,
          placeholder: @placeholder,
          allowed_characters: @allowed_characters,
          value: @value,
          disabled: @disabled,
          id: "#{@id}-hidden"
        }
      />
    </div>
    """
  end
end
