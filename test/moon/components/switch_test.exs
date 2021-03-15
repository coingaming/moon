defmodule Moon.Components.SwitchTest do
  use MoonWeb.ConnCase, async: true
  alias Moon.Components.Switch

  describe "creates a Switch component" do
    test "checked" do
      assigns = %{checked: true, size: "small"}

      html =
        render_surface do
          ~H"""
          <Switch size={{ @size }} checked={{ @checked }}></Switch>
          """
        end

      assert html =~ "<button"
      assert html =~ "bg-piccolo-100"
      assert html =~ "translate-x-3"
    end

    test "unchecked" do
      assigns = %{checked: false, size: "small"}

      html =
        render_surface do
          ~H"""
          <Switch size={{ @size }} checked={{ @checked }}></Switch>
          """
        end

      assert html =~ "<button"
      assert html =~ "bg-gohan-40"
      refute html =~ "translate-x-3"
    end

    test "medium size" do
      assigns = %{checked: true, size: "medium"}

      html =
        render_surface do
          ~H"""
          <Switch size={{ @size }} checked={{ @checked }}></Switch>
          """
        end

      assert html =~ "<button"
      refute html =~ "translate-x-3"
      assert html =~ "translate-x-4"
    end
  end
end
