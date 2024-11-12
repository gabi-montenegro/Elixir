defmodule BananaBank.Repo.Migrations.AddUniqueIndexToUsersEmail do
  use Ecto.Migration

  def change do
    create unique_index(:users, [:email]) # Adiciona a restrição única no campo email
  end
end
