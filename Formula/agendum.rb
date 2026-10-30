# SPDX-License-Identifier: AGPL-3.0-only
# Wol's Agendum from its GitHub Release: the escript, run by Homebrew's
# Erlang. The url, version and sha256 are kept up to date by
# .github/workflows/update.yml (0.0.0 until its first run); do not edit them
# by hand.
class Agendum < Formula
  desc "Lotus Agenda (1988) rebuilt: type a thought, and it files itself"
  homepage "https://github.com/jamting/agendum"
  url "https://github.com/jamting/agendum/releases/download/v0.72.3/agendum"
  version "0.72.3"
  sha256 "d4847c8892cca841526bfc13d62503416fadb2a1506b9b9b33ee618da05370ea"
  license "AGPL-3.0-only"

  depends_on "erlang"

  def install
    libexec.install "agendum"
    # run with Homebrew's own Erlang, whatever else is on the PATH
    (bin/"agendum").write <<~EOS
      #!/bin/bash
      exec "#{Formula["erlang"].opt_bin}/escript" "#{libexec}/agendum" "$@"
    EOS
  end

  test do
    assert_match "agendum --demo", shell_output("#{bin}/agendum --help")
  end
end
