defmodule Moon.Components.CodePreview do
  use Surface.MacroComponent

  slot(default)

  def expand(_attributes, children, _meta) do
    %Surface.AST.Literal{
      value: Makeup.highlight(List.to_string(children))
    }
  end
end
