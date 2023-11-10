defmodule Moon.Helpers.Alive do
  @moduledoc false

  def translate_template_node(other) do
    dbg(other)
  end

  def to_ast(nodes, compile_meta) do
    for node <- List.wrap(nodes),
        result = convert_node_to_ast(node_type(node), node, compile_meta),
        result != :ignore do
      case result do
        {:ok, ast} ->
          process_directives(ast)

        {:error, {message, line}, meta} ->
          IOHelper.warn(message, compile_meta.caller, meta.file, line)
          %AST.Error{message: message, meta: meta}

        {:error, {message, details, line}, meta} ->
          details = if details, do: "\n\n" <> details, else: ""
          IOHelper.warn(message <> details, compile_meta.caller, meta.file, line)
          %AST.Error{message: message, meta: meta}
      end
    end
  end
end
