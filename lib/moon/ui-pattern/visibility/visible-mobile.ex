defmodule Moon.UIPattern.Visibility.VisibleMobile do
  @moduledoc false

  use Moon.StatelessComponent
  slot default

  def render(assigns) do
    ~F"""
    <div class={class()}>
      <#slot context_put={device_context: :mobile} />
    </div>
    """
  end

  def class do
    "xl:hidden"
  end
end
