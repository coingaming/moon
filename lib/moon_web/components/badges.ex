defmodule Moon.Components.Badges do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.Label

  prop(title, :string)
  prop(color, :string)
  prop(background_color, :string)

  def render(assigns) do
    ~F"""
    <Label
      color={@color}
      background_color={@background_color}
      class="2xs gap-1 select-none py-0 px-2 text-moon-9-caption uppercase font-medium h-4"
    >{@title}</Label>
    """
  end
end

defmodule MoonWeb.Components.Badges.InProgress do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Components.Badges

  def render(assigns) do
    ~F"""
    <Badges title="In progress" color="text-popo" background_color="bg-krillin-60" />
    """
  end
end

defmodule MoonWeb.Components.Badges.AriaSupport do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Components.Badges

  def render(assigns) do
    ~F"""
    <Badges title="ARIA" color="text-goten" background_color="bg-nappa" />
    """
  end
end

defmodule MoonWeb.Components.Badges.Deprecated do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Components.Badges

  def render(assigns) do
    ~F"""
    <Badges title="Deprecated" color="text-popo" background_color="bg-chiChi-60" />
    """
  end
end

defmodule MoonWeb.Components.Badges.RTLSupport do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Components.Badges

  def render(assigns) do
    ~F"""
    <Badges title="RTL" color="text-goten" background_color="bg-whis" />
    """
  end
end
