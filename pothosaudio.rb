class Pothosaudio < Formula
  desc "Pothos audio source and sink blocks"
  homepage "https://github.com/pothosware/pothos-audio/wiki"
  head "https://github.com/pothosware/pothos-audio.git"
  url "https://github.com/pothosware/pothos-audio/archive/pothos-audio-0.1.3.tar.gz"
  sha256 "c2ff34b49f8a47a41479a19d95bf258d0bd1e18e5c7ef64781ae9a4d211ad69f"

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
