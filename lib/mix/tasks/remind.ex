defmodule Mix.Tasks.Remind do
  use Mix.Task

  @shortdoc "AgentO: Return a reminder for how to use project."
  @spec run(any) :: :ok
  def run(_) do
    IO.puts("""
    iex -S mix
    -> Start a console with our project

    mix test
    -> Run tests

    mix deps.get
    -> Fetch dependencies.
    """)
  end
end
