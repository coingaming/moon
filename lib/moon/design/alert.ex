defmodule Moon.Design.Alert do
  @moduledoc false

  use Moon.StatelessComponent

  prop(class, :css_class)

  slot(default)
  slot(title)
  slot(message)
  slot(close)

  prop(testid, :string)
  prop(id, :string)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      role="alert"
      class={merge([
        "relative flex justify-between w-full gap-x-3 gap-y-1 p-4 rounded-moon-s-sm bg-gohan",
        "text-moon-14 text-bulma",
        @class
      ])}
      data-testid={@testid}
    >
      <div class="flex flex-col">
        <#slot />
        <#slot {@title} />
        <#slot {@message} />
      </div>
      <#slot {@close} />
    </div>
    """
  end
end
