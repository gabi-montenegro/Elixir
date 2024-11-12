defmodule BananaBankWeb.UsersController do
  use BananaBankWeb, :controller
  alias BananaBank.Users
  alias Users.User

  action_fallback BananaBankWeb.FallbackController #vai lidar com a excecao, em ultia instancia, esse fallbck vai ser chamado

  def create(conn, params) do
    with {:ok, %User{} = user} <- Users.create(params) do # se o retrno de Create.call for {:ok, %User{} = user}
      conn
      |> put_status(:created)
      |> render(:create, user: user) # ele sabe que eh o :create da view de sucesso users_json.ex
    end
  end

  def show(conn, %{"id" => id}) do #id que vem do endpoint vem como string e nao como atom
    with {:ok, %User{} = user} <- Users.get(id) do
      conn
      |> put_status(:ok)
      |> render(:get, user: user)

    end

  end

  def update(conn, params) do
    with {:ok, %User{} = user} <- Users.update(params) do
      conn
      |> put_status(201)
      |> render(:update, user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Users.delete(id) do #verifica se user tbm eh do tipo %User{}
      conn
      |> put_status(204) #com status 204, nao eh executado a view
      |> render(:delete, user: user)
    end
  end
end
