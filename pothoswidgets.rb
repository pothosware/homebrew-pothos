class Pothoswidgets < Formula
  desc "Pothos graphical control widgets"
  homepage "https://github.com/pothosware/pothos-widgets/wiki"
  head "https://github.com/pothosware/pothos-widgets.git"
  url "https://github.com/pothosware/pothos-widgets/archive/pothos-widgets-0.4.2.tar.gz"
  sha256 "76f9148fdba74238b912938bfbd8611a483049016703267358c5e0e28ce6e125"

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
