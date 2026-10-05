class Soapyrtlsdr < Formula
  desc "Soapy SDR module for RTL-SDR"
  homepage "https://github.com/pothosware/SoapyRTLSDR/wiki"
  head "https://github.com/pothosware/SoapyRTLSDR.git"
  version "0.3.3-14"
  url "https://github.com/pothosware/SoapyRTLSDR/archive/6ca357c15cbf676ff30eb8eb445d1e1eac17c136.zip"
  sha256 "61c973e6d2d28ead888e8ec0db88c3cd353bf59ecfbf0f284faf0e4cb167d2d3"

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
