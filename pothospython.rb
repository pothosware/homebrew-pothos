class Pothospython < Formula
  desc "Pothos language bindings for Python"
  homepage "https://github.com/pothosware/pothos-python/wiki"
  head "https://github.com/pothosware/pothos-python.git"
  url "https://github.com/pothosware/pothos-python/archive/pothos-python-0.1.4.tar.gz"
  sha256 "df4863194171d39dec320018cf27c45ae40d8b877f2915440e38d822e2ed4d7e"

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
