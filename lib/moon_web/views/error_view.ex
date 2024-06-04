defmodule MoonWeb.ErrorView do
  @moduledoc false
  use MoonWeb, :html

  embed_templates("../templates/error/*")

  def render("500.html", _assigns) do
    "Internal server error"
  end
end
