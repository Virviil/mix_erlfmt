defmodule Mix.Tasks.Erlfmt do
  @moduledoc ~S"""
  Runs the `erlfmt` command for the given project.

  ## Command line options

  * `-v, --version` - returns the version of erlfmt being used
  * `-w, --write` - modify formatted files in place
  * `-o, --out` - output directory
  * `--verbose` - include debug output
  * `-c, --check` - check if your files are formatted. Get exit code `1`,
      if some files are not formatted. `--write` is not supported.
  * `--print-width` - the line length that formatter would wrap on
  * `--require-pragma` - require a special comment `@format`, called a pragma,
      to be present in the file's first docblock comment in order for prettier to format it.
  * `-i, --insert-pragma` - Insert a `@format` pragma to the top of formatted files when pragma is absent.
      Works well when used in tandem with `--require-pragma`,
      but it is not allowed to use `require-pragma` and `insert-pragma` at the same time.
  * `--exclude-files` - files not to format. This overrides the files specified to format
  * `<files>` - files to format, `-` for stdin. If no files are provided,
      and one option of [`-w`, `-o`, `-c`] are provided,
      then `{src,include,test}/*.{hrl,erl,app.src}` and rebar.config are specified as the default.

  ## Configuration
  You can configure common options inside `erlfmt` section in you `Mix` project.
  It's structure is the same as for `rebar.config` and can be got from `erlfmt` docs.

  ### Example

  ```elixir
  defmodule MyApp.MixProject do
    use Mix.Project
    def project do
      [
        app: :my_app,
        version: "0.0.1",
        erlfmt: [print_width: 100]
      ]
    end
  end
  ```
  """

  use Mix.Task

  @shortdoc "Run erlfmt formatter for Erlang files"

  @impl Mix.Task
  def run(args) do
    if "-h" in args do
      Mix.Tasks.Help.run(["erlfmt"])
    else
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
end
