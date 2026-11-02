# SPDX-License-Identifier: AGPL-3.0-only
# Wol's Agendum from its GitHub Release: the escript, run by Homebrew's
# Erlang. The url, version and sha256 are kept up to date by
# .github/workflows/update.yml (0.0.0 until its first run); do not edit them
# by hand.
class Agendum < Formula
  desc "Lotus Agenda (1988) rebuilt: type a thought, and it files itself"
  homepage "https://github.com/jamting/agendum"
  url "https://github.com/jamting/agendum/releases/download/v0.78.0/agendum"
  version "0.78.0"
  sha256 "5d3d832190160049acca93bbc93c43a4a07f6b9b0ba56fa24752164c52b27991"
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
