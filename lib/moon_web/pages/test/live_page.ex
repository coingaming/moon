defmodule MoonWeb.Pages.Test.LivePage.ContextInside do
  @moduledoc false
  use MoonWeb, :stateless_component
  alias Moon.Components.Button
  # that's just a copy of Surface.Components.Context in project tree for debug perspective
  # alias MoonWeb.Pages.Test.Context
  alias Surface.Components.Context

  prop(texter, :string, from_context: :texter)

  def render(assigns) do
    ~F"""
    <Button>{@texter || "no texter given"}</Button>
    """
  end

  def context_only(assigns) do
    ~F"""
    <Context put={foo: :bar}>
      we do put this line to debug the context iternal data presentation
    </Context>
    """
  end
end

defmodule MoonWeb.Pages.Test.LivePage do
  @moduledoc """
    Page for visual and automatic testing of moon render helper
  """

  use Phoenix.LiveView, layout: {MoonWeb.LayoutView, :live}

  alias Moon.Components.Button
  alias Moon.Components.Datepicker
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.SidebarLink

  # that's just a copy of Surface.Components.Context in project tree for debug perspective
  # alias MoonWeb.Pages.Test.Context
  alias Surface.Components.Context

  alias MoonWeb.Pages.Test.LivePage.ContextInside
  import ContextInside, only: [context_only: 1]

  import Moon.Helpers.MoonRender

  def mount(_, _, socket) do
    # IO.puts inspect socket.assigns, pretty: true
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <.moon module={Page}
      theme_name={@theme_name}
      active_page={@active_page}
      direction={@direction}
      __context__={%{
        active_page: __MODULE__,
        direction: @direction,
        theme_name: @theme_name
    }}>
      <.moon module={Button} variant="secondary">Secondary</.moon>
      <.moon module={Datepicker}
        start_date={Timex.today() |> Timex.beginning_of_week()}
        end_date={Timex.today() |> Timex.end_of_week()}
        week_starts_on={7}
        id="datepicker"
      />
      <.moon
        module={SidebarLink}
        __context__={%{
          active_page: __MODULE__,
          direction: @direction,
          theme_name: @theme_name
        }}
        route={MoonWeb.Pages.VisionPage}
      >
        Vision
      </.moon>
      <.moon module={ContextInside} texter="texter from attribute"/>
      <.moon module={ContextInside} __context__={%{texter: "texter from context attribute"}}/>
      <.context_only/>
      <.moon
        module={Context}
        put={[nil: [texter: "texter from context component"]]}
      >
        <.moon module={ContextInside}/>
      </.moon>
      <pre><%= inspect assigns, pretty: true, structs: false %></pre>
    </.moon>
    """
  end
end
