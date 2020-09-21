defmodule Moon.Sites.Aposta10.Body.Footer.FollowUs.Link do
  use Moon.StatelessComponent

  property brand, :string

  def render(assigns) do
    ~H"""
    <style>
      .site-footer-follow-us-link {
        display: inline-block;
        margin-left: 10px;
        text-align: center;
      }

      .site-footer-follow-us-link-logo {
        width: 36px;
        height: 36px;
        background-color: #EDEFF1;
        border-radius: 50%;
        position: relative;
        text-align: center;
        display: table-cell;
        vertical-align: middle;
      }

      .site-footer-follow-us-link-logo > img {
        display: inline-block;
        vertical-align: middle;
        line-height: normal;
      }
    </style>

    <div class="site-footer-follow-us-link">
      <div class="site-footer-follow-us-link-logo">
        <img src={{ "/uploads/img/site/channels/#{ @brand }.svg" }} />
      </div>
    </div>
    """
  end
end
