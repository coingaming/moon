defmodule Moon.UIPattern.Visibility.VisibleTabletAndDesktop do
  @moduledoc false

  use Moon.StatelessComponent
  prop is_mobile, :boolean, from_context: :is_mobile
  slot default

  def render(assigns) do
    ~F"""
    <div class={class()}>
      <#slot context_put={device_context: :tablet_and_desktop} />
    </div>
    """
  end

  def class do
    "hidden xl:visible"
  end
end
