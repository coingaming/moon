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
    has_icons = has_left_icon or has_right_icon
    is_label = not is_nil(assigns.label)
    is_inner_label = is_label and assigns.size == "xl"

    ~F"""
    <div class={
      "h-fit relative flex",
      "ml-4": !has_left_icon,
      "mr-4": !has_right_icon
    }>
      {#if has_value}
        {#if is_inner_label or has_icons}
        <div class={
          "flex flex-col w-full items-center text-moon-16",
          "pl-8": has_left_icon,
          "pr-8": has_right_icon
        }>
          <InnerLabelContent :if={is_inner_label} {=@size} label={@option.label} {=has_icons}/>
          <MainContent label={@option.label} {=has_icons} {=is_inner_label}/>
        </div>

        <div class="absolute top-0 left-0 z-20 w-full h-full flex items-center bg-transparent justify-between">
          <div class="justify-self-start ml-2">
            <Icon icon={@option[:left_icon]} :if={has_left_icon} />
          </div>
          <div class="justify-self-end mr-2">
            <Icon icon={@option[:right_icon]} :if={has_right_icon}/>
          </div>
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
