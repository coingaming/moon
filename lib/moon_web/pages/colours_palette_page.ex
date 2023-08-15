defmodule MoonWeb.Pages.ColoursPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PageSection
  alias MoonWeb.Components.ColorsPalette

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/colours",
        name: "Colours"
      }
    ]
  )

  data(accent_colors_list, :list,
    default: [
      %{
        :name => "piccolo",
        :bg_color => "bg-piccolo"
      },
      %{
        :name => "hit",
        :bg_color => "bg-hit"
      }
    ]
  )

  data(border_colors_list, :list,
    default: [
      %{
        :name => "beerus",
        :bg_color => "bg-beerus"
      }
    ]
  )

  data(background_colors_list, :list,
    default: [
      %{
        :name => "goku",
        :bg_color => "bg-goku"
      },
      %{
        :name => "gohan",
        :bg_color => "bg-gohan"
      }
    ]
  )

  data(text_colors_list, :list,
    default: [
      %{
        :name => "bulma",
        :bg_color => "bg-bulma"
      },
      %{
        :name => "trunks",
        :bg_color => "bg-trunks"
      }
    ]
  )

  data(forced_colors_list, :list,
    default: [
      %{
        :name => "goten",
        :bg_color => "bg-goten"
      },
      %{
        :name => "popo",
        :bg_color => "bg-popo"
      }
    ]
  )

  data(hover_overlay_colors_list, :list,
    default: [
      %{
        :name => "jiren",
        :bg_color => "bg-jiren"
      },
      %{
        :name => "heles",
        :bg_color => "bg-heles"
      },
      %{
        :name => "zeno",
        :bg_color => "bg-zeno"
      }
    ]
  )

  data(krillin_colors_list, :list,
    default: [
      %{
        :name => "krillin",
        :bg_color => "bg-krillin"
      },
      %{
        :name => "krillin-60",
        :bg_color => "bg-krillin-60"
      },
      %{
        :name => "krillin-10",
        :bg_color => "bg-krillin-10"
      }
    ]
  )

  data(chichi_colors_list, :list,
    default: [
      %{
        :name => "chichi",
        :bg_color => "bg-chichi"
      },
      %{
        :name => "chichi-60",
        :bg_color => "bg-chichi-60"
      },
      %{
        :name => "chichi-10",
        :bg_color => "bg-chichi-10"
      }
    ]
  )

  data(roshi_colors_list, :list,
    default: [
      %{
        :name => "roshi",
        :bg_color => "bg-roshi"
      },
      %{
        :name => "roshi-60",
        :bg_color => "bg-roshi-60"
      },
      %{
        :name => "roshi-10",
        :bg_color => "bg-roshi-10"
      }
    ]
  )

  data(dodoria_colors_list, :list,
    default: [
      %{
        :name => "dodoria",
        :bg_color => "bg-dodoria"
      },
      %{
        :name => "dodoria-60",
        :bg_color => "bg-dodoria-60"
      },
      %{
        :name => "dodoria-10",
        :bg_color => "bg-dodoria-10"
      }
    ]
  )

  data(cell_colors_list, :list,
    default: [
      %{
        :name => "cell",
        :bg_color => "bg-cell"
      },
      %{
        :name => "cell-60",
        :bg_color => "bg-cell-60"
      },
      %{
        :name => "cell-10",
        :bg_color => "bg-cell-10"
      }
    ]
  )

  data(raditz_colors_list, :list,
    default: [
      %{
        :name => "raditz",
        :bg_color => "bg-raditz"
      },
      %{
        :name => "raditz-60",
        :bg_color => "bg-raditz-60"
      },
      %{
        :name => "raditz-10",
        :bg_color => "bg-raditz-10"
      }
    ]
  )

  data(whis_colors_list, :list,
    default: [
      %{
        :name => "whis",
        :bg_color => "bg-whis"
      },
      %{
        :name => "whis-60",
        :bg_color => "bg-whis-60"
      },
      %{
        :name => "whis-10",
        :bg_color => "bg-whis-10"
      }
    ]
  )

  data(frieza_colors_list, :list,
    default: [
      %{
        :name => "frieza",
        :bg_color => "bg-frieza"
      },
      %{
        :name => "frieza-60",
        :bg_color => "bg-frieza-60"
      },
      %{
        :name => "frieza-10",
        :bg_color => "bg-frieza-10"
      }
    ]
  )

  data(nappa_colors_list, :list,
    default: [
      %{
        :name => "nappa",
        :bg_color => "bg-nappa"
      },
      %{
        :name => "nappa-60",
        :bg_color => "bg-nappa-60"
      },
      %{
        :name => "nappa-10",
        :bg_color => "bg-nappa-10"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Colours" image="facing/colors.webp">
        <p>Our design system is decentralized and built for multi-product purposes. Having different-color naming conventions and numbers etc... makes it harder to maintain it.</p>
        <p>For that, we made a decision to give our colours unique names.</p>
        <p>Meet the <span class="font-semibold">Dragon Ball Z approach</span>.</p>
        <p>Each color name is assigned for specific purpose and for each product these values are different.</p>
        <p>Please never use Hex values, they won"t change if you need theme support.</p>
      </ComponentPageDescription>

      <PageSection title="Main colours">
        <ColorsPalette title="Accent colours" colors={@accent_colors_list} />
        <ColorsPalette title="Border and line colours" colors={@border_colors_list} />
        <ColorsPalette title="Background colours" colors={@background_colors_list} />
        <ColorsPalette title="Text and icon colours" colors={@text_colors_list} />
        <ColorsPalette title="Forced colours" colors={@forced_colors_list} />
        <ColorsPalette title="Hover and overlay colours" colors={@hover_overlay_colors_list} />
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
