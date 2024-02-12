defmodule SeedingData.ContentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SeedingData.Contents` context.
  """

  @doc """
  Generate a tag.
  """
  def tag_fixture(attrs \\ %{}) do
    {:ok, tag} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> SeedingData.Contents.create_tag()

    tag
  end
end
