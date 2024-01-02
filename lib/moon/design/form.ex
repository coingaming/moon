defmodule Moon.Design.Form do
  @moduledoc false

  use Moon.StatelessComponent

  import Moon.Helpers.Form, only: [transfor: 1]

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Atom or changeset to inform the form data"
  prop(for, :any)
  @doc "The server side parameter in which all parameters will be gathered."
  prop(as, :atom)
  @doc "Triggered when the form is changed"
  prop(change, :event)
  @doc "Triggered when the form is submitted"
  prop(submit, :event)
  @doc "Additional Tailwind classes"
  prop(class, :string)
  @doc "Whether autocomplete is enabled"
  prop(autocomplete, :string, default: "on", values: ["on", "off"])
  @doc "Target"
  prop(target, :any)

  @doc "Trigger a standard form submit on DOM patch to the URL specified in the form's standard action
  attribute.
  This is useful to perform pre-final validation of a LiveView form submit before posting to a
  controller route for operations that require Plug session mutation."
  prop(trigger_action, :any)
  @doc "Whether label is on side of input field"
  prop(is_horizontal, :boolean, default: false)
  @doc "Whether error icon is shown"
  prop(has_error_icon, :boolean, default: false)
  @doc "Additional ttributes to be added to form tag"
  prop(attrs, :map, default: %{})
  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <Surface.Components.Form
      for={transfor(@for)}
      {=@as}
      {=@submit}
      {=@change}
      {=@class}
      {=@trigger_action}
      opts={Map.merge(
        %{autocomplete: @autocomplete, id: @id, "data-testid": @testid, "phx-target": @target},
        @attrs
      )}
    >
      <#slot context_put={is_horizontal: @is_horizontal, has_error_icon: @has_error_icon} />
    </Surface.Components.Form>
    """
  end
end
