defmodule MoonWeb.Pages.Components.MenuItemPage do
  @moduledoc false
  use MoonWeb, :live_view

  alias Moon.Components.MenuItem
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
    ControlsChevronDown
  }

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/menu",
        name: "MenuItem"
      }
    ]
  )

  data(props_info_array, :list,
    default: [
      %{
        :name => 'color',
        :type => 'string',
        :required => 'false',
        :default => 'bulma-100',
        :description => 'Colour of Loader'
      },
      %{
        :name => 'size',
        :type => 'twoxsmall | xsmall | small | medium | large',
        :required => 'false',
        :default => 'medium',
        :description => 'Size of Loader'
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="MenuItem">
        <p>Menu items are used in such vertical menues and containers as Popovers, Sidebars, Drawers, Dialogs etc.</p>
        <p>
          Menu item row heights can vary based on the amount of content in each row. The content in each row is flexible.
          By default, each menu item row height is Medium(md) 40px for one line of content.
        </p>
      </ComponentPageDescription>

      <ExampleAndCode title="Default" id="menu_1">
        <:example>
          <MenuItem>Menu item text</MenuItem>
        </:example>

        <:code>{menu_item_1_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="As link" id="menu_2">
        <:example>
          <MenuItem as={:a}>Menu item text</MenuItem>
        </:example>

        <:code>{menu_item_2_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="With icon" id="menu_3">
        <:example>
          <div class="w-56">
            <MenuItem>
              <SportBadminton class="text-[1.5rem]" />
              <MenuItem.Title>Your value</MenuItem.Title>
            </MenuItem>
          </div>
          <div class="w-56">
            <MenuItem>
              <MenuItem.Title>Your value</MenuItem.Title>
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
              <MenuItem.Title>Your value</MenuItem.Title>
              <span class="text-moon-12 text-trunks-100">Meta</span>
            </MenuItem>
          </div>
          <div class="w-56">
            <MenuItem>
              <ControlsChevronRight class="text-[1.5rem]" />
              <MenuItem.Title>Your value</MenuItem.Title>
              <span class="text-moon-12 text-trunks-100">Meta</span>
            </MenuItem>
          </div>
        </:example>
        <:code>{menu_item_4_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Checkbox" id="menu_5">
        <:example>
          <div class="w-56">
            <MenuItem>
              <MenuItem.Checkbox />
              <MenuItem.Title>Your value</MenuItem.Title>
            </MenuItem>
          </div>
          <div class="w-56">
            <MenuItem>
              <MenuItem.Title>Your value</MenuItem.Title>
              <MenuItem.Checkbox />
            </MenuItem>
          </div>
        </:example>
        <:code>{menu_item_5_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="MultiTitle" id="menu_6">
        <:example>
          <div class="w-56">
            <MenuItem>
              <ControlsChevronRight class="text-[1.5rem]" />
              <MenuItem.MultiTitle title="Your value">
                Lorem Ipsum is simply dummy text of the printing and typesetting industry
              </MenuItem.MultiTitle>
              <span class="text-moon-12 text-trunks-100">Meta</span>
            </MenuItem>
          </div>
          <div class="w-56">
            <MenuItem>
              <ControlsChevronRight class="text-[1.5rem]" />
              <MenuItem.MultiTitle title="Your value">
                Lorem Ipsum is simply dummy text of the printing and typesetting industry
              </MenuItem.MultiTitle>
              <MenuItem.Checkbox />
            </MenuItem>
          </div>
        </:example>
        <:code>{menu_item_6_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Multi Line Items" id="menu_7">
        <:example>
          <div class="w-94 bg-gohan-100 flex flex-col gap-3 rounded-moon-s-lg p-6">
            <MenuItem is_active>
              <span class="bg-piccolo/20 rounded-lg w-10 h-10 flex justify-center items-center">
                <TravelAirplane class="text-2xl" color="#4E46B4" />
              </span>
              <MenuItem.MultiTitle title="Job Board" text="find your dream design job" />
            </MenuItem>
            <MenuItem>
              <span class="bg-[#3448F01F]/20 rounded-lg w-10 h-10 flex justify-center items-center">
                <TravelBill class="text-2xl" color="#3448F0" />
              </span>
              <MenuItem.MultiTitle title="Freelance Projects" text="An exclusive list for contract work" />
            </MenuItem>
            <hr class="w-80 border-px border-solid border-beerus left-6 top-40  self-stretch">
            <MenuItem>
              <span class="bg-[#FFB3191F]/20 rounded-lg w-10 h-10 flex justify-center items-center">
                <GenericLoyalty class="text-2xl" color="#FFB319" />
              </span>
              <MenuItem.MultiTitle
                title="Want freelance design projects?"
                text="Get new leads in your inbox every day"
              />
            </MenuItem>
            <MenuItem>
              <span class="bg-[#FF4E641F]/20 rounded-lg w-10 h-10 flex justify-center items-center">
                <DevicesJoystick class="text-2xl" color="#FF4E64" />
              </span>
              <MenuItem.MultiTitle
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
          <div class="w-56 bg-gohan-100 flex flex-col gap-2 rounded-moon-s-lg p-4">
            <MenuItem>Vision</MenuItem>
            <MenuItem>Getting started</MenuItem>
            <MenuItem>How to contribute?</MenuItem>
            <MenuItem>Colours palette</MenuItem>
            <MenuItem>Tokens</MenuItem>
            <MenuItem>Transform SVG</MenuItem>
            <MenuItem>Manifest</MenuItem>
            <MenuItem>
              Tailwind
              <ControlsChevronDown />
            </MenuItem>

            <MenuItem>
              <ControlsChevronDown class="w-6" color="transparent" />
              <MenuItem.Title>
                Accordion</MenuItem.Title>
            </MenuItem>
            <MenuItem>
              <ControlsChevronDown class="w-6" color="transparent" />
              <MenuItem.Title>
                Avatar</MenuItem.Title>
            </MenuItem>
            <MenuItem>
              <ControlsChevronDown class="w-6" color="transparent" />
              <MenuItem.Title>
                Breadcrumb</MenuItem.Title>
            </MenuItem>
            <MenuItem>
              <ControlsChevronDown class="w-6" color="transparent" />
              <MenuItem.Title>
                Button</MenuItem.Title>
            </MenuItem>
            <MenuItem>
              <ControlsChevronDown class="w-6" color="transparent" />
              <MenuItem.Title>
                Checkbox</MenuItem.Title>
            </MenuItem>
          </div>
          <div class="w-56 bg-gohan-100 flex flex-col gap-2 rounded-moon-s-lg p-4">
            <MenuItem>
              <span class="bg-goku-100 w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                <p class="leading-4 font-semibold text-moon-10">B</p>
              </span>
              <MenuItem.Title>
                <p class="leading-6 text-moon-14 font-semibold">Bitcasino</p>
              </MenuItem.Title>
            </MenuItem>
            <MenuItem>
              <ControlsChevronDown class="w-6" />
              <span class="bg-goku-100 w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                <p class="leading-4 font-semibold text-moon-10">CX</p>
              </span>
              <MenuItem.Title>
                Customer...</MenuItem.Title>
            </MenuItem>

            <MenuItem>
              <ControlsChevronDown class="w-6" color="transparent" />
              <span class="bg-goku-100 w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                <p class="leading-4 font-semibold text-moon-10">S</p>
              </span>
              <MenuItem.Title>Sub nested item</MenuItem.Title>
            </MenuItem>
            <MenuItem>
              <ControlsChevronDown class="w-6" color="transparent" />
              <span class="bg-goku-100 w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                <p class="leading-4 font-semibold text-moon-10">S</p>
              </span>
              <MenuItem.Title>Sub nested item</MenuItem.Title>
            </MenuItem>

            <MenuItem>
              <ControlsChevronDown class="w-6" color="trunks" />
              <span class="bg-goku-100 w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                <p class="leading-4 font-semibold text-moon-10">CX</p>
              </span>
              <MenuItem.Title>Quality...</MenuItem.Title>
            </MenuItem>
            <MenuItem>
              <ControlsChevronDown class="w-6" color="trunks" />
              <span class="bg-goku-100 w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                <p class="leading-4 font-semibold text-moon-10">RG</p>
              </span>
              <MenuItem.Title>Responsible...</MenuItem.Title>
            </MenuItem>
            <MenuItem>
              <ControlsChevronDown class="w-6" color="trunks" />
              <span class="bg-goku-100 w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                <p class="leading-4 font-semibold text-moon-10">RG</p>
              </span>
              <MenuItem.Title>Responsible...</MenuItem.Title>
            </MenuItem>
            <div class="flex flex-col gap-2 rounded-moon-s-lg">
              <MenuItem>
                <span class="bg-goku-100 w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                  <p class="leading-4 font-semibold text-moon-10">S</p>
                </span>
                <MenuItem.Title>
                  <p class="leading-6 text-moon-14 font-semibold">Sportsbet</p>
                </MenuItem.Title>
              </MenuItem>
              <MenuItem>
                <ControlsChevronDown class="w-6" color="trunks" />
                <span class="bg-goku-100 w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                  <p class="leading-4 font-semibold text-moon-10">RG</p>
                </span>
                <MenuItem.Title>Customer...</MenuItem.Title>
              </MenuItem>
              <MenuItem>
                <ControlsChevronDown class="w-6" color="trunks" />
                <span class="bg-goku-100 w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                  <p class="leading-4 font-semibold text-moon-10">CX</p>
                </span>
                <MenuItem.Title>Quality...</MenuItem.Title>
              </MenuItem>
              <MenuItem>
                <ControlsChevronDown class="w-6" color="trunks" />
                <span class="bg-goku-100 w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                  <p class="leading-4 font-semibold text-moon-10">RG</p>
                </span>
                <MenuItem.Title>Responsible...</MenuItem.Title>
              </MenuItem>
            </div>
            <div class="flex flex-col gap-2 rounded-moon-s-lg">
              <MenuItem>
                <span class="bg-goku-100 w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                  <p class="leading-4 font-semibold text-moon-10">L</p>
                </span>
                <MenuItem.Title>
                  <p class="leading-6 text-moon-14 font-semibold">Livecasino</p>
                </MenuItem.Title>
              </MenuItem>
              <MenuItem>
                <ControlsChevronDown class="w-6" color="trunks" />
                <span class="bg-goku-100 w-6 h-6 top-2 left-2 rounded-full flex justify-center items-center">
                  <p class="leading-4 font-semibold text-moon-10">RG</p>
                </span>
                <MenuItem.Title>Customer...</MenuItem.Title>
              </MenuItem>
            </div>
          </div>
        </:example>
        <:code>{menu_item_8_code()}</:code>
      </ExampleAndCode>

      <PropsTable data={@props_info_array} />
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
        <MenuItem.Title>Left shuttlecock</MenuItem.Title>
      </MenuItem>
    </div>
    <div class="w-56">
      <MenuItem>
        # attr title is used when no default slot is given to MenuItem.Title component
        <MenuItem.Title title="Right shuttlecock" />
        <Moon.Icons.SportBadminton class="text-[1.5rem]" />
      </MenuItem>
    </div>
    """
  end

  defp menu_item_4_code() do
    """
    <div class="w-56">
      <MenuItem>
        <MenuItem.Title>Your value</MenuItem.Title>
        <span class="text-moon-12 text-trunks-100">Meta</span>
      </MenuItem>
    </div>
    <div class="w-56">
      <MenuItem>
        <ControlsChevronRight class="text-[1.5rem]" />
        <MenuItem.Title>Your value</MenuItem.Title>
        <span class="text-moon-12 text-trunks-100">Meta</span>
      </MenuItem>
    </div>
    """
  end

  defp menu_item_5_code() do
    """
    <div class="w-56">
      <MenuItem>
        <MenuItem.Checkbox />
        <MenuItem.Title>Your value</MenuItem.Title>
      </MenuItem>
    </div>
    <div class="w-56">
      <MenuItem>
        <MenuItem.Title>Your value</MenuItem.Title>
        <MenuItem.Checkbox />
      </MenuItem>
    </div>
    """
  end

  defp menu_item_6_code() do
    """
    <div class="w-56">
      <MenuItem>
        <ControlsChevronRight class="text-[1.5rem]" />
        <MenuItem.MultiTitle title="Your value">
          Lorem Ipsum is simply dummy text of the printing and typesetting industry
        </MenuItem.MultiTitle>
        <span class="text-moon-12 text-trunks">Meta</span>
      </MenuItem>
    </div>
    <div class="w-56">
      <MenuItem>
        <ControlsChevronRight class="text-[1.5rem]" />
        <MenuItem.MultiTitle title="Your value">
          Lorem Ipsum is simply dummy text of the printing and typesetting industry
        </MenuItem.MultiTitle>
        <MenuItem.Checkbox />
      </MenuItem>
    </div>

    # please note that text property is default when no slot is given, e.g. it equals
    # <MenuItem.MultiTitle title="Your value" text="Lorem Ipsum is simply dummy text of the printing and typesetting industry" />
    """
  end

  defp menu_item_7_code() do
    """
    <div class="w-94 bg-gohan-100 flex flex-col gap-3 rounded-moon-s-lg p-6">
      <MenuItem is_active>
        <span class="bg-piccolo/20 rounded-lg w-10 h-10 flex justify-center items-center">
          <TravelAirplane class="text-2xl" color="#4E46B4" />
        </span>
        <MenuItem.MultiTitle
          title="Job Board"
          text="find your dream design job"
        />
      </MenuItem>
      <MenuItem>
        <span class="bg-[#3448F01F]/20 rounded-lg w-10 h-10 flex justify-center items-center">
          <TravelBill class="text-2xl" color="#3448F0" />
        </span>
        <MenuItem.MultiTitle
          title="Freelance Projects"
          text="An exclusive list for contract work"
        />
      </MenuItem>
      <hr class="w-80 border-px border-solid border-beerus left-6 top-40  self-stretch" />
      <MenuItem>
        <span class="bg-[#FFB3191F]/20 rounded-lg w-10 h-10 flex justify-center items-center">
          <GenericLoyalty class="text-2xl" color="#FFB319" />
        </span>
        <MenuItem.MultiTitle
          title="Want freelance design projects?"
          text="Get new leads in your inbox every day"
        />
      </MenuItem>
      <MenuItem>
        <span class="bg-[#FF4E641F]/20 rounded-lg w-10 h-10 flex justify-center items-center">
          <DevicesJoystick class="text-2xl" color="#FF4E64" />
        </span>
        <MenuItem.MultiTitle
          title="Personalized your profile with video"
          text="Introduce yourself to new clients with Pitch"
        />
      </MenuItem>
    </div>
    """
  end

  defp menu_item_8_code() do
    """
    """
  end
end
