# https://github.com/coingaming/sportsbet-design/blob/develop/packages/components/src/badge/Badge.ts

defmodule Moon.Components.Badge do
  use Moon.StatelessComponent

  prop(color, :string, values: Moon.colors())
  prop(background_color, :string, values: Moon.colors())
  prop(size, :string, default: "xmall", values: ["xsmall", "small"])
  prop(class, :string)
  slot(default)

  def render(assigns) do
    ~H"""
    {{ asset_import @socket, "js/tailwind" }}

    <span
      class="{{ @class }} inline-flex bg-{{ @background_color }} text-{{ @color }} pl-2 pr-2 rounded-full {{ @size == "xsmall" && "text-half" || "text-xs" }} uppercase"
    >
      <slot />
    </span>
    """
  end
end
