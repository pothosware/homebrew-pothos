class Pothos < Formula
  desc "Pothos data-flow software suite"
  homepage "https://github.com/pothosware/pothos/wiki"
  head "https://github.com/pothosware/pothos.git"

  depends_on "cmake" => :build
  depends_on "qt5"
  depends_on "qwtqt5"
  depends_on "poco"
  depends_on "portaudio"
  depends_on "graphviz"
  depends_on "soapysdr"

  #This patch forces Pothos to search the /usr/local prefix for modules.
  #This patch is needed because the CMAKE_INSTALL_PREFIX is not /usr/local.
  #Another solution would be to set POTHOS_ROOT environment variable.
  patch :DATA

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end

__END__
diff --git a/library/lib/Plugin/Loader.in.cpp b/library/lib/Plugin/Loader.in.cpp
index f4e7891..754726f 100644
--- a/library/lib/Plugin/Loader.in.cpp
+++ b/library/lib/Plugin/Loader.in.cpp
@@ -48,7 +48,7 @@ void Pothos::PluginLoader::loadModules(void)
     searchPaths.push_back(libPath);
 
     //support /usr/local module installs when the install prefix is /usr
-    if (Pothos::System::getRootPath() == "/usr")
+    //if (Pothos::System::getRootPath() == "/usr")
     {
         searchPaths.push_back("/usr/local/lib@LIB_SUFFIX@/Pothos/modules");
         //when using a multi-arch directory, support single-arch path as well
