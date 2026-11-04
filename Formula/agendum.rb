# SPDX-License-Identifier: AGPL-3.0-only
# Wol's Agendum from its GitHub Release: the escript, run by Homebrew's
# Erlang. The url, version and sha256 are kept up to date by
# .github/workflows/update.yml (0.0.0 until its first run); do not edit them
# by hand.
class Agendum < Formula
  desc "Lotus Agenda (1988) rebuilt: type a thought, and it files itself"
  homepage "https://github.com/jamting/agendum"
  url "https://github.com/jamting/agendum/releases/download/v0.92.0/agendum"
  version "0.92.0"
  sha256 "8cac3de3774d19e57d00fb93f6e02f857b5da6bf61d5eb498638409664af20d3"
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
    assert_match "Wol's Agendum #{version}", shell_output("#{bin}/agendum --version")
  end
end
