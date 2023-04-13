defmodule MoonWeb.Examples.Design.PaginationExample.Default do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Pagination

  def render(assigns) do
    ~F"""
    <Pagination>
      <Pagination.PreviousButton>Previous</Pagination.PreviousButton>
      <Pagination.Pages />
      <Pagination.NextButton>Next</Pagination.NextButton>
    </Pagination>
    """
  end

  def code() do
    """

    """
  end
end
