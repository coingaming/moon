
defmodule Moon.Components.CodePreview do
  use Moon.StatelessComponent

  prop(code, :string)

  def render(assigns) do
    ~H"""
    {{ raw Makeup.highlight(@code) }}
    <style>{{ Makeup.stylesheet() }}</style>
    """
  end
end
