class Soapybladerf < Formula
  homepage "https://github.com/pothosware/SoapyBladeRF/wiki"
  head "https://github.com/pothosware/SoapyBladeRF.git"

  depends_on "cmake" => :build
  depends_on "bladerf"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
