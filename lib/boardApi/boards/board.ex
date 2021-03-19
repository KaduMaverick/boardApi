defmodule BoardApi.Boards.Board do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:users]}
  schema "boards" do
    field :name, :string

    many_to_many :users, BoardApi.Accounts.User, join_through: "board_users"

    timestamps()
  end

  @doc false
  def changeset(board, attrs) do
    board
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
