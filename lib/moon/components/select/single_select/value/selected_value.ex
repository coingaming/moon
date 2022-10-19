defmodule Moon.Components.Select.SingleSelect.Value.SelectedValue do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.Select.SingleSelect.Dropdown.Icon
  alias Moon.Components.Select.Dropdown.Icon
  alias Moon.Components.Select.SingleSelect.Value.SelectedValue.NoInnerLabelNoIconsContent
  alias Moon.Components.Select.SingleSelect.Value.SelectedValue.InnerLabelNoIconsContent
  alias Moon.Components.Select.SingleSelect.Value.SelectedValue.MainContent
  alias Moon.Components.Select.SingleSelect.Value.SelectedValue.InnerLabelContent

  prop select_id, :string
  prop option, :any
  prop label, :string, default: ""
  prop placeholder, :string, default: ""
  prop size, :string

  def render(assigns) do
    has_value = has_value(assigns.option)
    has_left_icon = has_value && not is_nil(assigns.option[:left_icon])
    has_right_icon = has_value && not is_nil(assigns.option[:right_icon])
    has_option_style = has_value && not is_nil(assigns.option[:class])
    has_icons = has_left_icon or has_right_icon
    is_label = not is_nil(assigns.label)
    is_inner_label = is_label and assigns.size == "xl"

    ~F"""
    <div class="h-fit relative flex">
      {#if has_value}
        {#if is_inner_label or has_icons}
          <div class={
            "flex flex-col w-full items-center text-moon-16",
            "ps-6": has_left_icon,
            "pe-2": has_left_icon && !has_right_icon,
            "pe-6": has_right_icon
          }>
            <InnerLabelContent :if={is_inner_label} {=@label} {=has_icons} />
            <MainContent {=@option} {=@size} {=has_option_style} />
          </div>

          <div class="absolute top-0 left-0 z-20 w-full h-full flex items-center bg-transparent justify-between">
            <div class="justify-self-start items-center">
              <Icon class="flex" icon={@option[:left_icon]} :if={has_left_icon} />
            </div>
            <div class="justify-self-end me-2 items-center">
              <Icon class="flex" icon={@option[:right_icon]} :if={has_right_icon} />
            </div>
          </div>
        {#else}
          <InnerLabelNoIconsContent {=@option} {=@size} {=has_option_style} />
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
