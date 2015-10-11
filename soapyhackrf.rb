class Soapyhackrf < Formula
  desc "Soapy SDR plugin for Hack RF"
  homepage "https://github.com/pothosware/SoapyHackRF/wiki"
  head "https://github.com/pothosware/SoapyHackRF.git"
  url "https://github.com/pothosware/SoapyBladeRF/archive/soapy-hackrf-0.1.0.tar.gz"

  depends_on "cmake" => :build
  depends_on "soapysdr"
  depends_on "hackrf"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
