defmodule MoonWeb.Components.ThemesSelect.RtlSwitcher do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.Form
  alias Moon.Design.Switch
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
        <Switch
          size="xs"
          id="direction_switcher"
          icon_name_off="text_right_align"
          icon_name_on="text_left_align"
          icons
          checked={@is_rtl}
        />
      </Field>
    </Form>
    """
  end
end
