defmodule MoonWeb.Components.Facing.Contributors do
  @moduledoc false

  use MoonWeb, :stateless_component
  alias MoonWeb.Components.Facing.SectionTitle
  alias MoonWeb.Components.Facing.FacingReel
  alias MoonWeb.Components.Facing.CardContributor

  def render(assigns) do
    ~F"""
    <div class="flex flex-col gap-12 z-20">
      <SectionTitle title="In the Spotlight." description="The team who design and develop Moon." />
      <FacingReel>
        <CardContributor
          name="Margus Pärt"
          title="Developer"
          image_src="/moon/assets/images/facing/contributors/marguspart.jpeg"
        />
        <CardContributor
          variant="tiny"
          name="Dima Nikolaenko"
          title="Lead Product Designer"
          image_src="/moon/assets/images/facing/contributors/dimanikolaenko.png"
        />
        <CardContributor
          variant="tall"
          name="Karl Kallavus"
          title="Lead Developer"
          image_src="/moon/assets/images/facing/contributors/karlkallavus.png"
        />
        <CardContributor
          variant="tiny"
          name="Dmytro Kireiev"
          title="Product Owner"
          image_src="/moon/assets/images/facing/contributors/dmytrokireiev.jpg"
        />
        <CardContributor
          name="Alexis Azanza"
          title="Developer"
          image_src="/moon/assets/images/facing/contributors/alexisazanza.png"
        />
      </FacingReel>
    </div>
    """
  end
end
