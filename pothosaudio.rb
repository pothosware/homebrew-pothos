class Pothosaudio < Formula
  desc "Pothos audio source and sink blocks"
  homepage "https://github.com/pothosware/pothos-audio/wiki"
  head "https://github.com/pothosware/pothos-audio.git"

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
