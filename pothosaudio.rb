class Pothosaudio < Formula
  desc "Pothos audio source and sink blocks"
  homepage "https://github.com/pothosware/PothosAudio/wiki"
  head "https://github.com/pothosware/PothosAudio.git"
  url "https://github.com/pothosware/PothosAudio/archive/pothos-audio-0.3.1.tar.gz"
  sha256 "aa36aaa1116515e4634fa29d585df2b847f2238d3c4eb29375bb4a82de9a7d4a"

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
