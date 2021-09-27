# https://github.com/coingaming/sportsbet-design/blob/develop/packages/components/src/private/label/label.tsx

defmodule Moon.Components.Label.LabelFlex do
  use Moon.StatelessComponent

  prop(flex, :boolean)
  prop(input_grow, :integer)
  prop(class, :string)
  slot(default)

  def render(assigns) do
    ~F"""
    <label class={"#{@class}"}>
      <#slot />
    </label>
    """
  end
end

defmodule Moon.Components.Label.LabelContent do
  use Moon.StatelessComponent

  prop(disabled, :boolean)
  prop(flex, :boolean)
  slot(default)

  def render(assigns) do
    ~F"""
    <span>
      <#slot />
    </span>
    """
  end
end

defmodule Moon.Components.Label do
  use Moon.StatelessComponent

  alias Moon.Components.Label.LabelContent
  alias Moon.Components.Label.LabelFlex

  prop(text, :string)
  prop(disabled, :boolean)
  prop(flex, :boolean)
  prop(inline, :boolean)
  prop(input_grow, :integer, default: 1)
  prop(class, :string)
  slot(default)

  def render(assigns) do
    ~F"""
    <label class={@class} :if={@inline}>{@text}</label>

    <LabelFlex class={@class} flex={@flex} input_grow={@input_grow} :if={!@inline}>
      <LabelContent disabled={@disabled} flex={@flex}>
        {@text}
      </LabelContent>
      <#slot />
    </LabelFlex>
    """
  end
end
