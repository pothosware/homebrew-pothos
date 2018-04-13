class Soapyiris < Formula
  desc "Soapy SDR plugin for Skylark Iris Module"
  homepage "https://github.com/skylarkwireless/sklk-soapyiris/wiki"
  head "https://github.com/skylarkwireless/sklk-soapyiris.wiki.git"
  url "https://github.com/skylarkwireless/sklk-soapyiris/archive/soapy-iris-2018.04.0.1.tar.gz"
  sha256 "1f1f3921890e9dd7b356d2b9763b420103be125fbf3a980e1b6fedf04e1b60d7"

  depends_on "cmake" => :build
  depends_on "soapysdr"
  depends_on "soapyremote" #runtime dependency

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
