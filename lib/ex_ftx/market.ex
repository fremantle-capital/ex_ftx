defmodule ExFtx.Market do
  alias __MODULE__

  @type name :: String.t()
  @type t :: %Market{
          name: name,
          base_currency: String.t() | nil,
          quote_currency: String.t() | nil,
          type: String.t(),
          underlying: String.t(),
          enabled: boolean,
          ask: number | nil,
          bid: number | nil,
          last: number | nil,
          post_only: boolean,
          price_increment: number,
          size_increment: number,
          min_provide_size: number,
          restricted: boolean,
          high_leverage_fee_exempt: boolean,
          change_1h: number,
          change_24h: number,
          change_bod: number,
          price: number,
          quote_volume_24h: number,
          volume_usd_24h: number
        }

  defstruct ~w[
    name
    base_currency
    quote_currency
    type
    underlying
    enabled
    ask
    bid
    last
    post_only
    price_increment
    size_increment
    min_provide_size
    restricted
    high_leverage_fee_exempt
    change_1h
    change_24h
    change_bod
    price
    quote_volume_24h
    volume_usd_24h
  ]a
end
