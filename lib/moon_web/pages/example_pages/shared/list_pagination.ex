defmodule MoonWeb.Pages.ExamplePages.Shared.ListPagination do
  use MoonWeb, :stateless_component

  alias Moon.Assets.Icons.IconChevronLeftRounded
  alias Moon.Assets.Icons.IconChevronRightRounded
  alias Moon.Assets.Icons.IconRefresh
  alias Moon.Assets.Icons.IconRow
  alias Moon.Autolayouts.LeftToRight
  alias Moon.Components.Divider

  prop page, :number, required: true
  prop page_count, :number, required: true
  prop total_count, :number, required: true

  prop on_next_page, :event, required: true
  prop on_prev_page, :event, required: true

  def render(assigns) do
    ~F"""
    <Divider class="mt-2" />
    <div class="h-14 max-w-full flex justify-between items-center">
      <LeftToRight>
        {"#{1 + @page_count * (@page - 1)}-#{@page_count * @page} of #{@total_count}"}
        <IconRefresh font_size="1.2rem" class="ml-2" />
      </LeftToRight>

      <LeftToRight>
        <IconChevronLeftRounded font_size="1.2rem" class="mr-2" click={@on_prev_page} />
        <IconChevronRightRounded font_size="1.2rem" click={@on_next_page} />
        <Divider orientation="vertical" class="mx-4" />
        <IconRow font_size="1.2rem" class="mr-4" />
      </LeftToRight>
    </div>
    """
  end
end
