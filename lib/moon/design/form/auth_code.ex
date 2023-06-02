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
  prop(type, :string,
    values: [
      "number",
      "text"
    ]
  )

  @doc "TBD"
  prop(size, :string, values!: ["sm", "md", "lg", "xl"], default: "lg")

  @doc "Inner content of the component"
  slot(input, required: true)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
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
          type: @type,
          size: @size
        }
      />
    </div>
    """
  end
end
