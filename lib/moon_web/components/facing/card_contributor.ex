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
        class={"relative rounded-moon-s-lg overflow-hidden bg-cover bg-center", get_dimensions(@variant)}
        style={"background-image: url('#{@image_src}')"}
      >
        <p class="list-item absolute bottom-12 pb-2 left-full whitespace-nowrap text-goten-100 text-moon-24 transform origin-bottom-left -rotate-90 z-10 font-semibold">
          {@title}
        </p>
      </div>
      <p class="text-moon-24 mt-2 font-semibold">{@name}</p>
    </div>
    """
  end

  defp get_dimensions(variant) do
    case variant do
      "tall" -> "w-[348px] h-[448px]"
      "tiny" -> "w-[256px] h-[320px]"
      _ -> "w-[384px] h-[384px]"
    end
  end
end
