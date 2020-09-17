defmodule Moon.Sites.Aposta10.Header.Links.Link do
  use Moon.StatelessComponent

  alias Moon.Components.Text

  def render(assigns) do
    ~H"""
    <style>
      .site-header-links-link {
        display: inline-block;
        margin-left: 10px;
        text-align: center;
      }

      .site-header-links-link-logo {
        width: 56px;
        height: 56px;
        background-color: #EDEFF1;
        border-radius: 50%;
        position: relative;
        text-align: center;
        display: table-cell;
        vertical-align: middle;
      }

      .site-header-links-link-logo > img {
        display: inline-block;
        vertical-align: middle;
        line-height: normal;
      }
    </style>

    <div class="site-header-links-link">

      <div class="site-header-links-link-logo">
        <img src={{ "/uploads/img/site/icons/#{ @text }.svg" }} />
      </div>

      <Text size=12 padding_top="10px">{{ @text }}</Text>

    </div>
    """
  end
end
