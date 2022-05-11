defmodule Moon.Components.Loader do
  @moduledoc false

  use Moon.StatelessComponent

  prop size, :string, values: ["twoxsmall", "xsmall", "medium", "large"], default: "medium"
  prop color, :string, default: "bulma-100", values: Moon.colors()

  def render(assigns) do
    ~F"""
    <div class={
      "relative",
      get_size_class_by_size(@size)
    }>
      <div class={
        "box-border block absolute w-full h-full border-solid border-#{@color} rounded-[50%]",
        "border-t-#{@color} border-r-transparent border-b-transparent border-l-transparent",
        "animate-loader",
        get_border_class_by_size(@size)
      } />
      <div class={
        "box-border block absolute w-full h-full border-solid border-#{@color} rounded-[50%]",
        "border-t-#{@color} border-r-transparent border-b-transparent border-l-transparent",
        "animate-loader animation-delay-minus-45",
        get_border_class_by_size(@size)
      } />
      <div class={
        "box-border block absolute w-full h-full border-solid border-#{@color} rounded-[50%]",
        "border-t-#{@color} border-r-transparent border-b-transparent border-l-transparent",
        "animate-loader animation-delay-minus-30",
        get_border_class_by_size(@size)
      } />
      <div class={
        "box-border block absolute w-full h-full border-solid border-#{@color} rounded-[50%]",
        "border-t-#{@color} border-r-transparent border-b-transparent border-l-transparent",
        "animate-loader animation-delay-minus-15",
        get_border_class_by_size(@size)
      } />
    </div>
    """
  end

  defp get_size_class_by_size(size) do
    case size do
      "twoxsmall" -> "w-4 h-4"
      "xsmall" -> "w-6 h-6"
      "small" -> "w-8 h-8"
      "medium" -> "w-10 h-10"
      "large" -> "w-12 h-12"
    end
  end

  defp get_border_class_by_size(size) do
    case size do
      "twoxsmall" -> "border-2"
      "xsmall" -> "border-2"
      "small" -> "border-2"
      "medium" -> "border-4"
      "large" -> "border-4"
    end
  end
end
