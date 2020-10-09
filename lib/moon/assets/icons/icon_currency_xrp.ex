defmodule Moon.Assets.Icons.IconCurrencyXRP do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property color, :string
  property background_color, :string

  def render(assigns) do
    class_name =
      get_class_name("Icons-IconCurrencyXRP-#{assigns.color}-#{assigns.background_color}")

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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M18.9612 14.0831C18.2709 13.6846 17.4936 13.5691 16.7236 13.5422C16.0776 13.5196 15.1138 13.1056 15.1138 11.9305C15.1138 11.0549 15.8236 10.3503 16.724 10.3188C17.4939 10.2919 18.2711 10.1763 18.9612 9.77784C19.5811 9.41996 20.0958 8.90521 20.4537 8.28533C20.8116 7.66545 21 6.96229 21 6.24651C21 5.53074 20.8116 4.82758 20.4537 4.2077C20.0958 3.58783 19.581 3.07309 18.9612 2.71521C18.3413 2.35733 17.6381 2.16893 16.9223 2.16895C16.2066 2.16896 15.5034 2.35739 14.8835 2.71529C14.2637 3.07319 13.7489 3.58796 13.3911 4.20784C13.0332 4.82773 12.8448 5.5309 12.8448 6.24668C12.8448 7.0367 13.1258 7.76373 13.4843 8.43803C13.7859 9.00516 13.9385 10.0578 12.9042 10.6548C12.1349 11.099 11.1747 10.8178 10.6952 10.0502C10.2901 9.40196 9.80103 8.79454 9.11637 8.39918C8.4965 8.04129 7.79335 7.85288 7.07758 7.85288C6.36182 7.85288 5.65866 8.04129 5.03879 8.39917C4.41892 8.75705 3.90418 9.27179 3.54629 9.89166C3.18841 10.5115 3 11.2147 3 11.9305C3 12.6462 3.18841 13.3494 3.54629 13.9692C3.90418 14.5891 4.41892 15.1039 5.03879 15.4617C5.65866 15.8196 6.36182 16.008 7.07758 16.008C7.79335 16.008 8.4965 15.8196 9.11637 15.4617C9.80083 15.0665 10.2899 14.4595 10.6947 13.8116C11.0272 13.2796 11.8575 12.6014 12.9042 13.2062C13.6724 13.65 13.9098 14.6225 13.484 15.4234C13.1255 16.0976 12.8449 16.8245 12.8449 17.6144C12.8449 18.3301 13.0333 19.0333 13.3912 19.6531C13.749 20.273 14.2638 20.7877 14.8836 21.1456C15.5035 21.5035 16.2067 21.6919 16.9224 21.6919C17.6382 21.6919 18.3413 21.5035 18.9612 21.1456C19.581 20.7877 20.0958 20.273 20.4537 19.6531C20.8115 19.0333 20.9999 18.3301 20.9999 17.6144C20.9999 16.8986 20.8115 16.1955 20.4537 15.5756C20.0958 14.9557 19.5811 14.441 18.9612 14.0831V14.0831Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
