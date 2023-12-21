defmodule Moon.Design.Form.Field.Error do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Icon

  @doc "Data-testid attribute for HTML tag"
  prop(testid, :string)
  @doc "Id attribute for HTML tag"
  prop(id, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Form info, usually should be taken from context"
  prop(form, :form, from_context: {Surface.Components.Form, :form})
  @doc "Whether error icon is shown"
  prop(has_error_icon, :boolean, default: false)
  @doc "Whether label is on side of input field"
  prop(is_horizontal, :boolean, default: false)
  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <div
      data-testid={@testid}
      {=@id}
      class={merge([
        [
          "flex gap-1 items-center mt-2 text-moon-12 [&_svg]:text-moon-16 text-chichi",
          "col-end-3": @is_horizontal
        ],
        @class
      ])}
      role="alert"
    >
      <#slot>
        <Icon name="generic_info" :if={@has_error_icon} />
      </#slot>
      <Moon.Design.Form.Field.ErrorTag form={get_changeset(@form)} />
    </div>
    """
  end

  defp get_changeset(%Phoenix.HTML.Form{source: source}), do: source
  defp get_changeset(other), do: other
end
