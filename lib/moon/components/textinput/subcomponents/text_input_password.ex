defmodule Moon.Components.TextInput.TextInputPassword do
  @moduledoc false

  use Moon.StatefulComponent
  alias Moon.Components.TextInput.Container
  alias Moon.Components.TextInput.Input
  alias Moon.Components.TextInput.HintText
  alias Moon.Components.TextInput.Utils
  alias Moon.Components.TextInput.ShowPassword
  alias Phoenix.LiveView.JS

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

  data password_shown, :boolean, default: false
  data password, :string, default: ""

  slot hint_text_slot

  def render(assigns) do
    ~F"""
    {get_text_input_normal(assigns)}
    """
  end

  defp get_text_input_normal(assigns) do
    ~F"""
    <Container disabled={@disabled} id={@id}>
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
        <Input
          size={@size}
          type={get_type(@password_shown)}
          is_error={@is_error}
          background_color={@background_color}
          value={@password}
          id={@id}
        />

        <ShowPassword toggle={toggle2(@id)}
          is_rtl={is_rtl(@dir)}
          input_password_id={"#{@id}_text_input_password"}
        >
          {@show_password_text}
        </ShowPassword>
      </div>
      <HintText :if={slot_assigned?(:hint_text_slot)}>
        <#slot name="hint_text_slot" />
      </HintText>
    </Container>
    """
  end

  def toggle2(id) do
    IO.puts("**** ----")
    IO.puts(id)
    IO.puts("##{id}_input")
    JS.set_attribute({"type", "text"}, to: "##{id}_input")
  end

  def handle_event("toggle_password_visibility", _, socket) do
    IO.puts("****")
    IO.puts(socket.assigns.password)
    {:noreply, assign(socket, password_shown: !socket.assigns.password_shown)}
  end

  def handle_event("blur_value_changed", _, socket) do
    {:noreply, assign(socket, password: !socket.assigns.password)}
  end

  defp get_text_input_xl(assigns) do
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
