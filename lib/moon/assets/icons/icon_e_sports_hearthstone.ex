defmodule Moon.Assets.Icons.IconESportsHearthstone do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property color, :string
  property background_color, :string

  def render(assigns) do
    class_name =
      get_class_name("Icons-IconESportsHearthstone-#{assigns.color}-#{assigns.background_color}")

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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M6 22L8.92876 20.8886L8.95251 20.8802L9 19L6 22Z" fill="#ECA51C"/> <path d="M22.5633 11.1452C22.2366 10.1924 21.7537 9.30022 21.1345 8.505L22.0275 6.02977L19.6394 8.56441L21.1212 8.5182L19.4476 8.72282H19.3682V8.62381H19.269V8.55121L19.5204 6.88785C18.7246 6.26805 17.8301 5.7861 16.8743 5.46212C15.0146 4.84596 13.0052 4.84596 11.1456 5.46212C10.1876 5.78731 9.2926 6.27401 8.49949 6.90105L6.01219 6.00337L8.61195 8.4522L8.56565 6.88785L8.79718 8.5116V8.61721H8.69133V8.72282H8.57888L6.96478 8.4786L8.38042 8.5314L6.01219 6.02977L6.90524 8.505C6.27682 9.29636 5.78905 10.1894 5.46313 11.1452C4.84562 13.0008 4.84562 15.0058 5.46313 16.8614C5.78905 17.8172 6.27682 18.7103 6.90524 19.5016L6.01881 21.9439L8.40688 19.4488L6.91847 19.495L8.48626 19.2838H8.56565V19.3828H8.67149V19.462L8.42011 21.1188C9.21708 21.7367 10.1112 22.2185 11.0662 22.5445C12.9273 23.1518 14.9338 23.1518 16.7949 22.5445C17.7492 22.22 18.6432 21.7405 19.441 21.1254H19.3748C19.474 21.1254 19.474 21.0792 19.4674 21.0594V20.8878V20.6567C19.4674 20.5049 19.4674 20.3531 19.4344 20.2013C19.4013 20.0495 19.3748 19.7459 19.3417 19.5412L19.2557 19.462L19.3153 19.4092C19.3153 19.4092 19.3153 19.3498 19.3153 19.3168H19.4277V19.2178H19.4873C19.7387 19.2838 19.9966 19.3432 20.248 19.396L20.6648 19.462L20.8698 19.495H20.9757H21.0286C21.0286 19.495 21.0617 19.495 21.0948 19.4026V19.5148C21.7232 18.7235 22.211 17.8305 22.5369 16.8746C23.1544 15.019 23.1544 13.014 22.5369 11.1585L22.5633 11.1452ZM16.1797 12.2608C16.1797 11.8911 15.3594 11.0858 15.3594 11.0858L13.5998 11.1386L12.4024 11.8449C11.8071 13.4423 12.8324 13.9637 12.8324 13.9637L13.4542 13.5611C13.3343 13.5135 13.2309 13.4318 13.1568 13.3263C13.0827 13.2207 13.0413 13.0958 13.0375 12.967C13.0375 12.4786 13.699 12.4522 14.301 12.6106C14.903 12.769 15.247 13.9769 15.2271 14.5908C15.2073 15.2046 14.301 15.6403 14.301 15.6403H13.8578C13.5047 15.8724 13.0789 15.9683 12.6601 15.91C12.2413 15.8517 11.8581 15.6432 11.5822 15.3234L10.2591 13.4093L10.0739 11.8119L10.1731 11.0594L10.8677 10.8284L11.4565 10.0429L13.4741 8.84823L13.5932 9.04625L13.9768 9.23107L14.4862 8.93404L16.7089 9.77232L18.0319 11.5413L18.5612 13.2112L18.3892 15.1914L17.6218 16.8614L16.9603 17.2508L16.8611 17.6865L15.2866 18.4125H14.2745L13.1103 18.7294L10.9736 18.0693L10.656 17.6073C10.656 17.6073 13.7189 16.4257 14.7905 15.9373C15.09 15.8134 15.3588 15.6257 15.5782 15.3874C15.7976 15.1492 15.9622 14.866 16.0606 14.5578L16.3186 14.4258C16.3186 14.4258 16.2194 12.637 16.1863 12.2608H16.1797Z" fill="#ECA51C"/> <path d="M19.0548 7.12397H19.0705L19 9L21.9922 6.00826L22 6L19.0548 7.12397Z" fill="#ECA51C"/> <path d="M21.8525 21.8457L21.6475 21.6314L21.2295 21.2029L20.4098 20.3457C19.9508 19.8829 19.4754 19.4371 19 19C19 19.2229 19 19.4543 19 19.6857C19 19.9171 19 20.08 19 20.2771V20.8C19 20.8 19 20.8514 19.1311 20.8686H19L22 22C22.0001 21.9787 21.9926 21.9581 21.979 21.9422C21.9653 21.9264 21.9465 21.9164 21.9262 21.9143L21.8525 21.8457Z" fill="#ECA51C"/> <path d="M20.8719 19.0608H20.8065H20.6757H20.4142C20.2425 19.0608 20.0708 19.0204 19.8992 19.0123C19.5997 18.9959 19.2995 18.9959 19 19.0123C19.4741 19.5386 19.9482 20.0568 20.4387 20.5669L21.2561 21.3765L21.6648 21.7895L21.8692 21.9919H21.9183C21.9312 21.9972 21.9451 22 21.9591 22C21.9732 22 21.987 21.9972 22 21.9919L21.1008 19.5628L20.9373 19.1013V19.2309C20.9128 19.0608 20.8883 19.0608 20.8719 19.0608Z" fill="#ECA51C"/> <path d="M23.327 13.88L27 14L23 11C23.2078 11.9372 23.3178 12.9056 23.327 13.88Z" fill="#ECA51C"/> <path d="M23.0132 14.1014C23.0009 14.9164 22.8816 15.7262 22.6582 16.51L27 13.9746L23.0132 14.1014ZM13.8986 4.99317L14 1L11.4647 5.34812C12.2891 5.11211 13.1425 4.99263 14 4.99317H13.8986ZM14 4.99317C14.8406 4.99731 15.6766 5.11674 16.4846 5.34812L14 1L14.1014 4.99317H14ZM14 27L16.5354 22.6582C15.7513 22.8807 14.9416 23 14.1268 23.0132L14 27ZM11.4647 22.6582L14 27L13.8986 23.0132C13.0752 23.0022 12.2569 22.8828 11.4647 22.6582ZM5.34179 11.4647L1 14L4.98684 13.8986C4.99685 13.0751 5.11621 12.2567 5.34179 11.4647ZM1 14L5.34179 16.5354C5.11842 15.7515 4.99908 14.9417 4.98684 14.1268L1 14Z" fill="#ECA51C"/> </svg>
    </Context>
    """
  end
end
