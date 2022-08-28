defmodule Expixiv.Client do
  @moduledoc """
  Custom Tesla-based Pixiv API HTTP client.
  """
  use Tesla

  @headers [
    {"User-Agent", "PixivIOSApp/7.6.2 (iOS 12.2; iPhone9,1)"},
    {"App-Version", "7.6.2"},
    {"App-OS-VERSION", "12.2"},
    {"App-OS", "ios"}
  ]

  plug(Tesla.Middleware.BaseUrl, "https://app-api.pixiv.net")
  plug(Tesla.Middleware.Headers, @headers)
  plug(Tesla.Middleware.JSON, engine: Poison, engine_opts: [keys: :atoms])
end
