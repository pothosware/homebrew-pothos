class Soapybladerf < Formula
  desc "Soapy SDR plugin for Blade RF"
  homepage "https://github.com/pothosware/SoapyBladeRF/wiki"
  head "https://github.com/pothosware/SoapyBladeRF.git"
  url "https://github.com/pothosware/SoapyBladeRF/archive/soapy-bladerf-0.3.1.tar.gz"
  sha256 "d9493662361a6bb8de3e39c7d15438829912b4bb297bfa055b5894ace5d9881c"

  depends_on "cmake" => :build
  depends_on "soapysdr"
  depends_on "libbladerf"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
