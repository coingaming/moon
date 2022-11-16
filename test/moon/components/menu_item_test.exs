defmodule Moon.Components.MenuItemTest do
  use Snapshy
  use ExUnit.Case
  use Surface.LiveViewTest

  alias Moon.Components.MenuItem
  alias Moon.Components.Lego
  import MoonWeb.Helpers.Html

  describe "MenuItem" do
    test_snapshot "as button" do
      render_surface do
        ~F"""
        <MenuItem>Hello</MenuItem>
        """
      end
      |> trim_tabs()
    end

    test_snapshot "as a" do
      render_surface do
        ~F"""
        <MenuItem as="a">Hello</MenuItem>
        """
      end
      |> trim_tabs()
    end

    test_snapshot "with title and text" do
      render_surface do
        ~F"""
        <MenuItem title="title" text="some description here" />
        """
      end
      |> trim_tabs()
    end

    test "content overrides" do
      html =
        render_surface do
          ~F"""
          <MenuItem title="not used" text="not used">Hello</MenuItem>
          """
        end
        |> trim_tabs()

      assert html =~ "Hello"
      assert !(html =~ "not used")
      html
    end
  end

  describe "with Lego.Title" do
    test_snapshot "title operates the saqme as content" do
      assigns = %{title: "Here I am"}

      html1 =
        render_surface do
          ~F"""
          <Lego.Title title={@title} />
          """
        end
        |> trim_tabs()

      html2 =
        render_surface do
          ~F"""
          <Lego.Title>{@title}</Lego.Title>
          """
        end
        |> trim_tabs()

      assert html1 == html2
      html1
    end

    test_snapshot "Title operates the saqme as content" do
      assigns = %{title: "Here I am"}

      html1 =
        render_surface do
          ~F"""
          <MenuItem title={@title} />
          """
        end
        |> trim_tabs()

      html2 =
        render_surface do
          # spaces are required here bc Surface does not String.trim() on rendered components
          ~F"""
          <MenuItem><Lego.Title>{@title}</Lego.Title></MenuItem>
          """
        end
        |> trim_tabs()

      assert html1 == html2
      html1
    end
  end

  describe "with Lego.Radio" do
    test_snapshot "role operates the same as content" do
      html1 =
        render_surface do
          ~F"""
          <MenuItem role="radio"><Lego.Radio /></MenuItem>
          """
        end
        |> trim_tabs()

      html2 =
        render_surface do
          ~F"""
          <MenuItem role="radio" />
          """
        end
        |> trim_tabs()

      assert html1 == html2
      html1
    end

    test_snapshot "selected" do
      render_surface do
        ~F"""
        <MenuItem role="radio" is_selected />
        """
      end
      |> trim_tabs()
    end
  end

  describe "with Lego.Checkbox" do
    test_snapshot "role operates the same as content" do
      html1 =
        render_surface do
          ~F"""
          <MenuItem role="checkbox"><Lego.Checkbox /></MenuItem>
          """
        end
        |> trim_tabs()

      html2 =
        render_surface do
          ~F"""
          <MenuItem role="checkbox" />
          """
        end
        |> trim_tabs()

      assert html1 == html2
      html1
    end

    test_snapshot "selected" do
      render_surface do
        ~F"""
        <MenuItem role="checkbox" is_selected />
        """
      end
      |> trim_tabs()
    end
  end

  describe "with Lego.ChevronUpDown" do
    test_snapshot "role operates the same as content" do
      html1 =
        render_surface do
          ~F"""
          <MenuItem role="switch"><Lego.ChevronUpDown /></MenuItem>
          """
        end
        |> trim_tabs()

      html2 =
        render_surface do
          ~F"""
          <MenuItem role="switch" />
          """
        end
        |> trim_tabs()

      assert html1 == html2
      html1
    end

    test_snapshot "selected" do
      render_surface do
        ~F"""
        <MenuItem role="switch" is_selected />
        """
      end
      |> trim_tabs()
    end
  end
end
