defmodule Moon.Design.Form.Field.Label do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "Id attribute for HTML tag"
  prop(id, :string)
  @doc "Data-testid attribute for HTML tag"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Additional attributes"
  prop(attrs, :map, default: %{})

  @doc "Name of the field, usually should be taken from context"
  prop(field, :atom, from_context: {Surface.Components.Form.Field, :field})
  @doc "Form info, usually should be taken from context"
  prop(form, :form, from_context: {Surface.Components.Form, :form})
  @doc "Atom or changeset to inform the form data"
  prop(for, :string)
  @doc "Common moon size property"
  prop(size, :string, values!: ~w(sm md lg xl), default: "md")
  @doc "Label for input field"
  prop(title, :string)
  @doc "Whether label has disabled state"
  prop(disabled, :boolean, default: false)
  @doc "Whether label is on side of input field"
  prop(is_horizontal, :boolean, from_context: :is_horizontal)

  @doc "On click event for the label"
  prop(on_click, :event)
  @doc "Value of the input"
  prop(value, :string)
  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <label
      for={@for || (@form && @field && Phoenix.HTML.Form.input_id(@form, @field))}
      {=@id}
      data-testid={@testid}
      :on-click={@on_click}
      phx-value-value={@value}
      class={merge([
        [
          "flex gap-2 cursor-pointer whitespace-nowrap pb-2 items-center leading-normal",
          (@size == "sm" && "text-moon-14") || "text-moon-16",
          "text-bulma opacity-60 cursor-not-allowed": @disabled,
          "font-medium pb-0 align-center": @is_horizontal
        ],
        @class
      ])}
      {@attrs}
    >
      <#slot>{@title}</#slot>
    </label>
    """
  end
end
