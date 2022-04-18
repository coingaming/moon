# https://github.com/coingaming/sportsbet-design/blob/develop/packages/components/src/private/label/label.tsx

defmodule Moon.Components.FieldLabel.LabelFlex do
  @moduledoc false

  use Moon.StatelessComponent

  prop(field, :atom)
  prop(for, :string)
  prop(flex, :boolean)
  prop(input_grow, :integer)
  prop(class, :css_class)

  slot(default)

  def render(assigns) do
    ~F"""
    <Surface.Components.Form.Label field={@field} class={@class} opts={for: @for}>
      <#slot />
    </Surface.Components.Form.Label>
    """
  end
end

defmodule Moon.Components.FieldLabel.LabelContent do
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

defmodule Moon.Components.FieldLabel do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.FieldLabel.LabelContent
  alias Moon.Components.FieldLabel.LabelFlex

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

    <LabelFlex
      field={@field}
      for={@for}
      class={@class}
      flex={@flex}
      input_grow={@input_grow}
      :if={!@inline}
    >
      <LabelContent disabled={@disabled} flex={@flex}>
        {@text}
      </LabelContent>
      <#slot />
    </LabelFlex>
    """
  end
end
