defmodule Moon.Convert do
  @moduledoc false

  alias Surface.Compiler.Parser

  def surface_to_liveview(c = %{module: module}) do
    import __MODULE__.{Ast, Module}

    ast = module |> module_ast()

    c = Map.put(c, :aliases, ast_aliases(ast))

    ast
    |> Macro.prewalk(nil, fn
      result = {:def, _, [{:render, _, _} | _]}, acc ->
        {translate_render(c, result), acc}

      result = {:sigil_F, _, _}, acc ->
        {translate_sigil(c, result), acc}

      result = {:prop, _meta, _options}, acc ->
        {translate_prop(c, result, acc), nil}

      result = {:data, _meta, _options}, acc ->
        {translate_prop(c, result, acc), nil}

      result = {:slot, _meta, _options}, acc ->
        {translate_slot(c, result, acc), nil}

      result = {:@, _, [{:moduledoc, _, [_text]}]}, acc ->
        {translate_moduledoc(c, result), acc}

      result = {:@, _, [{:doc, _, [_text]}]}, _acc ->
        {:skip, translate_doc(c, result)}

      result = {:use, _, [{:__aliases__, _, _alias} | _]}, acc ->
        {translate_use_defmodule(c, result), acc}

      result = {:defmodule, _, [{:__aliases__, _, _alias} | _]}, acc ->
        {translate_use_defmodule(c, result), acc}

      other, acc ->
        {other, acc}
    end)
    |> Tuple.to_list()
    |> hd()
  end

  defp translate_sigil(context, {:sigil_F, m1, [{:<<>>, meta, [string]}, opts]}) do
    import __MODULE__.{Tokens, Template}

    # "copy of Surface.sigil_F macro & Surface.Compiler.compile"

    result =
      string
      |> Parser.parse!(
        # file: module.__info__(:compile)[:source] |> to_string(),
        # line: meta[:line] + if(Keyword.has_key?(meta, :indentation), do: 1, else: 0),
        # caller: %{module: module, function: :render},
        # checks: opts[:checks] || [],
        # warnings: opts[:warnings] || [],
        # column: Keyword.get(opts, :column, 1),
        # indentation: Keyword.get(opts, :indentation, 0)
      )
      |> prewalk(context, fn
        # :text, text, context ->
        #   {text, context}

        _node_type, node, context ->
          {translate_node(node, context), context}
      end)
      |> Tuple.to_list()
      |> hd()
      |> to_text()

    {:sigil_H, m1, [{:<<>>, meta, [result]}, opts]}
  end
end
