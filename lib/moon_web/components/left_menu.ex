defmodule MoonWeb.Components.LeftMenu do
  use MoonWeb, :stateful_component

  alias Moon.Assets.Logos.LogoMoonDesign
  alias Moon.Assets.Logos.LogoMoonDesignShort
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Accordion
  alias Moon.Components.Accordion.Item
  alias Moon.Components.Sidebar
  alias Surface.Components.LiveRedirect

  prop theme_name, :any
  prop uri, :any
  prop active_page, :any
  data selected_theme, :any
  data item_id, :string, default: ""

  data navigations, :any,
    default: [
      %{
        name: "Tutorials",
        url: "/",
        children: [
          %{
            name: "Introduction",
            url: "/theme_name/tutorials/process-description-and-team-interactions"
          },
          %{
            name: "Installation",
            url: "/theme_name/tutorials/installation"
          },
          %{
            name: "Add data using form",
            url: "/theme_name/tutorials/add-data-using-form"
          }
        ]
      },
      %{
        name: "Examples",
        url: "/",
        children: [
          %{
            name: "New site on Moon",
            url: "/lab-light/example-pages/transactions"
          }
        ]
      },
      %{
        name: "Theming & Visuals",
        url: "/",
        children: [
          %{
            name: "Text Color",
            url: "/theme_name/tutorials/theming-and-visuals#text-color"
          },
          %{
            name: "Background Color",
            url: "/theme_name/tutorials/theming-and-visuals#background-color"
          },
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
        name: "Icons",
        url: "/theme_name/icons",
        children: []
      },
      %{
        name: "Components",
        url: "/",
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
          },
          %{
            name: "LineChart",
            url: "/theme_name/charts/line-chart"
          }
        ]
      }
    ]

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
    previous_item_id = assigns.item_id

    ~F"""
    <Sidebar background_color="bg-gohan-100" open_width="16rem">
      <:short_logo>
        <div class="flex items-center h-10">
          <LogoMoonDesignShort font_size="2.5rem" />
        </div>
      </:short_logo>

      <:menu>
        <nav class="mt-5">
          <TopToDown class="">
            <LogoMoonDesign class="ml-4" font_size="5rem" />
            <Accordion>
              {#for nav_section <- @navigations}
                {#if nav_section.children != []}
                  <Item
                    click="open"
                    item_id={"#{nav_section.name}"}
                    is_open={should_nav_section_be_open(nav_section, @uri, @item_id, previous_item_id, @theme_name)}
                    title={"#{nav_section.name}"}
                  >
                    {#for nav_item <- nav_section.children}
                      <LiveRedirect
                        class={
                          "block m-1 text-piccolo-100 hover:text-gohan-100 hover:bg-trunks-100 text-lg px-3 py-2 w-min whitespace-nowrap
                           leading-7 group w-full flex items-center py-2 rounded-md transition-colors ease-in-out duration-150",
                          "bg-trunks-100 text-gohan-100": should_url_be_highlighted(@uri, nav_item.url, @theme_name)
                        }
                        to={String.replace(nav_item.url, "theme_name", @theme_name)}
                      >
                        {nav_item.name}
                      </LiveRedirect>
                    {/for}
                  </Item>
                {#else}
                  <LiveRedirect
                    class={
                      "block m-1 ml-2 text-piccolo-100 hover:text-gohan-100 hover:bg-trunks-100 text-lg px-3 py-2 w-min whitespace-nowrap
                       leading-7 group w-full flex items-center py-2 rounded-md transition-colors ease-in-out duration-150",
                      "bg-trunks-100 text-gohan-100": should_url_be_highlighted(@uri, nav_section.url, @theme_name)
                    }
                    to={String.replace(nav_section.url, "theme_name", @theme_name)}
                  >
                    {nav_section.name}
                  </LiveRedirect>
                {/if}
              {/for}
            </Accordion>
          </TopToDown>
        </nav>
      </:menu>
    </Sidebar>
    """
  end

  defp should_url_be_highlighted(uri, nav_url, theme_name) do
    nav_url = remove_theme_name(nav_url, "theme_name")
    nav_url == url_with_fragment(uri, theme_name)
  end

  defp should_nav_section_be_open(nav_section, uri, item_id, previous_item_id, theme_name) do
    url_with_fragment = url_with_fragment(uri, theme_name)
    no_previous_section_clicked = previous_item_id == ""

    cond do
      is_nav_section_page_clicked?(item_id, nav_section.name) ->
        true

      no_previous_section_clicked and is_url_child_of_nav_section?(nav_section, url_with_fragment) ->
        true

      true ->
        false
    end
  end

  defp is_url_child_of_nav_section?(nav_section, url_with_fragment) do
    Enum.any?(nav_section.children, fn nav_item ->
      url = nav_item.url |> remove_theme_name("theme_name")
      url == url_with_fragment
    end)
  end

  defp is_nav_section_page_clicked?(clicked_item_id, current_selected_section) do
    clicked_item_id == current_selected_section
  end

  defp remove_theme_name(url, theme_name) do
    url |> String.replace("/#{theme_name}/", "/")
  end

  defp url_with_fragment(uri, theme_name) do
    parsed_uri = uri |> URI.parse()
    path = parsed_uri |> Map.fetch!(:path) |> remove_theme_name(theme_name)
    fragment = parsed_uri |> Map.fetch!(:fragment)

    path =
      case fragment do
        nil -> path
        _ -> path <> "#" <> fragment
      end

    path
  end
end
