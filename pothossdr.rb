class Pothossdr < Formula
  desc "Pothos SDR source and sink blocks"
  homepage "https://github.com/pothosware/pothos-sdr/wiki"
  head "https://github.com/pothosware/pothos-sdr.git"
  url "https://github.com/pothosware/pothos-sdr/archive/pothos-sdr-0.4.3.tar.gz"
  sha256 "aaa78d7906dad8e51bd8395ebd4a7f3e87318264968dc9c8869c500462f4439d"

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
