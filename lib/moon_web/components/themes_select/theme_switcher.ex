defmodule MoonWeb.Components.ThemesSelect.ThemeSwitcher do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.Form
  alias Moon.Design.Switch
  alias Moon.Components.Field
  alias MoonWeb.Components.ThemesSelect.SelectedTheme

  prop(show_themes, :boolean, default: false)
  prop(use_theme_switcher, :boolean, default: false)
  prop(selected_theme_changeset, :any, default: SelectedTheme.changeset(%SelectedTheme{}, %{}))
  prop(dark_mode, :boolean, default: false)
  prop(on_theme_switch, :event)

  def render(assigns) do
    ~F"""
    <Form for={@selected_theme_changeset} change={@on_theme_switch}>
      <Field name={:is_dark}>
        <Switch id="theme_switcher" icons checked={@dark_mode} class="theme_switcher" />
      </Field>
    </Form>
    """
  end
end
