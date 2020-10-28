defmodule Moon.Assets.Icons.IconSportsCycling do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property(color, :string)
  property(background_color, :string)
  property(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconSportsCycling-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">  <path d="M15.6953 8.48047C15.5781 8.40234 15.4375 8.35547 15.2852 8.35547H13.0352L14.2539 6.5C14.3672 6.32812 14.3984 6.12891 14.3555 5.94531C14.3359 5.46875 13.9648 5.06641 13.4766 5.02344C8.65234 4.57422 6.05859 6.85938 5.94922 6.95312C5.57422 7.28906 5.51953 7.85547 5.82422 8.25781L6.23047 8.79688C5.71094 8.58984 5.14453 8.47266 4.55469 8.47266C2.06641 8.47656 0.0390625 10.5039 0.0390625 12.9961C0.0390625 15.4883 2.06641 17.5156 4.55859 17.5156C6.16406 17.5156 7.57422 16.6758 8.37891 15.4102L8.38281 15.9492C8.38672 16.4844 8.82031 16.9102 9.35156 16.9102C9.35547 16.9102 9.35547 16.9102 9.35938 16.9102C9.89453 16.9062 10.3242 16.4688 10.3203 15.9336L10.2812 11.2578C10.2812 11.0508 10.2109 10.8477 10.0859 10.6797L7.98828 7.90234C8.78125 7.46484 10.207 6.89844 12.2461 6.90234L11.0781 8.68359C10.9297 8.90625 10.918 9.19141 11.0469 9.42969C11.1758 9.66406 11.418 9.8125 11.6875 9.8125H12.2773C11.4648 10.6289 10.9609 11.7578 10.9609 12.9961C10.9609 15.4883 12.9883 17.5156 15.4805 17.5156C17.9727 17.5156 20 15.4883 20 12.9961C20 10.5742 18.0898 8.59375 15.6953 8.48047ZM4.55859 16.3008C2.73437 16.3008 1.25 14.8164 1.25 12.9961C1.25 11.1719 2.73437 9.6875 4.55859 9.6875C6.38281 9.6875 7.86719 11.1719 7.86719 12.9961C7.86328 14.8203 6.38281 16.3008 4.55859 16.3008ZM15.4805 16.3008C13.6562 16.3008 12.1758 14.8164 12.1758 12.9961C12.1758 11.4805 13.2031 10.1992 14.5977 9.8125H15.2891C15.4336 9.8125 15.5664 9.76953 15.6797 9.69922C17.4102 9.80078 18.7891 11.2422 18.7891 13C18.7891 14.8203 17.3047 16.3008 15.4805 16.3008ZM15.875 5.93359C16.8164 5.93359 17.582 5.16797 17.582 4.22656C17.582 3.28516 16.8164 2.51953 15.875 2.51953C14.9336 2.51953 14.168 3.28516 14.168 4.22656C14.168 5.16797 14.9336 5.93359 15.875 5.93359Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
