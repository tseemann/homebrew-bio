class Gemma < Formula
  desc "Genome-wide Efficient Mixed Model Association"
  homepage "http://www.xzlab.org/software.html"
  url "https://github.com/genetics-statistics/GEMMA/archive/v0.97.tar.gz"
  sha256 "9b22a61f01af27e60d483cb7bca73e397d8ca4719c741349a8551984c6c33976"
  head "https://github.com/xiangzhou/GEMMA"
  # doi "10.1038/ng.2310"

  depends_on "zlib" unless OS.mac?
  depends_on "openblas"
  depends_on "eigen"
#  depends_on "lapack"
#  depends_on "gsl"

  def install
#    system "make", "FORCE_DYNAMIC=1"
    system "make", "-f", (OS.mac? ? "Makefile.macosx" : "Makefile.linux"), "FORCE_DYNAMIC=1"
    bin.install Dir["bin/*"]
    doc.install Dir["doc/*"], "README.txt"
    pkgshare.install "example"
  end

  test do
    assert_match "eigen", shell_output("#{bin}/gemma -h 2>&1")
  end
end
