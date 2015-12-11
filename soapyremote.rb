class Soapyremote < Formula
  desc "Use any Soapy SDR remotely"
  homepage "https://github.com/pothosware/SoapyRemote/wiki"
  head "https://github.com/pothosware/SoapyRemote.git"
  url "https://github.com/pothosware/SoapyRemote/archive/soapy-remote-0.2.0.tar.gz"
  sha256 "509bac4ad78dac26335644f91805707a7e8718e7af4887f4f4d57183bf59915b"

  depends_on "cmake" => :build
  depends_on "soapysdr"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
