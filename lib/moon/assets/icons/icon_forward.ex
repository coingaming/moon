defmodule Moon.Assets.Icons.IconForward do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconForward-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M28.3295 13.5096C28.3172 13.496 28.3045 13.4826 28.2914 13.4695L19.034 4.19563C18.7607 3.92177 18.7611 3.47815 19.0349 3.20477C19.3088 2.9314 19.7524 2.93179 20.0258 3.20565L29.2831 12.4795C30.2396 13.4375 30.2389 14.9893 29.2815 15.9463L20.0115 25.2154C19.7378 25.489 19.2942 25.489 19.0206 25.2153C18.747 24.9417 18.747 24.4981 19.0207 24.2245L28.2908 14.9553C28.3053 14.9408 28.3193 14.926 28.3327 14.9109H16.0671C9.09203 14.9109 3.42966 20.5503 3.40128 27.5253C3.39971 27.9123 3.08474 28.2247 2.69779 28.2231C2.31084 28.2216 1.99843 27.9066 2.00001 27.5196C2.03152 19.7729 8.32034 13.5096 16.0671 13.5096H28.3295Z" fill="currentColor" stroke="currentColor" stroke-width="0.8"/> </svg>
    </Context>
    """
  end
end
