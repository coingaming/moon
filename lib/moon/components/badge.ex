# https://github.com/coingaming/sportsbet-design/blob/develop/packages/components/src/badge/Badge.ts

defmodule Moon.Components.Badge do
  use Moon.StatelessComponent

  import Moon.Utils.Rem

  prop(color, :string)
  prop(background_color, :string)
  prop(size, :string, default: "xmall", values: ["xsmall", "small"])

  def render(assigns) do
    ~H"""
    {{ asset_import @socket, "js/moon/components/badge" }}

    <span
      class="moon-badge"
      style="
        {{ @color && "color: var(--color--#{@color});" }}
        {{ @background_color && "color: var(--color--#{@background_color});" }}
      "
      data-size={{ @size }}
    >
      <slot />
    </span>
    """
  end
end
