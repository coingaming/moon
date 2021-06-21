defmodule MoonWeb.Pages.Components.CheckboxMultiselectPage do
  use MoonWeb, :live_view

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~F"""
    <h1>Checkbox</h1>

    <p>
      Checkboxes offer users a 'yes' or 'no' choice. They can be used on their own, or as a multiple choice fieldset.
    </p>
    """
  end
end
