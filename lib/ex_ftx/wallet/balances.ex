defmodule ExFtx.Wallet.Balances do
  alias ExFtx.JsonResponse

  @type credentials :: ExFtx.Credentials.t()
  @type balance :: ExFtx.Balance.t()
  @type result :: {:ok, [balance]} | {:error, :parse_result_item}

  @spec get(credentials) :: result
  def get(credentials) do
    "/wallet/balances"
    |> ExFtx.HTTPClient.auth_get(credentials, %{})
    |> parse_response()
  end

  defp parse_response({:ok, %JsonResponse{success: true, result: coins}}) do
    coins
    |> Enum.map(&Mapail.map_to_struct(&1, ExFtx.Balance, transformations: [:snake_case]))
    |> Enum.reduce(
      {:ok, []},
      fn
        {:ok, i}, {:ok, acc} -> {:ok, [i | acc]}
        _, _acc -> {:error, :parse_result_item}
      end
    )
  end

  defp parse_response({:ok, %JsonResponse{success: false, error: error}}) do
    {:error, error}
  end
end
