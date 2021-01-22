defmodule ExMon.Trainer.Pokemon.Delete do
  alias ExMon.{Pokemon, Repo}
  alias Ecto.UUID

  def call(id) do
    id
    |> UUID.cast()
    |> verify_uuid_valid()
  end

  defp verify_uuid_valid({:ok, uuid}), do: delete(uuid)
  defp verify_uuid_valid(:error), do: {:error, "Invalid ID format!"}

  defp delete(uuid) do
    case fetch_pokemon(uuid) do
      nil -> {:error, "Pokemon not found!"}
      pokemon -> Repo.delete(pokemon)
    end
  end

  defp fetch_pokemon(uuid), do: Repo.get(Pokemon, uuid)
end
