defmodule MoonWeb.Pages.ColoursPalettePage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PageSection
  alias MoonWeb.Components.ColorsPalette

  data breadcrumbs, :any,
    default: [
      %{
        to: "/colours-palette",
        name: "Colours Palette"
      }
    ]

  data accent_colors_list, :list,
    default: [
      %{
        :name => 'piccolo',
        :value => '100',
      },
      %{
        :name => 'hit',
        :value => '100',
      },
    ]

  data border_colors_list, :list,
    default: [
      %{
        :name => 'beerus',
        :value => '100',
      },
    ]

  data background_colors_list, :list,
    default: [
      %{
        :name => 'goku',
        :value => '100',
      },
      %{
        :name => 'gohan',
        :value => '100',
      },
    ]

  data text_colors_list, :list,
    default: [
      %{
        :name => 'bulma',
        :value => '100',
      },
      %{
        :name => 'trunks',
        :value => '100',
      },
    ]

  data forced_colors_list, :list,
    default: [
      %{
        :name => 'goten',
        :value => '100',
      },
      %{
        :name => 'popo',
        :value => '100',
      },
    ]

  data krillin_colors_list, :list,
    default: [
      %{
        :name => 'krillin',
        :value => '100',
      },
      %{
        :name => 'krillin',
        :value => '60',
      },
      %{
        :name => 'krillin',
        :value => '10',
      },
    ]

  data chichi_colors_list, :list,
    default: [
      %{
        :name => 'chi-chi',
        :value => '100',
      },
      %{
        :name => 'chi-chi',
        :value => '60',
      },
      %{
        :name => 'chi-chi',
        :value => '10',
      },
    ]

  data roshi_colors_list, :list,
    default: [
      %{
        :name => 'roshi',
        :value => '100',
      },
      %{
        :name => 'roshi',
        :value => '60',
      },
      %{
        :name => 'roshi',
        :value => '10',
      },
    ]

  data dodoria_colors_list, :list,
    default: [
      %{
        :name => 'dodoria',
        :value => '100',
      },
      %{
        :name => 'dodoria',
        :value => '60',
      },
      %{
        :name => 'dodoria',
        :value => '10',
      },
    ]

  data cell_colors_list, :list,
    default: [
      %{
        :name => 'cell',
        :value => '100',
      },
      %{
        :name => 'cell',
        :value => '60',
      },
      %{
        :name => 'cell',
        :value => '10',
      },
    ]

  data raditz_colors_list, :list,
    default: [
      %{
        :name => 'raditz',
        :value => '100',
      },
      %{
        :name => 'raditz',
        :value => '60',
      },
      %{
        :name => 'raditz',
        :value => '10',
      },
    ]

  data whis_colors_list, :list,
    default: [
      %{
        :name => 'whis',
        :value => '100',
      },
      %{
        :name => 'whis',
        :value => '60',
      },
      %{
        :name => 'whis',
        :value => '10',
      },
    ]

  data frieza_colors_list, :list,
    default: [
      %{
        :name => 'frieza',
        :value => '100',
      },
      %{
        :name => 'frieza',
        :value => '60',
      },
      %{
        :name => 'frieza',
        :value => '10',
      },
    ]

  data nappa_colors_list, :list,
    default: [
      %{
        :name => 'nappa',
        :value => '100',
      },
      %{
        :name => 'nappa',
        :value => '60',
      },
      %{
        :name => 'nappa',
        :value => '10',
      },
    ]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "moon-design-light",
       active_page: __MODULE__
     )}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <ComponentPageDescription title="Colours Palette" image="/moon/assets/images/facing/colors.webp">
        <p>Our design system is decentralized and built for multi-product purposes. Having different-color naming conventions and numbers etc... makes it harder to maintain it.</p>
        <p>For that, we made a decision to give our colours unique names.</p>
        <p>Meet the <span class="font-semibold">Dragon Ball Z approach</span>.</p>
        <p>Each color name is assigned for specific purpose and for each product these values are different.</p>
        <p>Please never use Hex values, they won't change if you need theme support.</p>
      </ComponentPageDescription>

      <PageSection title="Main colours">
        <ColorsPalette title="Accent colours" colors={@accent_colors_list} />
        <ColorsPalette title="Border and line colours" colors={@border_colors_list} />
        <ColorsPalette title="Background colours" colors={@background_colors_list} />
        <ColorsPalette title="Text and icon colours" colors={@text_colors_list} />
        <ColorsPalette title="Forced colours" colors={@forced_colors_list} />
      </PageSection>

      <PageSection title="Supportive colours">
        <ColorsPalette title="Krillin" description="Warning colour" colors={@krillin_colors_list} />
        <ColorsPalette title="Chi Chi" description="Error colour" colors={@chichi_colors_list} />
        <ColorsPalette title="Roshi" description="Success colour" colors={@roshi_colors_list} />
        <ColorsPalette title="Dodoria" colors={@dodoria_colors_list} />
        <ColorsPalette title="Cell" colors={@cell_colors_list} />
        <ColorsPalette title="Raditz" colors={@raditz_colors_list} />
        <ColorsPalette title="Whis" colors={@whis_colors_list} />
        <ColorsPalette title="Frieza" colors={@frieza_colors_list} />
        <ColorsPalette title="Nappa" colors={@nappa_colors_list} />
      </PageSection>
    </Page>
    """
  end
end
