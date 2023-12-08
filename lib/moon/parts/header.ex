defmodule Moon.Parts.Header do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "Id for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "If only Title is given"
  prop(title_only, :boolean)
  @doc "If is table header"
  prop(is_table_header, :boolean, default: false)
  @doc "Default slot"
  slot(default)
  @doc "Buttons slot"
  slot(buttons)
  @doc "Title only slot"
  slot(title)

  def render(assigns) do
    ~F"""
    <header
      {=@id}
      data-testid={@testid}
      class={merge([
        [
          "w-full sticky top-0 bg-goku min-h-[5rem] theme-moon-dark flex flex-col z-10",
          "bg-transparent rounded-3xl": @is_table_header
        ],
        @class
      ])}
    >
      <#slot />
      <#slot
        {@title}
        context_put={
          is_table_header: @is_table_header
        }
      />
      <#slot
        {@buttons}
        context_put={
          title_only: slot_assigned?(:title) && !slot_assigned?(:default)
        }
      />
    </header>
    """
  end
end
