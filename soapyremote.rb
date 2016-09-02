class Soapyremote < Formula
  desc "Use any Soapy SDR remotely"
  homepage "https://github.com/pothosware/SoapyRemote/wiki"
  head "https://github.com/pothosware/SoapyRemote.git"
  url "https://github.com/pothosware/SoapyRemote/archive/soapy-remote-0.3.1.tar.gz"
  sha256 "6cb88091a2b2f35fc37368022a49aca313d1ae0f2380127f0f44feec56e8950e"

  depends_on "cmake" => :build
  depends_on "soapysdr"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
