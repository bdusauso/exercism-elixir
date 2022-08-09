defmodule TakeANumber do
  def start() do
    spawn(fn -> loop(0) end)
  end

  defp loop(state) do
    new_state =
      receive do
        {:report_state, sender} ->
          send(sender, state)
          state

        {:take_a_number, sender} ->
          state = state + 1
          send(sender, state)
          state

        :stop ->
          Process.exit(self(), :normal)

        _ ->
          state
      end

    loop(new_state)
  end
end
