defmodule Moon.Helpers.Tokens do
  @moduledoc "Some helper functions to proceed with html <-> tokens"

  require Logger

  @void_elements [
    "area",
    "base",
    "br",
    "col",
    "command",
    "embed",
    "hr",
    "img",
    "input",
    "keygen",
    "link",
    "meta",
    "param",
    "source",
    "track",
    "wbr"
  ]

  @doc "Mostly copy of Surface.Compiler.to_ast/2 "
  def prewalk(nodes, context, func) do
    {for node <- List.wrap(nodes),
         {result, context} = func.(node_type(node), node, context),
         result != :ignore do
       case result do
         {type, attributes, children, node_meta} ->
           {children, _context} = children |> prewalk(context, func)
           {type, attributes, children, node_meta}

         text when is_binary(text) ->
           text

         {:expr, expr, meta} ->
           {:expr, expr, meta}

         {:block, type, attributes, children, node_meta} ->
           {children, _context} = children |> prewalk(context, func)
           {:block, type, attributes, children, node_meta}

         other ->
           dbg(other)
       end
     end, context}
  end

  def to_text(nodes, context \\ %{}) do
    nodes
    |> List.wrap()
    |> Enum.reduce("", fn
      string, text when is_binary(string) ->
        "#{text}#{string}"

      {type, attributes, [], _meta}, text ->
        "#{text}<#{type} #{attrs_to_text(attributes)}/>"

      {type, attributes, children, _meta}, text ->
        "#{text}<#{type} #{attrs_to_text(attributes)}>#{to_text(children, context)}</#{type}>"

      {:expr, expr, _meta}, text ->
        "#{text}<%= #{expr} %>"

      {:block, type, [{:root, {:attribute_expr, expr, _m2}, _m1} | other_attrs], children, _meta}, text ->
        "#{text}<%= #{type} #{expr} #{attrs_to_text(other_attrs)} do %>#{to_text(children, context)}<% end %>"

      # {:block, type, attributes, children, _meta}, text ->
      #   "#{text}<%= #{type} #{attrs_to_text(attributes)} do %>#{to_text(children, context)}<% end %>"
    end)
  end

  defp attrs_to_text(attrs) do
    attrs
    |> List.wrap()
    |> Enum.map(fn
      {:root, {:attribute_expr, expr, _m2}, _m1} -> "{#{expr}}"
      {:root, expr, _m1} -> expr
      {name, {:attribute_expr, expr, _m2}, _m1} -> "#{name}={#{expr}}"
      {name, expr, _m1} -> "#{name}=\"#{expr}\""
    end)
    |> Enum.join(" ")
  end

  # Slots
  defp node_type({"#slot", _, _, _}), do: :slot
  defp node_type({":" <> _, _, _, _}), do: :slot_entry

  # Conditional blocks
  defp node_type({:block, "if", _, _, _}), do: :if_elseif_else
  defp node_type({:block, "elseif", _, _, _}), do: :if_elseif_else
  defp node_type({:block, "else", _, _, _}), do: :else
  defp node_type({:block, "unless", _, _, _}), do: :unless

  # For
  defp node_type({:block, "for", _, _, _}), do: :for_else

  # case/match
  defp node_type({:block, "case", _, _, _}), do: :block
  defp node_type({:block, "match", _, _, _}), do: :sub_block
  defp node_type({:block, :default, _, _, _}), do: :sub_block

  defp node_type({:ast, _, _}), do: :ast

  # Components
  defp node_type({"#" <> _, _, _, _}), do: :macro_component
  defp node_type({_, _, _, %{decomposed_tag: {:component, _, _}}}), do: :component

  defp node_type({_, _, _, %{decomposed_tag: {:recursive_component, _, _}}}),
    do: :recursive_component

  defp node_type({_, _, _, %{decomposed_tag: {:remote, _, _}}}), do: :function_component
  defp node_type({_, _, _, %{decomposed_tag: {:local, _, _}}}), do: :function_component

  # HTML elements
  defp node_type({name, _, _, _}) when name in @void_elements, do: :void_tag
  defp node_type({_, _, _, _}), do: :tag

  # Other
  defp node_type({:expr, _, _}), do: :interpolation
  defp node_type({:comment, _, _}), do: :comment
  defp node_type(_), do: :text
end
