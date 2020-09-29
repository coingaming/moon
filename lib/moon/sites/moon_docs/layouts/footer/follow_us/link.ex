defmodule Moon.Sites.MoonDocs.Layouts.Footer.FollowUs.Link do
  use Moon.StatelessComponent

  property brand, :string

  def render(assigns) do
    class_name = get_class_name("site-follow-us-link")

    ~H"""
    <style>
      .{{ class_name }} {
        display: inline-block;
        margin-left: 10px;
        text-align: center;
      }

      .{{ class_name }}-logo {
        width: 36px;
        height: 36px;
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
      }
    </style>

    <div class={{ class_name }}>
      <div class="{{ class_name }}-logo">
        <img src={{ "/uploads/img/site/channels/#{ @brand }.svg" }} />
      </div>
    </div>
    """
  end
end
