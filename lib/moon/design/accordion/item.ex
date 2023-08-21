defmodule Moon.Design.Accordion.Item do
  @moduledoc false

  use Moon.StatelessComponent, slot: "item"

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Disabling accordion item"
  prop(disabled, :boolean, default: false)
  @doc "Header of Accordion item, see Accordion.Header"
  slot(header, required: true)
  @doc "Content of Accordion item, see Accordion.Content"
  slot(content, required: true)

  # Internal API
  @doc "Will be got from Accordion in most cases"
  prop(value, :string, from_context: :value)
  @doc "Will be got from Accordion in most cases"
  prop(is_open, :boolean, from_context: :is_open)
  @doc "Will be got from Accordion in most cases"
  prop(has_content_outside, :boolean, from_context: :has_content_outside)

  def render(assigns) do
    ~F"""
    <div class={merge(["w-full", @class])} {=@id} data-testid={@testid}>
      <#slot
        {@header}
        context_put={value: @value, disabled: @disabled, is_content_outside: @has_content_outside}
      />
      <#slot {@content} :if={@is_open} context_put={is_content_outside: @has_content_outside} />
    </div>
    """
  end
end
