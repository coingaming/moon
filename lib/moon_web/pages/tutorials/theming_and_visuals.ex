defmodule MoonWeb.Pages.Tutorials.ThemingAndVisuals do
  use MoonWeb, :live_view

  alias Moon.Components.Heading
  alias Moon.Components.Text
  alias Moon.Components.Link

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~F"""
    {asset_import(@socket, "js/tailwind")}

    <Heading size={32}>Theming and visuals</Heading>
    <Text>
      Theming and visuals is based on TailwindCSS rules.
    </Text>
    <Heading size={24} class="mt-8" id="text-color">Text color</Heading>
    Read more: <Link to="https://tailwindcss.com/docs/text-color">https://tailwindcss.com/docs/text-color</Link>

    <Heading size={24} class="mt-8" id="background-color">Background color</Heading>
    Read more: <Link to="https://tailwindcss.com/docs/background-color">https://tailwindcss.com/docs/background-color</Link>

    <Heading size={24} class="mt-8" id="border-radius">Border radius</Heading>
    Read more: <Link to="https://tailwindcss.com/docs/border-radius">https://tailwindcss.com/docs/border-radius</Link>

    <Heading size={24} class="mt-8" id="margin">Margin</Heading>
    Read more: <Link to="https://tailwindcss.com/docs/margin">https://tailwindcss.com/docs/margin</Link>

    <Heading size={24} class="mt-8" id="padding">Padding</Heading>
    Read more: <Link to="https://tailwindcss.com/docs/padding">https://tailwindcss.com/docs/padding</Link>

    <Heading size={24} class="mt-8" id="responsive-layout">Responsive layout</Heading>
    Read more: <Link to="https://tailwindcss.com/docs/responsive-design">https://tailwindcss.com/docs/responsive-design</Link>
    """
  end
end
