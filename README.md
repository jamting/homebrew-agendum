# Homebrew tap for Wol's Agendum

[Wol's Agendum](https://github.com/jamting/agendum) is Lotus Agenda (1988) rebuilt in Elixir, with a terminal UI: type a thought, and it files itself.

On a Mac or on Linux with [Homebrew](https://brew.sh):

```sh
brew install jamting/agendum/agendum
agendum --demo            # a sample file to try it on
agendum my.agendum        # your own file
```

Homebrew brings Erlang along. To remove it again: `brew uninstall agendum`.

The formula follows Agendum's latest [release](https://github.com/jamting/agendum/releases) by itself: a workflow checks every morning, updates it, and installs it on a fresh Mac to see that it runs. Issues and contributions go to [jamting/agendum](https://github.com/jamting/agendum).
