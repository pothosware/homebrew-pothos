class Grpothos < Formula
  desc "Pothos bindings for gnuradio processing blocks"
  homepage "https://github.com/pothosware/gr-pothos/wiki"
  head "https://github.com/pothosware/gr-pothos.git"

  depends_on "cmake" => :build
  depends_on "gnuradio"
  depends_on "pothos"

  resource "ply" do
    url "https://pypi.python.org/packages/ce/3d/1f9ca69192025046f02a02ffc61bfbac2731aab06325a218370fd93e18df/ply-3.10.tar.gz"
    sha256 "96e94af7dd7031d8d6dd6e2a8e0de593b511c211a86e28a9c9621c275ac8bacb"
  end

  resource "cheetah" do
    url "https://pypi.python.org/packages/cd/b0/c2d700252fc251e91c08639ff41a8a5203b627f4e0a2ae18a6b662ab32ea/Cheetah-2.4.4.tar.gz"
    sha256 "be308229f0c1e5e5af4f27d7ee06d90bb19e6af3059794e5fd536a6f29a9b550"
  end

  def install

    args = []

    args += ["-DPYTHON_EXECUTABLE=/usr/bin/python2.7"]

    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
    res = %w[ply cheetah]
    res.each do |r|
      resource(r).stage do
        system "python2.7", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end
    mkdir "build" do
      args += std_cmake_args
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
