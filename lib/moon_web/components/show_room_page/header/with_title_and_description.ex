defmodule MoonWeb.Components.ShowRoomPage.Header.WithTitleAndDescription do
  @moduledoc false

  use MoonWeb, :stateful_component

  alias Moon.Design.Breadcrumb.Crumb
  alias Moon.Parts.Header

  data(breadcrumb_items, :list,
    default: [
      %Crumb{
        link: "#",
        icon: "generic_home"
      },
      %Crumb{
        name: "Sub page",
        link: "#"
      },
      %Crumb{
        name: "Target page",
        link: "#"
      }
    ]
  )

  prop(default_title, :string)
  prop(description, :string)

  prop(has_breadcrumbs, :boolean, default: true)
  prop(has_button_group, :boolean, default: true)
  prop(has_left_button, :boolean, default: true)
  prop(has_right_button, :boolean, default: true)

  prop(light_theme, :boolean, default: false)

  def render(assigns) do
    ~F"""
    <div>
      <Header class={"remove:theme-moon-dark theme-moon-light": @light_theme}>
        <Header.Breadcrumbs
          id="header-breadcrumbs-1"
          breadcrumbs={@breadcrumb_items}
          is_hidden={!@has_breadcrumbs}
        />
        <Header.TitleWithDescription title={@default_title} breadcrumbs_hidden={!@has_breadcrumbs}>{@description}</Header.TitleWithDescription>
        <Header.Buttons is_hidden={!@has_button_group}>
          <Header.ButtonGroupLink route="#" icon="generic_search" tooltip_text="Tooltip text" />
          <Header.ButtonGroupLink route="#" icon="mail_filter" tooltip_text="Filters (⌘ + F)" />
          <Header.ButtonGroupLink route="#" icon="arrows_sorting" tooltip_text="Tooltip text" />
          <Header.ButtonGroupLink route="#" icon="controls_eye" tooltip_text="Tooltip text" />
          <Header.LeftButton is_hidden={!@has_left_button} />
          <Header.RightButton is_hidden={!@has_right_button} />
        </Header.Buttons>
      </Header>
    </div>
    """
  end
end
