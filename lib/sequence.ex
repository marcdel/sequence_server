defmodule Sequence do
  use Application

  def start(_type, _args) do
    initial_value = Application.get_env(:sequence, :initial_value)
    {:ok, _pid} = Sequence.Supervisor.start_link(initial_value)
  end
end
