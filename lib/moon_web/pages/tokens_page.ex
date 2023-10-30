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
        :property => ~c"XS interactive border radius",
        :css => ~c"--radius-i-xs",
        :key => ~c"rounded-moon-i-xs",
        :value => ~c"4px"
      },
      %{
        :property => ~c"SM interactive border radius",
        :css => ~c"--radius-i-sm",
        :key => ~c"rounded-moon-i-sm",
        :value => ~c"8px"
      },
      %{
        :property => ~c"MD interactive border radius",
        :css => ~c"--radius-i-md",
        :key => ~c"rounded-moon-i-md",
        :value => ~c"12px"
      },
      %{
        :property => ~c"XS surface border radius",
        :css => ~c"--radius-s-xs",
        :key => ~c"rounded-moon-s-xs",
        :value => ~c"4px"
      },
      %{
        :property => ~c"SM surface border radius",
        :css => ~c"--radius-s-sm",
        :key => ~c"rounded-moon-s-sm",
        :value => ~c"8px"
      },
      %{
        :property => ~c"MD surface border radius",
        :css => ~c"--radius-s-md",
        :key => ~c"rounded-moon-s-md",
        :value => ~c"12px"
      },
      %{
        :property => ~c"LG surface border radius",
        :css => ~c"--radius-s-lg",
        :key => ~c"rounded-moon-s-lg",
        :value => ~c"16px"
      }
    ]
  )

  data(box_shadow_style_array, :list,
    default: [
      %{
        :property => ~c"XS box shadow",
        :css => ~c"--shadow-xs",
        :key => ~c"shadow-moon-xs",
        :value => ~c"0 4px 12px -6px rgb(0 0 0 / 0.06)"
      },
      %{
        :property => ~c"SM box shadow",
        :css => ~c"--shadow-sm",
        :key => ~c"shadow-moon-sm",
        :value => ~c"0 6px 6px -6px rgb(0 0 0 / 0.16), 0 0 1px rgb(0 0 0 / 0.4)"
      },
      %{
        :property => ~c"MD box shadow",
        :css => ~c"--shadow-md",
        :key => ~c"shadow-moon-md",
        :value => ~c"0 12px 12px -6px rgb(0 0 0 / 0.16), 0 0 1px rgb(0 0 0 / 0.4)"
      },
      %{
        :property => ~c"LG box shadow",
        :css => ~c"--shadow-lg",
        :key => ~c"shadow-moon-lg",
        :value => ~c"0 8px 24px -6px rgb(0 0 0 / 0.16), 0 0 1px rgb(0 0 0 / 0.4)"
      },
      %{
        :property => ~c"XL box shadow",
        :css => ~c"--shadow-xl",
        :key => ~c"shadow-moon-xl",
        :value =>
          ~c"0 32px 32px -8px rgb(0 0 0 / 0.08), 0 0 32px -8px rgb(0 0 0 / 0.12), 0 0 1px rgb(0 0 0 / 0.2)"
      }
    ]
  )

  data(opacity, :list,
    default: [
      %{
        :property => ~c"Opacity",
        :css => ~c"--opacity-moon",
        :key => ~c"opacity-moon",
        :value => ~c"0.6"
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
          <li>Check the <Link to="/colours" is_underline="underline">guide for colours</Link>.</li>
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
