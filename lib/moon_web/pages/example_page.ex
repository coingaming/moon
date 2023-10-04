defmodule MoonWeb.Pages.ExamplePage do
  @moduledoc "Page for visual/automated screen-shot tests in Moon DS"

  use MoonWeb, :live_view

  import Moon.Helpers.MoonRender

  data(example_module, :module)
  data(direction, :string, default: "ltr")
  data(theme_name, :string, default: "theme-moon-light")

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       example_module:
         String.to_existing_atom("Elixir.MoonWeb.Examples.Design." <> params["example"]),
       direction: params["direction"] || "ltr",
       theme_name: params["theme_name"] || "theme-moon-light"
     )}
  end

  def render(assigns) do
    ~F"""
    <div role="main" class={"pt-16 lg:pt-0 bg-gohan text-bulma flex", @theme_name} dir={@direction}>
      <.moon module={@example_module} id="main-example" />
    </div>
    """
  end
end
