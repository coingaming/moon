defmodule Moon.Components.Inline do
  use Moon.StatelessComponent

  prop(space, :string,
    default: "default",
    values: ["xsmall", "small", "default", "medium", "large", "xlarge"]
  )

  prop(font_size, :string)
  slot(default)

  def render(assigns) do
    ~F"""
    {asset_import @socket, "js/components/inline"}

    <div
      class="moon-inline"
      style={"font-size: #{@font_size};"}
      data-space={@space}
    >
      <#slot />
    </div>
    """
  end
end
