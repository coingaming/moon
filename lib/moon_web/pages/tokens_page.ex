defmodule MoonWeb.Pages.TokensPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.Link
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.TokensTable

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/tokens",
        name: "Tokens"
      }
    ]
  )

  data(border_radius_array, :list,
    default: [
      %{
        :property => 'XS interactive border radius',
        :css => '--radius-i-xs',
        :key => 'rounded-moon-i-xs',
        :value => '4px'
      },
      %{
        :property => 'SM interactive border radius',
        :css => '--radius-i-sm',
        :key => 'rounded-moon-i-sm',
        :value => '8px'
      },
      %{
        :property => 'MD interactive border radius',
        :css => '--radius-i-md',
        :key => 'rounded-moon-i-md',
        :value => '12px'
      },
      %{
        :property => 'XS surface border radius',
        :css => '--radius-s-xs',
        :key => 'rounded-moon-s-xs',
        :value => '4px'
      },
      %{
        :property => 'SM surface border radius',
        :css => '--radius-s-sm',
        :key => 'rounded-moon-s-sm',
        :value => '8px'
      },
      %{
        :property => 'MD surface border radius',
        :css => '--radius-s-md',
        :key => 'rounded-moon-s-md',
        :value => '12px'
      },
      %{
        :property => 'LG surface border radius',
        :css => '--radius-s-lg',
        :key => 'rounded-moon-s-lg',
        :value => '16px'
      }
    ]
  )

  data(box_shadow_style_array, :list,
    default: [
      %{
        :property => 'XS box shadow',
        :css => '--shadow-xs',
        :key => 'shadow-moon-xs',
        :value => '0 4px 12px -6px rgb(0 0 0 / 0.06)'
      },
      %{
        :property => 'SM box shadow',
        :css => '--shadow-sm',
        :key => 'shadow-moon-sm',
        :value => '0 6px 6px -6px rgb(0 0 0 / 0.16), 0 0 1px rgb(0 0 0 / 0.4)'
      },
      %{
        :property => 'MD box shadow',
        :css => '--shadow-md',
        :key => 'shadow-moon-md',
        :value => '0 12px 12px -6px rgb(0 0 0 / 0.16), 0 0 1px rgb(0 0 0 / 0.4)'
      },
      %{
        :property => 'LG box shadow',
        :css => '--shadow-lg',
        :key => 'shadow-moon-lg',
        :value => '0 8px 24px -6px rgb(0 0 0 / 0.16), 0 0 1px rgb(0 0 0 / 0.4)'
      },
      %{
        :property => 'XL box shadow',
        :css => '--shadow-xl',
        :key => 'shadow-moon-xl',
        :value =>
          '0 32px 32px -8px rgb(0 0 0 / 0.08), 0 0 32px -8px rgb(0 0 0 / 0.12), 0 0 1px rgb(0 0 0 / 0.2)'
      }
    ]
  )

  data(opacity, :list,
    default: [
      %{
        :property => 'Opacity',
        :css => '--opacity-moon',
        :key => 'opacity-moon',
        :value => '0.6'
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Tokens" image="facing/tokens.webp">
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
              is_underline="underline"
            >theme template file</Link>.</li>
          <li>Check the <Link to="/colours-palette" is_underline="underline">guide for colours</Link>.</li>
          <li>Replace colour values one by one.</li>
          <li>Change the values to your product ones.</li>
          <li>Publish your changes.</li>
          <li>Share tokens with your product front-end developers.</li>
          <li>Enjoy your new theme! 🎉</li>
        </ul>
      </ComponentPageDescription>
      <TokensTable title="Border Radius" data={@border_radius_array} />
      <TokensTable title="Box Shadow" data={@box_shadow_style_array} />
      <TokensTable title="Opacity" data={@opacity} />
    </Page>
    """
  end
end
