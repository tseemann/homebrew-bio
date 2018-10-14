class Csvtk < Formula
  desc "Cross-platform, efficient and practical CSV/TSV toolkit"
  homepage "https://github.com/shenwei356/csvtk"
  version "0.15.0"
  if OS.mac?
    url "https://github.com/shenwei356/csvtk/releases/download/v0.15.0/csvtk_darwin_amd64.tar.gz"
    sha256 "d9f32a5edbd73014202f037fb423f3c0b68b3f98c22bbe9e074e9f1efe0b4835"
  elsif OS.linux?
    url "https://github.com/shenwei356/csvtk/releases/download/v0.15.0/csvtk_linux_amd64.tar.gz"
    sha256 "1e2ec19dac32b7fe56042a929369c6a595a40811191bd4788f802597708195ef"
  end

  def install
    bin.install "csvtk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/csvtk -h 2>&1")
  end
end
