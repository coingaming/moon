defmodule MoonWeb.Pages.Components.CheckboxMultiselectPage do
  use Moon.LiveView
  alias Moon.Components.Stack
  alias Moon.Components.Checkbox
  alias Moon.Components.CodePreview

  def render(assigns) do
    ~H"""
    <h1>Checkbox</h1>

    <p>
      Checkboxes offer users a 'yes' or 'no' choice. They can be used on their own, or as a multiple choice fieldset.
    </p>
    """
  end
end
