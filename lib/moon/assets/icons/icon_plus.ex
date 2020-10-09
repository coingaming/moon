defmodule Moon.Assets.Icons.IconPlus do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property color, :string
  property background_color, :string

  def render(assigns) do
    class_name = get_class_name("Icons-IconPlus-#{assigns.color}-#{assigns.background_color}")

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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">  <path fill-rule="evenodd" clip-rule="evenodd" d="M8.42857 9.57143V16.4286C8.42857 17.1905 9.57143 17.1905 9.57143 16.4286V9.57143H16.4286C17.1905 9.57143 17.1905 8.42857 16.4286 8.42857H9.57143V1.57143C9.57143 0.809524 8.42857 0.809524 8.42857 1.57143V8.42857H1.57143C0.809524 8.42857 0.809524 9.57143 1.57143 9.57143H8.42857Z" fill="currentColor"/>  <path d="M8.42857 9.57143H8.77857V9.22143H8.42857V9.57143ZM9.57143 9.57143V9.22143H9.22143V9.57143H9.57143ZM9.57143 8.42857H9.22143V8.77857H9.57143V8.42857ZM8.42857 8.42857V8.77857H8.77857V8.42857H8.42857ZM8.77857 16.4286V9.57143H8.07857V16.4286H8.77857ZM9.22143 16.4286C9.22143 16.5241 9.1891 16.57 9.16033 16.5956C9.12512 16.6268 9.06828 16.65 9 16.65C8.93172 16.65 8.87488 16.6268 8.83967 16.5956C8.8109 16.57 8.77857 16.5241 8.77857 16.4286H8.07857C8.07857 16.714 8.1891 16.9538 8.37462 17.1187C8.55369 17.2779 8.78257 17.35 9 17.35C9.21743 17.35 9.44631 17.2779 9.62538 17.1187C9.8109 16.9538 9.92143 16.714 9.92143 16.4286H9.22143ZM9.22143 9.57143V16.4286H9.92143V9.57143H9.22143ZM16.4286 9.22143H9.57143V9.92143H16.4286V9.22143ZM16.4286 8.77857C16.5241 8.77857 16.57 8.8109 16.5956 8.83967C16.6268 8.87488 16.65 8.93172 16.65 9C16.65 9.06828 16.6268 9.12512 16.5956 9.16033C16.57 9.1891 16.5241 9.22143 16.4286 9.22143V9.92143C16.714 9.92143 16.9538 9.8109 17.1187 9.62538C17.2779 9.44631 17.35 9.21743 17.35 9C17.35 8.78257 17.2779 8.55369 17.1187 8.37462C16.9538 8.1891 16.714 8.07857 16.4286 8.07857V8.77857ZM9.57143 8.77857H16.4286V8.07857H9.57143V8.77857ZM9.22143 1.57143V8.42857H9.92143V1.57143H9.22143ZM8.77857 1.57143C8.77857 1.47593 8.8109 1.43002 8.83967 1.40445C8.87488 1.37315 8.93172 1.35 9 1.35C9.06828 1.35 9.12512 1.37315 9.16033 1.40445C9.1891 1.43002 9.22143 1.47593 9.22143 1.57143H9.92143C9.92143 1.28598 9.8109 1.04617 9.62538 0.881264C9.44631 0.722083 9.21743 0.65 9 0.65C8.78257 0.65 8.55369 0.722083 8.37462 0.881264C8.1891 1.04617 8.07857 1.28598 8.07857 1.57143H8.77857ZM8.77857 8.42857V1.57143H8.07857V8.42857H8.77857ZM1.57143 8.77857H8.42857V8.07857H1.57143V8.77857ZM1.57143 9.22143C1.47593 9.22143 1.43002 9.1891 1.40445 9.16033C1.37315 9.12512 1.35 9.06828 1.35 9C1.35 8.93172 1.37315 8.87488 1.40445 8.83967C1.43002 8.8109 1.47593 8.77857 1.57143 8.77857V8.07857C1.28598 8.07857 1.04617 8.1891 0.881264 8.37462C0.722083 8.55369 0.65 8.78257 0.65 9C0.65 9.21743 0.722083 9.44631 0.881264 9.62538C1.04617 9.8109 1.28598 9.92143 1.57143 9.92143V9.22143ZM8.42857 9.22143H1.57143V9.92143H8.42857V9.22143Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
