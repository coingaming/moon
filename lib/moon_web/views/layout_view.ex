defmodule MoonWeb.LayoutView do
  use MoonWeb, :view

  def theme_name(%{"theme_name" => theme}), do: theme
  def theme_name(_), do: "theme-moon-light"
end
