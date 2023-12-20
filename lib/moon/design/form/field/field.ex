defmodule Moon.Design.Form.Field.Field do
  @moduledoc """
  Copy of Surface.Components.Form.Field
  """

  use Moon.StatelessComponent
  # use Surface.Component

  import Phoenix.HTML.Form, only: [input_name: 2]

  @doc "The field name"
  prop name, :any, required: true

  @doc "The CSS class for the generated `<div>` element"
  prop class, :css_class

  @doc "data-testid attribute for DOM element"
  prop id, :string

  @doc "data-testid attribute for DOM element"
  prop testid, :string

  @doc "An identifier for the form"
  prop form, :form, from_context: {Surface.Components.Form, :form}

  @doc """
  If you changed the default ID on the input, provide it here.
  (Useful when there are multiple forms on the same page, each
  with an input of the same name. LiveView will exhibit buggy behavior
  without assigning separate id's to each.)
  """
  prop feedback_for, :string

  @doc """
  The content for the field
  """
  slot default, required: true

  def render(assigns) do
    ~F"""
    <div
      {=@class}
      {=@id}
      data-testid={@testid}
      phx-feedback-for={@feedback_for || input_name(@form, @name)}
    >
      <#slot context_put={Surface.Components.Form.Field, field: @name} />
    </div>
    """
  end
end
