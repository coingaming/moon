defmodule MoonWeb.Pages.TokensPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.Link
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.TokensTable

  data breadcrumbs, :any,
    default: [
      %{
        to: "/tokens",
        name: "Tokens"
      }
    ]

  data border_radius_array, :list,
    default: [
      %{
        :property => 'Interactive radius XS',
        :key => 'rounded-moon-i-xs',
        :value => '4px'
      },
      %{
        :property => 'Interactive radius SM',
        :key => 'rounded-moon-i-sm',
        :value => '8px'
      },
      %{
        :property => 'Interactive radius MD',
        :key => 'rounded-moon-i-md',
        :value => '12px'
      },
      %{
        :property => 'Surface radius XS',
        :key => 'rounded-moon-s-xs',
        :value => '4px'
      },
      %{
        :property => 'Surface radius SM',
        :key => 'rounded-moon-s-sm',
        :value => '8px'
      },
      %{
        :property => 'Surface radius MD',
        :key => 'rounded-moon-s-md',
        :value => '12px'
      },
      %{
        :property => 'Surface radius LG',
        :key => 'rounded-moon-s-lg',
        :value => '16px'
      }
    ]

  data border_style_array, :list,
    default: [
      %{
        :property => 'Default',
        :key => 'border',
        :value => '1px solid'
      },
      %{
        :property => 'Interactive',
        :key => 'border-2',
        :value => '2px solid'
      }
    ]

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Tokens" image="/moon/assets/images/facing/tokens.webp">
        <p>Design tokens are <span class="font-semibold">all the values needed to construct and maintain a design system</span> — spacing, color, typography, object styles, animation, etc.</p>
        <p>These can represent anything defined by design: a color as a HEX value, an opacity as a number, an animation ease as Bezier coordinates.</p>
        <p>They're used in place of hard-coded values in order to ensure flexibility and unity across all multi-product experiences.</p>
        <p>Design tokens are directly integrated into our component libraries. They cover the various options of platform scales, color themes, and more.</p>
        <h2 class="text-moon-20 font-semibold">How to create your own custom theme based and use it for your product.</h2>
        <ul class="list-decimal list-inside">
          <li>Create your product <Link
              to="https://github.com/coingaming/moon/tree/main/priv/static/themes"
              target="_black"
              rel="noreferrer"
              class="underline"
            >theme template file</Link>.</li>
          <li>Check the <Link to="/colours-palette" class="underline">guide for colours</Link>.</li>
          <li>Replace colour values one by one.</li>
          <li>Change the values to your product ones.</li>
          <li>Publish your changes.</li>
          <li>Share tokens with your product front-end developers.</li>
          <li>Enjoy your new theme! 🎉</li>
        </ul>
      </ComponentPageDescription>
      <TokensTable title="Border Radius" data={@border_radius_array} />
      <TokensTable title="Border Style" data={@border_style_array} />
    </Page>
    """
  end
end
