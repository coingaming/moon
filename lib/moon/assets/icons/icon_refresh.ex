defmodule Moon.Assets.Icons.IconRefresh do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconRefresh-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
      )

    ~H"""
    <Context get={{ theme: theme }}>
    <style>
      .{{ class_name }} {
        vertical-align: middle;
        width: 1em;
        color: {{ get_color(@color, theme) }};
        background-color: {{ get_color(@background_color, theme) }};
        font-size: {{ @font_size }};
        display: inline-block;
        overflow: hidden;
        
      }
    </style>

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M9.63782 2.4934C9.9176 2.01723 10.5304 1.85802 11.0066 2.13781L16.0066 5.07564C16.2428 5.21443 16.4117 5.44406 16.4739 5.71088C16.5361 5.9777 16.4861 6.25835 16.3355 6.48726L13.3355 11.0494C13.0321 11.5109 12.412 11.639 11.9506 11.3355C11.4891 11.0321 11.361 10.412 11.6645 9.95054L13.5234 7.12358C8.66936 8.0482 5 12.3145 5 17.4378C5 23.2368 9.70101 27.9378 15.5 27.9378C21.299 27.9378 26 23.2368 26 17.4378C26 14.3633 24.6798 11.5985 22.5723 9.67678C22.1642 9.30466 22.135 8.67217 22.5071 8.26406C22.8793 7.85596 23.5118 7.82679 23.9199 8.19891C26.4255 10.4836 28 13.7776 28 17.4378C28 24.3414 22.4036 29.9378 15.5 29.9378C8.59644 29.9378 3 24.3414 3 17.4378C3 11.5834 7.02477 6.66893 12.4583 5.31049L9.99341 3.86218C9.51724 3.58239 9.35804 2.96957 9.63782 2.4934Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
