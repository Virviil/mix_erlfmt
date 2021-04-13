defmodule Mix.Tasks.Erlfmt do
  @moduledoc [:getopt.usage_cmd_line('mix erlfmt', :erlfmt_cli.opts()), '\n\n', :getopt.usage_options(:erlfmt_cli.opts())] |> List.to_string

  use Mix.Task

  @shortdoc "Run erlfmt formatter for Erlang files"

  @impl Mix.Task
  def run(args) do
    mix_opts = Keyword.get(Mix.Project.config(), :erlfmt, [])
    case :getopt.parse(:erlfmt_cli.opts(), Enum.join(args, " ") |> String.to_charlist()) do
      {:ok, {arg_opts, []}} ->
        :erlfmt_cli.do('erlfmt', arg_opts, mix_opts)

      {:ok, {arg_opts, extra_files}} ->
        :erlfmt_cli.do('erlfmt', [{:files, extra_files} | arg_opts], mix_opts)

      {:error, reason} ->
        IO.puts(
          :getopt.format_error(
            :erlfmt_cli.opts(),
            reason
          )
        )
    end
  end

end
