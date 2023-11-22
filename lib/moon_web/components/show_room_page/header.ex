defmodule MoonWeb.Components.ShowRoomPage.Header do
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
  prop(description, :string)

  prop(has_breadcrumbs, :boolean, default: true)
  prop(has_title, :boolean, default: true)
  prop(has_description, :boolean, default: true)
  prop(has_button_group, :boolean, default: true)
  prop(has_left_button, :boolean, default: true)
  prop(has_right_button, :boolean, default: true)

  prop(light_theme, :boolean, default: false)

  def render(assigns) do
    ~F"""
    <Header {=@light_theme}>
      <Header.Breadcrumbs
        id="header-breadcrumbs"
        breadcrumbs={@breadcrumb_items}
        is_hidden={!@has_breadcrumbs}
      />
      <Header.Title is_hidden={!@has_title}>{@title}</Header.Title>
      <Header.Description is_hidden={!@has_description}>{@description}</Header.Description>

      <Header.ButtonGroup is_hidden={!@has_button_group}>
        <Header.ButtonGroupLink route="#" icon="generic_search" tooltip_text="Tooltip text" />
        <Header.ButtonGroupLink route="#" icon="mail_filter" tooltip_text="Filters (⌘ + F)" />
        <Header.ButtonGroupLink route="#" icon="arrows_sorting" tooltip_text="Tooltip text" />
        <Header.ButtonGroupLink route="#" icon="controls_eye" tooltip_text="Tooltip text" />
      </Header.ButtonGroup>
      <Header.LeftButton is_hidden={!@has_left_button} />
      <Header.RightButton is_hidden={!@has_right_button} />
    </Header>
    """
  end
end
