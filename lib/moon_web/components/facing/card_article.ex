defmodule MoonWeb.Components.Facing.CardArticle do
  @moduledoc false

  use MoonWeb, :stateless_component

  prop(variant, :string, values: ["default", "tall", "wide"], default: "default")
  prop(href, :string)
  slot(title)
  slot(section)
  slot(author)

  def render(assigns) do
    ~F"""
    <div>
      <a target="_blank" href={@href}>
        <div class={
          "group relative flex flex-col justify-end pl-6 py-6 bg-goku rounded-moon-s-lg",
          get_class(@variant)
        }>
          <p class="list-item absolute top-10 left-10 transform -rotate-90 origin-bottom-left text-moon-16 font-semibold">
            <#slot {@section} />
          </p>

          <p
            :if={@author}
            class="absolute top-0 right-6 transform -rotate-90 origin-bottom-right text-moon-16 font-semibold"
          >
            <#slot {@author} />
          </p>

          <p class="text-moon-24 font-semibold">
            <#slot {@title} />
          </p>
        </div>
      </a>
    </div>
    """
  end

  defp get_class(variant) do
    case variant do
      "tall" -> "pr-9 w-[288px] h-[448px]"
      "wide" -> "pr-12 w-[448px] h-[288px]"
      _ -> "pr-12 w-[384px] h-[288px]"
    end
  end
end
