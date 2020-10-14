defmodule Moon.Helpers.GetCssForMapsSupport do
  def get_css_for_maps(css_maps, class_name) do
    css_maps
    |> Enum.filter(fn x -> x end)
    |> Enum.map(fn css_map -> get_css_for_map(css_map, class_name) end)
    |> Enum.join("\n")
  end

  def get_css_for_map(nil, class_name) do
    ""
  end

  def get_css_for_map(false, class_name) do
    ""
  end

  def get_css_for_map(css_map, class_name) do
    css_body =
      css_map
      |> Enum.filter(fn {_k, v} ->
        !is_map(v) && v != nil && v != ""
      end)
      |> Enum.map(fn {k, v} ->
        css_key = String.replace("#{k}", "_", "-")
        "#{css_key}: #{v}"
      end)
      |> Enum.join(";")

    css_tricks_1 =
      css_map
      |> Enum.filter(fn {k, v} ->
        is_map(v) && String.contains?("#{k}", "&")
      end)
      |> Enum.map(fn {k, v} ->
        child_node_name = String.replace("#{k}", "&", "#{class_name}")
        get_css_for_map(v, child_node_name)
      end)
      |> Enum.join("\n")

    css_tricks_2 =
      css_map
      |> Enum.filter(fn {k, v} ->
        is_map(v) && String.contains?("#{k}", "@")
      end)
      |> Enum.map(fn {k, v} ->
        child_node_name = String.replace("#{k}", "&", "#{class_name}")
        css = get_css_for_map(v, class_name)
        "#{k} {\n #{css} \n}"
      end)
      |> Enum.join("\n")

    """
    #{class_name} {
      #{css_body};
    }

    #{css_tricks_1}

    #{css_tricks_2}
    """
  end
end
