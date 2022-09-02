defmodule Moon.Components.TextInput.ShowPassword do
  @moduledoc false

  use Moon.StatelessComponent

  prop input_password_id, :string
  prop toggle, :string, default: "toggle_password_visibility"

  slot default

  # TODO
  def render(assigns) do
    ~F"""
    <div
      role="alert"
      :on-click={@toggle, target: "##{@input_password_id}"}
      class={
        "text-moon-14 text-bulma absolute top-2/4 mt-[-0.75rem] z-[3] underline cursor-pointer",
        # buggy on beta TW, rtl: and ltr: (Show password when using <TopToDown> is broken)
        "rtl:left-[0.938rem]",
        # buggy on beta TW, rtl: and ltr: (Show password when using <TopToDown> is broken)
        "ltr:right-[0.938rem]",
        "right-[0.938rem]"
      }
    >
      <#slot />
    </div>
    """
  end
end
