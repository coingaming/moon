defmodule MoonWeb.Components.ThemesSelect.RtlSwitcher do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.Form
  alias Moon.Components.Switch
  alias Moon.Components.Field
  alias MoonWeb.Components.ThemesSelect.SelectedTheme

  prop show_themes, :boolean, default: false
  prop use_theme_switcher, :boolean, default: false
  prop selected_theme_changeset, :any, default: SelectedTheme.changeset(%SelectedTheme{}, %{})
  prop dark_mode, :boolean, default: false
  prop on_theme_switch, :event

  def render(assigns) do
    ~F"""
    <div class={
      "fixed right-4",
      hidden: !@show_themes,
      "bottom-36": @use_theme_switcher,
      "bottom-24": !@use_theme_switcher
    }>
      <Form for={@selected_theme_changeset} change={@on_theme_switch}>
        <Field name={:is_dark}>
          <Switch id="theme_switcher" icons checked={@dark_mode} />
        </Field>
      </Form>
    </div>
    """
  end
end
