defmodule AOC.One do
  use GenServer

  ## Client API

  @doc """
  Start the counter
  """
  def start_link do
    GenServer.start_link(__MODULE__, :ok, name: :calculator)
  end

  @doc """
  Calculates the floor where santa needs to go
  """
  def calculate(input) do
    GenServer.call({:calculate, input}, :calculator)
  end

  ## Private Server Application

  @doc """
  Actuall worker
  """
  def handle_call({:calculate, input}, from) do
    {:reply, sum_list(to_charlist(input), total=0)}
  end

  @doc """
  By default dump all the messages that are not for us
  """
  def handle_info(_msg, state) do
    {:noreply, state}
  end

  defp sum_list([], total) do
    total
  end
  defp sum_list(["("|tail], total) do
    sum_list([tail], total + 1)
  end
  defp sum_list([")"|tail], total) do
    sum_list([tail], total - 1)
  end
end
