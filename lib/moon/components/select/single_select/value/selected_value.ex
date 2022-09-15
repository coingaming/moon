defmodule Moon.Components.Select.SingleSelect.Value.SelectedValue do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.Select.SingleSelect.Dropdown.Icon
  alias Moon.Components.Label
  alias Moon.Components.Select.Dropdown.Icon
  alias Moon.Components.Select.Helpers, as: SelectHelpers

  prop select_id, :string
  prop option, :any
  prop label, :string, default: ""
  prop placeholder, :string, default: ""
  prop size, :string

  def render(assigns) do
    has_left_icon = not is_nil(assigns.option[:left_icon])
    has_right_icon = not is_nil(assigns.option[:right_icon])
    has_icons = has_left_icon or has_right_icon
    is_label = not is_nil(assigns.label)
    is_inner_label = is_label and assigns.size != "xl"

    left_icon_content = ~F"""
      <Icon
        class="grid place-content-center pr-2"
        icon={@option[:left_icon]}
        style="grid-row: span 3 / span 3;"
      />
    """

    inner_label_content = ~F"""
      <div
        class={
          "text-trunks-100",
          SelectHelpers.innerlabel_font_class(@size)
        }
        style={get_style("grid-col": if(has_left_icon, do: "span 2 / span 2"))}
      >
        {@label}
      </div>
    """

    main_content = ~F"""
    <div
      class={
        "text-bulma-100 text-moon-16",
        "mt-[-4px]": has_icons and is_inner_label,
        "col-[_span_3_/_span_2] row-[_span_3_/_span_2]": has_icons and !is_inner_label
      }
    >
      {@option.label}
    </div>
    """

    ~F"""
    {#if has_value(@option)}
      {#if is_inner_label or has_icons}
      <div
        class={"grid grid-rows-2": has_icons}
        style={get_style(
          "grid-auto-flow": if(has_icons, do: "column")
        )}
      >
          {#if has_left_icon}
            {left_icon_content}
          {/if}
          {#if is_inner_label}
            {inner_label_content}
          {/if}

          {main_content}
        </div>
      {#else} <!-- {#if is_inner_label or has_left_icon} -->
        <Label
          class="text-moon-14"
          background_color={@option[:bg]}
          color={@option[:text]}
        >
          {@option.label}
        </Label>
      {/if} <!-- {#if is_inner_label or has_left_icon} -->
    {#else} <!-- {#if has_value(@option)} -->
      <div class="text-trunks-100 text-moon-16">
        {@placeholder}
      </div>
    {/if} <!-- {#if has_value(@option)} -->
    """
  end

  defp has_value(option) do
    option && option.label != nil && option.label != 0
  end
end
