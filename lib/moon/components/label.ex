# https://github.com/coingaming/sportsbet-design/blob/develop/packages/components/src/private/label/label.tsx

defmodule Moon.Components.Label.LabelFlex do
  @moduledoc false

  use Moon.StatelessComponent

  prop(field, :atom)
  prop(flex, :boolean)
  prop(input_grow, :integer)
  prop(class, :css_class)

  slot(default)

  def render(assigns) do
    ~F"""
    <Surface.Components.Form.Label field={@field} class={@class}>
      <#slot />
    </Surface.Components.Form.Label>
    """
  end
end

defmodule Moon.Components.Label.LabelContent do
  @moduledoc false

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
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.Label.LabelContent
  alias Moon.Components.Label.LabelFlex

  prop(field, :atom)
  prop(for, :string)
  prop(text, :string)
  prop(disabled, :boolean)
  prop(flex, :boolean)
  prop(inline, :boolean)
  prop(input_grow, :integer, default: 1)
  prop(class, :css_class)
  prop(style, :string)
  slot(default)

  def render(assigns) do
    ~F"""
    <label class={@class} :if={@inline}>{@text}</label>

    <LabelFlex field={@field} class={@class} flex={@flex} input_grow={@input_grow} :if={!@inline}>
      <LabelContent disabled={@disabled} flex={@flex}>
        {@text}
      </LabelContent>
      <#slot />
    </LabelFlex>
    """
  end
end
