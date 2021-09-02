defmodule MoonWeb.Pages.Components.CheckboxMultiselectPage do
  use MoonWeb, :live_view
  alias Moon.Autolayouts.TopToDown
  alias MoonWeb.Components.Breadcrumbs

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/dropbox#checkbox-multiselct",
        name: "Checkbox multiselct"
      }
    ]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~F"""
    <TopToDown>
      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <h1>Checkbox</h1>

      <p>
        Checkboxes offer users a 'yes' or 'no' choice. They can be used on their own, or as a multiple choice fieldset.
      </p>
    </TopToDown>
    """
  end
end
