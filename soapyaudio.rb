class Soapyaudio < Formula
  desc "Soapy SDR plugin for audio devices"
  homepage "https://github.com/pothosware/SoapyAudio/wiki"
  head "https://github.com/pothosware/SoapyAudio.git"

  depends_on "cmake" => :build
  depends_on "soapysdr"
  depends_on "rt-audio"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
