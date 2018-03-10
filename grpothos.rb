class Grpothos < Formula
  desc "Pothos bindings for gnuradio processing blocks"
  homepage "https://github.com/pothosware/gr-pothos/wiki"
  head "https://github.com/pothosware/gr-pothos.git"

  depends_on "cmake" => :build
  depends_on "python3" => :build
  depends_on "gnuradio"
  depends_on "pothos"

  resource "ply" do
    url "https://pypi.python.org/packages/ce/3d/1f9ca69192025046f02a02ffc61bfbac2731aab06325a218370fd93e18df/ply-3.10.tar.gz"
    sha256 "96e94af7dd7031d8d6dd6e2a8e0de593b511c211a86e28a9c9621c275ac8bacb"
  end

  resource "mako" do
    url "https://pypi.python.org/packages/eb/f3/67579bb486517c0d49547f9697e36582cd19dafb5df9e687ed8e22de57fa/Mako-1.0.7.tar.gz"
    sha256 "4e02fde57bd4abb5ec400181e4c314f56ac3e49ba4fb8b0d50bba18cb27d25ae"
  end

  def install

    args = []

    args += ["-DPYTHON_EXECUTABLE=#{HOMEBREW_PREFIX}/bin/python3"]

    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python3.6/site-packages"
    res = %w[ply mako]
    res.each do |r|
      resource(r).stage do
        system "#{HOMEBREW_PREFIX}/bin/python3", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end
    mkdir "build" do
      args += std_cmake_args
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
