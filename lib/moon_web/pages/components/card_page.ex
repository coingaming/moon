defmodule MoonWeb.Pages.Components.CardPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.LeftToRight
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Card
  alias Moon.Components.CardV2
  alias Moon.Components.Heading
  alias Moon.Components.IconButton
  alias Moon.Components.Link
  alias Moon.Icons.ArrowsTopRight
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v1"
      },
      %{
        to: "/components/card",
        name: "Card"
      }
    ]
  )

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <TopToDown>
        <Heading size={56} class="mb-4">Card</Heading>

        <p>
          <Link to="https://github.com/coingaming/moon/blob/main/lib/moon_web/pages/components/card_page.ex">Sourcecode of this page</Link>
        </p>

        <ExampleAndCode id="card_1">
          <:example>
            <Card title="Winers">
              <:buttons>
                <IconButton
                  id="winers-arrows-update"
                  icon_name="arrows_update"
                  height={8}
                  width={8}
                  hover_bg_color="bg-gohan"
                />
                <IconButton icon_name="controls_expand" height={8} width={8} hover_bg_color="bg-gohan" />
              </:buttons>

              <:content>
                {Faker.Lorem.paragraph()}
              </:content>
            </Card>
          </:example>

          <:code>{card_1_code()}</:code>
        </ExampleAndCode>

        <ExampleAndCode title="Cards grid for stat" id="card_2">
          <:example>
            <LeftToRight gap="gap-6">
              {#for card <- AddDataUsingForm.Card.cards()}
                <CardV2
                  top_class="text-moon-18"
                  left_bottom_class="text-moon-14 text-roshi"
                  right_bottom_class="text-moon-48"
                >
                  <:top>
                    {card.top}
                  </:top>

                  <:left_bottom>
                    <LeftToRight>
                      <ArrowsTopRight class="h-5 w-5" color="bg-roshi" />
                      {card.left_bottom}
                    </LeftToRight>
                  </:left_bottom>

                  <:right_bottom>
                    {card.right_bottom}
                  </:right_bottom>
                </CardV2>
              {/for}
            </LeftToRight>
          </:example>

          <:code>{card_2_code()}</:code>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end

  def card_1_code do
    """
      alias Moon.Components.Card
      alias Moon.Components.IconButton

      <Card title="Winers">
        <:buttons>
          <IconButton
            id="winers-arrows-update"
            icon_name="arrows_update"
            height={8}
            width={8}
            hover_bg_color="bg-gohan"
          />
          <IconButton icon_name="controls_expand" height={8} width={8} hover_bg_color="bg-gohan" />
        </:buttons>

        <:content>
          {Faker.Lorem.paragraph()}
        </:content>
      </Card>
    """
  end

  def card_2_code do
    """
    <LeftToRight gap="gap-6">
      {#for card <- AddDataUsingForm.Card.cards()}
        <CardV2
          top_class="text-moon-18"
          left_bottom_class="text-moon-14 text-roshi"
          right_bottom_class="text-moon-48"
        >
          <:top>
            {card.top}
          </:top>

          <:left_bottom>
            <LeftToRight>
              <ArrowsTopRight class="h-5 w-5" color="bg-roshi" />
              {card.left_bottom}
            </LeftToRight>
          </:left_bottom>

          <:right_bottom>
            {card.right_bottom}
          </:right_bottom>
        </CardV2>
      {/for}
    </LeftToRight>
    """
  end
end
