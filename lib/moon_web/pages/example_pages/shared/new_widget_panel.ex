defmodule MoonWeb.Pages.ExamplePages.Shared.NewWidgetPanel do
  use MoonWeb, :stateful_component

  alias Moon.Components.Button
  alias Moon.Components.Card
  alias Moon.Components.IconButton

  prop show, :boolean, default: false
  prop categories, :list, default: []

  data active_category, :map, default: %{}

  def update(assigns, socket) do
    socket =
      socket
      |> assign(assigns)
      |> assign(active_category: List.first(assigns.categories))

    {:ok, socket}
  end

  def render(assigns) do
    ~F"""
    <div class="fixed inset-y-0 right-0 z-20 flex max-w-full pl-10">
      <div class={"w-screen max-w-2xl shadow", hidden: !@show}>
        <Card title="Add new widget" rounded={false} class="h-full">
          <:buttons>
            <IconButton
              icon_name="icon_close_rounded"
              title="Close panel"
              height={8}
              width={8}
              class="bg-goku-100"
              click="close"
            />
          </:buttons>

          <:content>
            <div class="flex flex-wrap items-center gap-1 mb-6">
              {#for category <- @categories}
                <Button
                  rounded
                  class={"p-2 text-sm font-normal #{active_btn_class(category.name == @active_category.name)}"}
                  on_click="select_category"
                  value_name="category_name"
                  value={category.name}
                >
                  {category.name} · {length(category.widget_options)}
                </Button>
              {/for}
            </div>

            <div class={
              "grid gap-6",
              "grid-cols-1": length(@active_category.widget_options) == 1,
              "grid-cols-2": length(@active_category.widget_options) > 1
            }>
              {#for widget_option <- @active_category.widget_options}
                <div class="flex flex-col items-center justify-center p-6 border border-dashed rounded border-beerus-100">
                  <IconButton
                    icon_name={widget_icon(widget_option)}
                    icon_size="4.5rem"
                    class="bg-goku-100"
                    height={25}
                    width={25}
                  />

                  <div class="mt-6 text-sm font-semibold text-piccolo-100">
                    {widget_option}
                  </div>
                </div>
              {/for}
            </div>
          </:content>
        </Card>
      </div>
    </div>
    """
  end

  defp active_btn_class(true), do: "bg-goku-120 text-bulma-100"
  defp active_btn_class(false), do: "text-trunks-100 hover:text-bulma-100"

  defp widget_icon("Top"), do: "icon_chart_bar"
  defp widget_icon("Calendar"), do: "icon_calendar"

  def handle_event("select_category", %{"category_name" => name}, socket) do
    category = Enum.find(socket.assigns.categories, &(&1.name == name))
    {:noreply, assign(socket, active_category: category)}
  end

  def handle_event("close", _, socket) do
    send(self(), {:new_widget_panel, :close})
    {:noreply, socket}
  end
end
