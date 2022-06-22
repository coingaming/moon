defmodule MoonWeb.Components.Facing.Updates do
  @moduledoc false

  use MoonWeb, :stateless_component
  alias MoonWeb.Components.Facing.FacingReel
  alias MoonWeb.Components.Facing.CardArticle
  alias MoonWeb.Components.Facing.SectionTitle

  def render(assigns) do
    ~F"""
    <!-- UPDATES -->
    <div class="flex flex-col gap-12 z-40">
      <SectionTitle title="Updates." description="Explore our community features." />
      <FacingReel>
        <CardArticle
          variant="wide"
          href="https://moonds.medium.com/introduction-to-the-world-of-dialogs-and-notifications-ad74d55fff0d"
        >
          <:title>Introduction to the world of dialogs and notifications.</:title>
          <:section>blog</:section>
          <:author>Natalja Saks</:author>
        </CardArticle>
        <CardArticle
          variant="tall"
          href="https://moonds.medium.com/10-guidelines-to-efficiently-display-data-tables-76c8f71af3c3"
        >
          <:title>10 Guidelines to efficiently display data tables.</:title>
          <:section>blog</:section>
          <:author>Ksenia Pavlov</:author>
        </CardArticle>
        <CardArticle href="https://moonds.medium.com/ux-aspect-of-design-system-d51bffd3734c">
          <:title>UX aspect of design system.</:title>
          <:section>blog</:section>
          <:author>Dmytro Nikolaienko</:author>
        </CardArticle>
        <CardArticle variant="wide" href="/gettingStarted">
          <:title>Learn how to get Moon Design System up and running in your project.</:title>
          <:section>tools</:section>
        </CardArticle>
        <CardArticle variant="tall" href="/colours">
          <:title>Customizing color palette for your project.</:title>
          <:section>tools</:section>
        </CardArticle>
      </FacingReel>
    </div>
    """
  end
end
