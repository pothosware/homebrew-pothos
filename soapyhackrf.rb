class Soapyhackrf < Formula
  desc "Soapy SDR plugin for Hack RF"
  homepage "https://github.com/pothosware/SoapyHackRF/wiki"
  head "https://github.com/pothosware/SoapyHackRF.git"
  url "https://github.com/pothosware/SoapyHackRF/archive/soapy-hackrf-0.3.2.tar.gz"
  sha256 "1f96103e9390f059e469b537c9f697fe998df10c78504f531408626023dc81fd"

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
