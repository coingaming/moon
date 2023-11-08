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
        icon: "generic_home"
      },
      %Crumb{
        name: "Page 1",
        link: "/components/v2/breadcrumb"
      },
      %Crumb{
        name: "Page 2",
        link: "/components/v2/breadcrumb"
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
        link: "/components/v2/breadcrumb"
      }
    ]
  )

  defp get_collapsed_breadcrumbs(breadcrumb_items) do
    count = Enum.count(breadcrumb_items)
    Enum.slice(breadcrumb_items, 1..(count - 3))
  end

  def render(assigns) do
    ~F"""
    <div>
      <Breadcrumb.Collapsed
        divider="arrows_chevron_right_double"
        divider_class="text-bulma text-moon-24"
        id="headless-collapsed"
        breadcrumbs={@breadcrumb_items}
        responsive_crumbs_on="md"
      >
        <Breadcrumb.Item
          class="text-bulma text-moon-16 hover:text-trunks last:text-piccolo last:font-normal last:hover:text-bulma"
          :let={crumb: crumb}
          divider="controls_chevron_right"
        >
          <Breadcrumb.Item.Divider
            divider="arrows_chevron_right_double"
            class="text-bulma text-moon-24 mx-1"
          />
          <Icon
            name={crumb.icon}
            class="text-moon-24"
            :if={Map.has_key?(crumb, :icon) && crumb.icon != ""}
          />
          {#if crumb.name}
            {crumb.name}
          {/if}
        </Breadcrumb.Item>
        <Breadcrumb.Dropdown id="headless-collapsed">
          <Dropdown id="headless-collapsed-breadcrumbs">
            <Dropdown.Options class="min-w-[10rem] p-2 gap-1">
              {#for crumb <- get_collapsed_breadcrumbs(@breadcrumb_items)}
                <a href={crumb.link}>
                  <Dropdown.Option class="w-full p-2">
                    <Icon
                      name={crumb.icon}
                      class="text-moon-24 text-piccolo"
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
              <IconButton icon="other3_dots_horizontal" variant="ghost" class="text-bulma" size="sm" />
            </Dropdown.Trigger>
          </Dropdown>
        </Breadcrumb.Dropdown>
      </Breadcrumb.Collapsed>
    </div>
    """
  end

  def code() do
    """
    alias Moon.Design.Breadcrumb
    alias Moon.Design.Breadcrumb.Crumb

    alias Moon.Icon

    alias Moon.Design.Button.IconButton
    alias Moon.Design.Dropdown

    prop(breadcrumb_items, :list,
      default: [
        %Crumb{
          link: "/components/v2/breadcrumb",
          icon: "generic_home"
        },
        %Crumb{
          name: "Page 1",
          link: "/components/v2/breadcrumb"
        },
        %Crumb{
          name: "Page 2",
          link: "/components/v2/breadcrumb"
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
          link: "/components/v2/breadcrumb"
        }
      ]
    )

    defp get_collapsed_breadcrumbs(breadcrumb_items) do
      count = Enum.count(breadcrumb_items)
      Enum.slice(breadcrumb_items, 1..(count - 3))
    end

    def render(assigns) do
      ~F/\"""
      <div>
        <Breadcrumb.Collapsed
          divider="arrows_chevron_right_double"
          divider_class="text-bulma text-moon-24"
          id="headless-collapsed"
          breadcrumbs={@breadcrumb_items}
          responsive_crumbs_on="md"
        >
          <Breadcrumb.Item
            class="text-bulma text-moon-16 hover:text-trunks last:text-piccolo last:font-normal last:hover:text-bulma"
            :let={crumb: crumb}
            divider="controls_chevron_right"
          >
            <Breadcrumb.Item.Divider
              divider="arrows_chevron_right_double"
              class="text-bulma text-moon-24 mx-1"
            />
            <Icon
              name={crumb.icon}
              class="text-moon-24"
              :if={Map.has_key?(crumb, :icon) && crumb.icon != ""}
            />
            {#if crumb.name}
              {crumb.name}
            {/if}
          </Breadcrumb.Item>
          <Breadcrumb.Dropdown id="headless-collapsed">
            <Dropdown id="headless-collapsed-breadcrumbs">
              <Dropdown.Options class="min-w-[10rem] p-2 gap-1">
                {#for crumb <- get_collapsed_breadcrumbs(@breadcrumb_items)}
                  <a href={crumb.link}>
                    <Dropdown.Option class="w-full p-2">
                      <Icon
                        name={crumb.icon}
                        class="text-moon-24 text-piccolo"
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
                <IconButton icon="other3_dots_horizontal" variant="ghost" class="text-bulma" size="sm" />
              </Dropdown.Trigger>
            </Dropdown>
          </Breadcrumb.Dropdown>
        </Breadcrumb.Collapsed>
      </div>
      /\"""
    end
    """
  end
end
