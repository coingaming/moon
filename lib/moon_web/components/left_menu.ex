defmodule MoonWeb.Components.LeftMenu do
  use MoonWeb, :stateful_component

  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias Moon.Components.Stack

  alias Moon.Components.Form
  alias Moon.Components.Select

  data(selected_theme, :any)
  prop(theme_name, :any)

  @available_themes [
    [key: "Aposta10 dark", value: "aposta10-dark"],
    [key: "Aposta10 light", value: "aposta10-light"],
    [key: "Bitcasino dark", value: "bitcasino-dark"],
    [key: "Bitcasino light", value: "bitcasino-light"],
    [key: "Bombay club", value: "bombay-club"],
    [key: "Btcxe", value: "btcxe"],
    [key: "Hub88", value: "hub88"],
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
    IO.puts("FUCK")

    new_path = Routes.live_path(socket, socket.assigns.active_page, theme_name: theme_name)
    {:noreply, redirect(socket, to: new_path)}
  end

  def render(assigns) do
    ~H"""
    <Stack class="p-4 max-h-full bg-gohan-100 overflow-y-scroll">
      <Form for={{ :selected_theme }} change="update_selected_theme" target={{ @myself }}>
        <Select
          field={{ :value }}
          options={{ available_themes() }}
          value={{ @theme_name }}
        />
      </Form>

      <Heading size=20>Concepts</Heading>
      <Link to="/{{ @theme_name }}/">Overview</Link>

      <Heading size=20>Tutorials</Heading>
      <Link to="/{{ @theme_name }}/tutorials/process-description-and-team-interactions">Introduction</Link>
      <Link to="/{{ @theme_name }}/tutorials/installation">Installation</Link>
      <Link to="/{{ @theme_name }}/tutorials/add-data-using-form">Add data using form</Link>

      <Heading size=20>Theming and visuals</Heading>
      <Link to="/{{ @theme_name }}/tutorials/theming-and-visuals#text-color">Text color</Link>
      <Link to="/{{ @theme_name }}/tutorials/theming-and-visuals#background-color">Background color</Link>
      <Link to="/{{ @theme_name }}/tutorials/theming-and-visuals#border-radius">Border radius</Link>
      <Link to="/{{ @theme_name }}/tutorials/theming-and-visuals#margin">Margin</Link>
      <Link to="/{{ @theme_name }}/tutorials/theming-and-visuals#padding">Padding</Link>
      <Link to="/{{ @theme_name }}/tutorials/theming-and-visuals#responsive-layout">Responsive layout</Link>


      <Heading size=20>Assets</Heading>
      <Link to="/{{ @theme_name }}/assets/crests">Crests</Link>
      <Link to="/{{ @theme_name }}/assets/duotones">Duotones</Link>
      <Link to="/{{ @theme_name }}/assets/icons">Icons</Link>
      <Link to="/{{ @theme_name }}/assets/logos">Logos</Link>
      <Link to="/{{ @theme_name }}/assets/patterns">Patterns</Link>

      <Heading size=20>Components</Heading>
      <Link to="/{{ @theme_name }}/components/accordion">Accordion</Link>
      <Link to="/{{ @theme_name }}/components/avatar">Avatar</Link>
      <Link to="/{{ @theme_name }}/components/badge">Badge</Link>
      <Link to="/{{ @theme_name }}/components/button">Button</Link>
      <Link to="/{{ @theme_name }}/components/carousel">Carousel</Link>
      <Link to="/{{ @theme_name }}/components/checkbox">Checkbox</Link>
      <Link to="/{{ @theme_name }}/components/dropdown#checkbox-multiselect">Checkbox multiselect</Link>
      <Link to="/{{ @theme_name }}/components/dropdown">Dropdown</Link>
      <Link to="/{{ @theme_name }}/components/heading">Heading</Link>
      <Link to="/{{ @theme_name }}/components/link">Link</Link>
      <Link to="/{{ @theme_name }}/components/select">Select</Link>
      <Link to="/{{ @theme_name }}/components/dropdown#single-element-select">SingleElementSelect</Link>
      <Link to="/{{ @theme_name }}/components/text">Text</Link>
      <Link to="/{{ @theme_name }}/components/text_input">Text input</Link>

    </Stack>
    """
  end
end
