class Soapyremote < Formula
  desc "Use any Soapy SDR remotely"
  homepage "https://github.com/pothosware/SoapyRemote/wiki"
  head "https://github.com/pothosware/SoapyRemote.git"
  url "https://github.com/pothosware/SoapyRemote/archive/soapy-remote-0.4.0.tar.gz"
  sha256 "4f34a20004b4721c60aeb9d301962282b48781b4eb69f6a3ca3baf0b6066f016"

  depends_on "cmake" => :build
  depends_on "soapysdr"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
