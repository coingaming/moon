defmodule MoonWeb.Components.ThemesSelect.RtlSwitcher do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.Form
  alias Moon.Components.Switch
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
    <div class={
      "fixed ltr:right-4 rtl:left-4",
      hidden: !@show_themes,
      "bottom-36": @use_theme_switcher,
      "bottom-24": !@use_theme_switcher
    }>
      <Form for={@selected_direction_changeset} change={@on_direction_switch}>
        <Field name={:is_rtl}>
          <Switch
            id="direction_switcher"
            icon_name_off="text_left_align"
            icon_name_on="text_right_align"
            icons
            checked={@is_rtl}
          />
        </Field>
      </Form>
    </div>
    """
  end
end
