
defmodule MoonWeb.Pages.Assets.AgeLimitPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Assets.Pattern
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Age Limit"
      },
      %{
        to: "/assets/age_limit",
        name: "Age Limit"
      }
    ]

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <TopToDown>
      <Heading size={56} class="mb-4">Age Limit</Heading>
      
        <ExampleAndCode id="pattern_1" class="mt-4">
          <#template slot="example">
            <AgeLimit name="Age18Big" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <AgeLimit name="Age18Big" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="pattern_2" class="mt-4">
          <#template slot="example">
            <AgeLimit name="Age18Small" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <AgeLimit name="Age18Small" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="pattern_3" class="mt-4">
          <#template slot="example">
            <AgeLimit name="Age21Big" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <AgeLimit name="Age21Big" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="pattern_4" class="mt-4">
          <#template slot="example">
            <AgeLimit name="Age21Small" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <AgeLimit name="Age21Small" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      
      </TopToDown>
    </Page>
    """
  end
end
    