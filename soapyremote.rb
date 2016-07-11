class Soapyremote < Formula
  desc "Use any Soapy SDR remotely"
  homepage "https://github.com/pothosware/SoapyRemote/wiki"
  head "https://github.com/pothosware/SoapyRemote.git"
  url "https://github.com/pothosware/SoapyRemote/archive/soapy-remote-0.3.0.tar.gz"
  sha256 "4ca5bdee17210d60bcc64971c38a51ca25d5b09599c218d78cb8f6ad38d8bffa"

  depends_on "cmake" => :build
  depends_on "soapysdr"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
