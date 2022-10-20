defmodule MoonWeb.Pages.VisionPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.VisionCard

  data breadcrumbs, :any,
    default: [
      %{
        to: "/vision",
        name: "Vision"
      }
    ]

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <h1 class="relative z-10 text-moon-72 font-semibold max-w-2xl text-bulma-100">
        Build the best products faster
      </h1>
      <div class="relative z-10 flex flex-col gap-6 max-w-2xl">
        <h6 class="text-moon-16 uppercase text-trunks-100">M I S S I O N</h6>
        <p class="text-moon-18 text-bulma-100">
          Create a tool that will reduce the time spent on routine and provide an
          opportunity for inspiration and innovation
        </p>
      </div>
      <div class="relative z-10 flex flex-col gap-16 text-bulma-100">
        <VisionCard
          header_image="/moon/assets/images/facing/vision/vision_front_card_header_text_1.png"
          alt_header_image="Efficiency, not consistency"
          subtext="Consistency is a result of efficiency, not the other way around. When the system is intuitive and empowering to use, consistency becomes an automatic by-product of adoption."
          inner_card_text="A design system isn't a project. It's a product serving products."
          name="Nathan Curtis"
          company="EightShapes"
          user_image="/moon/assets/images/facing/vision/testimonial_1.png"
          heading="Efficiency"
          sub_heading="A Design System ensures maximum returns on time spent on code and design, with minimal wasted energy, in order to achieve the same results."
          supporting_text_items={[
            'It improves the approach, minimising time spent creating products from scratch so it can be better spent solving problems.',
            'It improves code through iteration, which is cheaper than writing quality code from scratch on demand.',
            'It eliminates the need to repeatedly communicate design decisions that are documented and implemented.',
            'It frees teams up from maintaining their own code, which is often duplicated.'
          ]}
        />
        <VisionCard
          header_image="/moon/assets/images/facing/vision/vision_front_card_header_text_2.png"
          alt_header_image="Dynamic capability + stability = agility"
          subtext="Agility needs two things. One is a dynamic capability, the ability to move fast—speed, nimbleness, responsiveness. And agility requires stability, a stable foundation—a platform, if you will—of things that don't change."
          inner_card_text="The more decisions you put off, and the longer you delay them, the more expensive they become."
          name="Craig Villamor"
          company="Google Maps"
          user_image="/moon/assets/images/facing/vision/testimonial_2.png"
          heading="Agility"
          sub_heading="A Design System facilitates a product's agility by preventing stagnation on topics already discussed, agreed upon, documented and implemented."
          supporting_text_items={[
            'It shares the design and coding workload evenly between all team members.',
            "It allows us to create prototypes, experiments and launch MVPs in less time. This makes sure elements like consistency and accessibility aren't ignored in the initial product in order to meet launch times."
          ]}
        />
        <VisionCard
          header_image="/moon/assets/images/facing/vision/vision_front_card_header_text_3.png"
          alt_header_image="Quality over quantity"
          subtext="Focus on the best solutions, quantity become as consolidation of Agility and Efficiency"
          inner_card_text="Styles come and go. Good design is a language, not a style."
          name="Massimo Vignelli"
          company="Italian Designer"
          user_image="/moon/assets/images/facing/vision/testimonial_3.png"
          heading="Quality"
          sub_heading="A Design System provides a systematic approach to managing code quality and design decisions."
          supporting_text_items={[
            'Being in constant evolution through iterations means the quality of each component continues to improve over time, particularly in comparison to new components.',
            'The fact it is a modular, closed and versioned system reduces the risk of losses to both code and design.',
            "It's easily isolated in order to assess its quality and measure its external integration."
          ]}
        />
      </div>
      <div class="fixed top-0 right-0 w-[650px] 2xl:w-[892px] translate-x-1/3 -translate-y-1/3">
        <img src="/moon/assets/images/facing/moon.webp" alt="Moon">
      </div>
    </Page>
    """
  end
end
