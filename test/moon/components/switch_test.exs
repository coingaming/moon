defmodule Moon.Components.SwitchTest do
  use MoonWeb.ConnCase, async: true
  alias Moon.Components.Switch

  describe "creates a Switch component" do
    test "checked" do
      assigns = %{checked: true, size: "small"}

      html =
        render_surface do
          ~F"""
          <Switch size={@size} checked={@checked} id="switch_1" />
          """
        end

      assert html =~ "<button"
      assert html =~ "bg-piccolo"
      assert html =~ "translate-x-3"
    end

    test "unchecked" do
      assigns = %{checked: false, size: "small"}

      html =
        render_surface do
          ~F"""
          <Switch size={@size} checked={@checked} id="switch_1" />
          """
        end

      assert html =~ "<button"
      assert html =~ "bg-gohan"
      refute html =~ "translate-x-3"
    end

    test "medium size" do
      assigns = %{checked: true, size: "medium"}

      html =
        render_surface do
          ~F"""
          <Switch size={@size} checked={@checked} id="switch_1" />
          """
        end

      assert html =~ "<button"
      refute html =~ "translate-x-3"
      assert html =~ "translate-x-4"
    end

    test "with icons" do
      assigns = %{icons: true}

      html =
        render_surface do
          ~F"""
          <Switch icons={@icons} id="switch_1" />
          """
        end

      assert html =~ "<button"
      assert html =~ "other-moon.svg"
      assert html =~ "other-sun.svg"
    end

    test "without icons" do
      assigns = %{icons: false}

      html =
        render_surface do
          ~F"""
          <Switch icons={@icons} id="switch_1" />
          """
        end

      assert html =~ "<button"
      refute html =~ "other-moon.svg"
      refute html =~ "other-sun.svg"
    end

    test "with captions" do
      assigns = %{caption_unchecked: "off", caption_checked: "on"}

      html =
        render_surface do
          ~F"""
          <Switch caption_unchecked={@caption_unchecked} caption_checked={@caption_checked} id="switch_1" />
          """
        end

      assert html =~ "<button"
      assert html =~ "off"
      assert html =~ "on"
    end
  end
end
