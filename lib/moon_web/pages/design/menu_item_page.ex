defmodule MoonWeb.Pages.Design.MenuItemPage do
  @moduledoc false
  use MoonWeb, :live_view

  alias MoonWeb.Components.Anatomy
  alias Moon.Design.MenuItem
  alias Moon.Components.Lego
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable

  alias Moon.Icons.{
    SportBadminton,
    TravelAirplane,
    TravelBill,
    ControlsChevronRight,
    GenericLoyalty,
    DevicesJoystick,
    ControlsChevronDown,
    ControlsChevronUp
  }

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v2"
      },
      %{
        to: "/components/v2/menu_item",
        name: "MenuItem"
      }
    ]
  )

  data(props_info_array, :list,
    default: [
      %{
        :name => 'title',
        :type => 'string',
        :required => 'No',
        :default => '-',
        :description => 'Title of item, only if no slot is given'
      },
      %{
        :name => 'text',
        :type => 'string',
        :required => 'No',
        :default => '-',
        :description => 'Some hint to be shown under the title'
      },
      %{
        :name => 'is_active',
        :type => 'boolean',
        :required => 'No',
        :default => 'false',
        :description => 'To mark menu item as an active (bg only)'
      },
      %{
        :name => 'is_selected',
        :type => 'boolean',
        :required => 'No',
        :default => 'false',
        :description => 'Selected/checked/expanded if role is given'
      },
      %{
        :name => 'role',
        :type => 'checkbox | switch | radio',
        :required => 'No',
        :default => '-',
        :description => 'Role to MenuItem acts as'
      },
      %{
        :name => 'on_click',
        :type => 'event',
        :required => 'No',
        :default => '-',
        :description => 'Role-depending event handler'
      },
      %{
        :name => 'width',
        :type => 'css_class',
        :required => 'No',
        :default => 'w-full',
        :description => 'Width of the item'
      },
      %{
        :name => 'class',
        :type => 'css_class',
        :required => 'No',
        :default => '-',
        :description => 'Additional CSS class(es) for the item'
      },
      %{
        :name => 'as',
        :type => 'a | button',
        :required => 'No',
        :default => 'button',
        :description => 'HTML tag to be used to render item'
      },
      %{
        :name => 'attrs',
        :type => 'Map | List',
        :required => 'No',
        :default => '%{}',
        :description => 'HTML attributes to be set for tag given by as'
      }
    ]
  )

  data(selected0, :boolean, default: false)
  data(selected1, :boolean, default: true)
  data(selected2, :boolean, default: false)
  data(selected3, :boolean, default: false)
  data(selected4, :boolean, default: true)

  data(expanded0, :boolean, default: false)
  data(expanded1, :boolean, default: true)
  data(expanded2, :boolean, default: false)

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription
        is_aria_support
        title="MenuItem"
        image="facing/components/menu_item.png"
      >
        <p>Menu items are used in such vertical menues and containers as Popovers, Sidebars, Drawers, Dialogs etc.</p>
        <p>
          Menu item row heights can vary based on the amount of content in each
          row. The content in each row is flexible. By default, each menu item
          row height is Medium(md) 40px for one line of content.
        </p>
      </ComponentPageDescription>

      <Anatomy>{component_anatomy()}</Anatomy>

      <ExampleAndCode title="Default" id="menu_1">
        <:example>
          <MenuItem>Menu item text</MenuItem>
        </:example>

        <:code>{menu_item_1_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="As link" id="menu_2">
        <:example>
          <MenuItem as="a">Menu item text</MenuItem>
        </:example>

        <:code>{menu_item_2_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="With icon" id="menu_3">
        <:example>
          <div class="w-56">
            <MenuItem>
              <SportBadminton class="text-[1.5rem]" />
              <Lego.Title>Your value</Lego.Title>
            </MenuItem>
          </div>
          <div class="w-56">
            <MenuItem>
              <Lego.Title>Your value</Lego.Title>
              <SportBadminton class="text-[1.5rem]" />
            </MenuItem>
          </div>
        </:example>
        <:code>{menu_item_3_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="With meta" id="menu_4">
        <:example>
          <div class="w-56">
            <MenuItem>
              <Lego.Title>Your value</Lego.Title>
              <span class="text-moon-12 text-trunks">Meta</span>
            </MenuItem>
          </div>
          <div class="w-56">
            <MenuItem>
              <ControlsChevronRight class="text-[1.5rem]" />
              <Lego.Title>Your value</Lego.Title>
              <span class="text-moon-12 text-trunks">Meta</span>
            </MenuItem>
          </div>
        </:example>
        <:code>{menu_item_4_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Checkbox" id="menu_5">
        <:example>
          <div class="w-56">
            <MenuItem role="checkbox" title="Your value" on_click="on_select1" is_selected={@selected1} />
          </div>
          <div class="w-56">
            <MenuItem role="checkbox" on_click="on_select0" is_selected={@selected0}>
              <Lego.Title>Your value</Lego.Title>
              <Lego.Checkbox />
            </MenuItem>
          </div>
        </:example>
        <:code>{menu_item_5_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Radio" id="menu_9">
        <:example>
          <div class="w-56">
            <MenuItem role="radio" on_click="on_select3" is_selected={@selected3}>
              <Lego.Radio />
              <Lego.Title>Your value</Lego.Title>
            </MenuItem>
          </div>
          <div class="w-56">
            <MenuItem role="radio" on_click="on_select4" is_selected={@selected4}>
              <Lego.Title>Your value</Lego.Title>
              <Lego.Radio />
            </MenuItem>
          </div>
        </:example>
        <:code>{menu_item_9_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="MultiTitle" id="menu_6">
        <:example>
          <div class="w-56">
            <MenuItem>
              <span class="px-2">
                <ControlsChevronRight class="text-[1.5rem]" />
              </span>
              <Lego.MultiTitle title="Your value">
                Lorem Ipsum is simply dummy text of the printing and typesetting industry
              </Lego.MultiTitle>
              <span class="text-moon-12 text-trunks">Meta</span>
            </MenuItem>
          </div>
          <div class="w-56">
            <MenuItem role="checkbox" on_click="on_select2" is_selected={@selected2}>
              <span class="px-2">
                <SportBadminton class="text-[1.5rem]" />
              </span>
              <Lego.MultiTitle title="Your value">
                Lorem Ipsum is simply dummy text of the printing and typesetting industry
              </Lego.MultiTitle>
              <Lego.Checkbox />
            </MenuItem>
          </div>
        </:example>
        <:code>{menu_item_6_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Multi Line Items" id="menu_7">
        <:example>
          <div class="w-94 bg-gohan flex flex-col gap-3 rounded-moon-s-lg p-6">
            <MenuItem is_active>
              <span class="bg-piccolo/20 rounded-lg w-10 h-10 flex justify-center items-center">
                <TravelAirplane class="text-2xl text-piccolo" />
              </span>
              <Lego.MultiTitle title="Job Board" text="find your dream design job" />
            </MenuItem>
            <MenuItem>
              <span class="bg-chichi/20 rounded-lg w-10 h-10 flex justify-center items-center">
                <TravelBill class="text-2xl text-chichi" />
              </span>
              <Lego.MultiTitle title="Freelance Projects" text="An exclusive list for contract work" />
            </MenuItem>
            <hr class="w-80 border-px border-solid border-beerus left-6 top-40  self-stretch">
            <MenuItem>
              <span class="bg-raditz/20 rounded-lg w-10 h-10 flex justify-center items-center">
                <GenericLoyalty class="text-2xl text-raditz" />
              </span>
              <Lego.MultiTitle
                title="Want freelance design projects?"
                text="Get new leads in your inbox every day"
              />
            </MenuItem>
            <MenuItem>
              <span class="bg-frieza/20 rounded-lg w-10 h-10 flex justify-center items-center">
                <DevicesJoystick class="text-2xl text-frieza" />
              </span>
              <Lego.MultiTitle
                title="Personalized your profile with video"
                text="Introduce yourself to new clients with Pitch"
              />
            </MenuItem>
          </div>
        </:example>
        <:code>{menu_item_7_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Expand collapse" id="menu_8">
        <:example>
          <div class="w-56 bg-gohan flex flex-col gap-2 rounded-moon-s-lg p-4">
            <MenuItem>Vision</MenuItem>
            <MenuItem>Getting started</MenuItem>
            <MenuItem>How to contribute?</MenuItem>
            <MenuItem>Colours palette</MenuItem>
            <MenuItem>Tokens</MenuItem>
            <MenuItem>Transform SVG</MenuItem>
            <MenuItem>Manifest</MenuItem>
            <MenuItem role="switch" is_selected={@expanded0} title="Tailwind" on_click="on_expand0" />
            {#if @expanded0}
              <MenuItem>
                <span class="w-6" />
                <Lego.Title>
                  Accordion</Lego.Title>
              </MenuItem>
              <MenuItem>
                <span class="w-6" />
                <Lego.Title>
                  Avatar</Lego.Title>
              </MenuItem>
              <MenuItem>
                <span class="w-6" />
                <Lego.Title>
                  Breadcrumb</Lego.Title>
              </MenuItem>
              <MenuItem>
                <span class="w-6" />
                <Lego.Title>
                  Button</Lego.Title>
              </MenuItem>
              <MenuItem>
                <span class="w-6" />
                <Lego.Title>
                  Checkbox</Lego.Title>
              </MenuItem>
            {/if}
          </div>
          <div class="w-56 bg-gohan flex flex-col gap-2 rounded-moon-s-lg p-4">
            <MenuItem>
              <span class="bg-goku w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                <p class="leading-4 font-semibold text-moon-10">B</p>
              </span>
              <Lego.Title>
                <p class="leading-6 text-moon-14 font-semibold">Bitcasino</p>
              </Lego.Title>
            </MenuItem>
            <MenuItem>
              <span class="w-3" :on-click="on_expand1" :values={is_selected: !@expanded1}>
                <ControlsChevronDown :if={!@expanded1} />
                <ControlsChevronUp :if={@expanded1} />
              </span>

              <span class="bg-goku w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                <p class="leading-4 font-semibold text-moon-10">CX</p>
              </span>
              <Lego.Title>
                Customer...</Lego.Title>
            </MenuItem>
            {#if @expanded1}
              <MenuItem>
                <span class="w-6" />
                <span class="bg-goku w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                  <p class="leading-4 font-semibold text-moon-10">S</p>
                </span>
                <Lego.Title>Sub nested item</Lego.Title>
              </MenuItem>
              <MenuItem>
                <span class="w-6" />
                <span class="bg-goku w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                  <p class="leading-4 font-semibold text-moon-10">S</p>
                </span>
                <Lego.Title>Sub nested item</Lego.Title>
              </MenuItem>
            {/if}
            <MenuItem>
              <span class="w-3" />
              <span class="bg-goku w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                <p class="leading-4 font-semibold text-moon-10">CX</p>
              </span>
              <Lego.Title>Quality...</Lego.Title>
            </MenuItem>
            <MenuItem>
              <span class="w-3" />
              <span class="bg-goku w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                <p class="leading-4 font-semibold text-moon-10">RG</p>
              </span>
              <Lego.Title>Responsible...</Lego.Title>
            </MenuItem>
            <MenuItem>
              <span class="w-3" :on-click="on_expand2" :values={is_selected: !@expanded2}>
                <Lego.ChevronUpDown is_selected={@expanded2} />
              </span>
              <span class="bg-goku w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                <p class="leading-4 font-semibold text-moon-10">RG</p>
              </span>
              <Lego.Title>Responsible...</Lego.Title>
            </MenuItem>
            {#if @expanded2}
              <MenuItem>
                <span class="w-6" />
                <span class="bg-goku w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                  <p class="leading-4 font-semibold text-moon-10">S</p>
                </span>
                <Lego.Title>Sub nested item</Lego.Title>
              </MenuItem>
              <MenuItem>
                <span class="w-6" />
                <span class="bg-goku w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                  <p class="leading-4 font-semibold text-moon-10">S</p>
                </span>
                <Lego.Title>Sub nested item</Lego.Title>
              </MenuItem>
            {/if}
            <div class="flex flex-col gap-2 rounded-moon-s-lg">
              <MenuItem>
                <span class="bg-goku w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                  <p class="leading-4 font-semibold text-moon-10">S</p>
                </span>
                <Lego.Title>
                  <p class="leading-6 text-moon-14 font-semibold">Sportsbet</p>
                </Lego.Title>
              </MenuItem>
              <MenuItem>
                <span class="w-3" />
                <span class="bg-goku w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                  <p class="leading-4 font-semibold text-moon-10">RG</p>
                </span>
                <Lego.Title>Customer...</Lego.Title>
              </MenuItem>
              <MenuItem>
                <span class="w-3" />
                <span class="bg-goku w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                  <p class="leading-4 font-semibold text-moon-10">CX</p>
                </span>
                <Lego.Title>Quality...</Lego.Title>
              </MenuItem>
              <MenuItem>
                <span class="w-3" />
                <span class="bg-goku w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                  <p class="leading-4 font-semibold text-moon-10">RG</p>
                </span>
                <Lego.Title>Responsible...</Lego.Title>
              </MenuItem>
            </div>
            <div class="flex flex-col gap-2 rounded-moon-s-lg">
              <MenuItem>
                <span class="bg-goku w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                  <p class="leading-4 font-semibold text-moon-10">L</p>
                </span>
                <Lego.Title>
                  <p class="leading-6 text-moon-14 font-semibold">Livecasino</p>
                </Lego.Title>
              </MenuItem>
              <MenuItem>
                <span class="w-3" />
                <span class="bg-goku w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                  <p class="leading-4 font-semibold text-moon-10">RG</p>
                </span>
                <Lego.Title>Customer...</Lego.Title>
              </MenuItem>
            </div>
          </div>
        </:example>
        <:code>{menu_item_8_code()}</:code>
      </ExampleAndCode>

      <PropsTable title="MenuItem props" data={@props_info_array} />
    </Page>
    """
  end

  defp menu_item_1_code(), do: "<MenuItem/>Menu item text</MenuItem>"
  defp menu_item_2_code(), do: "<MenuItem as={:a}/>Menu item text</MenuItem>"

  defp menu_item_3_code() do
    """
    <div class="w-56">
      <MenuItem>
        <Moon.Icons.SportBadminton class="text-[1.5rem]" />
        <Lego.Title>Left shuttlecock</Lego.Title>
      </MenuItem>
    </div>
    <div class="w-56">
      <MenuItem>
        # attr title is used when no default slot is given to Lego.Title component
        <Lego.Title title="Right shuttlecock" />
        <Moon.Icons.SportBadminton class="text-[1.5rem]" />
      </MenuItem>
    </div>
    """
  end

  defp menu_item_4_code() do
    """
    <div class="w-56">
      <MenuItem>
        <Lego.Title>Your value</Lego.Title>
        <span class="text-moon-12 text-trunks">Meta</span>
      </MenuItem>
    </div>
    <div class="w-56">
      <MenuItem>
        <ControlsChevronRight class="text-[1.5rem]" />
        <Lego.Title>Your value</Lego.Title>
        <span class="text-moon-12 text-trunks">Meta</span>
      </MenuItem>
    </div>
    """
  end

  defp menu_item_5_code() do
    """
    data selected0, :boolean, default: false
    data selected1, :boolean, default: true

    def render(assigns) do
      ~F\"""
      <div class="w-56">
        <MenuItem role="checkbox" on_click="on_select1" is_selected={@selected1}>
          <Lego.Checkbox/>
          <Lego.Title>Your value</Lego.Title>
        </MenuItem>
      </div>
      <div class="w-56">
        <MenuItem role="checkbox" on_click="on_select0" is_selected={@selected0}>
          <Lego.Title>Your value</Lego.Title>
          <Lego.Checkbox />
        </MenuItem>
      </div>
      \"""
    end

    def handle_event("selected0, params, socket) do
      {:noreply, assign(socket, :selected0, Map.has_key?(params, "is_selected"))}
    end

    def handle_event("selected1, params, socket) do
      {:noreply, assign(socket, :selected1, Map.has_key?(params, "is_selected"))}
    end
    """
  end

  defp menu_item_9_code() do
    """
    data selected0, :boolean, default: false
    data selected1, :boolean, default: true

    def render(assigns) do
      ~F\"""
      <div class="w-56">
        <MenuItem role="radio" on_click="on_select1"  is_selected={@selected1}>
          <Lego.Radio />
          <Lego.Title>Your value</Lego.Title>
        </MenuItem>
      </div>
      <div class="w-56">
        <MenuItem role="radio" on_click="on_select0" is_selected={@selected0}>
          <Lego.Title>Your value</Lego.Title>
          <Lego.Radio />
        </MenuItem>
      </div>
      \"""
    end

    def handle_event("selected0, params, socket) do
      {:noreply, assign(socket, :selected0, Map.has_key?(params, "is_selected"))}
    end

    def handle_event("selected1, params, socket) do
      {:noreply, assign(socket, :selected1, Map.has_key?(params, "is_selected"))}
    end
    """
  end

  defp menu_item_6_code() do
    """
    <div class="w-56">
      <MenuItem>
        <span class="px-2">
          <ControlsChevronRight class="text-[1.5rem]" />
        </span>
        <Lego.MultiTitle title="Your value">
          Lorem Ipsum is simply dummy text of the printing and typesetting industry
        </Lego.MultiTitle>
        <span class="text-moon-12 text-trunks">Meta</span>
      </MenuItem>
    </div>
    <div class="w-56">
      <MenuItem>
        <span class="px-2">
          <SportBadminton class="text-[1.5rem]" />
        </span>
        <Lego.MultiTitle title="Your value">
          Lorem Ipsum is simply dummy text of the printing and typesetting industry
        </Lego.MultiTitle>
        <Lego.Checkbox />
      </MenuItem>
    </div>

    # please note that text property is used when no slot is given, e.g. flowing lines are equal
    # <Lego.MultiTitle title="Your value" text="Lorem Ipsum Dolor" />
    # <Lego.MultiTitle title="Your value">Lorem Ipsum Dolor</Lego.MultiTitle>
    """
  end

  defp menu_item_7_code() do
    """
    <div class="w-94 bg-gohan flex flex-col gap-3 rounded-moon-s-lg p-6">
      <MenuItem is_active>
        <span class="bg-piccolo/20 rounded-lg w-10 h-10 flex justify-center items-center">
          <TravelAirplane class="text-2xl" color="#4E46B4" />
        </span>
        <Lego.MultiTitle
          title="Job Board"
          text="find your dream design job"
        />
      </MenuItem>
      <MenuItem>
        <span class="bg-[#3448F01F]/20 rounded-lg w-10 h-10 flex justify-center items-center">
          <TravelBill class="text-2xl" color="#3448F0" />
        </span>
        <Lego.MultiTitle
          title="Freelance Projects"
          text="An exclusive list for contract work"
        />
      </MenuItem>
      <hr class="w-80 border-px border-solid border-beerus left-6 top-40  self-stretch" />
      <MenuItem>
        <span class="bg-[#FFB3191F]/20 rounded-lg w-10 h-10 flex justify-center items-center">
          <GenericLoyalty class="text-2xl" color="#FFB319" />
        </span>
        <Lego.MultiTitle
          title="Want freelance design projects?"
          text="Get new leads in your inbox every day"
        />
      </MenuItem>
      <MenuItem>
        <span class="bg-[#FF4E641F]/20 rounded-lg w-10 h-10 flex justify-center items-center">
          <DevicesJoystick class="text-2xl" color="#FF4E64" />
        </span>
        <Lego.MultiTitle
          title="Personalized your profile with video"
          text="Introduce yourself to new clients with Pitch"
        />
      </MenuItem>
    </div>
    """
  end

  defp menu_item_8_code() do
    """
    <div class="w-56 bg-gohan flex flex-col gap-2 rounded-moon-s-lg p-4">
      <MenuItem>Vision</MenuItem>
      <MenuItem>Getting started</MenuItem>
      <MenuItem>How to contribute?</MenuItem>
      <MenuItem>Colours palette</MenuItem>
      <MenuItem>Tokens</MenuItem>
      <MenuItem>Transform SVG</MenuItem>
      <MenuItem>Manifest</MenuItem>
      <MenuItem role="switch" is_selected={@expanded0} title="Tailwind" on_click="on_expand0"/>
      {#if @expanded0}
        <MenuItem>
          <span class="w-6"/>
          <Lego.Title>
            Accordion</Lego.Title>
        </MenuItem>
        <MenuItem>
          <span class="w-6"/>
          <Lego.Title>
            Avatar</Lego.Title>
        </MenuItem>
        <MenuItem>
          <span class="w-6"/>
          <Lego.Title>
            Breadcrumb</Lego.Title>
        </MenuItem>
        <MenuItem>
          <span class="w-6"/>
          <Lego.Title>
            Button</Lego.Title>
        </MenuItem>
        <MenuItem>
          <span class="w-6"/>
          <Lego.Title>
            Checkbox</Lego.Title>
        </MenuItem>
      {/if}
      </div>
      <div class="w-56 bg-gohan flex flex-col gap-2 rounded-moon-s-lg p-4">
      <MenuItem>
        <span class="bg-goku w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
          <p class="leading-4 font-semibold text-moon-10">B</p>
        </span>
        <Lego.Title>
          <p class="leading-6 text-moon-14 font-semibold">Bitcasino</p>
        </Lego.Title>
      </MenuItem>
      <MenuItem>
        <span class="w-3" :on-click="on_expand1" :values={is_selected: !@expanded1}>
          <ControlsChevronDown :if={!@expanded1}/>
          <ControlsChevronUp :if={@expanded1} />
        </span>

        <span class="bg-goku w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
          <p class="leading-4 font-semibold text-moon-10">CX</p>
        </span>
        <Lego.Title>
          Customer...</Lego.Title>
      </MenuItem>
      {#if @expanded1}
        <MenuItem>
          <span class="w-6"/>
          <span class="bg-goku w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
            <p class="leading-4 font-semibold text-moon-10">S</p>
          </span>
          <Lego.Title>Sub nested item</Lego.Title>
        </MenuItem>
        <MenuItem>
          <span class="w-6"/>
          <span class="bg-goku w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
            <p class="leading-4 font-semibold text-moon-10">S</p>
          </span>
          <Lego.Title>Sub nested item</Lego.Title>
        </MenuItem>
      {/if}
      <MenuItem>
        <span class="w-3"/>
        <span class="bg-goku w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
          <p class="leading-4 font-semibold text-moon-10">CX</p>
        </span>
        <Lego.Title>Quality...</Lego.Title>
      </MenuItem>
      <MenuItem>
        <span class="w-3"/>
        <span class="bg-goku w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
          <p class="leading-4 font-semibold text-moon-10">RG</p>
        </span>
        <Lego.Title>Responsible...</Lego.Title>
      </MenuItem>
      <MenuItem>
        <span class="w-3" :on-click="on_expand2" :values={is_selected: !@expanded2}>
          <Lego.ChevronUpDown is_selected={@expanded2}/>
        </span>
        <span class="bg-goku w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
          <p class="leading-4 font-semibold text-moon-10">RG</p>
        </span>
        <Lego.Title>Responsible...</Lego.Title>
      </MenuItem>
      {#if @expanded2}
        <MenuItem>
          <span class="w-6" />
          <span class="bg-goku w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
            <p class="leading-4 font-semibold text-moon-10">S</p>
          </span>
          <Lego.Title>Sub nested item</Lego.Title>
        </MenuItem>
        <MenuItem>
          <span class="w-6" />
          <span class="bg-goku w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
            <p class="leading-4 font-semibold text-moon-10">S</p>
          </span>
          <Lego.Title>Sub nested item</Lego.Title>
        </MenuItem>
      {/if}
      <div class="flex flex-col gap-2 rounded-moon-s-lg">
        <MenuItem>
          <span class="bg-goku w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
            <p class="leading-4 font-semibold text-moon-10">S</p>
          </span>
          <Lego.Title>
            <p class="leading-6 text-moon-14 font-semibold">Sportsbet</p>
          </Lego.Title>
        </MenuItem>
        <MenuItem>
          <span class="w-3"/>
          <span class="bg-goku w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
            <p class="leading-4 font-semibold text-moon-10">RG</p>
          </span>
          <Lego.Title>Customer...</Lego.Title>
        </MenuItem>
        <MenuItem>
          <span class="w-3"/>
          <span class="bg-goku w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
            <p class="leading-4 font-semibold text-moon-10">CX</p>
          </span>
          <Lego.Title>Quality...</Lego.Title>
        </MenuItem>
        <MenuItem>
          <span class="w-3"/>
          <span class="bg-goku w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
            <p class="leading-4 font-semibold text-moon-10">RG</p>
          </span>
          <Lego.Title>Responsible...</Lego.Title>
        </MenuItem>
      </div>
      <div class="flex flex-col gap-2 rounded-moon-s-lg">
        <MenuItem>
          <span class="bg-goku w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
            <p class="leading-4 font-semibold text-moon-10">L</p>
          </span>
          <Lego.Title>
            <p class="leading-6 text-moon-14 font-semibold">Livecasino</p>
          </Lego.Title>
        </MenuItem>
        <MenuItem>
          <span class="w-3"/>
          <span class="bg-goku w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
            <p class="leading-4 font-semibold text-moon-10">RG</p>
          </span>
          <Lego.Title>Customer...</Lego.Title>
        </MenuItem>
      </div>
    </div>
    """
  end

  def handle_event("on_select" <> number, params, socket) do
    {:noreply, assign(socket, :"selected#{number}", Map.get(params, "is-selected") == "true")}
  end

  def handle_event("on_expand" <> number, params, socket) do
    {:noreply, assign(socket, :"expanded#{number}", Map.get(params, "is-selected") == "true")}
  end

  def component_anatomy do
    """
    <MenuItem>...</MenuItem>
    """
  end
end
