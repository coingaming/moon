defmodule Moon.Components.Accordion.Item do
  use Moon.StatelessComponent
  alias Moon.Components.Heading
  alias Moon.Assets.Icons.IconChevronUp

  prop(click, :event)
  prop(item_id, :string)
  prop(title, :string)
  prop(is_open, :boolean, default: false)
  slot(default)

  def render(assigns) do
    ~F"""
    <div class="bg-gohan-100 p-4 mb-2 rounded-xl relative">
      <div :on-click={@click} phx-value-item_id={@item_id}>
        <Heading class="cursor-pointer">{@title}</Heading>
        <IconChevronUp
          color={(@is_open && "piccolo-100") || "trunks-100"}
          class={"absolute right-4 top-4 text-xs cursor-pointer transition-all transform #{
            (@is_open && "rotate-180") || "rotate-0"
          }"}
        />
      </div>
      <div
        class={"transition-all #{(@is_open && "pt-4 opacity-100") || "pt-0 opacity-0"}"}
        style={"max-height: #{(@is_open && "800px") || "0px"}"}
      >
        <#slot />
      </div>
    </div>
    """
  end
end

defmodule Moon.Components.Accordion do
  use Moon.StatelessComponent

  prop(class, :string)
  slot(default)

  def render(assigns) do
    ~F"""
    {asset_import(@socket, "js/tailwind")}

    <div class={@class}>
      <#slot />
    </div>
    """
  end
end
