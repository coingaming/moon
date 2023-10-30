defmodule MoonWeb.Layouts do
  @moduledoc false
  use MoonWeb, :html

  embed_templates("../templates/layout/*")
  # embed_sface("../templates/layout/default.sface")
end
