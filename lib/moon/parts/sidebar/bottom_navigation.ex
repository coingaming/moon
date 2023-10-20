defmodule Moon.Parts.Sidebar.BottomNavigation do
  @moduledoc false

  use Moon.StatelessComponent, slot: "button"

  alias Moon.Icon
  alias Moon.Design.Chip

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Additional Tailwind classes"
  prop(button_class, :css_class)
  @doc "Additional Tailwind classes"
  prop(logo_class, :css_class)
  @doc "Additional Tailwind classes"
  prop(icon_class, :css_class)
  @doc "Source of the svg"
  prop(src, :string, required: true)
  @doc "Icon name"
  prop(icon, :string)
  @doc "Href attribute for Logo"
  prop(href, :string)
  @doc "On click event to open sidebar"
  prop(on_click, :event)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      data-testid={@testid}
      class={merge([
        "fixed bottom-12 z-[9999] justify-center lg:hidden items-center left-1/2 transform -translate-x-1/2 bg-bulma rounded-full flex flex-row p-1 gap-0 h-14 w-[6.5rem]",
        "theme-moon-light",
        @class
      ])}
    >
      <a href={@href}>
        <Chip class={merge([
          "bg-transparent h-12 w-12 px-2 py-2 justify-center items-center rounded-moon-i-xx rounded-full",
          @button_class
        ])}>
          <svg class={merge([
            "moon-logo h-8 w-8 text-goku hover:text-goku active:text-goku focus:text-goku",
            @logo_class
          ])}>
            <use href={@src} />
          </svg>
        </Chip>
      </a>
      <Chip
        class={merge([
          "bg-transparent h-12 w-12 px-2 py-2 justify-center items-center rounded-moon-i-xx rounded-full",
          @button_class
        ])}
        {=@on_click}
      >
        <Icon name={@icon || "generic_menu"} class={merge(["text-moon-24 text-goku", @icon_class])} />
      </Chip>
    </div>
    """
  end
end
