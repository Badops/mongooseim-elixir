defmodule MongooseimTest do
  use ExUnit.Case
  doctest Mongooseim

  test "greets the world" do
    assert Mongooseim.hello() == :world
  end
end
