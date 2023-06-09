defmodule Moon.Design.Form.Input do
  @moduledoc false

  use Moon.StatelessComponent

  import Phoenix.HTML.Form
  import Moon.Helpers.Form

  @doc "Name of the field, usually should be taken from context"
  prop(field, :atom, from_context: {Surface.Components.Form.Field, :field})
  @doc "Form info, usually should be taken from context"
  prop(form, :form, from_context: {Surface.Components.Form, :form})
  @doc "Common moon size property"
  prop(size, :string, values!: ["sm", "md", "lg"], default: "md")

  @doc "Some additional styling will be set to indicate the field is invalid. Generally should be set by Form.Field component"
  prop(error, :boolean, from_context: :error)
  @doc "HTML5 type of the input, please don't use checkbox or radio here"
  prop(type, :string,
    values!: [
      "date",
      "datetime-local",
      "email",
      "number",
      "password",
      "search",
      "tel",
      "text",
      "time",
      "url"
    ],
    default: "text"
  )

  @doc "Text to be set as a HTML placeholder attribute - when input is empty"
  prop(placeholder, :string, default: "")
  @doc "Additional classes for the <input> tag"
  prop(class, :css_class, from_context: :class)
  @doc "Value of the input, don't use it inside the forms"
  prop(value, :string)
  @doc "Id to be given to the input tag"
  prop(id, :string)
  @doc "Data-testid attribute value"
  prop(testid, :string)
  @doc "Well, disabled"
  prop(disabled, :boolean)
  @doc "Readonly - some additional classes and behaviour"
  prop(readonly, :boolean)
  @doc "Autocomplete HTML attribute for the input, use \"off\" to disable"
  prop(autocomplete, :string)
  @doc "Keyword | Map of additional attributes for the input"
  prop(opts, :any, default: %{})

  @doc "On change event for the input - again don't use it inside phoenix forms"
  prop(on_change, :event)
  @doc "On keyup event for the input"
  prop(on_keyup, :event)
  @doc "On focus event for the input"
  prop(on_focus, :event)
  @doc "On blur event for the input"
  prop(on_blur, :event)

  def render(assigns) do
    ~F"""
    <input
      class={merge(input_classes(assigns) ++ [@class])}
      {=@type}
      {=@placeholder}
      value={@value || input_value(@form, @field)}
      id={@id || input_id(@form, @field)}
      name={input_name(@form, @field)}
      {=@disabled}
      {=@readonly}
      error={@error || has_error(@form, @field)}
      data-testid={@testid}
      {=@autocomplete}
      {...@opts}
      :on-change={@on_change}
      :on-keyup={@on_keyup}
      :on-focus={@on_focus}
      :on-blur={@on_blur}
    />
    """
  end
end
