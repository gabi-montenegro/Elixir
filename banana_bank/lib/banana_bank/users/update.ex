defmodule BananaBank.Users.Update do
  alias BananaBank.Users.User
  alias BananaBank.Repo

  def call(%{"id" => id} = params) do #extrai id do mapa params e mantem o resto
    case Repo.get(User, id) do
      nil -> {:error, :not_found, :user}
      user -> update(user, params)
    end
  end

  defp update(user, params) do
    user
    |> User.changeset(params) #crio um changeset com ele
    |> Repo.update()
  end
end
