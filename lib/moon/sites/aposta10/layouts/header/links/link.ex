defmodule Moon.Sites.Aposta10.Layouts.Header.Links.Link do
  use Moon.StatelessComponent
  alias Moon.Components.Text
  alias Moon.Components.Link
  alias Moon.Assets.Icons

  prop(text, :string)
  prop(color, :string)
  prop(icon, :string)

  def render(assigns) do
    class_name = get_class_name("site-header-links-link-#{assigns.color}")

    ~H"""
    <style>
      .{{ class_name }} {
        display: inline-block;
        margin-left: 10px;
        text-align: center;
      }

      .{{ class_name }}-logo {
        width: 56px;
        height: 56px;
        background-color: #EDEFF1;
        border-radius: 50%;
        position: relative;
        text-align: center;
        display: table-cell;
        vertical-align: middle;
      }

      .{{ class_name }}-logo > img {
        display: inline-block;
        vertical-align: middle;
        line-height: normal;
        color: {{ @color }};
      }
    </style>

    <Link add_class={{ class_name }} to="/tips/{{ @text }}">

      <div class="{{ class_name }}-logo">
        <Icons name={{ @icon }} color={{ @color }} />
      </div>

      <Text size=12>{{ @text }}</Text>
    </Link>
    """
  end
end
