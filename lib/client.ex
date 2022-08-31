defmodule Expixiv.Client do
  @moduledoc """
  Custom Tesla-based Pixiv API HTTP client.
  """

  @headers [
    {"User-Agent", "PixivIOSApp/7.6.2 (iOS 12.2; iPhone9,1)"},
    {"App-Version", "7.6.2"},
    {"App-OS-VERSION", "12.2"},
    {"App-OS", "ios"}
  ]

  @base_url "https://app-api.pixiv.net"

  @spec client(String.t()) :: Tesla.Client.t()
  def client(access_token) do
    middleware = [
      {Tesla.Middleware.BaseUrl, @base_url},
      {Tesla.Middleware.Headers, @headers},
      {Tesla.Middleware.BearerAuth, token: access_token},
      {Tesla.Middleware.JSON, engine: Poison, engine_opts: [keys: :atoms]}
    ]

    Tesla.client(middleware)
  end

  @spec user_details(Tesla.Client.t(), any) :: {:error, any} | {:ok, Tesla.Env.t()}
  def user_details(client, user_id) do
    path = "/v1/user/detail"
    Tesla.get(client, path, query: [user_id: user_id, filter: "for_ios"])
  end
end
