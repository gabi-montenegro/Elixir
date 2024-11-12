defmodule BananaBank.Users.Create do
  alias BananaBank.Users.User
  alias BananaBank.Repo

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end

  #defp handle_insert({:ok, user}), do: user # ok retorna User
  #defp handle_insert({:error, changeset}), do: changeset # erro retorna Changeset

end
