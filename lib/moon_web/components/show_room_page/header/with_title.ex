defmodule MoonWeb.Components.ShowRoomPage.Header.WithTitle do
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

  prop(title, :string)
  prop(has_button_group, :boolean, default: true)
  prop(has_left_button, :boolean, default: true)
  prop(has_right_button, :boolean, default: true)

  prop(light_theme, :boolean, default: false)

  def render(assigns) do
    ~F"""
    <Header class={"remove:theme-moon-dark theme-moon-light": @light_theme}>
      <Header.Title>{@title}</Header.Title>
      <Header.Buttons is_hidden={!@has_button_group}>
        <Header.ButtonGroupLink route="#" icon="generic_search" tooltip_text="Tooltip text" />
        <Header.ButtonGroupLink route="#" icon="mail_filter" tooltip_text="Filters (⌘ + F)" />
        <Header.ButtonGroupLink route="#" icon="arrows_sorting" tooltip_text="Tooltip text" />
        <Header.ButtonGroupLink route="#" icon="controls_eye" tooltip_text="Tooltip text" />
        <Header.LeftButton is_hidden={!@has_left_button} />
        <Header.RightButton is_hidden={!@has_right_button} />
      </Header.Buttons>
    </Header>
    """
  end
end
