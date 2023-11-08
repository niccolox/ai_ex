defmodule AiExTest do
  use ExUnit.Case
  doctest AiEx

  test "greets the world" do
    assert AiEx.hello() == :world
  end
end
