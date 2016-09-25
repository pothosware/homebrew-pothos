class Pothossdr < Formula
  desc "Pothos SDR source and sink blocks"
  homepage "https://github.com/pothosware/pothos-sdr/wiki"
  head "https://github.com/pothosware/pothos-sdr.git"
  url "https://github.com/pothosware/pothos-sdr/archive/pothos-sdr-0.4.2.tar.gz"
  sha256 "7a4f3a3101868bb1e43f890e8261ed56e77e615729ecbd3211ae8a08a1c795f9"

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
