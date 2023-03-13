defmodule MoonWeb.Examples.Design.AvatarExample.StatusOrigin do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Avatar
  alias Moon.Design.Avatar.StatusOrigin

  def render(assigns) do
    ~F"""
    <Avatar is_status_active status_origin={%StatusOrigin{vertical: "top", horizontal: "right"}} />
    <Avatar is_status_active status_origin={%StatusOrigin{vertical: "top", horizontal: "left"}} />
    <Avatar is_status_active />
    <Avatar is_status_active status_origin={%StatusOrigin{vertical: "bottom", horizontal: "left"}} />
    """
  end

  def code() do
    """
    alias Moon.Design.Avatar

    ...

    <Avatar is_status_active status_origin={%StatusOrigin{vertical: "top", horizontal: "right"}} />
    <Avatar is_status_active status_origin={%StatusOrigin{vertical: "top", horizontal: "left"}} />
    <Avatar is_status_active />
    <Avatar is_status_active status_origin={%StatusOrigin{vertical: "bottom", horizontal: "left"}} />
    """
  end
end
