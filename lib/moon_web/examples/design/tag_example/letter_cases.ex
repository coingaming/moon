defmodule MoonWeb.Examples.Design.TagExample.LetterCases do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Design.Tag

  def render(assigns) do
    ~F"""
    <Tag>Default</Tag>
    <Tag is_uppercase={false}>Lowercase</Tag>
    """
  end

  def code() do
    """
    alias Moon.Design.Tag

    ...

    <Tag>Default</Tag>
    <Tag is_uppercase={false}>Lowercase</Tag>
    """
  end
end
