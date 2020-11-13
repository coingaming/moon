defmodule MoonWeb.Pages.Components.StackPage do
  use Moon.LiveView
  alias Moon.Components.Stack

  def render(assigns) do
    ~H"""
    <Stack>
      <div>a</div>
      <div>b</div>
    </Stack>
    """
  end
end
