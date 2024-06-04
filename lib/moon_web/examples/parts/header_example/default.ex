defmodule MoonWeb.Examples.Parts.HeaderExample.Default do
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
    <div>
      <Header>
        <Header.Breadcrumbs id="header-breadcrumbs" breadcrumbs={@breadcrumb_items} />
        <Header.TitleWithDescription title="Chat history">Manage your team members and their account permissions here.</Header.TitleWithDescription>
        <Header.Buttons>
          <Header.ButtonGroupLink route="#" icon="generic_search" tooltip_text="Tooltip text" />
          <Header.ButtonGroupLink route="#" icon="mail_filter" tooltip_text="Filters (⌘ + F)" />
          <Header.ButtonGroupLink route="#" icon="arrows_sorting" tooltip_text="Tooltip text" />
          <Header.ButtonGroupLink route="#" icon="controls_eye" tooltip_text="Tooltip text" />
          <Header.LeftButton />
          <Header.RightButton />
        </Header.Buttons>
      </Header>
    </div>
    """
  end
end
