defmodule Moon.Design.Accordion.Content do
  @moduledoc false

  use Surface.Component, slot: "content"

  import Moon.Helpers.MergeClass

  prop(class, :css_class)

  prop(size, :string, values!: ["sm", "md", "lg", "xl"], from_context: :size)
  prop(is_content_outside, :boolean, from_context: :is_content_outside)

  slot(default, required: true)

  def render(assigns) do
    ~F"""
    <div
      role="region"
      class={merge([
        (@is_content_outside &&
           ["overflow-hidden w-full text-bulma text-moon-14", margins(@size)]) ||
          "bg-gohan rounded-moon-s-sm rounded-t-none pb-2 ps-3 pe-2 pt-0 text-moon-14 overflow-hidden w-full text-bulma",
        @class
      ])}
    ><#slot /></div>
    """
  end

  defp margins("xl"), do: "mt-4"
  defp margins("lg"), do: "mt-3"
  defp margins(_), do: "mt-2"
end
