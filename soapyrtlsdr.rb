class Soapyrtlsdr < Formula
  desc "Soapy SDR module for RTL-SDR"
  homepage "https://github.com/pothosware/SoapyRTLSDR/wiki"
  head "https://github.com/pothosware/SoapyRTLSDR.git"
  url "https://github.com/pothosware/SoapyRTLSDR/archive/soapy-rtl-sdr-0.3.2.tar.gz"
  sha256 "d0335684179d5b0357213cc786a78d7b6dc5728de7af9dcbf6364b17e62cef02"

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
