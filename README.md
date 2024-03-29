[![](https://img.shields.io/hexpm/dt/mix_erlfmt.svg?style=flat-square)](https://hex.pm/packages/mix_erlfmt)[![](https://img.shields.io/hexpm/v/mix_erlfmt.svg?style=flat-square)](https://hex.pm/packages/mix_erlfmt)[![](https://img.shields.io/hexpm/l/mix_erlfmt.svg?style=flat-square)](https://hex.pm/packages/mix_erlfmt)[![](https://img.shields.io/maintenance/yes/2021.svg?style=flat-square)](https://github.com/Virviil/mix_erlfmt)

# MixErlfmt

Runs the `erlfmt` command for the given project. It's the most possible thin wrapper
to the original library. All the documentation can be found in the [original library](https://hex.pm/packages/erlfmt).

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

## Installation

This libraby is [available in Hex](https://hex.pm/packages/mix_erlfmt), the package can be installed
by adding `mix_erlfmt` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:mix_erlfmt, "~> 0.2.0"}
  ]
end
```

Documentation can is generated and published on [HexDocs](https://hexdocs.pm/mix_erlfmt).
