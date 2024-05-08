defmodule Gist.Gists.SavedPost do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "saved_posts" do

    field :user_id, :binary_id
    field :post_id, :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(saved_post, attrs) do
    saved_post
    |> cast(attrs, [])
    |> validate_required([])
  end
end
