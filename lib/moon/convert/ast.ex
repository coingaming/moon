defmodule Moon.Convert.Ast do
  @moduledoc "Some helper functions for work with elixir module AST"

  # import Macro
  @doc "try Macro.to_string(function_ast(__MODULE__, :function_name))"
  def function_ast(mod, fun) do
    mod
    |> module_ast()
    |> Macro.prewalk(fn
      result = {:def, _, [{^fun, _, _} | _]} -> throw(result)
      other -> other
    end)

    :error_fetchig_ast
  catch
    result -> {:ok, result}
  end

  def module_ast(mod) do
    mod.__info__(:compile)[:source]
    |> to_string()
    |> File.read!()
    |> Code.string_to_quoted!()
  end

  def merge_ast(
        {:defmodule, m1,
         [
           aliases,
           [
             do: {:__block__, [], children}
           ]
         ]},
        {:defmodule, _,
         [
           _aliases,
           [
             do: {:__block__, [], children2}
           ]
         ]}
      ) do
    {:defmodule, m1,
     [
       aliases,
       [
         do:
           {:__block__, [],
            (children ++ children2)
            |> Enum.sort_by(fn
              {:@, _, [{:moduledoc, _, _}]} -> 0
              {:use, _, _} -> 1
              {:alias, _, _} -> 2
              {:import, _, _} -> 3
              {:require, _, _} -> 4
              _ -> 100
            end)}
       ]
     ]}
  end

  def ast_aliases(ast, %{module: module}) do
    {_, aliases} =
      ast
      |> Macro.prewalk([], fn
        result = {:alias, _, [{:__aliases__, _, a} | _]}, acc ->
          {result, acc ++ [a]}

        result = {:alias, _, [{:__MODULE__, _, _}]}, acc ->
          {result,
           acc ++
             [
               module
               |> to_string()
               |> String.replace("Elixir.", "")
               |> String.split(".")
               |> Enum.map(&String.to_atom/1)
             ]}

        result = {:alias, _, [{{:., _, [{:__aliases__, _, root_part}, :{}]}, _, children}]},
        acc ->
          {result,
           acc ++
             (children |> Enum.map(fn {:__aliases__, _, sub_part} -> root_part ++ sub_part end))}

        other, acc ->
          {other, acc}
      end)

    aliases
    |> Enum.reduce(%{}, fn items, acc ->
      Map.put(
        acc,
        Enum.at(items, -1) |> to_string(),
        [:"Elixir" | items] |> Enum.map_join(".", &to_string/1) |> String.to_atom()
      )
    end)
  end

  def parent_module(module) do
    module |> to_string() |> String.replace(~r/\.[A-Za-z]*$/, "") |> String.to_atom()
  end
end
