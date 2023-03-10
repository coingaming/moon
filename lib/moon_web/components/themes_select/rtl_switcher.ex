defmodule MoonWeb.Components.ThemesSelect.RtlSwitcher do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Icons.TextLeftAlign
  alias Moon.Icons.TextRightAlign
  alias Moon.Components.Form
  alias Moon.Design.Form.Switch
  alias Moon.Components.Field
  alias MoonWeb.Components.ThemesSelect.SelectedDirection

  prop(show_themes, :boolean, default: false)
  prop(use_theme_switcher, :boolean, default: false)

  prop(selected_direction_changeset, :any,
    default: SelectedDirection.changeset(%SelectedDirection{}, %{})
  )

  prop(is_rtl, :boolean, default: false)
  prop(on_direction_switch, :event)

  def render(assigns) do
    ~F"""
    <Form for={@selected_direction_changeset} change={@on_direction_switch}>
      <Field name={:is_rtl}>
        <Switch size="xs" id="direction_switcher" is_switched={!@is_rtl}>
          <:on_icon><TextRightAlign /></:on_icon>
          <:off_icon><TextLeftAlign /></:off_icon>
        </Switch>
      </Field>
    </Form>
    """
  end
end
