defmodule Moon.Design.Form.AuthCode do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "Id attribute for DOM element"
  prop(id, :string)

  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)

  @doc "Additional Tailwind classes"
  prop(class, :css_class)

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
      <#slot {@input} />
    </div>
    """
  end
end
