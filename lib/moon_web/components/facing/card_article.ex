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
          "group relative w-72 h-96 flex flex-col justify-end p-6 bg-goku rounded-moon-s-lg",
          get_class(@variant)
        }>
          <p class="list-item absolute top-10 ltr:left-10 rtl:right-10 transform -rotate-90 origin-bottom-left text-moon-16 font-semibold">
            <#slot {@section} />
          </p>

          <p
            :if={@author}
            class="absolute top-0 ltr:right-6 rtl:left-6 transform -rotate-90 origin-bottom-right text-moon-16 font-semibold"
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
      "tall" -> "md:w-72 md:h-[28rem] md:pe-9"
      "wide" -> "md:w-[28rem] md:h-72 md:pe-12"
      _ -> "md:w-96 md:h-72 md:pe-12"
    end
  end
end
