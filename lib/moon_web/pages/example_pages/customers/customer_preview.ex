defmodule MoonWeb.Pages.ExamplePages.CustomersPage.CustomerPreview do
  use MoonWeb, :stateful_component

  prop customer, :map, required: true
  prop on_close, :event, required: true

  def render(assigns) do
    ~F"""
    <div>
      {@customer.id}
    </div>
    """
  end
end
