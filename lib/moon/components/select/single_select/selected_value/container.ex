defmodule Moon.Components.Select.SelectedValue.Container do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.Label
  alias Moon.Components.Select.Helpers, as: SelectHelpers
  alias Moon.Components.Select.Dropdown.Icon

  prop option, :any
  prop label, :string
  prop size, :string
  prop is_icon, :boolean, default: false
  prop is_label, :boolean, default: false

  def render(assigns) do
    is_inner_label = assigns.is_label and assigns.size in ~w(large xlarge)

    ~F"""
    {#if is_inner_label or @is_icon}
      <div
        class={"grid grid-rows-1": @is_icon}
        style={get_style("grid-auto-flow": if(@is_icon, do: "column"))}
      >
        {#if @is_icon}
          <Icon
            class="grid place-content-center pr-2"
            icon={@option[:left_icon]}
            style="grid-row: span 3 / span 3;"
          />
        {/if}
        {#if is_inner_label}
          <div
            class={
              "text-trunks-100",
              SelectHelpers.innerlabel_font_class(@size)
            }
            style={get_style("grid-col": if(@is_icon, do: "span 2 / span 2"))}
          >
            {@label}
          </div>
        {/if}
        <div style={get_style(
          "grid-col": if(@is_icon, do: "span 2 / span 2"),
          "grid-row": if(@is_icon, do: "span 2 / span 2")
        )}>
          <Label
            class="text-moon-14"
            background_color={@option[:bg]}
            color={@option[:text]}
          >
            {@option.label}
          </Label>
        </div>
      </div>
    {#else}
      <Label
        class="text-moon-14"
        background_color={@option[:bg]}
        color={@option[:text]}
      >
        {@option.label}
      </Label>
    {/if}
    """
  end
end
