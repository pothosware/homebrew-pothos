class Pothossdr < Formula
  desc "Pothos SDR source and sink blocks"
  homepage "https://github.com/pothosware/PothosSoapy/wiki"
  head "https://github.com/pothosware/PothosSoapy.git"
  url "https://github.com/pothosware/PothosSoapy/archive/pothos-soapy-0.5.0.tar.gz"
  sha256 "266caaa3060692215a0433f3bc9ea31891b99a6b3e3eaa10edeed992d426999c"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "poco"
  depends_on "soapysdr"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
