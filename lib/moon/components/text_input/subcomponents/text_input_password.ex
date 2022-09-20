defmodule Moon.Components.TextInput.TextInputPassword do
  @moduledoc false

  use Moon.StatefulComponent
  alias Moon.Components.TextInput.Container
  alias Moon.Components.TextInput.Password
  alias Moon.Components.TextInput.Utils
  alias Moon.Components.TextInput.ShowPassword
  alias Moon.Components.ErrorTag

  data password_shown, :boolean, default: false
  data password, :string, default: ""

  prop field, :atom
  prop class, :css_class
  slot default
  slot left_icon_slot
  slot right_icon_slot

  def render(assigns) do
    ~F"""
    <Context
      get={Moon.Components.TextInput, disabled: disabled}
      get={Moon.Components.TextInput, size: size}
      get={Moon.Components.TextInput, background_color: background_color}
      get={Moon.Components.TextInput, label: label}
      get={Moon.Components.TextInput, is_error: is_error}
      get={Moon.Components.TextInput, use_error_tag: use_error_tag}
      get={Moon.Components.TextInput, show_password_text: show_password_text}
      get={Moon.Components.TextInput, has_left_icon: has_left_icon}
    >
      <Container {=disabled} {=@id} {=@class}>
        {#if size == "xl"}
          <div
            id={"#{@id}_text_input_password"}
            class={
              "w-full max-w-full relative",
              Utils.get_border_radius(size),
              "bg-#{background_color}": background_color
            }
          >
            <Password
              {=@id}
              {=@field}
              value={@password}
              on_keyup="on_keyup"
              input_password_id={"#{@id}_text_input_password"}
              type={get_type(@password_shown)}
            />
            <label class={
              "absolute text-[0.75rem] leading-3 text-trunks-100 top-3 z-[3] transition-all",
              "rtl:right-4",
              "ltr:left-4",
              "pl-8": has_left_icon
            }>
              {label}
            </label>

            <ShowPassword
              toggle="toggle_password_visibility"
              input_password_id={"#{@id}_text_input_password"}
            >
              {show_password_text}
            </ShowPassword>

            <div class={
              "w-full absolute top-0 left-0 z-20 bg-transparent pointer-events-none pr-12",
              Utils.get_height_by_size(size)
            }>
              <div class="w-full h-full flex items-center justify-between px-4 bg-transparent">
                <div class="justify-self-start pointer-events-auto"><#slot name="left_icon_slot" /></div>
                <div class="justify-self-end pointer-events-auto"><#slot name="right_icon_slot" /></div>
              </div>
            </div>
          </div>
          <#slot />
          <div class="inline-block mt-2 text-moon-12" :if={use_error_tag && is_error}>
            <ErrorTag />
          </div>
        {#else}
          <label
            :if={label}
            class={"block text-moon-16 text-bulma-100 pb-2", "opacity-30 cursor-not-allowed": disabled}
          >
            {label}
          </label>
          <div
            id={"#{@id}_text_input_password"}
            class={
              "w-full max-w-full relative",
              Utils.get_border_radius(size)
            }
          >
            <Password
              {=@id}
              {=@field}
              value={@password}
              on_keyup="on_keyup"
              input_password_id={"#{@id}_text_input_password"}
              type={get_type(@password_shown)}
            />

            <ShowPassword
              toggle="toggle_password_visibility"
              input_password_id={"#{@id}_text_input_password"}
            >
              {show_password_text}
            </ShowPassword>

            <div class={
              "w-full absolute top-0 left-0 z-20 bg-transparent pointer-events-none pr-12",
              Utils.get_height_by_size(size)
            }>
              <div class="w-full h-full flex items-center justify-between px-4 bg-transparent">
                <div class="justify-self-start pointer-events-auto"><#slot name="left_icon_slot" /></div>
                <div class="justify-self-end pointer-events-auto"><#slot name="right_icon_slot" /></div>
              </div>
            </div>
          </div>
          <#slot />
          <div class="inline-block mt-2 text-moon-12" :if={use_error_tag && is_error}>
            <ErrorTag />
          </div>
        {/if}
      </Container>
    </Context>
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
end
