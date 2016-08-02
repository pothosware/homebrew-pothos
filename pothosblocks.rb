class Pothosblocks < Formula
  desc "Pothos core processing blocks"
  homepage "https://github.com/pothosware/pothos-blocks/wiki"
  head "https://github.com/pothosware/pothos-blocks.git"
  url "https://github.com/pothosware/pothos-blocks/archive/pothos-blocks-0.4.0.tar.gz"
  sha256 "5162487899db65a340f6fd4d863133cf0d80b0fde95bddf99016b2fd10c984b1"

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
