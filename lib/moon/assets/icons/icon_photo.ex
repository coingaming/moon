defmodule Moon.Assets.Icons.IconPhoto do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconPhoto-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M16 12C12.6863 12 10 14.6863 10 18C10 21.3137 12.6863 24 16 24C19.3137 24 22 21.3137 22 18C22 14.6863 19.3137 12 16 12ZM12 18C12 15.7909 13.7909 14 16 14C18.2091 14 20 15.7909 20 18C20 20.2091 18.2091 22 16 22C13.7909 22 12 20.2091 12 18Z" fill="currentColor"/> <path fill-rule="evenodd" clip-rule="evenodd" d="M30 25V12.7082C30 10.108 27.8921 8.00002 25.2918 8.00002C24.266 8.00002 23.3283 7.42046 22.8695 6.50296L22 4.76394C21.153 3.07003 19.4217 2.00002 17.5279 2.00001L14.4722 2C12.5783 1.99999 10.847 3.07001 10 4.76393L9.1305 6.50293C8.67175 7.42043 7.734 7.99999 6.70821 7.99999C4.10794 7.99999 2 10.1079 2 12.7082V25C2 27.7614 4.23858 30 7 30L25 30C27.7614 30 30 27.7614 30 25ZM28 12.7082V25C28 26.6568 26.6569 28 25 28L7 28C5.34315 28 4 26.6568 4 25L4 12.7082C4 11.2125 5.21251 9.99999 6.70821 9.99999C8.49154 9.99999 10.1218 8.99242 10.9194 7.39736L11.7889 5.65836C12.297 4.642 13.3358 4 14.4721 4L17.5279 4.00001C18.6642 4.00002 19.703 4.64202 20.2111 5.65837L21.0807 7.39739C21.8782 8.99245 23.5085 10 25.2918 10C26.7875 10 28 11.2125 28 12.7082Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
