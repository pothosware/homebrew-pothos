class Soapybladerf < Formula
  desc "Soapy SDR plugin for Blade RF"
  homepage "https://github.com/pothosware/SoapyBladeRF/wiki"
  head "https://github.com/pothosware/SoapyBladeRF.git"
  url "https://github.com/pothosware/SoapyBladeRF/archive/soapy-bladerf-0.2.0.tar.gz"

  depends_on "cmake" => :build
  depends_on "soapysdr"
  depends_on "bladerf"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
