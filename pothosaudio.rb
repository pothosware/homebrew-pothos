class Pothosaudio < Formula
  desc "Pothos audio source and sink blocks"
  homepage "https://github.com/pothosware/pothos-audio/wiki"
  head "https://github.com/pothosware/pothos-audio.git"
  url "https://github.com/pothosware/pothos-audio/archive/pothos-audio-0.2.0.tar.gz"
  sha256 "0a39b062fa101dc86cc4d5b7dee89a2c2f108f1fe493cc865f26da76e966474c"

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
