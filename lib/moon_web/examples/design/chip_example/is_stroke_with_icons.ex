defmodule MoonWeb.Examples.Design.ChipExample.IsStrokeWithIcons do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Chip

  alias Moon.Icons.MediaMusic
  alias Moon.Icons.SoftwareDownload

  def render(assigns) do
    ~F"""
    <div class="flex flex-wrap items-center justify-around gap-2 w-full">
      <Chip size="sm" is_stroke>
        <:left_icon><MediaMusic class="text-moon-24" /></:left_icon>
        Left Icon
      </Chip>
      <Chip size="sm" is_stroke>
        Right Icon
        <:right_icon><SoftwareDownload class="text-moon-24" /></:right_icon>
      </Chip>
      <Chip size="sm" is_stroke>
        <:left_icon><MediaMusic class="text-moon-24" /></:left_icon>
        Left/Right Icons
        <:right_icon><SoftwareDownload class="text-moon-24" /></:right_icon>
      </Chip>
      <Chip size="sm" is_stroke>
        <:left_icon><MediaMusic class="text-moon-24" /></:left_icon>
        <:right_icon><SoftwareDownload class="text-moon-24" /></:right_icon>
      </Chip>
      <Chip size="sm" is_stroke>
        <:icon_only><SoftwareDownload class="text-moon-24" /></:icon_only>
      </Chip>
    </div>
    <div class="flex flex-wrap items-center justify-around gap-2 w-full">
      <Chip is_stroke>
        <:left_icon><MediaMusic class="text-moon-24" /></:left_icon>
        Left Icon
      </Chip>
      <Chip is_stroke>
        Right Icon
        <:right_icon><SoftwareDownload class="text-moon-24" /></:right_icon>
      </Chip>
      <Chip is_stroke>
        <:left_icon><MediaMusic class="text-moon-24" /></:left_icon>
        Left/Right Icons
        <:right_icon><SoftwareDownload class="text-moon-24" /></:right_icon>
      </Chip>
      <Chip is_stroke>
        <:left_icon><MediaMusic class="text-moon-24" /></:left_icon>
        <:right_icon><SoftwareDownload class="text-moon-24" /></:right_icon>
      </Chip>
      <Chip is_stroke>
        <:icon_only><SoftwareDownload class="text-moon-24" /></:icon_only>
      </Chip>
    </div>
    """
  end

  def code() do
    """
    alias Moon.Design.Chip

    alias Moon.Icons.MediaMusic
    alias Moon.Icons.SoftwareDownload

    ...

    <div class="flex flex-wrap items-center justify-around gap-2 w-full">
      <Chip size="sm" is_stroke>
        <:left_icon><MediaMusic class="text-moon-24" /></:left_icon>
        Left Icon
      </Chip>
      <Chip size="sm" is_stroke>
        Right Icon
        <:right_icon><SoftwareDownload class="text-moon-24" /></:right_icon>
      </Chip>
      <Chip size="sm" is_stroke>
        <:left_icon><MediaMusic class="text-moon-24" /></:left_icon>
        Left/Right Icons
        <:right_icon><SoftwareDownload class="text-moon-24" /></:right_icon>
      </Chip>
      <Chip size="sm" is_stroke>
        <:left_icon><MediaMusic class="text-moon-24" /></:left_icon>
        <:right_icon><SoftwareDownload class="text-moon-24" /></:right_icon>
      </Chip>
      <Chip size="sm" is_stroke>
        <:icon_only><SoftwareDownload class="text-moon-24" /></:icon_only>
      </Chip>
    </div>
    <div class="flex flex-wrap items-center justify-around gap-2 w-full">
      <Chip is_stroke>
        <:left_icon><MediaMusic class="text-moon-24" /></:left_icon>
        Left Icon
      </Chip>
      <Chip is_stroke>
        Right Icon
        <:right_icon><SoftwareDownload class="text-moon-24" /></:right_icon>
      </Chip>
      <Chip is_stroke>
        <:left_icon><MediaMusic class="text-moon-24" /></:left_icon>
        Left/Right Icons
        <:right_icon><SoftwareDownload class="text-moon-24" /></:right_icon>
      </Chip>
      <Chip is_stroke>
        <:left_icon><MediaMusic class="text-moon-24" /></:left_icon>
        <:right_icon><SoftwareDownload class="text-moon-24" /></:right_icon>
      </Chip>
      <Chip is_stroke>
        <:icon_only><SoftwareDownload class="text-moon-24" /></:icon_only>
      </Chip>
    </div>
    """
  end
end
