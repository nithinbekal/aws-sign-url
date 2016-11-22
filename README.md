# AwsSignUrl

Sign Amazon REST API request URLs.

## Usage

Add `aws_sign_url` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:aws_sign_url, "~> 0.1.0"}]
end
```

Use the `call/2` function to add timestamp and signature to the URL.

```elixir
AwsSignUrl.call("http://webservices.amazon.com/onca/xml?foo=bar", "secret_access_key")
#=> "http://webservices.amazon.com/onca/xml?foo=bar&Timestamp=[timestamp]&Signature=some-signature"
```
