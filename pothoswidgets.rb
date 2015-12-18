class Pothoswidgets < Formula
  desc "Pothos graphical control widgets"
  homepage "https://github.com/pothosware/pothos-widgets/wiki"
  head "https://github.com/pothosware/pothos-widgets.git"
  url "https://github.com/pothosware/pothos-widgets/archive/pothos-widgets-0.3.0.tar.gz"
  sha256 "eb867069fd1063e4e4c31aac26c50b34a274d7e34eb9a946c0b310be954ffdb3"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "pothosserialization"
  depends_on "qt5"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
