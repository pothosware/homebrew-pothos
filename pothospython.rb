class Pothospython < Formula
  desc "Pothos language bindings for Python"
  homepage "https://github.com/pothosware/PothosPython/wiki"
  head "https://github.com/pothosware/PothosPython.git"
  url "https://github.com/pothosware/PothosPython/archive/pothos-python-0.4.2.tar.gz"
  sha256 "80bc8e7a1adc9b86d76b957ee8cfaa258e8e5f5fdf424de2fd7e29c35d5dfdac"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "poco"
  depends_on "nlohmann/json/nlohmann_json"
  depends_on "python2" => :optional
  depends_on "python" => :recommended

  def install

    args = []

    args += ["-DUSE_PYTHON_CONFIG=ON"]

    #using --with-python3 to build bindings for python3
    #its always one or the other, we cant build for both
    if build.with?("python2")
      args += ["-DPython_ADDITIONAL_VERSIONS=2"]
    else
      args += ["-DPython_ADDITIONAL_VERSIONS=3"]
    end

    mkdir "build" do
      args += std_cmake_args
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
