class Pothospython < Formula
  desc "Pothos language bindings for Python"
  homepage "https://github.com/pothosware/pothos-python/wiki"
  head "https://github.com/pothosware/pothos-python.git"
  url "https://github.com/pothosware/pothos-python/archive/pothos-python-0.2.0.tar.gz"
  sha256 "3fd8619f8db0f4b1e3bdf8f07ce2907258112a71232914ca10055bdfecec6df7"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "poco"
  depends_on "python3" => :optional

  def install

    args = []

    args += ["-DUSE_PYTHON_CONFIG=ON"]

    #using --with-python3 to build bindings for python3
    #its always one or the other, we cant build for both
    if build.with?("python3")
      args += ["-DPython_ADDITIONAL_VERSIONS=3"]
    else
      args += ["-DPython_ADDITIONAL_VERSIONS=2"]
    end

    mkdir "build" do
      args += std_cmake_args
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
