defmodule Moon.Design.Accordion.Item do
  @moduledoc false

  use Moon.StatelessComponent, slot: "item"

  prop(id, :string)
  prop(testid, :string)
  prop(class, :css_class)

  prop(value, :string, from_context: :value)
  prop(is_open, :boolean, from_context: :is_open)
  prop(disabled, :boolean, default: false)
  prop(has_content_outside, :boolean, from_context: :has_content_outside)

  slot(header, required: true)
  slot(content, required: true)

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
