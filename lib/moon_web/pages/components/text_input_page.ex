defmodule MoonWeb.Pages.Components.TextInputPage do
  use MoonWeb, :live_view
  alias Moon.Components.TextInput
  alias Moon.Components.CodePreview

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~H"""
    <h1>Text Input</h1>

    The input component is used when you need to let users enter the text of some kind, such as their name or phone number etc.

    <TextInput label="Text Input" placeholder="e.g. username" />
    <#CodePreview><TextInput label="Text Input" placeholder="e.g. username" /></#CodePreview>
    """
  end
end
