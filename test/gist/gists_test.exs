defmodule Gist.GistsTest do
  use Gist.DataCase

  alias Gist.Gists

  describe "posts" do
    alias Gist.Gists.Post

    import Gist.GistsFixtures

    @invalid_attrs %{name: nil, description: nil, markup_text: nil}

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Gists.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Gists.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      valid_attrs = %{name: "some name", description: "some description", markup_text: "some markup_text"}

      assert {:ok, %Post{} = post} = Gists.create_post(valid_attrs)
      assert post.name == "some name"
      assert post.description == "some description"
      assert post.markup_text == "some markup_text"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gists.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", markup_text: "some updated markup_text"}

      assert {:ok, %Post{} = post} = Gists.update_post(post, update_attrs)
      assert post.name == "some updated name"
      assert post.description == "some updated description"
      assert post.markup_text == "some updated markup_text"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Gists.update_post(post, @invalid_attrs)
      assert post == Gists.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Gists.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Gists.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Gists.change_post(post)
    end
  end

  describe "saved_posts" do
    alias Gist.Gists.SavedPost

    import Gist.GistsFixtures

    @invalid_attrs %{}

    test "list_saved_posts/0 returns all saved_posts" do
      saved_post = saved_post_fixture()
      assert Gists.list_saved_posts() == [saved_post]
    end

    test "get_saved_post!/1 returns the saved_post with given id" do
      saved_post = saved_post_fixture()
      assert Gists.get_saved_post!(saved_post.id) == saved_post
    end

    test "create_saved_post/1 with valid data creates a saved_post" do
      valid_attrs = %{}

      assert {:ok, %SavedPost{} = saved_post} = Gists.create_saved_post(valid_attrs)
    end

    test "create_saved_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gists.create_saved_post(@invalid_attrs)
    end

    test "update_saved_post/2 with valid data updates the saved_post" do
      saved_post = saved_post_fixture()
      update_attrs = %{}

      assert {:ok, %SavedPost{} = saved_post} = Gists.update_saved_post(saved_post, update_attrs)
    end

    test "update_saved_post/2 with invalid data returns error changeset" do
      saved_post = saved_post_fixture()
      assert {:error, %Ecto.Changeset{}} = Gists.update_saved_post(saved_post, @invalid_attrs)
      assert saved_post == Gists.get_saved_post!(saved_post.id)
    end

    test "delete_saved_post/1 deletes the saved_post" do
      saved_post = saved_post_fixture()
      assert {:ok, %SavedPost{}} = Gists.delete_saved_post(saved_post)
      assert_raise Ecto.NoResultsError, fn -> Gists.get_saved_post!(saved_post.id) end
    end

    test "change_saved_post/1 returns a saved_post changeset" do
      saved_post = saved_post_fixture()
      assert %Ecto.Changeset{} = Gists.change_saved_post(saved_post)
    end
  end
end
