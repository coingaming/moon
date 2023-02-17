defmodule MoonWeb.Examples.Design.TagExample.Customization do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Design.Tag

  def render(assigns) do
    ~F"""
    <Tag class="rounded-none">Customized</Tag>
    <Tag class="bg-roshi">Customized</Tag>
    <Tag class="bg-roshi-10 text-roshi">Customized</Tag>
    """
  end

  def code() do
    """
    alias Moon.Design.Tag

    ...

    <Tag class="rounded-none">Customized</Tag>
    <Tag class="bg-roshi">Customized</Tag>
    <Tag class="bg-roshi-10 text-roshi">Customized</Tag>
    """
  end
end
