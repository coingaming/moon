defmodule MoonWeb.Components.ThemesSelect do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Design.Popover
  alias Moon.Design.Button.IconButton
  alias Moon.Design.MenuItem
  alias Moon.Design.Switch

  alias Moon.Icons.{TextLeftAlign, TextRightAlign, OtherMoon, OtherSun}

  prop(theme_name, :string)
  prop(direction, :string, values!: ["ltr", "rtl"])

  def render(assigns) do
    ~F"""
    <div>
      <Popover
        id="settings-popover"
        class="fixed bottom-4 lg:bottom-20 ltr:right-4 rtl:left-4 lg:z-50 z-[9999]"
      >
        <Popover.Trigger>
          <IconButton
            icon="media_tuner"
            class="shadow-moon-md rounded-full rounded-moon-s-xx"
            aria_label="Toggle site settings"
          />
        </Popover.Trigger>
        <Popover.Panel position="top-end" class="flex flex-col gap-1 p-3 bg-goku">
          <MenuItem as="div" class="cursor-default">
            {(String.contains?(@theme_name, "-dark") && "Dark mode") || "Light mode"}
            <Switch
              size="xs"
              checked={String.contains?(@theme_name, "-dark")}
              on_change={"toggle_dark_mode", target: :live_view}
            >
              <:on_icon><OtherMoon /></:on_icon>
              <:off_icon><OtherSun /></:off_icon>
            </Switch>
          </MenuItem>
          <MenuItem as="div" class="cursor-default">
            {String.upcase(@direction)} mode
            <Switch
              size="xs"
              checked={@direction == "rtl"}
              on_change={"toggle_direction", target: :live_view}
            >
              <:on_icon><TextRightAlign /></:on_icon>
              <:off_icon><TextLeftAlign /></:off_icon>
            </Switch>
          </MenuItem>
        </Popover.Panel>
      </Popover>
    </div>
    """
  end
end
