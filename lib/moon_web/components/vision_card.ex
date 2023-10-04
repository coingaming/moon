defmodule MoonWeb.Components.VisionCard do
  @moduledoc false

  use MoonWeb, :stateless_component

  prop(header_image, :string)
  prop(alt_header_image, :string)
  prop(subtext, :string)
  prop(inner_card_text, :string)
  prop(name, :string)
  prop(company, :string)
  prop(user_image, :string)
  prop(heading, :string)
  prop(sub_heading, :string)
  prop(supporting_text_items, :list)

  def render(assigns) do
    ~F"""
    <div class="flex flex-col 2xl:flex-row items-center gap-8 2xl:gap-18 3xl:gap-36">
      <div class="theme-moon-dark flex flex-col items-center bg-gohan rounded-moon-s-lg gap-14 p-2">
        <div class="flex flex-col gap-14 max-w-lg items-end">
          <img src={@header_image} alt={@alt_header_image}>
          <p class="text-moon-16 max-w-md text-right text-trunks">
            {@subtext}
          </p>
        </div>
        <div class="flex flex-col rounded-moon-s-md py-6 px-8 gap-6 bg-goku">
          <p class="text-moon-32 text-goten">{@inner_card_text}</p>
          <div class="flex items-center gap-2">
            <img src={@user_image} alt="Testimonial">
            <div class="flex flex-col">
              <p class="text-moon-18 text-goten">{@name}</p>
              <p class="text-moon-16 text-trunks">{@company}</p>
            </div>
          </div>
        </div>
      </div>
      <div class="flex flex-col gap-8 max-w-sm">
        <h3 class="text-moon-48 font-semibold">{@heading}</h3>
        <p class="text-moon-20">{@sub_heading}</p>
        <ul class="flex flex-col gap-4 text-moon-18 text-trunks list-disc ms-6">
          {#for item <- @supporting_text_items}
            <li key={item}>{item}</li>
          {/for}
        </ul>
      </div>
    </div>
    """
  end
end
