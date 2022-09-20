defmodule Moon.Components.Select.SingleSelect.Value.SelectedValue do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.Select.SingleSelect.Dropdown.Icon
  alias Moon.Components.Label
  alias Moon.Components.Select.Dropdown.Icon
  alias Moon.Components.Select.Helpers, as: SelectHelpers
  alias Moon.Components.Select.SingleSelect.Value.SelectedValue.NoInnerLabelNoIconsContent
  alias Moon.Components.Select.SingleSelect.Value.SelectedValue.InnerLabelNoIconsContent
  alias Moon.Components.Select.SingleSelect.Value.SelectedValue.MainContent
  alias Moon.Components.Select.SingleSelect.Value.SelectedValue.InnerLabelContent
  alias Moon.Components.Select.SingleSelect.Value.SelectedValue.LeftIconContent
  alias Moon.Components.Select.SingleSelect.Value.SelectedValue.RightIconContent

  prop select_id, :string
  prop option, :any
  prop label, :string, default: ""
  prop placeholder, :string, default: ""
  prop size, :string

  def render(assigns) do
    has_value = has_value(assigns.option)
    has_left_icon = has_value && not is_nil(assigns.option[:left_icon])
    has_right_icon = has_value && not is_nil(assigns.option[:right_icon])
    has_icons = has_left_icon or has_right_icon
    is_label = not is_nil(assigns.label)
    is_inner_label = is_label and assigns.size != "xl"

    ~F"""
    <div class="mx-4 h-fit">
      {#if has_value}
        {#if is_inner_label or has_icons}
        <div class={
          "grid grid-rows-2 grid-flow-col": has_icons,
          "pl-12": has_left_icon,
          "pr-12": has_right_icon
        }>
            <LeftIconContent :if={has_left_icon} icon={@option[:left_icon]}/>
            <InnerLabelContent :if={is_inner_label} {=@size} label={@option.label} {=has_icons}/>
            <MainContent label={@option.label} {=has_icons} {=is_inner_label}/>
            <RightIconContent :if={has_right_icon} icon={@option[:right_icon]}/>

          </div>
        {#else}
          <InnerLabelNoIconsContent label={@option.label} />
        {/if}
      {#else}
        <NoInnerLabelNoIconsContent {=@placeholder} />
      {/if}
    </div>
    """
  end

  defp has_value(option) do
    not is_nil(option) and option != "" and option.label != nil and option.label != 0
  end
end
