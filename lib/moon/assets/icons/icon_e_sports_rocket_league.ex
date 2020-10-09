defmodule Moon.Assets.Icons.IconESportsRocketLeague do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property color, :string
  property background_color, :string

  def render(assigns) do
    class_name =
      get_class_name("Icons-IconESportsRocketLeague-#{assigns.color}-#{assigns.background_color}")

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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M12.9574 11.1004C12.9574 11.1004 13.5252 11.1434 14.0056 11.7459L13.7435 11.7889L13.6125 11.7459C13.6125 11.7459 13.2194 11.2725 12.9574 11.1004ZM12.084 13.7684L11.8219 13.123H11.7346L11.2978 13.6393C11.6035 13.8975 12.084 13.7684 12.084 13.7684ZM16.1019 9.98156L15.8835 10.0676L16.1455 10.541L17.019 10.8422C16.6696 10.1107 16.1019 9.98156 16.1019 9.98156ZM13.6125 10.8852C13.8745 11.1865 14.1366 11.6168 14.1366 11.6168C14.5733 11.1865 15.4904 11.0143 16.6696 11.0574C15.01 10.7131 13.6125 10.8852 13.6125 10.8852ZM11.9966 10.2398C11.9966 10.2398 12.477 10.2398 13.1321 10.3689C12.6954 10.0676 11.9966 9.89549 11.9966 9.89549V10.2398ZM16.0145 12.6066L15.2721 13.252L15.8398 13.4242L16.4076 12.8217L16.1019 12.6926L16.0145 12.6066ZM11.0795 9.20697C11.0795 9.20697 11.3852 9.3791 11.4289 9.3791C11.4725 9.3791 12.084 9.59426 12.346 9.68033C12.5644 9.76639 12.6954 9.68033 12.739 9.68033C12.7827 9.68033 13.5252 9.25 13.5252 9.25C12.8701 8.9918 12.2586 8.81967 12.2586 8.81967C12.215 8.81967 11.0795 9.20697 11.0795 9.20697ZM15.5341 9.59426C15.4904 9.5082 15.4031 9.5082 14.879 9.42213C14.3986 9.3791 13.9619 9.33606 13.8745 9.33606C13.7872 9.33606 13.7435 9.3791 13.7435 9.3791C13.7435 9.3791 13.4815 9.55123 13.2631 9.68033C13.0448 9.80943 13.0011 9.85246 12.9574 9.93852C12.9137 9.98156 13.0448 10.1537 13.0448 10.1537L13.3941 10.584C13.4378 10.584 13.5688 10.6701 13.5688 10.6701C13.5688 10.6701 14.2676 10.627 14.7043 10.584H15.8398C15.8835 10.584 15.8398 10.4119 15.7525 10.1967C15.6651 10.0246 15.5341 9.59426 15.5341 9.59426ZM11.3852 10.0676C11.3852 10.0676 11.4289 10.0676 11.5162 10.1107C11.6035 10.1107 11.6472 10.0246 11.6472 9.93852C11.6472 9.80943 11.5162 9.76639 11.5162 9.76639H11.4289L11.2978 9.80943L11.2542 10.1107H11.2978L11.3852 10.0676C11.3415 9.98156 11.3415 9.93852 11.3415 9.85246C11.3415 9.80943 11.4289 9.72336 11.4725 9.72336C11.4725 9.72336 11.5599 9.72336 11.5162 9.89549C11.5162 10.0676 11.3852 10.0676 11.3852 10.0676ZM18.7659 13.4672L18.4165 13.9406V13.9836H18.8969C18.9843 13.6824 18.7659 13.4672 18.7659 13.4672ZM10.0313 11.2295H9.94398L9.72562 11.1865C9.50725 11.1434 9.5946 10.7561 9.5946 10.7561L9.33256 10.8422C9.24522 10.6701 8.85216 10.1967 8.85216 10.1967L8.76481 10.541C8.80849 10.584 9.02685 10.9283 9.07053 11.0143L8.93951 11.1434C8.93951 11.1434 8.89583 11.2295 8.89583 11.2725C8.89583 11.3156 8.85216 11.3586 8.85216 11.3586L8.67747 11.4447H8.6338L8.02238 10.9713V11.3156H8.06605C8.10972 11.4016 8.19707 11.5738 8.41543 11.6598C8.59012 11.7459 8.80849 11.7459 8.89583 11.7029C8.98318 11.7459 9.02685 11.7459 9.07053 11.7889C9.24522 11.875 9.28889 11.832 9.28889 11.832L9.55093 11.7459H9.5946L9.63827 11.7029L9.72562 11.5307C9.72562 11.5307 10.1623 11.5738 10.337 11.5738C10.5117 11.3156 11.0795 10.9283 11.4725 10.8852C11.8656 10.8852 12.5207 10.9713 13.0448 11.4877C13.5252 12.0041 13.3941 12.6926 13.3941 12.6926L14.3549 12.9939L13.9182 12.6926C13.5688 11.832 12.739 11.0574 12.739 11.0574C12.739 11.0574 12.5207 11.0143 12.3897 11.0143C12.2586 10.9713 12.1713 10.8852 12.1713 10.8852C12.1713 10.8852 12.1276 10.8422 12.0403 10.7131L11.9529 10.541C11.9529 10.541 11.8656 10.4549 11.7346 10.3689C11.6035 10.2828 11.1231 10.2398 10.8611 10.1967C10.5991 10.1537 10.5991 10.1967 10.5991 10.1967C11.3415 10.3689 11.5599 10.4119 11.6035 10.4549C11.6035 10.4549 11.6472 10.541 11.6909 10.584C11.0795 10.4549 10.5117 10.541 10.3807 10.584C10.4681 10.7131 10.4681 10.8852 10.3807 11.0143C10.2934 11.1004 10.0313 11.2295 10.0313 11.2295ZM18.3292 14.3279L18.4602 14.8873C18.4602 14.8873 18.5912 14.7582 18.7222 14.5861C18.8532 14.4139 18.8969 14.2418 18.8969 14.2418L18.3728 14.2848L18.3292 14.3279ZM7.80401 10.4119L7.76034 10.8852H8.02238L8.06605 10.584V10.7561H8.10972V10.498H8.06605V10.3258L8.45911 10.541L8.50278 10.627L8.59013 10.7131H8.67747L8.72114 10.6701V10.627C8.45911 10.627 8.45911 10.498 8.45911 10.498C8.45911 10.498 8.50278 10.1967 8.54645 10.1107C8.59012 10.0246 8.76481 10.0676 8.76481 10.0676L8.72114 10.0246H8.6338C8.54645 9.98156 8.28441 9.80943 8.19707 9.76639V9.72336L8.24074 9.68033V9.5082H8.28441C8.28441 9.46516 8.32809 9.46516 8.32809 9.42213C8.41543 9.42213 9.07053 9.29303 9.07053 9.29303L8.45911 9.16393V9.1209C8.28441 9.07787 8.1534 9.03484 8.06605 8.9918C7.84769 9.25 7.76034 9.59426 7.76034 9.59426C7.76034 9.59426 7.71667 10.1967 7.71667 10.2828C7.673 10.3689 7.80401 10.4119 7.80401 10.4119ZM18.0671 13.8115L18.1545 13.9406L18.1982 13.8975L18.5475 13.4672V13.4242C18.3728 13.4242 18.0671 13.8115 18.0671 13.8115ZM17.019 13.0369L16.7569 12.9508L16.1455 13.6393L16.5823 13.7684C16.6696 13.4242 17.019 13.0369 17.019 13.0369ZM17.9361 14.0266C17.7177 14.457 17.7614 14.7582 17.7614 14.7582L17.9798 14.2848V14.1988C18.0235 14.1988 17.9798 14.1127 17.9361 14.0266ZM17.7177 11.2295C17.7177 11.2295 17.6304 11.4016 17.5867 11.4447C17.5431 11.4877 17.2373 11.5307 17.0627 11.5738C16.888 11.6598 16.5823 11.7889 16.4949 11.875C16.4512 11.918 16.4512 12.0471 16.4512 12.0902C16.4512 12.0902 16.5386 12.1332 16.5823 12.1332L16.1892 12.4775L16.2765 12.5635L17.2373 12.8648C17.4557 12.6926 17.7614 12.6496 17.7614 12.6496C17.5867 12.5635 16.8443 12.2623 16.6259 12.1762C16.6259 12.1762 16.4949 12.1332 16.4949 12.0902V11.9611C16.4949 11.9611 17.0627 11.5307 17.9361 11.5307L18.0671 11.2725L17.7177 11.2295ZM18.2855 15.0164L18.1108 14.5H18.0671L17.8051 14.9734L17.8488 15.0164C18.0671 15.1025 18.2855 15.0164 18.2855 15.0164ZM11.6909 10.1107L11.8219 10.1537C11.8219 10.1537 11.9093 10.1537 11.9093 10.0676V9.89549L11.7782 9.80943L11.6035 9.76639C11.6472 9.80943 11.6472 9.85246 11.6472 9.85246H11.6909C11.6909 9.80943 11.7346 9.80943 11.7346 9.85246C11.7346 9.85246 11.8219 9.89549 11.7782 10.0246C11.8219 10.0676 11.7346 10.1107 11.6909 10.1107ZM11.2978 12.4775C10.9921 13.0369 11.2105 13.4242 11.2105 13.4242L11.6035 12.8648V12.7787L11.2978 12.4775ZM8.45911 9.16393L8.98318 9.29303C9.02685 9.29303 9.33256 9.25 9.33256 9.25L8.50278 9.03484L8.45911 9.16393ZM8.76481 9.03484C9.46358 9.1209 9.5946 9.25 9.5946 9.25C9.5946 9.25 9.85664 9.20697 9.98766 9.20697C9.76929 9.03484 8.80849 8.73361 8.80849 8.73361C8.80849 8.73361 8.76481 8.86271 8.76481 9.03484ZM9.81296 10.3689C9.68194 10.4549 9.55093 10.7131 9.5946 10.9283C9.63827 11.1434 9.68194 11.1434 9.81296 11.1434C9.5946 11.0574 9.63827 10.7131 9.81296 10.498C9.94398 10.3258 10.075 10.4549 10.075 10.4549C10.075 10.4549 9.94398 10.2828 9.81296 10.3689ZM6.71219 16.7377C6.14444 16.7377 5.48935 16.9529 5.88241 17.5553C9.1142 23.0205 12.5207 24.3115 13.9619 25C14.617 24.6988 15.6651 24.2254 16.9316 23.3648C17.6741 22.8914 17.5867 22.1598 17.412 21.6865C16.4949 19.4488 11.4725 16.9098 6.71219 16.7377ZM24.9238 6.53893C23.6136 5.63524 20.3818 4 13.9619 4C11.7346 4 9.85664 4.21516 8.37176 4.51639C8.72114 5.07582 8.89583 5.72131 8.89583 6.40984C8.89583 7.35656 8.54645 8.21721 7.9787 8.8627C8.10972 8.90574 8.28441 8.94877 8.50278 8.9918L8.59013 8.77664C8.59013 8.77664 8.67747 8.77664 8.72114 8.81967C8.72114 8.60451 8.85216 8.60451 8.85216 8.60451C8.85216 8.60451 8.85216 8.56147 8.89583 8.56147C9.1142 8.60451 9.72562 8.90574 9.98766 9.03484C10.2497 9.16393 10.2497 9.20697 10.2497 9.20697C10.2497 9.20697 10.8611 9.20697 11.0358 9.16393C11.2105 9.16393 11.5162 9.03483 11.9529 8.90574C12.3897 8.77664 12.477 8.73361 12.5644 8.73361C12.6517 8.73361 13.4378 8.77664 14.1366 8.8627C14.8353 8.94877 15.4904 9.20697 15.6215 9.29303L15.8398 9.33606L15.8835 9.20697L15.5341 9.07787C15.5341 9.07787 15.5778 8.86271 15.5778 8.81967C15.5778 8.77664 15.6215 8.73361 15.6651 8.73361C15.7088 8.73361 16.1019 8.81967 16.2329 8.8627C16.3639 8.90574 16.8006 9.20697 16.8443 9.20697C16.888 9.20697 16.888 9.25 16.888 9.25C16.888 9.33607 16.8006 9.5082 16.8006 9.5082L16.6696 9.46516L16.8006 9.5082C16.8006 9.5082 16.9316 9.55123 16.9753 9.59426C17.019 9.63729 17.15 9.72336 17.281 9.85246C17.412 9.93852 17.3684 10.0676 17.3684 10.0676L17.6741 10.3689V10.498L18.4165 11.2295V11.2725L18.0671 11.4877C18.0671 11.4877 18.5475 11.4447 18.8969 11.6168C19.2463 11.7889 19.29 11.875 19.29 11.9611C19.2026 12.0041 19.0716 12.0471 19.0716 12.0471C18.8096 12.1332 18.1545 12.5635 18.1545 12.5635V12.6066L18.5039 12.6926C18.8969 12.3484 19.5957 12.2193 20.1198 12.3053C21.9103 12.6496 23.1332 13.8115 23.3952 14.8012C23.3952 14.8443 23.4389 14.9303 23.4389 14.9734C25.2295 10.8422 25.0548 7.87295 24.9238 6.53893ZM18.6349 12.8217C18.6786 12.8648 18.7222 12.8648 18.7659 12.9078C19.0279 13.0799 19.159 13.166 19.2026 13.5533C19.2463 13.8545 19.159 14.2848 18.9406 14.6721C20.1634 15.4898 21.8667 14.8443 22.5218 15.4898C22.3907 13.8545 19.9451 12.2193 18.6349 12.8217ZM8.59013 10.7131L8.50278 10.7561V11.1004L8.59013 11.0574V10.7131ZM21.2116 16.0492C20.2944 16.0492 19.3773 15.748 18.7222 14.9734V15.0164C18.3292 15.5328 17.8924 15.5328 17.7177 15.5328C17.5431 15.5328 16.9753 15.2746 16.7569 15.0164C16.5386 14.7582 16.5386 14.2848 16.5386 14.2848L15.6651 13.9836L14.5733 13.3811L14.3986 13.3381C14.0492 13.5102 13.6125 13.3811 13.2194 13.0799C13.1758 13.252 12.9574 13.6824 12.6954 13.8975C12.4333 14.1127 11.9093 14.4139 11.5162 14.4139C11.1231 14.4139 10.2497 13.9836 9.98766 13.3811C9.72562 12.7787 9.98766 12.1332 9.98766 12.1332L9.55093 12.0471L9.37623 11.832C9.37623 11.832 8.85216 12.2623 8.28441 12.0902C7.71667 11.918 7.23627 11.4447 7.10525 11.0143C7.0179 10.584 7.14892 10.1967 7.19259 10.1537C7.10525 9.85246 7.10525 9.68033 7.10525 9.68033H7.06158V9.55123C6.49383 9.93852 5.83874 10.1107 5.13997 10.1107C4.35386 10.1107 3.61142 9.85246 3 9.46516C3.08735 10.4119 3.34938 11.5307 3.69876 12.7787C4.17917 14.5 5.75139 15.0594 8.10972 15.4467C13.3068 16.2643 18.2855 20.1803 17.9361 22.5902C19.2463 21.5143 20.6438 19.9221 22.0414 17.5553C22.6091 16.6516 22.085 16.0492 21.2116 16.0492ZM7.32361 10.1107L7.27994 10.584H7.58565V10.541H7.54198V10.498H7.4983L7.54198 10.4119L7.58565 10.1967L7.54198 10.1537V10.0676L7.58565 10.0246L7.62932 9.5082L7.41096 9.3791C7.4983 9.03484 7.71667 8.73361 7.71667 8.73361H7.58565C7.36728 8.9918 7.27994 9.33606 7.27994 9.33606C7.27994 9.33606 7.23626 9.89549 7.23626 9.98156C7.23626 10.1107 7.32361 10.1107 7.32361 10.1107ZM12.1276 12.9939L12.346 13.6824C12.7827 13.3811 12.8701 12.9078 12.8701 12.9078L12.1713 12.9508L12.1276 12.9939ZM12.5207 11.918L12.1713 12.5205L12.215 12.5635L12.9137 12.6066C12.9137 12.1332 12.5207 11.918 12.5207 11.918ZM8.1534 10.584L8.10972 10.8422H8.1534V10.584ZM11.4725 12.2193L11.8219 12.4775L11.9093 12.4344L12.3023 11.832C11.8219 11.7889 11.4725 12.2193 11.4725 12.2193ZM8.24074 10.627L8.19707 10.584V10.8852H8.24074V10.627ZM8.37176 10.7131L8.32809 11.0143H8.37176V10.7131ZM8.45911 10.7561L8.41543 11.0574H8.45911V10.7561ZM8.28441 10.6701L8.24074 10.9713H8.28441V10.6701Z" fill="#018FE2"/> </svg>
    </Context>
    """
  end
end
