class Pothosblocks < Formula
  desc "Pothos core processing blocks"
  homepage "https://github.com/pothosware/PothosBlocks/wiki"
  head "https://github.com/pothosware/PothosBlocks.git"
  url "https://github.com/pothosware/PothosBlocks/archive/pothos-blocks-0.5.2.tar.gz"
  sha256 "93676192b30353e3a523e0876e5d212ede4b1f03daf979d8cef210248e2a82f9"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "poco"
  depends_on "nlohmann/json/nlohmann_json"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
