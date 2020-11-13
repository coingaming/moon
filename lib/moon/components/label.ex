# https://github.com/coingaming/sportsbet-design/blob/develop/packages/components/src/private/label/label.tsx

defmodule Moon.Components.Label.LabelFlex do
  use Moon.StatelessComponent

  prop(flex, :boolean)
  prop(input_grow, :integer)

  def render(assigns) do
    ~H"""
    <label class="moon-label-flex">
      <slot />
    </label>
    """
  end
end

defmodule Moon.Components.Label.LabelContent do
  use Moon.StatelessComponent

  prop(disabled, :boolean)
  prop(flex, :boolean)

  def render(assigns) do
    ~H"""
    <span class="moon-label-content">
      <slot />
    </span>
    """
  end
end

defmodule Moon.Components.Label do
  use Moon.StatelessComponent

  alias Moon.Components.Label.LabelFlex
  alias Moon.Components.Label.LabelContent

  slot(default)

  prop(text, :string)
  prop(disabled, :boolean)
  prop(flex, :boolean)
  prop(inline, :boolean)
  prop(input_grow, :integer, default: 1)

  def render(assigns) do
    ~H"""
    <label :if={{ @inline }}>{{ @text }}</label>

    <LabelFlex flex={{ @flex }} input_grow={{ @input_grow }} :if={{ !@inline }}>
      <LabelContent disabled={{ @disabled }} flex={{ @flex }}>
        {{ @text }}
      </LabelContent>
      <slot />
    </LabelFlex>
    """
  end
end
