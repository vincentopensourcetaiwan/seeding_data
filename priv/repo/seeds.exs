# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     SeedingData.Repo.insert!(%SeedingData.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias SeedingData.Repo
alias SeedingData.Contents.Tag

Repo.insert!(%Tag{name: "elixir"})
