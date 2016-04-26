class Soapyrtlsdr < Formula
  desc "Soapy SDR module for RTL-SDR"
  homepage "https://github.com/pothosware/SoapyRTLSDR/wiki"
  head "https://github.com/pothosware/SoapyRTLSDR.git"
  url "https://github.com/pothosware/SoapyRTLSDR/archive/soapy-rtlsdr-0.2.1.tar.gz"
  sha256 "b2d3c8145b538bc9d310be5660d594ce10d0afd5a1e601c4c30358abb6e65a54"

  depends_on "cmake" => :build
  depends_on "soapysdr"
  depends_on "librtlsdr"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
