defmodule Moon.Components.PasswordInput do
  @moduledoc false

  use Moon.StatefulComponent
  alias Moon.Components.TextInput

  data hidden, :boolean, default: true

  prop field, :atom
  prop label, :string
  prop value, :string
  prop placeholder, :string
  prop error, :string
  prop rounded, :boolean
  prop disabled, :boolean
  prop required, :boolean
  prop class, :string
  prop focus, :event
  prop blur, :event
  prop background_color, :string, values: Moon.colors(), default: "goku-100"
  prop size, :string, values: ["medium", "large"], default: "large"

  slot left_icon

  def render(assigns) do
    # the reason for if else is left_icon,
    # surface currently does not support conditionals on slots,
    # but hopefully in 0.17 liveview it works
    if slot_assigned?(:left_icon) do
      ~F"""
      <TextInput
        type={@hidden && "password"}
        {=@field}
        {=@label}
        {=@value}
        {=@placeholder}
        {=@error}
        {=@rounded}
        {=@disabled}
        {=@required}
        {=@class}
        {=@focus}
        {=@blur}
        {=@background_color}
        {=@size}
      >
        <:left_icon>
          <#slot name="left_icon" />
        </:left_icon>
        <:right_icon>
          <div style="font-size: 1.2em">
            {#if @hidden}
              <Moon.Icons.ControlsEyeCrossed click="show" />
            {/if}
            {#if !@hidden}
              <Moon.Icons.ControlsEye click="hide" />
            {/if}
          </div>
        </:right_icon>
      </TextInput>
      """
    else
      ~F"""
      <TextInput
        type={@hidden && "password"}
        {=@field}
        {=@label}
        {=@value}
        {=@placeholder}
        {=@error}
        {=@rounded}
        {=@disabled}
        {=@required}
        {=@class}
        {=@focus}
        {=@blur}
        {=@background_color}
        {=@size}
      >
        <:right_icon>
          <div style="font-size: 1.2em">
            {#if @hidden}
              <Moon.Icons.ControlsEyeCrossed click="show" />
            {/if}
            {#if !@hidden}
              <Moon.Icons.ControlsEye click="hide" />
            {/if}
          </div>
        </:right_icon>
      </TextInput>
      """
    end
  end

  def handle_event("show", _, socket) do
    {:noreply, assign(socket, hidden: false)}
  end

  def handle_event("hide", _, socket) do
    {:noreply, assign(socket, hidden: true)}
  end
end
