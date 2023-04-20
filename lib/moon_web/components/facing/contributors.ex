defmodule MoonWeb.Components.Facing.Contributors do
  @moduledoc false

  use MoonWeb, :stateless_component
  alias MoonWeb.Components.Facing.SectionTitle
  alias MoonWeb.Components.Facing.FacingReel
  alias MoonWeb.Components.Facing.CardContributor

  def render(assigns) do
    ~F"""
    <div class="flex flex-col gap-12 z-20">
      <SectionTitle title="In the Spotlight." description="The people who design and develop Moon now are" />
      <FacingReel>
        <CardContributor
          variant="tiny"
          name="Margus Pärt"
          title="Library author"
          image_src="/moon/assets/images/facing/contributors/mpart.jpeg"
        />
        <CardContributor
          variant="tiny"
          name="Sergey Semenov"
          title="Lead Developer"
          image_src="/moon/assets/images/facing/contributors/ssemenov.png"
        />
        <CardContributor
          variant="tiny"
          name="Dmytro Kireiev"
          title="Product Owner"
          image_src="/moon/assets/images/facing/contributors/dmytrokireiev.jpg"
        />
        <CardContributor
          variant="tiny"
          name="Triin Kullisaar"
          title="Developer"
          image_src="/moon/assets/images/facing/contributors/tkullisaar.png"
        />
      </FacingReel>
    </div>
    """
  end
end
