defmodule Logrex.Channels do
  @moduledoc """
  Channels module, wrapping phoenix_pubsub
  """
  alias Phoenix.PubSub

  @doc """
  Subscribes to all channels
  """
  def subscribe do
    PubSub.subscribe(Logrex.PubSub, "all")
  end

  @doc """
  Subscribes to a given channel
  """
  def subscribe(type) do
    PubSub.subscribe(Logrex.PubSub, type)
  end

  @doc """
  Broadcasts message to its channel
  """
  def broadcast(message) do
    channel = message.type
    :ok = Phoenix.PubSub.broadcast(Logrex.PubSub, channel, message)
    :ok = Phoenix.PubSub.broadcast(Logrex.PubSub, "all", message)
    {:ok, self()}
  end
end
