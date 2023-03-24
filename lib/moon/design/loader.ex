defmodule Moon.Design.Loader do
  @moduledoc false

  use Moon.StatelessComponent

  import Moon.Helpers.MergeClass

  prop(size, :string, values: ["2xs", "xs", "md", "lg"], default: "md")
  prop(color, :string, default: "hit", values: Moon.colors())
  prop(class, :css_class)

  prop(testid, :string)
  prop(id, :string)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      class={
        "relative",
        get_size_class_by_size(@size)
      }
      data-testid={@testid}
    >
      <div class={
        merge([
          "box-border block absolute w-full h-full border-solid rounded-[50%]",
          "border-t-#{@color} border-r-transparent border-b-transparent border-l-transparent",
          "animate-loader",
          get_border_class_by_size(@size),
          @class
        ]),
        "border-#{@color}"
      } />
      <div class={
        merge([
          "box-border block absolute w-full h-full border-solid rounded-[50%]",
          "border-t-#{@color} border-r-transparent border-b-transparent border-l-transparent",
          "animate-loader animation-delay-minus-45",
          get_border_class_by_size(@size),
          @class
        ]),
        "border-#{@color}"
      } />
      <div class={
        merge([
          "box-border block absolute w-full h-full border-solid rounded-[50%]",
          "border-t-#{@color} border-r-transparent border-b-transparent border-l-transparent",
          "animate-loader animation-delay-minus-30",
          get_border_class_by_size(@size),
          @class
        ]),
        "border-#{@color}"
      } />
      <div class={
        merge([
          "box-border block absolute w-full h-full border-solid rounded-[50%]",
          "border-t-#{@color} border-r-transparent border-b-transparent border-l-transparent",
          "animate-loader animation-delay-minus-15",
          get_border_class_by_size(@size),
          @class
        ]),
        "border-#{@color}"
      } />
    </div>
    """
  end

  defp get_size_class_by_size(size) do
    case size do
      "2xs" -> "w-4 h-4"
      "xs" -> "w-6 h-6"
      "sm" -> "w-8 h-8"
      "md" -> "w-10 h-10"
      "lg" -> "w-12 h-12"
    end
  end

  defp get_border_class_by_size(size) do
    case size do
      "2xs" -> "border-2"
      "xs" -> "border-2"
      "sm" -> "border-4"
      "md" -> "border-4"
      "lg" -> "border-4"
    end
  end
end
