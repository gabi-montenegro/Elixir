defmodule BananaBankWeb.FallbackController do
  use BananaBankWeb, :controller
  alias BananaBank.Users.Create
  alias BananaBank.Users.User

  def call(conn, {:error, :not_found, :user}) do
    conn
    |> put_status(:not_found)
    |> put_view(json: BananaBankWeb.ErrorJSON)
    |> render(:error, status: :not_found, type: :user)
  end

  def call(conn, {:error, changeset}) do #se o controller de users nao conseguir lidar com ok, ele lanca o erro para esse metodo
    conn
    |> put_status(:bad_request)
    |> put_view(json: BananaBankWeb.ErrorJSON) #usando view especifica do error_json.ex
    |> render(:error, changeset: changeset) #renderiza a funca error do error_json.ex passando a changeset
  end

end
