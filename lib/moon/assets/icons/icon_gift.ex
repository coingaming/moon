defmodule Moon.Assets.Icons.IconGift do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property(color, :string)
  property(background_color, :string)
  property(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconGift-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em" viewBox="0 0 20 23" fill="none" xmlns="http://www.w3.org/2000/svg">  <path fill-rule="evenodd" clip-rule="evenodd" d="M16.1134 5.30649C16.6614 4.76556 17 4.02302 17 3.2019C17 1.5412 15.6148 0.201904 13.9142 0.201904C12.3798 0.201904 11.0014 1.27624 11.0014 3.23364C11.0014 4.01356 10.6875 4.54634 9.99998 4.86161C9.3125 4.54634 8.99853 4.01356 8.99853 3.23364C8.99853 1.27624 7.62015 0.201904 6.08574 0.201904C4.38521 0.201904 2.99995 1.5412 2.99995 3.2019C2.99995 4.0214 3.33727 4.76263 3.88334 5.30329C3.38023 5.31821 2.88659 5.33513 2.4024 5.35405C1.06069 5.40646 0 6.5094 0 7.85214V10.4116C0 10.8935 0.0495758 11.1502 0.192659 11.4178C0.326412 11.6679 0.525681 11.8672 0.775778 12.0009C0.847767 12.0394 0.918974 12.0711 0.993996 12.097C0.991556 12.4236 0.991625 12.8856 0.993582 13.487C0.994205 13.6785 0.994978 13.8748 0.996071 14.1278L0.99637 14.1972C0.999441 14.9078 0.999905 15.0152 0.999969 15.1227L0.999977 15.2108C0.999977 16.9671 1.05549 18.4347 1.16702 19.6154C1.28022 20.8138 2.23132 21.7614 3.43011 21.8701C5.99909 22.1031 8.18003 22.2198 9.97443 22.2198C11.772 22.2198 13.9694 22.1027 16.5682 21.8689C17.7678 21.7609 18.7199 20.813 18.8331 19.6139C18.9445 18.4334 19 16.9663 19 15.2108L19 15.122C19.0001 15.0096 19.0006 14.8972 19.0037 14.1834L19.0037 14.1832L19.0037 14.1831L19.004 14.1259C19.0051 13.8737 19.0059 13.6787 19.0065 13.4883C19.0085 12.8861 19.0086 12.4238 19.0061 12.0965C19.0811 12.0707 19.1523 12.0389 19.2242 12.0004C19.4743 11.8667 19.6736 11.6674 19.8073 11.4173C19.9504 11.1498 20 10.8931 20 10.4112L20 7.85486C20 6.51138 18.9382 5.40812 17.5957 5.3567C17.1091 5.33806 16.615 5.32132 16.1134 5.30649ZM17.5574 6.35596C15.8034 6.28878 13.9509 6.24645 12 6.229V11.1931H18.2181C18.549 11.1931 18.6498 11.1736 18.7526 11.1186C18.8285 11.0781 18.885 11.0216 18.9255 10.9457C18.9805 10.8429 19 10.7421 19 10.4112L19 7.85486C19 7.04878 18.3629 6.38682 17.5574 6.35596ZM18.0067 12.1931H12V21.153C12 21.1608 11.9998 21.1686 11.9995 21.1764C13.3242 21.1235 14.8174 21.0224 16.4786 20.8729C17.1983 20.8081 17.7696 20.2394 17.8375 19.5199C17.9457 18.3743 18 16.9373 18 15.2108L18 15.1202C18.0001 15.0073 18.0006 14.8943 18.0037 14.1807L18.004 14.1215C18.0051 13.8696 18.0059 13.6749 18.0065 13.4849C18.0083 12.9395 18.0085 12.5085 18.0067 12.1931ZM9.97443 21.2198C10.3033 21.2198 10.6461 21.2158 11.003 21.2078C11.001 21.1898 11 21.1715 11 21.153V6.22227C10.6399 6.22063 10.2766 6.21981 9.91005 6.21981C9.60399 6.21981 9.30065 6.22038 9.00004 6.22152V21.153C9.00004 21.1719 8.99899 21.1905 8.99695 21.2089C9.33515 21.2162 9.66098 21.2198 9.97443 21.2198ZM8.00067 21.1782C6.67357 21.1261 5.18002 21.0247 3.52044 20.8742C2.80117 20.809 2.23051 20.2404 2.16259 19.5214C2.05435 18.3755 1.99998 16.938 1.99998 15.2108L1.99997 15.121C1.99991 15.0147 1.99945 14.9084 1.99652 14.2281L1.9965 14.2238L1.99645 14.2136L1.99644 14.2099L1.99639 14.1995L1.99637 14.1961L1.99606 14.1234C1.99497 13.8708 1.9942 13.6748 1.99358 13.4838C1.99181 12.9391 1.99161 12.5084 1.99339 12.1936H8.00004V21.153C8.00004 21.1615 8.00025 21.1699 8.00067 21.1782ZM8.00004 11.1936H1.78194C1.45102 11.1936 1.35024 11.1741 1.24738 11.1191C1.17155 11.0785 1.11503 11.022 1.07447 10.9462C1.01946 10.8433 1 10.7425 1 10.4116V7.85214C1 7.04649 1.63641 6.38473 2.44144 6.35328C4.17168 6.28568 6.02457 6.24375 8.00004 6.22751V11.1936ZM6.08581 5.20186C4.93016 5.20186 4.00003 4.30259 4.00003 3.20186C4.00003 2.10114 4.93016 1.20186 6.08581 1.20186C7.11481 1.20186 7.9986 1.8907 7.9986 3.2336C7.9986 4.04164 8.24732 4.69291 8.72467 5.17742C7.568 5.19372 6.68823 5.20186 6.08581 5.20186ZM13.9142 1.20186C12.8852 1.20186 12.0014 1.8907 12.0014 3.2336C12.0014 4.04164 11.7527 4.69291 11.2753 5.17742C12.432 5.19372 13.3118 5.20186 13.9142 5.20186C15.0698 5.20186 16 4.30259 16 3.20186C16 2.10114 15.0698 1.20186 13.9142 1.20186Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
