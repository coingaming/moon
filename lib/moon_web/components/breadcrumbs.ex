defmodule MoonWeb.Components.Breadcrumbs do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Components.Breadcrumb, as: BreadCrumbsComponent

  prop breadcrumbs, :any
  prop theme_name, :string, default: "lab-light"
  prop class, :string, default: nil

  @spec render(any) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~F"""
    <BreadCrumbsComponent
      class={@class}
      id="page_crumbs"
      breadcrumbs={get_formatted_crumbs_list(@breadcrumbs)}
    />
    """
  end

  defp get_formatted_crumbs_list(breadcrumbs) do
    with_home = [
      %{
        to: "/",
        name: "Home"
      }
    ]

    with_home = Enum.concat(with_home, breadcrumbs)

    with_home =
      Enum.map(with_home, fn b ->
        %{
          link: b.to,
          name: b.name
        }
      end)
  end
end
