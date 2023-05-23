defmodule Moon.Design.BottomSheet.Panel do
  @moduledoc false

  use Moon.StatelessComponent, slot: "panel"

  @doc "Tailwind classes for customization"
  prop(class, :css_class)

  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)

  @doc "Id attribute for DOM element"
  prop(id, :string)

  @doc "Header of BottomSheet, see BottomSheet.Header"
  slot(header)

  @doc "Content of BottomSheet"
  slot(default)

  # inner API
  @doc "Will be got from Bottomsheet in most cases"
  prop(on_close, :event, from_context: :on_close)

  @doc "Will be got from Bottomsheet in most cases"
  prop(has_shadow, :boolean, from_context: :has_shadow)

  @doc "Will be got from Bottomsheet in most cases"
  prop(size, :string, from_context: :size)

  @doc """
  Experimental: makes BottomSheet behave as Modal on some screen widths,
  please reffer to https://tailwindcss.com/docs/screens
  In most cases got from context
  """
  prop(as_modal_on, :string, values: ~w(sm md lg xl 2xl), from_context: :as_modal_on)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      data-animate_enter_class="animate-drawer_enter_bottom"
      data-animate_leave_class="animate-drawer_leave_bottom"
      class={merge([
        [
          "fixed w-full bottom-0 rounded-t-xl bg-gohan overflow-y-auto",
          "moon-panel",
          "shadow-moon-lg": @has_shadow,
          "h-[32%]": @size == "sm",
          "h-[64%]": @size == "md",
          "h-[88%]": @size == "lg"
        ],
        modal_classes(@as_modal_on),
        @class
      ])}
      :on-click-away={@on_close}
      data-testid={@testid}
    >
      <#slot {@header} />
      <#slot />
    </div>
    """
  end

  defp modal_classes(nil), do: []

  defp modal_classes(size) do
    ~w(max-w-sm inline-block rounded-xl align-middle shadow-moon-lg bottom-auto)
    |> Enum.map(&"#{size}:#{&1}")
  end
end
