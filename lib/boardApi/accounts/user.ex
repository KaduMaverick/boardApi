defmodule BoardApi.Accounts.User do
  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:name, :email]}
  schema "users" do
    field :avatar,  Avatar.Type
    field :email, :string
    field :name, :string
    field :password_hash, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password_hash, :name,])
    |> cast_attachments(attrs, [:avatar])
    |> validate_required([:email, :password_hash, :name])
    |> validate_format(:email, ~r/^[A-Za-z0-9._%+-+']+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/) # Check that email is valid
    |> unique_constraint(:email)
  end
end
