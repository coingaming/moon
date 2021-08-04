defmodule MoonWeb.Pages.ExamplePages.Shared.NewWidgetPanel do
  use MoonWeb, :stateless_component

  alias Moon.Components.Card
  alias Moon.Components.IconButton

  prop show, :boolean, default: false
  prop on_close, :string, required: true
  prop widgets, :list, default: []

  data active_tab, :string, default: ""

  def render(assigns) do
    ~F"""
    <div class="fixed inset-y-0 right-0 z-20 flex max-w-full pl-10">
      <div class={"w-screen max-w-md", hidden: !@show}>
        <Card title="Add new widget" rounded={false} class="h-full">
          <:buttons>
            <IconButton
              icon_name="icon_close_rounded"
              title="Close panel"
              height={8}
              width={8}
              class="bg-goku-100"
              click={@on_close}
            />
          </:buttons>

          <:content>
            Widgets
          </:content>
        </Card>
      </div>
    </div>
    """
  end
end
