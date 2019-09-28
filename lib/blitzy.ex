defmodule Blitzy do
  use Application

  def start(_type, _args) do
    Blitzy.Supervisor.start_link(:ok)
  end

 def run(n_workers, url) when n_workers > 0 do
   worker_func = fn -> Blitzy.Worker.start(url) end
   1..n_workers
   |> Enum.map(fn _ -> Task.async(worker_func) end)
   |> Enum.map(&Task.await(&1, :infinity))
 end

end
