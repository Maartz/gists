defmodule Gist.Gists.SavedPost do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "saved_posts" do
    belongs_to :user, Gist.Accounts.User
    belongs_to :post, Gist.Gists.Post
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(saved_post, attrs) do
    saved_post
    |> cast(attrs, [:user_id, :post_id])
    |> validate_required([:user_id, :post_id])
  end
end
