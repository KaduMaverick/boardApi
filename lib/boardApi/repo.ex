defmodule BoardApi.Repo do
  use Ecto.Repo,
    otp_app: :boardApi,
    adapter: Ecto.Adapters.Postgres
end
