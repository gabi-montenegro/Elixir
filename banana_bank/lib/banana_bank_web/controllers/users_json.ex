defmodule BananaBankWeb.UsersJSON do
  #modulo de renderizacao (view)

  alias BananaBank.Users.User

  def create(%{user: user}) do#mesmo nome do create no controller no handle
    %{
      message: "User successful created!",
      data: data(user)
    }

  end

  def get(%{user: user}) do
    %{
      data: data(user)
    }
  end

  def update(%{user: user}), do: %{mesage: "User atualizado com sucesso", data: data(user)}

  def delete(%{user: user}) do
    %{
      message: "User excluido com sucesso",
      data: data(user)
    }
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      cep: user.cep,
      email: user.email,
      name: user.name
    }
  end


end
