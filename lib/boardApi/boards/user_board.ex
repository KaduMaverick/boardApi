defmodule BoardApi.Boards.UserBoard do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "board_users" do
    field :user_id, :id, primary_key: true
    field :board_id, :id, primary_key: true
    field :role, :string
    timestamps()
  end

  @doc false
  def changeset(user_board, attrs) do
    user_board
    |> cast(attrs, [:string])
    |> validate_required([:string])
  end
end
