defmodule Moon.Components.Inline do
  use Moon.StatelessComponent

  prop(space, :string,
    default: "default",
    values: ["xsmall", "small", "default", "medium", "large", "xlarge"]
  )

  prop(font_size, :string)

  def render(assigns) do
    ~H"""
    {{ asset_import @socket, "js/components/inline" }}

    <div
      class="moon-inline"
      style="font-size: {{ @font_size }};"
      data-space={{ @space }}
    >
      <slot />
    </div>
    """
  end
end
