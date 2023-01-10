defmodule Moon.Design.Accordion.Header do
  @moduledoc false

  use Surface.Component, slot: "header"

  alias Moon.Icons.ControlsChevronDown
  import Moon.Helpers.MergeClass

  # public API
  prop(class, :css_class)
  prop(title, :string)
  prop(disabled, :boolean)

  slot(default)

  # internal API
  prop(is_open, :boolean, from_context: :is_open)
  prop(size, :string, values!: ["sm", "md", "lg", "xl"], from_context: :size)
  prop(index, :integer, from_context: :index)
  prop(on_change, :event, from_context: :on_change)
  prop(is_content_outside, :boolean, from_context: :is_content_outside)

  def render(assigns) do
    ~F"""
    <h3 class="w-full">
      <button
        type="button"
        aria-expanded={"#{@is_open}"}
        :on-click={@on_change}
        value={@index}
        {=@disabled}
        class={merge([
          "justify-between flex items-center relative w-full rounded-moon-s-sm",
          "gap-1 flex-1 font-medium text-bulma text-start bg-gohan",
          get_size_class(@size),
          (@disabled && "cursor-not-allowed opacity-30") || "cursor-pointer",
          !@is_content_outside && @is_open && "rounded-b-none",
          @class
        ])}
      >
        <#slot><span>{@title}</span></#slot>
        <ControlsChevronDown class={"text-trunks text-moon-16 transition-transform transition-200", "rotate-180": @is_open} />
      </button>
    </h3>
    """
  end

  defp get_size_class(size) do
    case size do
      "xl" -> "p-4 text-moon-16"
      "lg" -> "p-3 text-moon-14"
      "md" -> "py-2 ps-3 pe-2 text-moon-14"
      _ -> "py-1 ps-3 pe-1 text-moon-14"
    end
  end
end
