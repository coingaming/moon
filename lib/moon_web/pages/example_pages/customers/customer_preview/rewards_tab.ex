defmodule MoonWeb.Pages.ExamplePages.Customers.CustomerPreview.RewardsTab do
  @moduledoc false

  use MoonWeb, :stateful_component

  alias Moon.Assets.Icons.{IconChevronLeftRounded, IconChevronRightRounded}
  alias Moon.Autolayouts.LeftToRight
  alias Moon.Components.{Button, Divider, Text}

  def render(assigns) do
    ~F"""
    <div class="flex-1 h-full w-full">
      <div class="flex justify-between pt-6">
        <LeftToRight>
          <Button size="sm" right_icon="icon_chevron_down_rounded" class="rounded bg-goku-100 mr-4">
            <Text size="14" class="capitalize text-gohan-80">Lifetime</Text>
          </Button>

          <Button size="sm" right_icon="icon_chevron_down_rounded" class="rounded bg-goku-100">
            <Text size="14" class="capitalize text-gohan-80">More Filters</Text>
          </Button>
        </LeftToRight>

        <LeftToRight>
          <Button
            size="sm"
            variant="primary"
            right_icon="icon_chevron_down_rounded"
            class="rounded bg-goku-100 mr-4"
          >
            <Text size="14">Release cashback</Text>
          </Button>

          <Button
            size="sm"
            variant="primary"
            right_icon="icon_chevron_down_rounded"
            class="rounded bg-goku-100"
          >
            <Text size="14">Give reward</Text>
          </Button>
        </LeftToRight>
      </div>

      <Divider class="my-4" />
      <div class="flex justify-between items-center">
        <div>&nbsp;0 of 0</div>

        <LeftToRight>
          <IconChevronLeftRounded font_size="1.2rem" class="mr-2" />
          <IconChevronRightRounded font_size="1.2rem" />
        </LeftToRight>
      </div>
      <Divider class="my-4" />

      <table>
        <thead>
          <th>Reward type</th>
          <th>Create time</th>
          <th>Activate time</th>
          <th>Currency</th>
          <th>Amount</th>
          <th>Added by</th>
          <th>Brand</th>
        </thead>
        <tbody>
        </tbody>
      </table>

      <div class="flex items-center justify-around w-full h-32">
        <Text size="16">No records found</Text>
      </div>
    </div>
    """
  end
end
