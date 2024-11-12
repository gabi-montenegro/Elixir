defmodule BananaBank.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @required_params_create [:name, :password, :email, :cep]
  @required_params_update [:name, :email, :cep]

  #@derive {Jason.Encoder, only: [:name, :email, :cep]}
  schema "users" do
    field :name, :string
    field :password, :string, virtual: true # campo no mundo logico apenas
    field :password_hash, :string
    field :email, :string
    field :cep, :string

    timestamps()
  end

  #def changeset(user \\ %__MODULE__{}, params) # user pode ser vazio ou nao,  ao chamar changeset(params), o Elixir entende que user será %User{} e params será o segundo argumento

  def changeset(params) do #create user, id: _id quando usr nao existe
    %__MODULE__{}
    |> cast(params, @required_params_create)
    |> do_validations(@required_params_create)
    |> unique_constraint(:email)
    |> add_password_hash()
  end

  def changeset(user, params) do #update user
    user
    |> cast(params, @required_params_create)
    |> do_validations(@required_params_update)
    |> unique_constraint(:email)
    |> add_password_hash()
  end

  defp do_validations(changeset, fields) do
    changeset
    |> validate_required(fields)
    |> validate_length(:name, min: 3)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:cep, is: 8)
  end

  defp add_password_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    changeset
  |> change(%{password_hash: Pbkdf2.hash_pwd_salt(password)})
  end

  defp add_password_hash(changeset), do: changeset # se nao der pm com a de cima, retorna o changeset

end
