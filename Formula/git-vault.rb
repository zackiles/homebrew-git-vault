class GitVault < Formula
  desc "Drop-dead simple solution for sharing sensitive things in git repositories"
  homepage "https://github.com/zackiles/git-vault"
  version "0.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zackiles/git-vault/releases/download/v0.0.4/git-vault-macos-arm64.tar.gz"
      sha256 "ca6ce8a55070a91727e7460856216093c15d9d59850fcdc454a387449cd84c76"
    else
      url "https://github.com/zackiles/git-vault/releases/download/v0.0.4/git-vault-macos.tar.gz"
      sha256 "50da288dec0e86b4e7180992b40fb05f6eae6ba32e4253d4218b4c3b9834af37"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zackiles/git-vault/releases/download/v0.0.4/git-vault-linux-arm64.tar.gz"
      sha256 "ab2912610c5dd34559fc210343b783f362504bfa1bfb5243258fe15a3ba70d65"
    else
      url "https://github.com/zackiles/git-vault/releases/download/v0.0.4/git-vault-linux.tar.gz"
      sha256 "ffda0c764662d3e83f121ca3cd4b7a798d2eb3ec51808e1c80f2172fa3c920c7"
    end
  end

  def install
    # Install the appropriate binary based on platform
    if Hardware::CPU.arm?
      if OS.mac?
        bin.install "gv-aarch64-apple-darwin" => "gv"
      else
        bin.install "gv-aarch64-unknown-linux-gnu" => "gv"
      end
    else
      if OS.mac?
        bin.install "gv-x86_64-apple-darwin" => "gv"
      else
        bin.install "gv-x86_64-unknown-linux-gnu" => "gv"
      end
    end

    # Create git-vault symlink for backward compatibility
    bin.install_symlink "gv" => "git-vault"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/git-vault --version")
  end
end
