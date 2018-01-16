class Vsearch < Formula
  desc "USEARCH-compatible metagenomic sequence tool"
  homepage "https://github.com/torognes/vsearch"
  url "https://github.com/torognes/vsearch/archive/v2.6.2.tar.gz"
  sha256 "65ffb5c368a07d7cdd24ed12ad53a4f81b840cc33539c1f963215488e0cb700a"
  head "https://github.com/torognes/vsearch.git"

  # doi "10.5281/zenodo.31443"
  # tag "bioinformatics"

  depends_on "autoconf" => :build
  depends_on "automake" => :build

  unless OS.mac?
    depends_on "bzip2"
    depends_on "zlib"
  end

  def install
    system "./autogen.sh"
    system "./configure",
      "--disable-dependency-tracking",
      "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    assert_match "allpairs_global", shell_output("#{bin}/vsearch --help 2>&1")
  end
end
