defmodule MusicappTest do
  use ExUnit.Case
  doctest Musicapp

  test "greets the world" do
    assert Musicapp.hello() == :world
  end
end
