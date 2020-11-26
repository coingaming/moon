defmodule MoonWeb.Pages.Components.CheckboxMultiselectPage do
  use MoonWeb, :live_view
  alias Moon.Components.Stack
  alias Moon.Components.Checkbox
  alias Moon.Components.CodePreview

  def mount(%{"theme_name" => theme_name}, _session, socket) do
    {:ok, assign(socket, theme_name: theme_name, active_page: __MODULE__)}
  end

  def render(assigns) do
    ~H"""
    <h1>Checkbox</h1>

    <p>
      Checkboxes offer users a 'yes' or 'no' choice. They can be used on their own, or as a multiple choice fieldset.
    </p>
    """
  end
end
