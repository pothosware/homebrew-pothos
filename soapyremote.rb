class Soapyremote < Formula
  desc "Use any Soapy SDR remotely"
  homepage "https://github.com/pothosware/SoapyRemote/wiki"
  head "https://github.com/pothosware/SoapyRemote.git"
  url "https://github.com/pothosware/SoapyRemote/archive/soapy-remote-0.5.1.tar.gz"
  sha256 "f325c5dde26fc8d7a82bd4e893b9aac445bb736679724728fc1dd2f0aef7b5f6"

  depends_on "cmake" => :build
  depends_on "soapysdr"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
