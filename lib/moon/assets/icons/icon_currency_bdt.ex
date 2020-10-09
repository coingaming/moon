defmodule Moon.Assets.Icons.IconCurrencyBDT do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property color, :string
  property background_color, :string

  def render(assigns) do
    class_name =
      get_class_name("Icons-IconCurrencyBDT-#{assigns.color}-#{assigns.background_color}")

    ~H"""
    <Context get={{ :theme }}>
    <style>
      .{{ class_name }} {
        vertical-align: middle;

        
        color: {{ get_color(@color, @theme) }};
        background-color: {{ get_color(@background_color, @theme) }};
        display: inline-block;
        overflow: hidden;
        

        
      }
    </style>

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M5.69231 0C6.84452 0 7.7174 0.293725 8.31096 0.881175C8.66012 1.2194 8.93071 1.69114 9.12275 2.29639C9.31478 2.90165 9.4108 3.75612 9.4108 4.85981V6.59546H18V9.53271H9.4108V15.6208C9.4108 16.1193 9.48063 16.4931 9.62029 16.7423C9.75996 16.9737 10.0742 17.0895 10.563 17.0895C11.0867 17.0895 11.6017 16.9737 12.108 16.7423C12.6143 16.5109 13.0245 16.2083 13.3388 15.8344C13.6705 15.4606 13.8363 15.0601 13.8363 14.6328C13.8363 14.4726 13.7665 14.3213 13.6268 14.1789C13.4872 14.0365 13.2166 13.9653 12.8151 13.9653C12.5008 13.9653 12.2215 13.992 11.9771 14.0454L11.5581 11.3218C12.1866 11.1615 12.946 11.0814 13.8363 11.0814C14.8663 11.0814 15.6956 11.3218 16.3241 11.8024C16.9525 12.283 17.2668 13.0307 17.2668 14.0454C17.2668 15.0067 17.0486 15.8611 16.6121 16.6088C16.1757 17.3565 15.5996 17.9795 14.8838 18.478C14.168 18.9764 13.3824 19.3591 12.527 19.6262C11.689 19.8754 10.8685 20 10.0655 20C9.33224 20 8.71249 19.911 8.20622 19.733C7.7174 19.555 7.3246 19.3235 7.02782 19.0387C6.83579 18.8429 6.65248 18.6204 6.4779 18.3712C6.32079 18.1219 6.18985 17.7748 6.08511 17.3298C5.99782 16.8847 5.95417 16.2884 5.95417 15.5407V9.53271H3.7545V6.59546H5.95417V4.99332C5.95417 4.31687 5.86688 3.80952 5.69231 3.47129C5.51773 3.13307 5.1162 2.96395 4.48772 2.96395C4.01637 2.96395 3.51882 3.07076 2.99509 3.28438L2 0.72096C2.68085 0.471739 3.29187 0.293724 3.83306 0.186915C4.37425 0.062305 4.994 0 5.69231 0Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
