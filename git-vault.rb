class GitVault < Formula
  desc "CLI tool for managing Git secrets and vaults"
  homepage "https://github.com/zackiles/git-vault"
  version "0.0.3"

  if OS.mac?
    url "https://github.com/zackiles/git-vault/releases/download/v0.0.3/git-vault-macos.tar.gz"
    sha256 "<MACOS_SHA256>"
  elsif OS.linux?
    url "https://github.com/zackiles/git-vault/releases/download/v0.0.3/git-vault-linux.tar.gz"
    sha256 "<LINUX_SHA256>"
  end

  def install
    bin.install "git-vault"
  end
end
