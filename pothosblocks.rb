class Pothosblocks < Formula
  desc "Pothos core processing blocks"
  homepage "https://github.com/pothosware/PothosBlocks/wiki"
  head "https://github.com/pothosware/PothosBlocks.git"
  url "https://github.com/pothosware/PothosBlocks/archive/pothos-blocks-0.5.1.tar.gz"
  sha256 "278d5dfcdf07d3140b4824404f9288ff5d1fed449113bad2ce1db38923e6d5ea"

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
