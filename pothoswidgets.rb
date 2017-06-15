class Pothoswidgets < Formula
  desc "Pothos graphical control widgets"
  homepage "https://github.com/pothosware/pothos-widgets/wiki"
  head "https://github.com/pothosware/pothos-widgets.git"
  url "https://github.com/pothosware/pothos-widgets/archive/pothos-widgets-0.4.3.tar.gz"
  sha256 "d10b258277496286dd56b2d8458a53bb520bf7e8b9783ac07742f8553cfada1f"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "qt5"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
