class Pothosblocks < Formula
  desc "Pothos core processing blocks"
  homepage "https://github.com/pothosware/pothos-blocks/wiki"
  head "https://github.com/pothosware/pothos-blocks.git"
  url "https://github.com/pothosware/pothos-blocks/archive/pothos-blocks-0.3.0.tar.gz"
  sha256 "670e7a52febe2024dd1dc72a04a99587c77935c123cea7873a6b2d215923881b"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "poco"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
