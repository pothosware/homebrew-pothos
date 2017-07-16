class Pothosaudio < Formula
  desc "Pothos audio source and sink blocks"
  homepage "https://github.com/pothosware/pothos-audio/wiki"
  head "https://github.com/pothosware/pothos-audio.git"
  url "https://github.com/pothosware/pothos-audio/archive/pothos-audio-0.2.1.tar.gz"
  sha256 "350e26f926232368ed47cae19ad556db5f491c09285c0bb2cf3d040c7d535a29"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "poco"
  depends_on "portaudio"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
