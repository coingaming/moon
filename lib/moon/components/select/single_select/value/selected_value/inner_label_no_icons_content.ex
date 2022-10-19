defmodule Moon.Components.Select.SingleSelect.Value.SelectedValue.InnerLabelNoIconsContent do
  @moduledoc false

  use Moon.StatelessComponent

  prop option, :any
  prop has_option_style, :boolean
  prop size, :string

  def render(assigns) do
    ~F"""
    <div class={
      "h-full w-full",
      set_style(@has_option_style, @size, @option)
    }>
      {@option.label}
    </div>
    """
  end

  defp set_style(has_option_style, size, option) do
    if has_option_style do
      text_class =
        case size do
          "xl" -> "text-moon-14"
          _ -> "text-moon-12"
        end

      "#{option.class} #{text_class}"
    else
      "text-bulma-100 text-moon-16 text-left pe-4"
    end
  end
end
