defmodule ExFtx.LendingHistory do
  alias __MODULE__

  @type t :: %LendingHistory{
          coin: String.t(),
          rate: number,
          size: number,
          time: String.t()
        }

  defstruct ~w[
    coin
    rate
    size
    time
  ]a
end
