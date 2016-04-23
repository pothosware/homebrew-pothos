class Soapysdr < Formula
  desc "Vendor and platform neutral SDR support library"
  homepage "https://github.com/pothosware/SoapySDR/wiki"
  head "https://github.com/pothosware/SoapySDR.git"
  url "https://github.com/pothosware/SoapySDR/archive/soapy-sdr-0.4.3.tar.gz"
  sha256 "7d66abdd0f861bf305f44f9ee0569b499b918c4f8cd14a249ffb9b05641e1ede"

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
