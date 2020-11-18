defmodule MoonWeb.Components.LeftMenu do
  use Moon.LiveView

  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias Moon.Components.Stack

  def render(assigns) do
    ~H"""
    <Stack>
      <Heading size=20>Concepts & Tutorials</Heading>
      <Link to="/">Overview</Link>
      <Link to="/tutorials/add-data-using-form">Add data using form</Link>
      <Heading size=20>Assets</Heading>
      <Link to="/assets/crests">Crests</Link>
      <Link to="/assets/duotones">Duotones</Link>
      <Link to="/assets/icons">Icons</Link>
      <Link to="/assets/logos">Logos</Link>
      <Link to="/assets/patterns">Patterns</Link>

      <Heading size=20>Components</Heading>
      <Link to="/components/avatar">Avatar</Link>
      <Link to="/components/badge">Badge</Link>
      <Link to="/components/button">Button</Link>
      <Link to="/components/checkbox">Checkbox</Link>
      <Link to="/components/checkbox-multiselect">Checkbox multiselect</Link>
      <Link to="/components/inline">Inline</Link>
      <Link to="/components/link">Link</Link>
      <Link to="/components/select">Select</Link>
      <Link to="/components/stack">Stack</Link>
      <Link to="/components/text">Text</Link>
      <Link to="/components/text_input">Text input</Link>

      <Heading size=20>Themes</Heading>
      <Link to="/themes/list-of-themes">List of themes</Link>
    </Stack>
    """
  end
end
