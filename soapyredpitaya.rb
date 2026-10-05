class Soapyredpitaya < Formula
  desc "Soapy SDR plugin for Red Pitaya"
  homepage "https://github.com/pothosware/SoapyRedPitaya/wiki"
  head "https://github.com/pothosware/SoapyRedPitaya.git"
  version "0.1.1-4"
  url "https://github.com/pothosware/SoapyRedPitaya/archive/b616d6b29d3ec727ffaa456085f1269587d75eb1.zip"
  sha256 "3879a259914b5053e0936746a6fc98f1e9d9c33631efc5381b19962713a5664d"

  depends_on "cmake" => :build
  depends_on "soapysdr"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
