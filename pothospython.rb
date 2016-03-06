class Pothospython < Formula
  desc "Pothos language bindings for Python"
  homepage "https://github.com/pothosware/pothos-python/wiki"
  head "https://github.com/pothosware/pothos-python.git"
  url "https://github.com/pothosware/pothos-python/archive/pothos-python-0.1.3.tar.gz"
  sha256 "5117c010b23389dc04951a830a419f790c381060d32ce31aaadb71943c51db54"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "poco"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
