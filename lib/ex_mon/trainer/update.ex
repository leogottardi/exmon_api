defmodule ExMon.Trainer.Update do
  alias ExMon.{Trainer, Repo}
  alias Ecto.UUID

  def call(%{"id" => uuid} = params) do
    IO.inspect(params)

    uuid
    |> UUID.cast()
    |> verify_uuid_valid(params)
  end

  defp verify_uuid_valid({:ok, _uuid}, params), do: update(params)
  defp verify_uuid_valid(:error, _params), do: {:error, "Invalid ID format!"}

  defp update(%{"id" => uuid} = params) do
    case fetch_trainer(uuid) do
      nil -> {:error, "Trainer not found!"}
      trainer -> update_trainer(trainer, params)
    end
  end

  defp fetch_trainer(uuid), do: Repo.get(Trainer, uuid)

  defp update_trainer(trainer, params) do
    trainer
    |> Trainer.changeset(params)
    |> Repo.update()
  end
end
