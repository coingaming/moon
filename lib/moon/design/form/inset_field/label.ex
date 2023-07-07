defmodule Moon.Design.Form.InsetField.Label do
  @moduledoc false

  use Moon.StatelessComponent

  prop(id, :string)
  prop(testid, :string)
  prop(class, :css_class)
  prop(attrs, :map, default: %{})

  prop(field, :atom)
  prop(form, :any)
  prop(for, :string)
  prop(title, :string)
  prop(disabled, :boolean, from_context: :disabled)

  prop(on_click, :event)
  prop(value, :string)

  slot(default)

  def render(assigns) do
    ~F"""
    <Surface.Components.Form.Label
      {=@field}
      {=@form}
      class={[
        merge([
          [
            "absolute leading-3 text-trunks top-3 z-[1] transition-all ease-in-out duration-200 rtl:right-4 ltr:left-4",
            "text-bulma opacity-60 cursor-not-allowed": @disabled
          ],
          @class
        ]),
        "text-[0.75rem]"
      ]}
      opts={Map.merge(
        %{
          for: @for,
          id: @id,
          "data-testid": @testid,
          "phx-click": @on_click,
          "phx-value-value": @value
        },
        @attrs
      )}
    >
      <#slot>{@title}</#slot>
    </Surface.Components.Form.Label>
    """
  end
end
