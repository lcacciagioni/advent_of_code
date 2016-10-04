defmodule AOC.One do
  use GenServer

  ## Client API

  @doc """
  Start the counter
  """
  def start_link do
    GenServer.start_link(__MODULE__, :ok, [])
  end

  @doc """
  Calculates the floor where santa needs to go
  """
  def calculate(server, input) do
    GenServer.call(server, {:calculate, input})
  end

  ## Private Server Application

  @doc """
  Actuall worker
  """
  def handle_call({:calculate, input}) do

  end

  @doc """
  By default dump all the messages that are not for us
  """
  def handle_info(_msg, state) do
    {:noreply, state}
  end

  defp sum_list([]) do
    0
  end
  defp sum_list(["("|tail]) do

  end
  defp sum_list([")"|tail]) do

  end
end
