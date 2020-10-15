defmodule Moon.Sites.MoonDocs.Layouts.Header.Menu do
  use Moon.StatelessComponent

  alias Moon.Sites.MoonDocs.Layouts.Header.Menu
  alias Menu.Link
  alias Menu.Title
  alias Menu.Separator

  def render(assigns) do
    class_name = get_class_name("Moon.Sites.MoonDocs.Layouts.Header.Menu")

    ~H"""
    <style>
      .{{ class_name }} {
        position: absolute;
        left: 20px;
        top: 20px;
        top: 0;
        bottom: 0;
        display: block;
        max-height: 100%;
        overflow-y: scroll;
        padding-bottom: 200px;
      }

      .{{ class_name }} > .links {
        display: none;
      }

      {{ for_desktop() }} {
        .{{ class_name }} {
          position: fixed;
          background-color: #fff;
          top: 100px;
          left: 0px;
          width: 232px;
        }

        .{{ class_name }} > .hamburger {
          display: none;
        }

        .{{ class_name }} > .links {
          display: block;
        }
      }
    </style>

    <div class={{ class_name }}>
      <div class="links" style="padding: 20px;">
        <Title>Concepts & Tutorials</Title>
        <Link to="/">Overview</Link>
        <Link to="/tutorials/add-data-using-form">Add data using form</Link>
        <Title>Assets</Title>
        <Link to="/assets/crests">Crests</Link>
        <Link to="/assets/duotones">Duotones</Link>
        <Link to="/assets/icons">Icons</Link>
        <Link to="/assets/logos">Logos</Link>
        <Link to="/assets/patterns">Patterns</Link>
        <Separator />
        <Title>Components</Title>
        <Link to="/components/avatar">Avatar</Link>
        <Link to="/components/badge">Badge</Link>
        <Link to="/components/button">Button</Link>
        <Link to="/components/inline">Inline</Link>
        <Link to="/components/link">Link</Link>
        <Link to="/components/stack">Stack</Link>
        <Link to="/components/text">Text</Link>
        <Link to="/components/text_input">Text input</Link>
        <Separator />
        <Title>Themes</Title>
        <Link to="/themes/list-of-themes">List of themes</Link>
        <Separator />
        <Title>Sites</Title>
        <Link to="/">MoonDocs</Link>
        <Link to="/sites/aposta10">Aposta10</Link>
      </div>

    </div>
    """
  end
end
