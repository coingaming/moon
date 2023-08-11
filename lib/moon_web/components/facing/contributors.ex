defmodule MoonWeb.Components.Facing.Contributors do
  @moduledoc false

  use MoonWeb, :stateless_component
  alias Moon.Design.Carousel
  alias MoonWeb.Components.Facing.SectionTitle
  alias MoonWeb.Components.Facing.CardContributor

  def render(assigns) do
    ~F"""
    <div class="flex flex-col gap-12 z-20">
      <SectionTitle
        title="In the Spotlight"
        description="The people who design and develop Moon now are"
      />
      <Carousel id="spotlight">
        <Carousel.Reel>
          <CardContributor
            name="Egert Tamm"
            title="Art Director"
            image_src="/moon/assets/images/facing/contributors/etamm.webp"
          />
          <CardContributor
            variant="tall"
            name="Dmytro Kireiev"
            title="Product Owner"
            image_src="/moon/assets/images/facing/contributors/dmytrokireiev.webp"
          />
          <CardContributor
            name="Margus Pärt"
            title="Library author"
            image_src="/moon/assets/images/facing/contributors/mpart.webp"
          />
          <CardContributor
            variant="tall"
            name="Sergey Semenov"
            title="Lead Developer"
            image_src="/moon/assets/images/facing/contributors/ssemenov.webp"
          />
          <CardContributor
            name="Triin Kullisaar"
            title="Developer"
            image_src="/moon/assets/images/facing/contributors/tkullisaar.webp"
          />
        </Carousel.Reel>
      </Carousel>
    </div>
    """
  end
end
