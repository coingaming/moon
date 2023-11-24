defmodule MoonWeb.Examples.Parts.HeaderExample.TitleOnly do
  @moduledoc false

  use Moon.StatefulComponent

  use MoonWeb, :example

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

  def render(assigns) do
    ~F"""
    <Header>
      <Header.Title title="Chat history" />
      <Header.Buttons>
        <Header.ButtonGroupLink route="#" icon="generic_search" tooltip_text="Tooltip text" />
        <Header.ButtonGroupLink route="#" icon="mail_filter" tooltip_text="Filters (⌘ + F)" />
        <Header.ButtonGroupLink route="#" icon="arrows_sorting" tooltip_text="Tooltip text" />
        <Header.ButtonGroupLink route="#" icon="controls_eye" tooltip_text="Tooltip text" />
        <Header.LeftButton />
        <Header.RightButton />
      </Header.Buttons>
    </Header>
    """
  end
end
