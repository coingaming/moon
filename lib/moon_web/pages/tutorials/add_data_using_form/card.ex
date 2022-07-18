defmodule MoonWeb.Pages.Tutorials.AddDataUsingForm.Card do
  @moduledoc false

  def cards() do
    [
      %{
        top: "Total deposits amount, USDT",
        left_bottom: "+5%",
        right_bottom: "1234,56 ₮"
      },
      %{
        top: "Clicks",
        left_bottom: "+8%",
        right_bottom: 5000
      }
    ]
  end
end
