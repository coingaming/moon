defmodule Moon.Helpers.Ast do
  @moduledoc "https://stackoverflow.com/questions/63938738/is-there-a-way-to-get-function-body-as-a-string-in-elixir"

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
end
