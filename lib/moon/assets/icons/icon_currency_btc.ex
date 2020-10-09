defmodule Moon.Assets.Icons.IconCurrencyBTC do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property color, :string
  property background_color, :string

  def render(assigns) do
    class_name =
      get_class_name("Icons-IconCurrencyBTC-#{assigns.color}-#{assigns.background_color}")

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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M12.4613 9.5714C13.0768 9.25814 13.4618 8.70646 13.3719 7.78738C13.2508 6.53136 12.1653 6.11019 10.7951 5.99025L10.7949 4.24805H9.7332L9.7329 5.94443C9.45358 5.94443 9.16883 5.94991 8.88537 5.95559L8.88514 4.24828L7.82445 4.24818L7.82425 5.98995C7.59437 5.99464 7.36863 5.9991 7.1482 5.9991V5.99395L5.68384 5.99335L5.68404 7.12579C5.68404 7.12579 6.46804 7.11106 6.45513 7.12536C6.88499 7.12566 7.02535 7.37506 7.06571 7.59034L7.06604 9.57506V12.363C7.04711 12.4981 6.96747 12.7139 6.6669 12.7143C6.68058 12.7264 5.89462 12.7142 5.89462 12.7142L5.68404 13.9805H7.06538C7.32278 13.9808 7.57568 13.9848 7.82379 13.9868L7.82471 15.7487L8.88514 15.749L8.88484 14.0056C9.17659 14.0115 9.4582 14.0141 9.73327 14.0137L9.73297 15.749H10.7946L10.7952 13.99C12.5797 13.8876 13.829 13.4385 13.9843 11.7641C14.1095 10.4161 13.4745 9.81432 12.4613 9.5714ZM8.91074 7.20223C9.5095 7.20223 11.3926 7.01173 11.3928 8.2614C11.3926 9.45948 9.5101 9.31952 8.91074 9.31952V7.20223V7.20223ZM8.91028 12.7229L8.91074 10.3884C9.63014 10.3882 11.8865 10.1816 11.8868 11.5551C11.8871 12.8724 9.63014 12.7224 8.91028 12.7229Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
