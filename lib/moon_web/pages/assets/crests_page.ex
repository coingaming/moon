defmodule MoonWeb.Pages.Assets.CrestsPage do
  use MoonWeb, :live_view

  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.CodePreview

  alias Moon.Assets.Crests
  alias Crests.CrestArsenal
  alias Crests.CrestFlamengo
  alias Crests.CrestSouthampton
  alias Crests.CrestWatford

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~H"""

    <ExampleAndCode class="mt-4">
      <template slot="example">
        <CrestArsenal font_size="10rem" />
      </template>

      <template slot="code">
        <#CodePreview>
        <CrestArsenal font_size="10rem" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <CrestFlamengo font_size="10rem" />
      </template>

      <template slot="code">
        <#CodePreview>
        <CrestFlamengo font_size="10rem" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <CrestSouthampton font_size="10rem" />
      </template>

      <template slot="code">
        <#CodePreview>
        <CrestSouthampton font_size="10rem" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <CrestWatford font_size="10rem" />
      </template>

      <template slot="code">
        <#CodePreview>
        <CrestWatford font_size="10rem" />
        </#CodePreview>
      </template>
    </ExampleAndCode>

    """
  end
end
