defmodule MoonWeb.Components.LeftMenu do
  use MoonWeb, :stateful_component

  alias Moon.Assets.Logos.LogoMoonDesignShort
  alias Moon.Autolayouts.TopToDown
  alias Surface.Components.LiveRedirect
  alias Moon.Components.Sidebar
  alias Moon.Components.Form
  alias Moon.Components.Select
  alias Moon.Components.Accordion
  alias Moon.Components.Accordion.Item

  prop theme_name, :any
  prop active_page, :any
  data selected_theme, :any
  data item_id, :string, default: "MoonWeb.Pages.Tutorials.Introduction"

  data navigations, :any,
    default: [
      %{
        name: "Tutorials",
        url: "/",
        active_page: "MoonWeb.Pages.Tutorials",
        children: [
          %{
            name: "Introudction",
            url: "/theme_name/tutorials/process-description-and-team-interactions"
          },
          %{
            name: "Installation",
            url: "/theme_name/tutorials/installation"
          },
          %{
            name: "Add data using form",
            url: "/theme_name/tutorials/add-data-using-form"
          },
          %{name: "New site on Moon", url: "/lab-light/example-pages/transactions"},
          %{name: "", url: "/theme"}
        ]
      },
      %{
        name: "Theming & Visuals",
        url: "/",
        active_page: "MoonWeb.Pages.Theming.ThemingAndVisuals",
        children: [
          %{
            name: "Text Color",
            url: "/theme_name/tutorials/theming-and-visuals#text-color"
          },
          %{
            name: "Background Color",
            url: "/theme_name/tutorials/theming-and-visuals#background-color"
          },
          %{name: "", url: "theme/tutorials/theming-and-visuals#background-color"},
          %{
            name: "Border radius",
            url: "/theme_name/tutorials/theming-and-visuals#border-radius"
          },
          %{
            name: "Margin",
            url: "/theme_name/tutorials/theming-and-visuals#margin"
          },
          %{
            name: "Padding",
            url: "/theme_name/tutorials/theming-and-visuals#padding"
          },
          %{
            name: "Responsive Layout",
            url: "/theme_name/tutorials/theming-and-visuals#responsive-layout"
          }
        ]
      },
      %{
        name: "Assets",
        url: "/",
        active_page: "MoonWeb.Pages.Assets",
        children: [
          %{
            name: "Crests",
            url: "/theme_name/assets/crests"
          },
          %{
            name: "Currencies",
            url: "/theme_name/assets/currencies"
          },
          %{
            name: "Duotones",
            url: "/theme_name/assets/duotones"
          },
          %{
            name: "Icons",
            url: "/theme_name/assets/icons"
          },
          %{
            name: "Logos",
            url: "/theme_name/assets/logos"
          },
          %{
            name: "Patterns",
            url: "/theme_name/assets/patterns"
          }
        ]
      },
      %{
        name: "Components",
        url: "/",
        active_page: "MoonWeb.Pages.Components",
        children: [
          %{
            name: "Accordion",
            url: "/theme_name/components/accordion"
          },
          %{
            name: "Avatar",
            url: "/theme_name/components/avatar"
          },
          %{
            name: "Badge",
            url: "/theme_name/components/badge"
          },
          %{
            name: "Button",
            url: "/theme_name/components/button"
          },
          %{
            name: "Calendar",
            url: "/theme_name/components/calendar"
          },
          %{
            name: "Card",
            url: "/theme_name/components/card"
          },
          %{
            name: "Carousel",
            url: "/theme_name/components/carousel"
          },
          %{
            name: "Checkbox",
            url: "/theme_name/components/checkbox"
          },
          %{
            name: "Checkbox multiselect",
            url: "/theme_name/components/dropdown#checkbox-multiselect"
          },
          %{
            name: "Datepicker",
            url: "/theme_name/components/datepicker"
          },
          %{
            name: "Dropdown",
            url: "/theme_name/components/dropdown"
          },
          %{
            name: "Dropdown Menu Button",
            url: "/theme_name/components/dropdown_menu_button"
          },
          %{
            name: "Dropdown MultiFilter",
            url: "/theme_name/components/dropdown_multi_filter"
          },
          %{
            name: "File Input",
            url: "/theme_name/components/file-input"
          },
          %{
            name: "Heading",
            url: "/theme_name/components/heading"
          },
          %{
            name: "Link",
            url: "/theme_name/components/link"
          },
          %{
            name: "List Items",
            url: "/theme_name/components/list_items"
          },
          %{
            name: "Pagination",
            url: "/theme_name/components/pagination"
          },
          %{
            name: "Popover",
            url: "/theme_name/components/popover"
          },
          %{
            name: "Select",
            url: "/theme_name/components/select"
          },
          %{
            name: "Sidebar",
            url: "/theme_name/components/sidebar"
          },
          %{
            name: "SingleItemSelect",
            url: "/theme_name/components/dropdown#single-item-select"
          },
          %{
            name: "Switch",
            url: "/theme_name/components/switch"
          },
          %{
            name: "Switcher",
            url: "/theme_name/components/switcher"
          },
          %{
            name: "Tabs",
            url: "/theme_name/components/tabs"
          },
          %{
            name: "Text",
            url: "/theme_name/components/text"
          },
          %{
            name: "Text input",
            url: "/theme_name/components/text_input"
          },
          %{
            name: "Toast",
            url: "/theme_name/components/toast"
          },
          %{
            name: "Tooltip",
            url: "/theme_name/components/tooltip"
          }
        ]
      }
    ]

  @available_themes [
    [key: "Aposta10 dark", value: "aposta10-dark"],
    [key: "Aposta10 light", value: "aposta10-light"],
    [key: "Bitcasino dark", value: "bitcasino-dark"],
    [key: "Bitcasino light", value: "bitcasino-light"],
    [key: "Bombay club", value: "bombay-club"],
    [key: "Btcxe", value: "btcxe"],
    [key: "Hub88", value: "hub88"],
    [key: "Lab dark", value: "lab-dark"],
    [key: "Lab light", value: "lab-light"],
    [key: "Livecasino dark", value: "livecasino-dark"],
    [key: "Livecasino light", value: "livecasino-light"],
    [key: "Hub88", value: "luckyslots"],
    [key: "MissionsTool dark", value: "missions-tool-dark"],
    [key: "MissionsTool light", value: "missions-tool-light"],
    [key: "Moneyball dark", value: "moneyball-dark"],
    [key: "Moneyball light", value: "moneyball-light"],
    [key: "Moon design dark", value: "moon-design-dark"],
    [key: "Moon design light", value: "moon-design-light"],
    [key: "Slots dark", value: "slots-dark"],
    [key: "Slots light", value: "slots-light"],
    [key: "Sportsbet dark", value: "sportsbet-dark"],
    [key: "Sportsbet light", value: "sportsbet-light"]
  ]

  def available_themes do
    @available_themes
  end

  def handle_event(
        "update_selected_theme",
        %{"selected_theme" => %{"value" => theme_name}},
        socket
      ) do
    new_path = Routes.live_path(socket, socket.assigns.active_page, theme_name: theme_name)
    {:noreply, redirect(socket, to: new_path)}
  end

  def handle_event("open", %{"item_id" => item_id}, socket) do
    {:noreply, assign(socket, item_id: item_id)}
  end

  def render(assigns) do
    ~F"""
    <Sidebar background_color="bg-gohan-100" open_width="16rem">
      <:short_logo>
        <div class="flex items-center h-10">
          <LogoMoonDesignShort font_size="2.5rem" />
        </div>
      </:short_logo>

      <:full_logo>
        <div class="w-full">
          <Form for={:selected_theme} change="update_selected_theme">
            <Select field={:value} options={available_themes()} value={@theme_name} />
          </Form>
        </div>
      </:full_logo>

      <:menu>
        <nav class="mt-5">
          <TopToDown class="">
            <Accordion>
              {#for nav <- @navigations}
                <Item
                  click="open"
                  item_id={"#{nav.active_page}"}
                  is_open={should_be_open(Atom.to_string(@active_page), nav.active_page, @item_id)}
                  title={"#{nav.name}"}
                >
                  {#for nav_item <- nav.children}
                    <LiveRedirect class="block mt-3" to={String.replace(nav_item.url, "theme_name", @theme_name)}>{nav_item.name}</LiveRedirect>
                  {/for}
                </Item>
              {/for}
            </Accordion>
          </TopToDown>
        </nav>
      </:menu>
    </Sidebar>
    """
  end

  defp should_be_open(current_active_page, item_active_page, item_id) do
    cond do
      item_active_page == item_id -> true
      String.contains?(current_active_page, item_active_page) -> true
      true -> false
    end
  end
end
