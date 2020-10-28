defmodule Moon.Assets.Icons.IconFreebet do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property(color, :string)
  property(background_color, :string)
  property(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconFreebet-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="auto"  viewBox="0 0 20 16" version="1.1" xmlns="http://www.w3.org/2000/svg" >   <!-- Generator: Sketch 53 (72520) - https://sketchapp.com -->   <title>icon-freebet</title>   <desc>Created with Sketch.</desc>   <defs>     <path d="M4.57705166,6.93439225 L4.5729781,6.9318139 C4.32083433,6.77222033 4.33048931,6.42152461 4.5910797,6.27431373 L7.67897951,4.52991924 C7.81363675,4.45384962 7.98255031,4.45526582 8.11573196,4.53358104 L8.35321887,4.6732312 L12.6911648,2.06195784 C12.8267981,1.98031189 13.0005512,1.97928367 13.1372753,2.05931789 L19.8039056,5.96176643 C20.0640925,6.11407218 20.0652286,6.46860725 19.8060224,6.62237296 L15.4166383,9.22623364 L15.4166383,10.2535026 L19.3603397,7.91411747 C19.5547454,7.79879692 19.8121571,7.85291532 19.9352849,8.03499429 C20.0584126,8.21707326 20.0006304,8.45816319 19.8062247,8.57348374 L15.4166383,11.1773657 L15.4166383,12.2047604 L19.3603374,9.86534309 C19.5547423,9.75002137 19.8121544,9.8041382 19.9352834,9.98621642 C20.0584124,10.1682946 20.0006319,10.4093849 19.806227,10.5247067 L15.4166383,13.1286273 L15.4166383,13.7230335 C15.4166383,13.8556098 15.3447732,13.9791185 15.225819,14.050979 L11.8925038,16.0646425 C11.6152401,16.2321381 11.2499944,16.0457118 11.2499944,15.7366969 L11.2499944,15.6000196 L7.3062952,17.9394369 C7.17093053,18.0197358 6.99839469,18.0202199 6.86251875,17.9406821 L0.195888478,14.0382336 C0.000749322348,13.9240049 -0.0585725058,13.6832432 0.0633894667,13.5004772 C0.185351439,13.3177113 0.442412695,13.2621509 0.637551851,13.3763796 L7.08187566,17.1486965 L11.2499944,14.6761527 L11.2499944,13.6487953 L7.3062952,15.9882127 C7.17093053,16.0685115 6.99839469,16.0689956 6.86251875,15.9894578 L0.195888478,12.0870093 C0.000749322348,11.9727806 -0.0585725058,11.7320189 0.0633894667,11.549253 C0.185351439,11.3664871 0.442412695,11.3109267 0.637551851,11.4251554 L7.08187566,15.1974723 L11.2499944,12.7249284 L11.2499944,11.6975711 L7.3062952,14.0369884 C7.17093053,14.1172872 6.99839469,14.1177713 6.86251875,14.0382336 L0.195888478,10.135785 C-0.0659004458,9.98254153 -0.0650600132,9.62518502 0.197447165,9.47302315 L4.57705166,6.93439225 Z M5.33400037,7.41350045 L1.20566143,9.80648566 L7.08187566,13.246248 L10.9365701,10.9596286 L5.33400037,7.41350045 Z M12.0833231,10.9943523 L12.0833231,12.933076 C12.0833944,12.9372455 12.0833943,12.9414129 12.0833231,12.9455765 L12.0833231,14.8843003 C12.0833944,14.8884697 12.0833943,14.892637 12.0833231,14.8968005 L12.0833231,15.0206099 L14.5833095,13.5103623 L14.5833095,12.9204797 C14.5832382,12.9163102 14.5832384,12.9121429 14.5833095,12.9079792 L14.5833095,9.25670845 L9.48636682,6.26112823 L7.88979987,5.32229404 L5.58027237,6.62697596 C5.58419663,6.62949942 5.58807988,6.63208971 5.59192002,6.63474636 L11.8999602,10.6273997 C12.0146174,10.6999716 12.0833231,10.8211244 12.0833231,10.950734 L12.0833231,10.9818518 C12.0833944,10.9860212 12.0833943,10.9901886 12.0833231,10.9943523 Z M9.13288006,5.13169778 L9.9293877,5.60007063 L14.9740391,8.56491817 L18.8006701,6.29489266 L12.9195604,2.85226469 L9.13288006,5.13169778 Z" id="path-1"></path>   </defs>   <g id="Icons" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">     <g id="Freebet" transform="translate(0.000000, -2.000000)">       <mask id="mask-2" fill="white">         <use xlink:href="#path-1"></use>       </mask>       <use id="icon-freebet" fill="currentColor" fill-rule="nonzero" xlink:href="#path-1"></use>     </g>   </g> </svg>
    </Context>
    """
  end
end
