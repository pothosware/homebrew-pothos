class Pothosliquiddsp < Formula
  desc "Pothos liquiddsp processing blocks"
  homepage "https://github.com/pothosware/PothosLiquidDSP/wiki"
  head "https://github.com/pothosware/PothosLiquidDSP.git"

  depends_on "cmake" => :build
  depends_on "liquid-dsp" => :build
  depends_on "pothos"

  resource "ply" do
    url "https://pypi.python.org/packages/ce/3d/1f9ca69192025046f02a02ffc61bfbac2731aab06325a218370fd93e18df/ply-3.10.tar.gz"
    sha256 "96e94af7dd7031d8d6dd6e2a8e0de593b511c211a86e28a9c9621c275ac8bacb"
  end

  resource "pyyaml" do
    url "https://pypi.python.org/packages/4a/85/db5a2df477072b2902b0eb892feb37d88ac635d36245a72a6a69b23b383a/PyYAML-3.12.tar.gz"
    sha256 "592766c6303207a20efc445587778322d7f73b161bd994f227adaa341ba212ab"
  end

  resource "mako" do
    url "https://pypi.python.org/packages/eb/f3/67579bb486517c0d49547f9697e36582cd19dafb5df9e687ed8e22de57fa/Mako-1.0.7.tar.gz"
    sha256 "4e02fde57bd4abb5ec400181e4c314f56ac3e49ba4fb8b0d50bba18cb27d25ae"
  end


  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
    res = %w[ply pyyaml mako]
    res.each do |r|
      resource(r).stage do
        system "python", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
