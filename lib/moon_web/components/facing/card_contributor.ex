defmodule MoonWeb.Components.Facing.CardContributor do
  @moduledoc false

  use MoonWeb, :stateless_component

  prop(variant, :string, values: ["default", "tiny", "tall"], default: "default")
  prop(name, :string, required: true)
  prop(title, :string)
  prop(image_src, :string, required: true)

  def render(assigns) do
    ~F"""
    <div class="flex flex-col">
      <div
        class={
          "relative relative w-72 h-96 rounded-moon-s-lg overflow-hidden bg-cover bg-center grayscale",
          get_dimensions(@variant)
        }
        style={"background-image: url('#{@image_src}')"}
      >
        <p class="list-item absolute bottom-12 pb-2 ltr:left-full rtl:right-full whitespace-nowrap text-goten text-moon-24 transform origin-bottom-left -rotate-90 z-10 font-semibold drop-shadow-sm">
          {@title}
        </p>
      </div>
      <p class="text-moon-24 mt-2 font-semibold">{@name}</p>
    </div>
    """
  end

  defp get_dimensions(variant) do
    case variant do
      "tall" -> "md:w-96 md:h-[28rem]"
      "tiny" -> "md:w-64 md:h-80"
      _ -> "md:w-96 md:h-96"
    end
  end
end
