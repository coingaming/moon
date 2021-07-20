defmodule Moon.Components.Card do
  use Moon.StatelessComponent

  prop title, :string
  prop class, :string

  slot buttons
  slot content, required: true

  def render(assigns) do
    ~F"""
    <div class={"p-6 rounded bg-gohan-100 #{@class}"}>
      <div class="flex items-center justify-between gap-4">
        <h3 class="text-xl font-semibold">{@title}</h3>

        <div class="flex flex-shrink-0 gap-2">
          <#slot name="buttons" />
        </div>
      </div>

      <div class="mt-6 text-sm">
        <#slot name="content" />
      </div>
    </div>
    """
  end

end
