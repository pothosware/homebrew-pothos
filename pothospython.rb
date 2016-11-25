class Pothospython < Formula
  desc "Pothos language bindings for Python"
  homepage "https://github.com/pothosware/pothos-python/wiki"
  head "https://github.com/pothosware/pothos-python.git"
  url "https://github.com/pothosware/pothos-python/archive/pothos-python-0.2.2.tar.gz"
  sha256 "a44f0a55beda144b8def51584c15cc9dc01c96e5e05a7a27adeadfc487775046"

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
