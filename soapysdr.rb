class Soapysdr < Formula
  desc "Vendor and platform neutral SDR support library"
  homepage "https://github.com/pothosware/SoapySDR/wiki"
  head "https://github.com/pothosware/SoapySDR.git"
  url "https://github.com/pothosware/SoapySDR/archive/soapy-sdr-0.3.1.tar.gz"
  sha256 "f631235c0caf94faab17c05c98cfbf8f41ecb1ce86e9c8d790be9218943ebed4"

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
