class Soapyremote < Formula
  desc "Use any Soapy SDR remotely"
  homepage "https://github.com/pothosware/SoapyRemote/wiki"
  head "https://github.com/pothosware/SoapyRemote.git"
  version "0.5.2-34"
  url "https://github.com/pothosware/SoapyRemote/archive/0784804a6cf569c624320d5ad9bd6662d1ec5948.zip"
  sha256 "309d780004ff37c0a7c6550623f6bd26b1e8a215beaaf065ceb74c44c9b10f40"

  depends_on "cmake" => :build
  depends_on "soapysdr"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
