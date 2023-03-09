defmodule StreamingApp.Repo do
  use Ecto.Repo,
    otp_app: :streaming_app,
    adapter: Ecto.Adapters.Postgres
end
