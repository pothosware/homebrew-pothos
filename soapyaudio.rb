class Soapyaudio < Formula
  desc "Soapy SDR plugin for audio devices"
  homepage "https://github.com/pothosware/SoapyAudio/wiki"
  head "https://github.com/pothosware/SoapyAudio.git"
  url "https://github.com/pothosware/SoapyAudio/archive/soapy-audio-0.1.2.tar.gz"
  sha256 "61a90aff4131fee6748fb9c4871c5f6af9c7e67954b84a2d7f0ec4fbb08a5347"

  depends_on "cmake" => :build
  depends_on "soapysdr"
  depends_on "rt-audio"
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
