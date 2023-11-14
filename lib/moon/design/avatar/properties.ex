defmodule Moon.Design.Avatar.Properties do
  @moduledoc "Module for putting Avatar properties in one place"

  defmacro __using__(_opts \\ []) do
    quote do
      @doc "Path to the image"
      prop(image_url, :string)
      @doc "Size of avatar"
      prop(size, :string, default: "md", values: ~w(xs sm md lg xl 2xl))
      @doc "Capital letters of name"
      prop(name, :string)
      @doc "Tailwind classes for customization"
      prop(class, :css_class)
      @doc "Data-testid attribute for DOM element"
      prop(testid, :string)
      @doc "Id of the component"
      prop(id, :string)
      @doc "Content of Avatar - use it to show icons or anything else"
      slot(default)
      @doc "Status indicator of Avatar, see Avatar.Status"
      slot(status)
    end
  end
end
