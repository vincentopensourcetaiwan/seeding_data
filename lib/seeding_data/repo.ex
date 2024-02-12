defmodule SeedingData.Repo do
  use Ecto.Repo,
    otp_app: :seeding_data,
    adapter: Ecto.Adapters.Postgres
end
