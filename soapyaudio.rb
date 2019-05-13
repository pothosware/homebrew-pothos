class Soapyaudio < Formula
  desc "Soapy SDR plugin for audio devices"
  homepage "https://github.com/pothosware/SoapyAudio/wiki"
  head "https://github.com/pothosware/SoapyAudio.git"
  url "https://github.com/pothosware/SoapyAudio/archive/soapy-audio-0.1.1.tar.gz"
  sha256 "856150d6ca472d3f53b7ac34eb4a218bdea44494012e23e0a592e454dc68d835"

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
