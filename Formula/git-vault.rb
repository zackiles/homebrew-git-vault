class GitVault < Formula
  desc "Drop-dead simple solution for sharing sensitive things in git repositories"
  homepage "https://github.com/zackiles/git-vault"
  version "0.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zackiles/git-vault/releases/download/v0.0.4/git-vault-macos-arm64.tar.gz"
      sha256 "c410fda815be83a5dd5b382c01bedee03bc50ae832da7ddad2fce1297fa3c04e"
    else
      url "https://github.com/zackiles/git-vault/releases/download/v0.0.4/git-vault-macos.tar.gz"
      sha256 "6d17ce3f67825bb652e6ee1579c5a73fe9f0f75a52858a6237c22ae663b53ba4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zackiles/git-vault/releases/download/v0.0.4/git-vault-linux-arm64.tar.gz"
      sha256 "f9d9f794ec6472198dd669fa0194b8661406d429e41e3fbb76536f24639c362f"
    else
      url "https://github.com/zackiles/git-vault/releases/download/v0.0.4/git-vault-linux.tar.gz"
      sha256 "206cd710a35e9d83bbb42c98d67b95c1c4cae355a8fcb1986f85307799961cda"
    end
  end

  def install
    # Install the appropriate binary based on platform
    if Hardware::CPU.arm?
      if OS.mac?
        bin.install "gv-aarch64-apple-darwin" => "git-vault"
      else
        bin.install "gv-aarch64-unknown-linux-gnu" => "git-vault"
      end
    else
      if OS.mac?
        bin.install "gv-x86_64-apple-darwin" => "git-vault"
      else
        bin.install "gv-x86_64-unknown-linux-gnu" => "git-vault"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/git-vault --version")
  end
end
