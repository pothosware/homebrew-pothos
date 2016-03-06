class Pothosblocks < Formula
  desc "Pothos core processing blocks"
  homepage "https://github.com/pothosware/pothos-blocks/wiki"
  head "https://github.com/pothosware/pothos-blocks.git"
  url "https://github.com/pothosware/pothos-blocks/archive/pothos-blocks-0.3.1.tar.gz"
  sha256 "bf5f14c48651c239c6d2b44414802d56e063f5353915fd1c5297a0ac99d04264"

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
