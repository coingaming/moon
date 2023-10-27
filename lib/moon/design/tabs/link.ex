defmodule Moon.Design.Tabs.Link do
  @moduledoc false

  use Moon.StatelessComponent, slot: "tabs"

  # open API
  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "If true, the tab is disabled"
  prop(disabled, :boolean, default: false)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes for unselected tab"
  prop(unselected_class, :css_class, default: "after:scale-x-0 text-bulma")
  @doc "Additional Tailwind classes for selected tab"
  prop(selected_class, :css_class, default: "after:scale-x-100 text-piccolo")
  @doc "Content inside the tab"
  slot(default, required: true)

  # inner API
  @doc "Will be got from Tabs.List in most cases"
  prop(tabindex, :integer, from_context: :tabindex)
  @doc "If tab is selected"
  prop(is_selected, :boolean)
  @doc "Will be got from Tabs.List in most cases"
  prop(size, :string, values!: ~w(sm md), from_context: :size)
  @doc "Href for the link"
  prop(href, :string, required: true)
  @doc "Attributes for the link"
  prop(attrs, :any, default: [])

  def render(assigns) do
    ~F"""
    <a
      {=@id}
      role="tab"
      type="button"
      {=@tabindex}
      aria-selected={"#{is_selected(assigns)}"}
      {=@disabled}
      class={merge([
        "focus:outline-none text-moon-14 font-semibold flex items-center justify-center cursor-pointer",
        "relative after:content-[\"\"] after:absolute after:left-0 after:bottom-0 after:w-full",
        "after:h-[2px] after:bg-piccolo  after:transition-transform after:duration-300 after:origin-top-left after:scale-y-100",
        (@size === "sm" && "px-2 py-1 gap-1") || "py-2 px-3 gap-2",
        (is_selected(assigns) && @selected_class) || @unselected_class,
        (@disabled && "cursor-default text-trunks") ||
          "hover:after:origin-top-left hover:after:scale-100 hover:text-piccolo",
        @class
      ])}
      {=@href}
      value={@tabindex}
      data-testid={@testid}
      {...@attrs}
    ><#slot /></a>
    """
  end

  defp is_selected(_assigns = %{is_selected: is_selected}) do
    # TODO: find a good url-based-way to understand if the tab is selected inside the component wo setting global params
    is_selected
  end
end
