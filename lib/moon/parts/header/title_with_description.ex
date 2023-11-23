defmodule Moon.Parts.Header.TitleWithDescription do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "Id for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Additional Tailwind classes"
  prop(title_class, :css_class)
  @doc "Additional Tailwind classes"
  prop(description_class, :css_class)
  @doc "Conditional displaying due to an issue with named slots in Surface"
  prop(is_hidden, :boolean, default: false)
  @doc "Conditional displaying due to an issue with named slots in Surface"
  prop(breadcrumbs_hidden, :boolean, default: false)
  @doc "Title"
  prop(title, :string, required: true)
  @doc "Default slot"
  slot(default, required: true)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      data-testid={@testid}
      class={merge([
        [
          "w-full text-bulma text-moon-24 font-grotesk p-4 lg:p-8 lg:not-first:pt-0 px-4 pb-6 pt-[5.5rem] flex flex-col gap-3",
          hidden: @is_hidden,
          "lg:not-first:pt-8": @breadcrumbs_hidden
        ],
        @class
      ])}
    >
      <h3 class={merge(["text-moon-32 text-bulma font-grotesk", @title_class])}>{@title}</h3>
      <p class={merge(["text-moon-18 text-trunks", @description_class])}><#slot /></p>
    </div>
    """
  end
end
