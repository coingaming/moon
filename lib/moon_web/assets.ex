defmodule MoonWeb.Assets do
  use AssetImport, assets_path: "assets"
  use Moon.Assets # add dependency assets
end
