# https://github.com/coingaming/sportsbet-design/blob/develop/packages/components/src/badge/Badge.ts

defmodule Moon.Components.Badge do
  use Moon.StatelessComponent

  prop(color, :string, values: Moon.colors)
  prop(background_color, :string, values: Moon.colors)
  prop(size, :string, default: "xmall", values: ["xsmall", "small"])

  def render(assigns) do
    ~H"""
    {{ asset_import @socket, "js/components/badge" }}

    <span
      class="moon-badge"
      style="{{ @color && "color: var(--color--#{@color});" }}{{ @background_color && "background-color: var(--color--#{@background_color});" }}"
      data-size={{ @size }}
    >
      <slot />
    </span>
    """
  end
end
