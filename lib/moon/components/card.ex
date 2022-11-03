defmodule Moon.Components.Card do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.Heading

  prop(title, :string)
  prop(class, :string)
  prop(rounded, :boolean, default: true)

  slot(buttons)
  slot(content, required: true)

  def render(assigns) do
    ~F"""
    <div class={"p-6 bg-gohan-100 #{@class}", rounded: @rounded}>
      <div class="flex items-center justify-between gap-4">
        <Heading size={20}>{@title}</Heading>

        <div class="flex shrink-0 gap-2">
          <#slot {@buttons} />
        </div>
      </div>

      <div class="mt-6 text-moon-14">
        <#slot {@content} />
      </div>
    </div>
    """
  end
end
