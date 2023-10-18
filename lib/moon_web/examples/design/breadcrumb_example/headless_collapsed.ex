defmodule MoonWeb.Examples.Design.BreadcrumbExample.HeadlessCollapsed do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Breadcrumb
  alias Moon.Design.Breadcrumb.Crumb

  alias Moon.Icon

  alias Moon.Design.Button.IconButton
  alias Moon.Design.Dropdown

  prop(breadcrumb_items, :list,
    default: [
      %Crumb{
        link: "/components/v2/breadcrumb",
        icon: "generic_home",
        name: "Home"
      },
      %Crumb{
        name: "Page 1",
        link: "/components/v2/breadcrumb"
      },
      %Crumb{
        name: "Page 2",
        link: "/components/v2/breadcrumb",
        icon: "generic_user"
      },
      %Crumb{
        name: "Page 3",
        link: "/components/v2/breadcrumb"
      },
      %Crumb{
        name: "Page 4",
        link: "/components/v2/breadcrumb"
      },
      %Crumb{
        name: "Current Page",
        link: "/components/v2/breadcrumb",
        icon: "generic_user"
      }
    ]
  )

  defp get_collapsed_breadcrumbs(breadcrumb_items) do
    count = Enum.count(breadcrumb_items)
    Enum.slice(breadcrumb_items, 1..(count - 3))
  end

  def render(assigns) do
    ~F"""
    <Breadcrumb.Collapsed
      divider="arrows_chevron_right_double"
      divider_class="text-moon-24 text-piccolo hover:text-piccolo"
      id="headless-collapsed"
      breadcrumbs={@breadcrumb_items}
      responsive_crumbs_on="md"
    >
      <Breadcrumb.Item
        class="text-chichi text-moon-32 hover:text-krillin last:text-roshi"
        divider_class="text-moon-24 text-piccolo hover:text-piccolo"
        :let={crumb: crumb}
        divider="controls_chevron_right"
      >
        <Breadcrumb.Item.Divider
          divider="arrows_chevron_right_double"
          class="text-piccolo text-moon-24"
        />
        <Icon name={crumb.icon} :if={Map.has_key?(crumb, :icon) && crumb.icon != ""} />
        {crumb.name}
      </Breadcrumb.Item>
      <Breadcrumb.CollapsedItems id="headless-collapsed">
        <Dropdown id="headless-collapsed-breadcrumbs">
          <Dropdown.Options class="min-w-[8.5rem] p-1">
            {#for crumb <- get_collapsed_breadcrumbs(@breadcrumb_items)}
              <a href={crumb.link}>
                <Dropdown.Option class="w-full p-2">
                  <Icon
                    name={crumb.icon}
                    class="text-moon-24"
                    :if={Map.has_key?(crumb, :icon) && crumb.icon != ""}
                  />
                  {#if crumb.name}
                    {crumb.name}
                  {/if}
                </Dropdown.Option>
              </a>
            {/for}
          </Dropdown.Options>

          <Dropdown.Trigger>
            <IconButton icon="other3_dots_horizontal" variant="outline" size="sm" />
          </Dropdown.Trigger>
        </Dropdown>
      </Breadcrumb.CollapsedItems>
    </Breadcrumb.Collapsed>
    """
  end

  def code() do
    """

    """
  end
end
