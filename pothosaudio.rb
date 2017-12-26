class Pothosaudio < Formula
  desc "Pothos audio source and sink blocks"
  homepage "https://github.com/pothosware/PothosAudio/wiki"
  head "https://github.com/pothosware/PothosAudio.git"
  url "https://github.com/pothosware/PothosAudio/archive/pothos-audio-0.3.0.tar.gz"
  sha256 "4c7462fb25d2b9c168444d0e450ff2843609598b4227691e06fe120d6f6db22d"

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
