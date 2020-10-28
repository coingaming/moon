# https://github.com/coingaming/sportsbet-design/blob/develop/packages/components/src/private/label/label.tsx

defmodule Moon.Components.Label.LabelFlex do
  use Moon.StatelessComponent
  import Moon.Utils.Mq
  import Moon.Utils.Rem

  property(flex, :boolean)
  property(input_grow, :integer)

  def style(%{flex: flex}, %Moon.Theme{breakpoint: %Moon.Theme.Breakpoint{} = breakpoint}) do
    flex &&
      %{
        mq(breakpoint.small) => %{
          display: "flex",
          align_items: "center"
        }
      }
  end

  def render(assigns) do
    class_name = get_class_name("label-flex-#{assigns.flex}-#{assigns.input_grow}")

    ~H"""
    <Context get={{ theme: theme }}>
      <style>
        {{ style(assigns, theme) |> get_css_for_map(".#{class_name}") }}
      </style>

      <label class={{ class_name }}>
        <slot />
      </label>
    </Context>
    """
  end
end

defmodule Moon.Components.Label.LabelContent do
  use Moon.StatelessComponent
  import Moon.Utils.Rem
  import Moon.Utils.Mq

  property(disabled, :boolean)
  property(flex, :boolean)

  def style(%{disabled: disabled, flex: flex}, theme) do
    [
      %{
        display: "block",
        margin_bottom: rem(theme.space.small),
        color: theme.color.trunks_100,
        font_size: rem(theme.space.default)
      },
      flex &&
        %{
          mq(theme.breakpoint.small) => %{
            flex: 1,
            padding_right: rem(theme.space.default),
            margin_bottom: 0
          }
        },
      disabled &&
        %{
          opacity: 0.5
        }
    ]
  end

  def render(assigns) do
    class_name = get_class_name("label-content-#{assigns.disabled}-#{assigns.flex}")

    ~H"""
    <Context get={{ theme: theme }}>
      <style>
        {{ style(assigns, theme) |> get_css_for_maps(".#{class_name}") }}
      </style>

      <span class={{ class_name }}>
        <slot />
      </span>
    </Context>
    """
  end
end

defmodule Moon.Components.Label do
  use Moon.StatelessComponent

  alias Moon.Components.Label.LabelFlex
  alias Moon.Components.Label.LabelContent

  slot(default)

  property(text, :string)
  property(disabled, :boolean)
  property(flex, :boolean)
  property(inline, :boolean)
  property(input_grow, :integer, default: 1)

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
