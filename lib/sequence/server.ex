defmodule Sequence.Server do
  use GenServer

  @vsn "1"
  defmodule State do
    defstruct current_number: 0, stash_pid: nil, delta: 1
  end

  # External API

  def start_link(stash_pid) do
    {:ok, _pid} = GenServer.start_link(__MODULE__, stash_pid, name: __MODULE__)
  end

  def clear do
    GenServer.cast __MODULE__, :clear
  end

  def next_number do
    GenServer.call __MODULE__, :next_number
  end

  def increment_number(delta) do
    GenServer.cast __MODULE__, {:increment_number, delta}
  end

  # GenServer implementation

  def init(stash_pid) do
    current_number = Sequence.Stash.get_value stash_pid
    {:ok,
      %State{current_number: current_number, stash_pid: stash_pid}}
  end

  def handle_call(:next_number, _from, state) do
    {:reply,
      state.current_number,
      %{state | current_number: state.current_number + state.delta}}
  end

  def handle_cast({:increment_number, delta}, state) do
    {:noreply,
      %{state | current_number: state.current_number + delta, delta: delta}}
  end

  def handle_cast(:clear, state) do
    {:noreply,
      %{state | current_number: 0, delta: 1}}
  end

  def terminate(_reason, {current_number, stash_pid}) do
    Sequence.Stash.save_value stash_pid, current_number
  end

  def format_status(_reason, [ _pdict, state ]) do
    [data: [{'State', "My current state is '#{inspect state}', and I'm happy"}]]
  end
end
