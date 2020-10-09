defmodule Moon.Assets.Icons.IconDuotoneCoins do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property color, :string
  property background_color, :string

  def render(assigns) do
    class_name =
      get_class_name("Icons-IconDuotoneCoins-#{assigns.color}-#{assigns.background_color}")

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

    <svg class={{ class_name }} width="1em" height="auto"  viewBox="0 0 20 19" fill="none" xmlns="http://www.w3.org/2000/svg"> <g id="icon-duotone-coins"> <path id="Shadow" fill-rule="evenodd" clip-rule="evenodd" d="M10 13.2416C4.3928 13.2416 0 11.3316 0 8.89363C0 6.4557 4.3928 4.54562 10 4.54562C15.6076 4.54562 20 6.4557 20 8.89363C20 11.3316 15.6076 13.2416 10 13.2416Z" fill="white" fill-opacity="0.1"/> <path id="Coins" fill-rule="evenodd" clip-rule="evenodd" d="M17.8787 12.547V13.9395C17.8787 14.802 17.4014 15.5947 16.5805 16.2575C16.5793 16.2588 16.578 16.26 16.5767 16.2611L16.5753 16.2622C16.5732 16.264 16.571 16.2656 16.569 16.2675C15.2271 17.3442 12.9656 18.0678 10.3149 18.1663L10.312 18.1668L10.3094 18.1675L10.3093 18.1675C10.3073 18.1681 10.3053 18.1687 10.303 18.1687C10.3013 18.1687 10.2998 18.1683 10.2983 18.1678C10.2968 18.1673 10.2954 18.1669 10.294 18.1669L10.2176 18.1696C10.0453 18.1759 9.87284 18.1821 9.69697 18.1821C9.52109 18.1821 9.34867 18.1759 9.17628 18.1696L9.09998 18.1669C9.09904 18.1669 9.09814 18.1671 9.09723 18.1673L9.09565 18.1678L9.09409 18.1683C9.09307 18.1685 9.09201 18.1687 9.09089 18.1687C9.08985 18.1687 9.08887 18.1686 9.08792 18.1684L9.08498 18.1675C9.08309 18.1669 9.08119 18.1663 9.07907 18.1663C6.42808 18.0678 4.1665 17.3442 2.82494 16.2675L2.82274 16.2655L2.81959 16.263C2.81748 16.2614 2.81541 16.2597 2.81343 16.2578C1.99249 15.595 1.51521 14.802 1.51521 13.9395V11.5152C1.51521 10.7146 1.93673 9.94454 2.72736 9.27816V8.90451C1.9631 8.25813 1.51521 7.49599 1.51521 6.66687V4.24255C1.51521 1.86369 5.10925 0 9.69697 0C14.285 0 17.8787 1.86369 17.8787 4.24255V5.64169C18.6694 6.30807 19.0909 7.07809 19.0909 7.87903V10.303C19.0909 11.134 18.6448 11.8995 17.8787 12.547ZM16.6666 15.3389C17.056 14.9058 17.2727 14.4322 17.2727 13.9395V13.137C17.1027 13.3546 16.899 13.5616 16.6666 13.7576V15.3389ZM16.6851 12.6243C16.6788 12.6275 16.6725 12.6307 16.6666 12.634V10.9176C16.8805 10.8085 17.0833 10.694 17.2727 10.573V12.2404C17.2651 12.2459 17.2581 12.2516 17.2511 12.2573L17.251 12.2573C17.2433 12.2635 17.2356 12.2698 17.2272 12.2758C17.0636 12.3943 16.8896 12.5076 16.7036 12.6146L16.695 12.6192L16.6851 12.6243ZM15.4544 16.2705C15.6747 16.1459 15.8756 16.0141 16.0605 15.8765V14.1992C15.8702 14.3207 15.6689 14.4371 15.4544 14.5465V16.2705ZM16.0605 11.1955V12.9376L16.0525 12.9412L16.0525 12.9413C15.9515 12.987 15.8507 13.0327 15.7447 13.0758L15.7301 13.0818L15.73 13.0818L15.7299 13.0819C15.7083 13.0908 15.6867 13.0996 15.6647 13.1082C15.6219 13.1251 15.5769 13.1409 15.5319 13.1567L15.5318 13.1567L15.5318 13.1568L15.5317 13.1568L15.5316 13.1568C15.5057 13.1659 15.4798 13.175 15.4544 13.1843V11.4249C15.6641 11.3533 15.8656 11.2767 16.0605 11.1955ZM14.2423 16.8208C14.4532 16.7433 14.6553 16.6611 14.8483 16.5739V14.8238C14.6535 14.905 14.4514 14.9814 14.2423 15.0529V16.8208ZM13.6362 17.0224C13.4395 17.0815 13.238 17.1363 13.0304 17.1869V15.396C13.2371 15.349 13.4389 15.2975 13.6362 15.2417V17.0224ZM11.8182 17.4224C12.0243 17.3924 12.2255 17.3569 12.4243 17.3187V15.519C12.2255 15.5547 12.0234 15.5866 11.8182 15.6144V17.4224ZM11.2122 17.499C11.0131 17.5193 10.8101 17.5333 10.6061 17.5457V15.7293C10.8104 15.7177 11.0125 15.7029 11.2122 15.6838V17.499ZM9.39391 17.5684C9.435 17.5691 9.47585 17.5705 9.51671 17.5719H9.51678L9.51686 17.5719C9.57659 17.5739 9.63634 17.576 9.69695 17.576C9.75756 17.576 9.81731 17.5739 9.87704 17.5719L9.87712 17.5719H9.8772L9.87728 17.5719C9.91811 17.5705 9.95893 17.5691 9.99999 17.5684V15.7514C9.96616 15.7521 9.93246 15.753 9.89879 15.754C9.83172 15.7558 9.76474 15.7577 9.69695 15.7577C9.63616 15.7577 9.57655 15.7557 9.5169 15.7537L9.51681 15.7537L9.51673 15.7537L9.51664 15.7537L9.51656 15.7537L9.51648 15.7536L9.5164 15.7536L9.51632 15.7536L9.51624 15.7536C9.47561 15.7523 9.43496 15.7509 9.39391 15.7501V17.5684ZM8.78787 17.5457C8.58392 17.5333 8.38089 17.5193 8.18179 17.499V15.6847C8.38149 15.7035 8.58302 15.7202 8.78787 15.7314V17.5457ZM6.96995 17.3187C7.16844 17.3569 7.36996 17.3923 7.57572 17.4223V15.6141C7.37026 15.5865 7.16814 15.5553 6.96995 15.5202V17.3187ZM6.36392 17.1869C6.15634 17.1363 5.95452 17.0814 5.75754 17.0223V15.2501C5.95391 15.305 6.15786 15.3535 6.36392 15.3998V17.1869ZM4.54563 16.5741C4.73867 16.6611 4.9411 16.7432 5.15171 16.8208V15.0611C4.942 14.9899 4.74048 14.9129 4.54563 14.832V16.5741ZM3.93951 16.2704C3.7192 16.1458 3.51829 16.014 3.33344 15.8764V14.2094C3.52283 14.33 3.72557 14.4449 3.93951 14.5537V16.2704ZM2.12131 13.9395C2.12131 14.4322 2.33799 14.9059 2.72739 15.3392V13.7592C2.49587 13.5634 2.2898 13.3586 2.12131 13.1425V13.9395ZM9.697 15.1516C5.59051 15.1516 2.12131 13.4864 2.12131 11.5151C2.12131 10.9603 2.39526 10.4851 2.72739 10.1133V10.303C2.72739 10.4351 2.74224 10.5645 2.76406 10.693C2.7697 10.7264 2.77713 10.7593 2.78458 10.7924L2.78982 10.8157C2.80982 10.9042 2.83497 10.9915 2.86497 11.0782L2.87633 11.1121L2.87634 11.1122C2.88734 11.1453 2.89831 11.1784 2.91164 11.2112C2.95649 11.3206 3.0077 11.4285 3.06801 11.5339C3.09773 11.5864 3.1322 11.6374 3.16676 11.6885L3.19407 11.7291L3.2045 11.7446L3.20451 11.7447C3.22949 11.782 3.25456 11.8194 3.28195 11.8561C3.33802 11.9318 3.39802 12.0067 3.46196 12.0803C3.46971 12.0892 3.47782 12.0979 3.48591 12.1065L3.48592 12.1065L3.50045 12.1221C4.71139 13.4746 7.24207 14.4164 10.2913 14.5298C10.2932 14.5299 10.295 14.5305 10.2968 14.531C10.2988 14.5316 10.3008 14.5322 10.3031 14.5322C10.3047 14.5322 10.3062 14.5318 10.3076 14.5313L10.3076 14.5313C10.3091 14.5308 10.3105 14.5304 10.3122 14.5304L10.3886 14.5331H10.3886H10.3887H10.3887H10.3887H10.3887H10.3887H10.3887H10.3887H10.3888C10.561 14.5393 10.7334 14.5455 10.9092 14.5455C11.2761 14.5455 11.6337 14.5295 11.9865 14.5064C12.0405 14.5027 12.0939 14.4983 12.1477 14.4939L12.1537 14.4934C13.3768 14.4001 14.5062 14.1758 15.4802 13.841C14.0656 14.6495 11.9649 15.1516 9.697 15.1516ZM14.8483 13.3862V11.6137C14.6523 11.6686 14.4483 11.717 14.2423 11.7637V13.5504C14.2664 13.5446 14.2908 13.5391 14.3151 13.5336L14.3152 13.5336L14.3152 13.5336C14.3518 13.5253 14.3885 13.517 14.4241 13.5077C14.4625 13.4979 14.5003 13.4874 14.5381 13.4771L14.5381 13.4771L14.5381 13.477L14.5381 13.477L14.5382 13.477L14.5382 13.477L14.5677 13.4689C14.64 13.4493 14.71 13.428 14.7799 13.4068L14.78 13.4068L14.8483 13.3862ZM13.6362 11.8837V13.6825C13.5708 13.6951 13.5043 13.7067 13.4379 13.7183L13.398 13.7252L13.3093 13.7406C13.2207 13.7562 13.132 13.7717 13.0413 13.7846L13.0406 13.7847C13.0372 13.785 13.0335 13.7853 13.0304 13.7858V11.9776C13.2359 11.95 13.438 11.9188 13.6362 11.8837ZM12.4243 13.8601V12.0486C12.2243 12.067 12.0231 12.0837 11.8182 12.0952V13.9092C11.904 13.9039 11.9887 13.897 12.0734 13.8901L12.0735 13.8901L12.0737 13.8901L12.111 13.8871C12.1556 13.8831 12.2005 13.8794 12.2453 13.8757C12.3051 13.8708 12.3649 13.8658 12.4243 13.8601ZM11.2122 12.1137V13.9319C11.1738 13.9327 11.1356 13.934 11.0974 13.9353H11.0974H11.0974H11.0974H11.0973H11.0973H11.0973H11.0973H11.0972H11.0972H11.0972H11.0972H11.0971H11.0971H11.0971H11.0971H11.097H11.097H11.097H11.097H11.0969H11.0969H11.0969H11.0969H11.0968C11.0346 13.9374 10.9723 13.9395 10.9091 13.9395C10.846 13.9395 10.7837 13.9374 10.7215 13.9353H10.7214H10.7214H10.7214H10.7214H10.7213H10.7213H10.7213H10.7213H10.7212H10.7212H10.7212H10.7212H10.7211H10.7211H10.7211H10.7211H10.721H10.721H10.721H10.721H10.7209H10.7209H10.7209H10.7208C10.6827 13.934 10.6445 13.9327 10.6061 13.9319V12.1152C10.643 12.1159 10.6797 12.1169 10.7163 12.1178H10.7164H10.7164H10.7164H10.7165H10.7165H10.7165H10.7165H10.7166H10.7166H10.7166H10.7167H10.7167H10.7167H10.7167H10.7168H10.7168H10.7168H10.7169H10.7169H10.7169H10.7169H10.717H10.717H10.717C10.7809 12.1196 10.8446 12.1213 10.9091 12.1213C10.9699 12.1213 11.0296 12.1193 11.0892 12.1172L11.0893 12.1172L11.0894 12.1172L11.0895 12.1172L11.0895 12.1172L11.0896 12.1172L11.0897 12.1172C11.1304 12.1158 11.1711 12.1144 11.2122 12.1137ZM9.99999 13.9092V12.0928C9.79574 12.0813 9.59361 12.0664 9.39391 12.0476V13.8583C9.59392 13.8789 9.79544 13.8968 9.99999 13.9092ZM8.78787 11.9779V13.7825C8.58211 13.7525 8.38028 13.718 8.18179 13.6798V11.8827C8.38059 11.9185 8.58271 11.95 8.78787 11.9779ZM7.57572 13.5477V11.7594C7.36905 11.7124 7.16723 11.6609 6.96995 11.6055V13.3816C7.16692 13.4407 7.36784 13.4973 7.57572 13.5477ZM6.36392 11.4164V13.181C6.15271 13.1034 5.95118 13.0207 5.75754 12.9334V11.1873C5.9527 11.2685 6.15483 11.3449 6.36392 11.4164ZM5.15171 12.6288V10.9099C4.93716 10.8005 4.73594 10.6845 4.54563 10.5626V12.2333C4.73139 12.3709 4.93019 12.5042 5.15171 12.6288ZM5.15171 7.78021V9.54451C4.94079 9.46723 4.73897 9.3842 4.54563 9.29723V7.5496C4.74109 7.63081 4.9414 7.7087 5.15171 7.78021ZM3.33344 9.50056V10.303C3.33344 10.7921 3.55435 11.26 3.93951 11.6894V10.1212C3.70708 9.92542 3.50344 9.71845 3.33344 9.50056ZM3.93951 7.27076V8.99233C3.71799 8.86778 3.5192 8.73475 3.33344 8.59717V6.92439C3.52405 7.0453 3.72436 7.16167 3.93951 7.27076ZM2.12131 6.66684C2.12131 7.15594 2.34223 7.62353 2.72739 8.05294V6.47835C2.49708 6.28501 2.28829 6.08379 2.12131 5.86984V6.66684ZM2.12131 4.24251C2.12131 2.27123 5.59051 0.606031 9.697 0.606031C13.8035 0.606031 17.2727 2.27123 17.2727 4.24251C17.2727 6.21378 13.8035 7.87898 9.697 7.87898C5.59051 7.87898 2.12131 6.21378 2.12131 4.24251ZM5.75754 7.9691V9.74552C5.95482 9.80461 6.15574 9.86098 6.36392 9.91128V8.12426C6.15604 8.07729 5.95543 8.02426 5.75754 7.9691ZM6.96995 10.0437V8.24603C7.16874 8.28148 7.36996 8.31452 7.57572 8.34209V10.1461C7.37026 10.1164 7.16844 10.0815 6.96995 10.0437ZM8.18179 8.41142V10.2221C8.3818 10.2424 8.58332 10.2603 8.78787 10.2727V8.45718C8.58302 8.44596 8.38149 8.4302 8.18179 8.41142ZM9.39391 10.2954V8.47901C9.43067 8.47967 9.46723 8.48065 9.50377 8.48163L9.504 8.48164L9.50409 8.48164C9.56807 8.48335 9.63202 8.48507 9.69695 8.48507C9.76188 8.48507 9.82583 8.48335 9.88981 8.48164L9.88991 8.48164L9.89013 8.48163C9.92668 8.48065 9.96323 8.47967 9.99999 8.47901V10.2954C9.9616 10.2962 9.92342 10.2975 9.88525 10.2988H9.88522H9.8852H9.88517H9.88515H9.88512H9.88509H9.88507H9.88504H9.88502H9.88499C9.82262 10.3009 9.76025 10.303 9.69695 10.303C9.63364 10.303 9.57127 10.3009 9.50889 10.2988H9.50886H9.50884H9.50882H9.50879H9.50877H9.50875H9.50873H9.5087H9.50868H9.50865C9.47048 10.2975 9.4323 10.2962 9.39391 10.2954ZM10.6061 8.45718V10.2727C10.8107 10.2603 11.0122 10.2424 11.2122 10.2221V8.41142C11.0125 8.4302 10.811 8.44596 10.6061 8.45718ZM11.8182 10.1461V8.34209C12.024 8.31452 12.2252 8.28148 12.4243 8.24603V10.0437C12.2255 10.0815 12.024 10.1164 11.8182 10.1461ZM13.0304 8.12396V9.91128C13.2383 9.86098 13.4392 9.80461 13.6362 9.74552V7.9691C13.4386 8.02426 13.238 8.07729 13.0304 8.12396ZM14.2423 9.54451V7.78021C14.4526 7.7087 14.6529 7.63081 14.8483 7.5496V9.29723C14.655 9.3842 14.4535 9.46723 14.2423 9.54451ZM15.4544 7.27076V8.99233C15.6759 8.86778 15.8747 8.73475 16.0605 8.59717V6.92439C15.8699 7.0453 15.6695 7.16167 15.4544 7.27076ZM16.6666 6.47835C16.8969 6.28501 17.1057 6.08379 17.2727 5.86984V6.66684C17.2727 7.15564 17.0517 7.62353 16.6666 8.05294V6.47835ZM17.8787 6.47692V6.66692C17.8787 6.79874 17.8639 6.92845 17.8421 7.05663C17.8364 7.09 17.829 7.12297 17.8215 7.15603L17.8163 7.17936C17.7963 7.26785 17.7711 7.35512 17.7411 7.44179L17.7294 7.47687C17.7185 7.50979 17.7077 7.54271 17.6945 7.57513C17.6496 7.68423 17.5984 7.79211 17.5381 7.89787C17.5075 7.95159 17.472 8.00411 17.4365 8.05657L17.412 8.09272L17.4096 8.09635C17.382 8.13786 17.3545 8.17906 17.3242 8.2197C17.2681 8.29576 17.2081 8.37031 17.1442 8.44395C17.1359 8.45338 17.1273 8.46268 17.1187 8.47194L17.1057 8.48607C15.8947 9.83853 13.3637 10.7804 10.3149 10.8937C10.3138 10.8937 10.3128 10.8939 10.3118 10.8941L10.3089 10.8948C10.3071 10.8953 10.3052 10.8958 10.303 10.8958C10.3019 10.8958 10.3009 10.8957 10.2999 10.8954C10.2992 10.8953 10.2985 10.8951 10.2978 10.8949L10.2978 10.8949C10.2965 10.8945 10.2953 10.8941 10.2939 10.894L10.251 10.8956C10.0675 10.9024 9.88417 10.9092 9.69696 10.9092C9.54223 10.9092 9.38972 10.9033 9.23727 10.8974L9.10876 10.8925C9.10573 10.8926 9.10297 10.8934 9.10022 10.8942C9.09721 10.895 9.09421 10.8958 9.09088 10.8958C9.08627 10.8958 9.08211 10.8947 9.07796 10.8935L9.07795 10.8935C9.07446 10.8925 9.07098 10.8916 9.06724 10.8913C8.22449 10.8583 7.41143 10.7601 6.64656 10.6031C6.61232 10.6007 6.57868 10.5958 6.54838 10.5831C6.54277 10.5819 6.53739 10.5805 6.53201 10.5792L6.52857 10.5783L6.51565 10.5752C6.32867 10.5349 6.14443 10.4928 5.96442 10.4455C5.91406 10.4325 5.86501 10.4184 5.81601 10.4042L5.81599 10.4042L5.81598 10.4042L5.81585 10.4042C5.78706 10.3958 5.75829 10.3875 5.72926 10.3795C5.49471 10.3125 5.26773 10.2395 5.04591 10.1622C6.4608 10.9967 8.59995 11.5153 10.9091 11.5153C15.0156 11.5153 18.4848 9.85005 18.4848 7.87908C18.4848 7.32391 18.2109 6.84905 17.8787 6.47692ZM17.8787 10.1227C18.1102 9.9269 18.3163 9.72235 18.4848 9.50628V10.303C18.4848 10.7957 18.2681 11.2694 17.8787 11.7027V10.1227ZM9.69694 7.27292C5.78895 7.27292 2.72734 5.94166 2.72734 4.24252C2.72734 2.54338 5.78895 1.21213 9.69694 1.21213C13.6052 1.21213 16.6665 2.54338 16.6665 4.24252C16.6665 5.94166 13.6052 7.27292 9.69694 7.27292ZM3.33344 4.24254C3.33344 3.0719 5.89048 1.81822 9.69696 1.81822C13.5034 1.81822 16.0605 3.0719 16.0605 4.24254C16.0605 5.41318 13.5034 6.66686 9.69696 6.66686C5.89048 6.66686 3.33344 5.41318 3.33344 4.24254Z" fill="#8697A2"/> </g> </svg>
    </Context>
    """
  end
end
