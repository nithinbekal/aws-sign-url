defmodule AwsSignUrl do
  @moduledoc """
  AwsSignUrl.call/2 takes a URL and signs it using AWS secret access
  key and returns the new URL.
  """

  @doc """
  Signs an Amazon API request `url` using the given AWS secret access `key`.

  Example:

      AwsSignUrl.call("http://webservices.amazon.com/onca/xml?foo=bar", "aws_secret_access_key")
      #=> "http://webservices.amazon.com/onca/xml?foo=bar&Signature=some-signature"

  """
  def call(url, key) do
    url
    |> URI.parse
    |> apply_timestamp
    |> apply_signature(key)
  end

  defp apply_timestamp(url) do
    query_with_ts =
      url.query
      |> URI.decode_query
      |> Map.put("Timestamp", timestamp)
      |> URI.encode_query
      |> String.replace("+", "%20")

    Map.put(url, :query, query_with_ts)
  end

  defp apply_signature(uri, key) do
    "#{uri}&Signature=#{signature(uri, key)}"
  end

  defp signature(uri, key) do
    string_to_sign =
      ["GET", uri.host, uri.path, uri.query]
      |> Enum.join("\n")

    :crypto.hmac(:sha256, key, string_to_sign)
    |> Base.encode64
    |> URI.encode_www_form
  end

  defp timestamp do
    DateTime.utc_now() |> DateTime.to_iso8601()
  end
end
