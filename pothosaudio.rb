class Pothosaudio < Formula
  desc "Pothos audio source and sink blocks"
  homepage "https://github.com/pothosware/pothos-audio/wiki"
  head "https://github.com/pothosware/pothos-audio.git"
  url "https://github.com/pothosware/pothos-audio/archive/pothos-audio-0.1.2.tar.gz"
  sha256 "c2d4be39aaafd4f36fcb68f6217312c14a01e429d5be4bee01fe8339bfd63938"

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
