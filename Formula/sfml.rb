class Sfml < Formula
  # Don't update SFML until there's a corresponding CSFML release
  desc "Multi-media library with bindings for multiple languages"
  homepage "https://www.sfml-dev.org/"
  url "https://www.sfml-dev.org/files/SFML-2.4.2-sources.zip"
  sha256 "8ba04f6fde6a7b42527d69742c49da2ac529354f71f553409f9f821d618de4b6"
  revision 1
  head "https://github.com/SFML/SFML.git"

  bottle do
    cellar :any
    sha256 "351011a2dec340dff04273b266c0be498d45d11a0e4c8f3b72f7f2bd41777ea6" => :sierra
    sha256 "d5a2a3d7b6df3694b74b14b39d0b1daee79584557e4635e3aa60c70fa6109a34" => :el_capitan
    sha256 "f291a6bffc2a65f4175b19bd0f416e2e784b73d7686cb8f5c2b5491d6c724a29" => :yosemite
  end

  depends_on "cmake" => :build
  depends_on "doxygen" => :optional
  depends_on "flac"
  depends_on "freetype"
  depends_on "jpeg"
  depends_on "libogg"
  depends_on "libvorbis"
  depends_on "openal-soft" => :optional

  # https://github.com/Homebrew/homebrew/issues/40301
  depends_on :macos => :lion

  def install
    args = std_cmake_args
    args << "-DSFML_BUILD_DOC=TRUE" if build.with? "doxygen"

    # Always remove the "extlibs" to avoid install_name_tool failure
    # (https://github.com/Homebrew/homebrew/pull/35279) but leave the
    # headers that were moved there in https://github.com/SFML/SFML/pull/795
    rm_rf Dir["extlibs/*"] - ["extlibs/headers"]

    system "cmake", ".", *args
    system "make", "install"
  end

  test do
    (testpath/"test.cpp").write <<-EOS.undent
      #include "Time.hpp"
      int main() {
        sf::Time t1 = sf::milliseconds(10);
        return 0;
      }
    EOS
    system ENV.cxx, "-I#{include}/SFML/System", "-L#{lib}", "-lsfml-system",
           testpath/"test.cpp", "-o", "test"
    system "./test"
  end
end
