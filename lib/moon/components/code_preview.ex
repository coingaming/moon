defmodule Moon.Components.CodePreview do
  use Surface.MacroComponent

  slot(default)

  def expand(_attributes, children, _meta) do
    %Surface.AST.Literal{
      value: colorify(children)
    }
  end

  def colorify(children) do
    str = List.to_string(children)
    str = str |> Phoenix.HTML.html_escape() |> Phoenix.HTML.safe_to_string()

    "<pre><code>#{str}</code></pre>"
  end
end
