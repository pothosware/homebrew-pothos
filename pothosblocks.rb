class Pothosblocks < Formula
  desc "Pothos core processing blocks"
  homepage "https://github.com/pothosware/PothosBlocks/wiki"
  head "https://github.com/pothosware/PothosBlocks.git"
  url "https://github.com/pothosware/PothosBlocks/archive/pothos-blocks-0.4.4.tar.gz"
  sha256 "50f65e166e1e62abd884fb11a47190f7dda2dbe17ee8162a8779b9feb2c39fab"

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
