class GitVault < Formula
  desc "Drop-dead simple solution for sharing sensitive things in git repositories"
  homepage "https://github.com/zackiles/git-vault"
  version "0.0.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zackiles/git-vault/releases/download/v0.0.5/git-vault-macos-arm64.tar.gz"
      sha256 "62dad99c056406346a6aa292734a1041f3408c92e13a06b8950753488dbcef76"
    else
      url "https://github.com/zackiles/git-vault/releases/download/v0.0.5/git-vault-macos.tar.gz"
      sha256 "92747a2c932087fae496937e929d09b898f115efa034ba6e709d80a23aa8e96f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zackiles/git-vault/releases/download/v0.0.5/git-vault-linux-arm64.tar.gz"
      sha256 "b63e7d2b55f3b186f3cc8101b28fee7beda0d1ce62d2eeff799bcd2659e26163"
    else
      url "https://github.com/zackiles/git-vault/releases/download/v0.0.5/git-vault-linux.tar.gz"
      sha256 "2cb3431cf5985f7fde0054d59037f13cd2ac5377b2bedf9c799c86b0a87ce10a"
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
