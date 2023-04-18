defmodule MoonWeb.Layouts do
  @moduledoc false
  use MoonWeb, :html

  embed_templates("../templates/layout/*")
end
