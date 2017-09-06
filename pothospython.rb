class Pothospython < Formula
  desc "Pothos language bindings for Python"
  homepage "https://github.com/pothosware/PothosPython/wiki"
  head "https://github.com/pothosware/PothosPython.git"
  url "https://github.com/pothosware/PothosPython/archive/pothos-python-0.3.0.tar.gz"
  sha256 "2246e45b7a191fb8d743a0db5f5bddb2dc7a83c951981923a809663d53e69422"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "poco"
  depends_on "nlohmann/json/nlohmann_json"
  depends_on "python" => :recommended
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
