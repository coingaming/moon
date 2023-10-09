defmodule Moon.Parts.Sidebar.Slim do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.Drawer
  alias Moon.Parts.Sidebar

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Additional Tailwind classes"
  prop(backdrop_class, :css_class)
  @doc "Additional Tailwind classes"
  prop(panel_class, :css_class)
  @doc "List of links to be rendered when no default slot is given"
  prop(links, :list, default: [])
  @doc "Default slot, menu"
  slot(default)
  @doc "Bottom slot, footer"
  slot(bottom)
  @doc "Logo slot"
  slot(logo)

  def render(assigns) do
    ~F"""
    <Drawer
      {=@id}
      lg_persists
      class={merge(["lg:flex lg:start-0 lg:inset-y-0 lg:z-50 inset-auto", @class])}
      {=@testid}
    >
      <Drawer.Backdrop class={merge(["lg:hidden", @backdrop_class])} />
      <Drawer.Panel
        position="start"
        class={merge([
          [
            "bg-goku shadow-none border-e",
            "w-[4.5rem]"
          ],
          @panel_class
        ])}
      >
        <div
          class={merge([
            ["flex flex-col h-full gap-4"],
            @class
          ])}
          {=@id}
          data-testid={@testid}
        >
          <div class="flex flex-col flex-grow h-full justify-between">
            <#slot
              {@logo}
              context_put={
                is_slim: true
              }
            />
            <div class={merge([
              ["flex flex-col gap-4"]
            ])}>
              <#slot>
                <Sidebar.SlimMenuLink
                  :for={link <- @links}
                  route={link[:page]}
                  icon_name={link[:icon]}
                  tooltip_text={link[:key]}
                />
              </#slot>
            </div>
            <div class={merge([
              ["flex flex-col gap-4 items-center"]
            ])}>
              <#slot {@bottom} />
            </div>
          </div>
        </div>
      </Drawer.Panel>
    </Drawer>
    """
  end
end
