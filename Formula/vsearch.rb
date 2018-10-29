class Vsearch < Formula
  # cite Rognes_2017: "https://doi.org/10.5281/zenodo.275113"
  desc "USEARCH-compatible metagenomic sequence tool"
  homepage "https://github.com/torognes/vsearch"
  url "https://github.com/torognes/vsearch/archive/v2.9.0.tar.gz"
  sha256 "588d7d0e6b70a4ccf14ca71ed95ca8ba0e3c2672a5a844ec31672364bcd266f1"
  head "https://github.com/torognes/vsearch.git"

  bottle do
    root_url "https://linuxbrew.bintray.com/bottles-bio"
    cellar :any_skip_relocation
    sha256 "48669dbd515e234fae8d2d1a89cfd71484c88e77bb04c186cbbf54401916a7da" => :sierra
    sha256 "8a1912e76409cf9f37ae2dfef7d91044799bde8d527fb71a32c4ac37e3731ca8" => :x86_64_linux
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  unless OS.mac?
    depends_on "bzip2"
    depends_on "zlib"
  end

  def install
    system "./autogen.sh"
    system "./configure", "--prefix=#{prefix}", "--disable-pdfman"
    system "make", "install"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vsearch --help 2>&1")
  end
end
