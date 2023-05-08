defmodule Moon.UIPattern.Visibility.OnlyTabletAndDesktop do
  @moduledoc false

  use Moon.StatelessComponent
  prop is_mobile, :boolean, from_context: :is_mobile
  prop class, :css_class
  slot default

  def render(assigns) do
    ~F"""
    <div class={@class} :if={!@is_mobile}>
      <#slot context_put={device_context: :tablet_and_desktop} />
    </div>
    """
  end
end
