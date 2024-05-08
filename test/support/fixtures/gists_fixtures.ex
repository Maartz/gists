defmodule Gist.GistsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Gist.Gists` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        description: "some description",
        markup_text: "some markup_text",
        name: "some name"
      })
      |> Gist.Gists.create_post()

    post
  end

  @doc """
  Generate a saved_post.
  """
  def saved_post_fixture(attrs \\ %{}) do
    {:ok, saved_post} =
      attrs
      |> Enum.into(%{

      })
      |> Gist.Gists.create_saved_post()

    saved_post
  end
end
