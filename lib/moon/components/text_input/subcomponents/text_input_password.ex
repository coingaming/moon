defmodule Moon.Components.TextInput.TextInputPassword do
  @moduledoc false

  use Moon.StatefulComponent
  alias Moon.Components.TextInput.Container
  alias Moon.Components.TextInput.Password
  alias Moon.Components.TextInput.HintText
  alias Moon.Components.TextInput.Utils
  alias Moon.Components.TextInput.ShowPassword
  alias Moon.Components.ErrorTag

  prop size, :string, values: ["md", "lg", "xl"]
  prop placeholder, :string
  prop is_error, :boolean
  prop dir, :string, values: ["ltr", "rtl"], default: "ltr"
  prop background_color, :string, values: Moon.colors(), default: "gohan-100"
  prop is_first, :boolean
  prop disabled, :boolean
  prop label, :string
  prop required, :boolean
  prop step, :string, default: "1"
  prop readonly, :boolean
  prop value, :string

  prop is_sharp_left_side, :boolean
  prop is_sharp_right_side, :boolean
  prop is_sharp_top_side, :boolean
  prop is_sharp_bottom_side, :boolean
  prop is_top_bottom_border_hidden, :boolean
  prop is_side_border_hidden, :boolean
  prop show_password_text, :string, default: "Show"

  prop focus, :event
  prop keydown, :event
  prop blur, :event

  prop use_error_tag, :boolean

  data password_shown, :boolean, default: false
  data password, :string, default: ""

  slot hint_text_slot

  def render(assigns) do
    ~F"""
    <Container disabled={@disabled} id={@id}>
      {#if @size == "xl"}
        <div
          id={"#{@id}_text_input_password"}
          class={
            "w-full max-w-full relative",
            Utils.get_border_radius(@size),
            "bg-#{@background_color}": @background_color
          }
        >
          <Password
            size={@size}
            is_error={@is_error}
            background_color={@background_color}
            value={@password}
            on_keyup="on_keyup"
            input_password_id={"#{@id}_text_input_password"}
            id={@id}
            with_label={@label}
            type={get_type(@password_shown)}
            focus={@focus}
            keydown={@keydown}
            blur={@blur}
            placeholder={@placeholder}
          />
          <label class={
            "absolute text-[0.75rem] leading-3 text-trunks-199 top-3 z-[3] transition-all",
            "right-4": @dir == "rtl",
            "left-4": @dir == "ltr"
          }>
            {@label}
          </label>
          <ShowPassword
            toggle="toggle_password_visibility"
            is_rtl={is_rtl(@dir)}
            input_password_id={"#{@id}_text_input_password"}
          >
            {@show_password_text}
          </ShowPassword>
        </div>
        <HintText :if={slot_assigned?(:hint_text_slot)} is_error={@is_error}>
          <#slot name="hint_text_slot" />
        </HintText>
        <div class="inline-block mt-2 text-moon-12">
          <ErrorTag :if={@use_error_tag && @is_error} />
        </div>
      {#else}
        <label
          dir={@dir}
          :if={@label}
          class={"block text-moon-16 text-bulma pb-2", "opacity-30 cursor-not-allowed": @disabled}
        >
          {@label}
        </label>
        <div
          id={"#{@id}_text_input_password"}
          class={
            "w-full max-w-full relative",
            Utils.get_border_radius(@size)
          }
        >
          <Password
            size={@size}
            is_error={@is_error}
            background_color={@background_color}
            value={@password}
            on_keyup="on_keyup"
            input_password_id={"#{@id}_text_input_password"}
            id={@id}
            type={get_type(@password_shown)}
            focus={@focus}
            blur={@blur}
            placeholder={@placeholder}
          />

          <ShowPassword
            toggle="toggle_password_visibility"
            is_rtl={is_rtl(@dir)}
            input_password_id={"#{@id}_text_input_password"}
          >
            {@show_password_text}
          </ShowPassword>
        </div>
        <div>
        </div>
        <HintText :if={slot_assigned?(:hint_text_slot)} is_error={@is_error}>
          <#slot name="hint_text_slot" />
        </HintText>
        <div class="inline-block mt-2 text-moon-12">
          <ErrorTag :if={@use_error_tag && @is_error} />
        </div>
      {/if}
    </Container>
    """
  end

  def handle_event("toggle_password_visibility", _, socket) do
    {:noreply, assign(socket, password_shown: !socket.assigns.password_shown)}
  end

  def handle_event("on_keyup", params, socket) do
    {:noreply, assign(socket, password: params["value"])}
  end

  defp get_type(password_shown) do
    if password_shown do
      "text"
    else
      "password"
    end
  end

  defp is_rtl(dir) do
    dir == "rtl"
  end
end
