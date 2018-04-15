class Pothospython < Formula
  desc "Pothos language bindings for Python"
  homepage "https://github.com/pothosware/PothosPython/wiki"
  head "https://github.com/pothosware/PothosPython.git"
  url "https://github.com/pothosware/PothosPython/archive/pothos-python-0.4.0.tar.gz"
  sha256 "a8ed23bf3888e5a96a3bc763013e15ea4723b8f70c1e56e12a74f10ae702f679"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "poco"
  depends_on "nlohmann/json/nlohmann_json"
  depends_on "python2" => :optional
  depends_on "python3" => :recommended

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
