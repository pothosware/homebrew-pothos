class Soapyaudio < Formula
  desc "Soapy SDR plugin for audio devices"
  homepage "https://github.com/pothosware/SoapyAudio/wiki"
  head "https://github.com/pothosware/SoapyAudio.git"
  url "https://github.com/pothosware/SoapyAudio/archive/soapy-audio-0.1.0.tar.gz"
  sha256 "fb2895c32cf466190e46673e5c08bf624e5331e2627e881328d9795a49ff5194"

  depends_on "cmake" => :build
  depends_on "soapysdr"
  #depends_on "rt-audio" #included in SoapyAudio source
  depends_on "hamlib" => :recommended

  def install
    args = []
    if build.with?("hamlib")
      args += ["-DUSE_HAMLIB=ON"]
    else
      args += ["-DUSE_HAMLIB=OFF"]
    end

    mkdir "build" do
      args += std_cmake_args
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
