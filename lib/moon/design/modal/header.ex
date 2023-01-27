defmodule Moon.Design.Modal.Header do
  @moduledoc false

  use Moon.StatelessComponent, slot: "header"

  alias Moon.Icons.ControlsClose

  prop(class, :css_class)
  prop(title, :string)

  slot(default)

  prop(has_divider, :boolean, default: false)
  prop(has_close, :boolean, default: false)

  # Internal API
  prop(on_close, :event, from_context: :on_close)

  @spec render(map) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~F"""
    <div class={"pt-5 pb-4 px-6", "border-b-2 border-beerus": @has_divider == true}>
      <div class="flex flex-row justify-between">
        <div class={merge(["text-moon-18 text-bulma font-semibold", @class])}>
          <#slot><span>{@title}</span></#slot>
        </div>
        <div
          :if={@has_close}
          class={merge(["flex justify-end items-center cursor-pointer", @class])}
          :on-click={@on_close}
        >
          <ControlsClose /></div>
      </div>
    </div>
    """
  end
end
