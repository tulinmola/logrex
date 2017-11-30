defmodule Logrex.ChannelsTest do
  use Logrex.DataCase

  alias Logrex.{Message, Channels}

  test "Broadcast message to channel" do
    message = %Message{type: "broadcast", content: %{foo: "bar"}}

    assert :ok = Channels.subscribe("broadcast")
    assert {:ok, _pid} = Channels.broadcast(message)

    assert_receive ^message
  end

  test "Don't broadcast message to channel" do
    message = %Message{type: "dont_broadcast", content: %{foo: "bar"}}

    assert :ok = Channels.subscribe("other")
    assert {:ok, _pid} = Channels.broadcast(message)

    refute_receive ^message
  end
end
