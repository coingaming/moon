defmodule Moon.Parts.Sidebar.Logo do
  @moduledoc false

  use Moon.StatelessComponent, slot: "logo"

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Additional Tailwind classes"
  prop(svg_class, :css_class)
  @doc "On click event"
  prop(on_click, :event)
  @doc "Source of the svg"
  prop(src, :string, required: true)
  @doc "If is slim sidebar"
  prop(is_slim, :boolean, from_context: :is_slim)

  def render(assigns) do
    ~F"""
    <div class={merge(["flex items-center", @class])} {=@id} data-testid={@testid}>
      <svg
        class={merge([
          [
            "moon-logo h-10 w-[6.5rem] text-bulma hover:text-bulma active:text-bulma focus:text-bulma cursor-pointer",
            "h-10 w-10 self-center": @is_slim
          ],
          @svg_class
        ])}
        :on-click={@on_click}
      >
        <use href={@src} />
      </svg>
    </div>
    """
  end
end
