defmodule BoardApi.Repo.Migrations.CreateBoardUsers do
  use Ecto.Migration

  def change do
    create table(:board_users, primary_key: false) do
      add :user_id, references(:users, on_delete: :nothing), null: false, primary_key: true
      add :board_id, references(:boards, on_delete: :nothing), null: false, primary_key: true
    end

    create index(:board_users, [:user_id])
    create index(:board_users, [:board_id])
  end
end
