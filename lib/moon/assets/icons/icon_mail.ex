defmodule Moon.Assets.Icons.IconMail do
  use Moon.StatelessComponent

  property color, :string
  property background_color, :string

  def render(assigns) do
    class_name = get_class_name("Icons-IconMail-#{assigns[:color]}-#{assigns[:background_color]}")

    ~H"""
    <style>
      .{{ class_name }} {
        vertical-align: middle;
        color: {{ @color }};
        background-color: {{ @background_color }};
      }
    </style>

    <svg class={{ class_name }} width="28" height="22" viewBox="0 0 28 22" fill="none" xmlns="http://www.w3.org/2000/svg">  <path fill-rule="evenodd" clip-rule="evenodd" d="M28 17L28 5C28 2.23857 25.7614 -2.88147e-06 23 0L5 1.75953e-05C2.23857 2.02979e-05 1.66893e-06 2.2386 1.66893e-06 5.00002V17C1.66893e-06 19.7614 2.23858 22 5 22L23 22C25.7614 22 28 19.7614 28 17ZM26 6.04926L26 17C26 18.6568 24.6569 20 23 20L5 20C3.34315 20 2 18.6569 2 17L2 6.04929L11.1884 12.2974C12.8852 13.4512 15.1147 13.4512 16.8115 12.2974L26 6.04926ZM25.7505 3.80032C25.2876 2.7406 24.2303 2 23 2L5 2.00002C3.76968 2.00002 2.71234 2.74063 2.24948 3.80034L12.313 10.6436C13.3311 11.3359 14.6688 11.3359 15.6869 10.6436L25.7505 3.80032Z" fill="currentColor"/> </svg>
    """
  end
end
