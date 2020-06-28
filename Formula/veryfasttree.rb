class Veryfasttree < Formula
  desc "Approximately-maximum-likelihood phylogenetic trees"
  homepage "https://github.com/citiususc/veryfasttree"
  url "https://github.com/citiususc/veryfasttree/archive/v3.0.tar.gz"
  sha256 "51686593396b7b317b977b3b30930ddd5736e7aba63343b3e6322ac1f599b190"

  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make"
      bin.install "VeryFastTree"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/VeryFastTree 2>&1")
  end
end
