class Soapyaudio < Formula
  desc "Soapy SDR plugin for audio devices"
  homepage "https://github.com/pothosware/SoapyAudio/wiki"
  head "https://github.com/pothosware/SoapyAudio.git"
  version "0.1.1-7"
  url "https://github.com/pothosware/SoapyAudio/archive/01f7dbbf3365242883b0420ae47946415d49c994.zip"
  sha256 "e2545a06276f557b4b9d40ac4e9032773347258ea770b4504d54c390c391a16d"

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
