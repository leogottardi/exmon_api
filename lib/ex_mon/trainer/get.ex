defmodule ExMon.Trainer.Get do
  alias ExMon.{Trainer, Repo}
  alias Ecto.UUID

  def call(id) do
    id
    |> UUID.cast()
    |> verify_uuid_valid()
  end

  defp verify_uuid_valid({:ok, uuid}), do: get(uuid)
  defp verify_uuid_valid(:error), do: {:error, "Invalid ID format!"}

  defp get(uuid) do
    case Repo.get(Trainer, uuid) do
      nil -> {:error, "Trainer not found!"}
      trainer -> {:ok, trainer}
    end
  end
end
