defmodule MoonWeb.Examples.Design.BreadcrumbExample.OneItem do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Breadcrumb
  alias Moon.Design.Breadcrumb.Crumb

  data(breadcrumb_items, :list,
    default: [
      %Crumb{
        name: "Current Page",
        link: "/components/v2/breadcrumb"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <div>
      <Breadcrumb id="breadcrumb_1" breadcrumbs={@breadcrumb_items} />
    </div>
    """
  end

  def code() do
    """
    alias Moon.Design.Breadcrumb
    alias Moon.Design.Breadcrumb.Crumb

    data(breadcrumb_items, :list,
      default: [
        %Crumb{
          name: "Current Page",
          link: "/components/v2/breadcrumb"
        }
      ]
    )

    def render(assigns) do
      ~\F\"""
      <div>
        <Breadcrumb id="breadcrumb_1" breadcrumbs={@breadcrumb_items} />
      </div>
      \"""
    end
    """
  end
end
