defmodule Moon.Components.LineChart do
  use Moon.StatelessComponent
  alias VegaLite, as: Vl

  prop id, :string, required: true
  prop width, :any, default: "container"
  prop height, :integer, default: 300
  prop values, :list, default: []
  prop time_format, :string, default: "%d/%m"

  def render(assigns) do
    ~F"""
    <div
      id={@id}
      phx-hook="VegaLite"
      phx-update="ignore"
      data-spec={graph_spec(@width, @height, @values, @time_format)}
      class="w-full -ml-6"
    >
    </div>
    """
  end

  def graph_spec(width, height, values, time_format) do
    Vl.new(width: width, height: height)
    |> Vl.data_from_values(values,
      format: %{parse: %{x: "utc:#{time_format}"}}
    )
    |> Vl.mark(:line, tooltip: true)
    |> Vl.encode_field(:x, "x",
      type: :temporal,
      title: nil,
      axis: %{
        domain: false,
        ticks: false,
        tick_count: %{interval: "day", step: 2},
        label_bound: true,
        label_expr: "timeFormat(datum.value, '#{time_format}')",
        label_color: "#8697A2",
        label_font: "Averta Std",
        label_font_size: 12,
        label_padding: 12
      }
    )
    |> Vl.encode_field(:y, "y",
      type: :quantitative,
      title: nil,
      axis: %{
        domain: false,
        ticks: false,
        label_color: "#8697A2",
        label_font: "Averta Std",
        label_font_size: 12,
        label_padding: 12
      }
    )
    |> Vl.encode_field(:color, "category", type: :nominal)
    |> VegaLite.Export.to_json()
  end
end
