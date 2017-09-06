class Pothosaudio < Formula
  desc "Pothos audio source and sink blocks"
  homepage "https://github.com/pothosware/PothosAudio/wiki"
  head "https://github.com/pothosware/PothosAudio.git"
  url "https://github.com/pothosware/PothosAudio/archive/pothos-audio-0.2.1.tar.gz"
  sha256 "101701a5b0e775619429c4d8d6e840ab84905d6f7d49a9f40972c33d6fe10854"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "poco"
  depends_on "nlohmann/json/nlohmann_json"
  depends_on "portaudio"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
