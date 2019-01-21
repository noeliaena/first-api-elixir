defmodule MusicApiTest do
  use ExUnit.Case
  doctest MusicApi

  test "greets the world" do
    assert MusicApi.hello() == :world
  end
end
