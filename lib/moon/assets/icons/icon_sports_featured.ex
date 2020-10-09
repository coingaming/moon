defmodule Moon.Assets.Icons.IconSportsFeatured do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property color, :string
  property background_color, :string

  def render(assigns) do
    class_name =
      get_class_name("Icons-IconSportsFeatured-#{assigns.color}-#{assigns.background_color}")

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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M1.70534 6.33739L4.54371 9.10406C4.67128 9.22833 4.7295 9.40793 4.69936 9.5834L4.02929 13.4896L7.53732 11.6453C7.69544 11.5623 7.8837 11.5623 8.04182 11.6453L11.5498 13.4896L10.8798 9.5834C10.8496 9.40793 10.9079 9.22833 11.0354 9.10406L13.8738 6.33739L9.95127 5.76722C9.77498 5.74162 9.62223 5.63097 9.54379 5.47077L7.78957 1.91676L6.03535 5.47077C5.9565 5.63097 5.80415 5.74162 5.62745 5.76722L1.70534 6.33739ZM12.2686 15.0213C12.1827 15.0213 12.096 15.0007 12.0168 14.9594L7.78957 12.7365L3.56236 14.9594C3.37946 15.0548 3.15859 15.0391 2.99179 14.9181C2.825 14.7967 2.74119 14.5915 2.77628 14.3884L3.58383 9.68125L0.163742 6.34689C0.0159406 6.20321 -0.0373176 5.98769 0.0266748 5.79199C0.0902543 5.59546 0.259937 5.45261 0.463887 5.42329L5.19024 4.73627L7.30405 0.453131C7.39529 0.268576 7.58356 0.151733 7.78957 0.151733C7.99558 0.151733 8.18384 0.268576 8.27509 0.453131L10.3889 4.73627L15.1153 5.42329C15.3192 5.45261 15.4889 5.59546 15.5525 5.79199C15.616 5.98769 15.5628 6.20321 15.4154 6.34689L11.9953 9.68125L12.8024 14.3884C12.8375 14.5915 12.7541 14.7967 12.5873 14.9181C12.4928 14.9867 12.3809 15.0213 12.2686 15.0213Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
