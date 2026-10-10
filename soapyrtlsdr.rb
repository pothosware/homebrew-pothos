class Soapyrtlsdr < Formula
  desc "Soapy SDR module for RTL-SDR"
  homepage "https://github.com/pothosware/SoapyRTLSDR/wiki"
  head "https://github.com/pothosware/SoapyRTLSDR.git"
  url "https://github.com/pothosware/SoapyRTLSDR/archive/soapy-rtlsdr-0.3.4.tar.gz"
  sha256 "1602035b849bca2e9c189712a08d22dc0c7c3a936f9063ac9851bf3229d4460e"

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
