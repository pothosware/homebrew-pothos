class Soapysdr < Formula
  desc "Vendor and platform neutral SDR support library"
  homepage "https://github.com/pothosware/SoapySDR/wiki"
  head "https://github.com/pothosware/SoapySDR.git"
  url "https://github.com/pothosware/SoapySDR/archive/soapy-sdr-0.4.1.tar.gz"
  sha256 "134471fbcf2e29d679c6d1ef0b14e6337d37636d9a9460a05beff96945038340"

  depends_on "cmake" => :build
  depends_on "swig" => :build

  def install
    mkdir "build" do
      args = %W[
        -DSOAPY_SDR_ROOT='#{HOMEBREW_PREFIX}'
      ] + std_cmake_args
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
