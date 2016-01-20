class Soapyredpitaya < Formula
  desc "Soapy SDR plugin for Red Pitaya"
  homepage "https://github.com/pothosware/SoapyRedPitaya/wiki"
  head "https://github.com/pothosware/SoapyRedPitaya.git"
  url "https://github.com/pothosware/SoapyRedPitaya/archive/soapy-redpitaya-0.1.0.tar.gz"
  sha256 "5cfe992708491ade06947c874cada70cc6d91f18b1fecdee24eca8ef23234bad"

  depends_on "cmake" => :build
  depends_on "soapysdr"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
