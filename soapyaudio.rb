class Soapyaudio < Formula
  desc "Soapy SDR plugin for audio devices"
  homepage "https://github.com/pothosware/SoapyAudio/wiki"
  head "https://github.com/pothosware/SoapyAudio.git"

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
