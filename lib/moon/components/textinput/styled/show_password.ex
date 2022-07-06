defmodule Moon.Components.TextInput.ShowPassword do
  @moduledoc false

  use Moon.StatelessComponent

  prop input_password_id, :string
  prop toggle, :event

  prop is_rtl, :boolean, default: false

  slot default

  def render(assigns) do
    ~F"""
    <div
      class={
        "text-moon-14 text-bulma absolute top-2/4 mt-[-0.75rem] z-[3] underline cursor-pointer",
        get_direction_style(@is_rtl)
      }
    >
      <a role="alert" :on-click={@toggle}><#slot /></a>
    </div>
    """
  end

  defp get_direction_style(is_rtl) do
    if is_rtl do
      "left-[0.938rem]"
    else
      "right-[0.938rem]"
    end
  end
end
