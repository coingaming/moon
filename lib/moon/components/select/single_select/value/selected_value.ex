defmodule Moon.Components.Select.SingleSelect.Value.SelectedValue do
  @moduledoc false

  use Moon.StatelessComponent

  alias Phoenix.LiveView.JS

  prop select_id, :string
  prop option, :any
  prop label, :string
  prop size, :string

  def render(assigns) do
    is_icon = not is_nil(assigns.option[:left_icon])
    is_label = not is_nil(assigns.label)

    ~F"""
    {#if @option}
      <div
        class="cursor-pointer"
        :on-click={JS.dispatch("moon:update-select",
          detail: %{value: @option.value, selected: false},
          to: "##{@select_id}"
        )}
      >
        <Moon.Components.Select.SelectedValue.Container
          {=@option}
          {=@size}
          {=@label}
          {=is_icon}
          {=is_label}
        />
      </div>
    {/if}
    """
  end
end
