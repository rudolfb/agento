defmodule Agento.Repo do
  use Ecto.Repo,
    otp_app: :agento,
    adapter: Ecto.Adapters.Postgres
end
