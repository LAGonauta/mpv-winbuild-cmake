ExternalProject_Add(python
    URL https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tar.xz
    URL_HASH MD5=b9c2c36c33fb89bda1fefd37ad5af9be
    PATCH_COMMAND patch -p1 < ${CMAKE_CURRENT_SOURCE_DIR}/python-0001-Msys2-patches-for-python3.patch &&
                  patch -p1 < ${CMAKE_CURRENT_SOURCE_DIR}/python-0002-_testapimodule-Fix-compile-error-in-static-mode.patch &&
                  patch -p1 < ${CMAKE_CURRENT_SOURCE_DIR}/python-0004-setup-add-built-in-modules.patch
    CONFIGURE_COMMAND ${EXEC} LDFLAGS='-Wl,-no-export-dynamic -static' <SOURCE_DIR>/configure --disable-shared --host=${TARGET_ARCH} --build=${TARGET_ARCH} --enable-optimizations --prefix=${MINGW_INSTALL_PREFIX}
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ""
    BUILD_IN_SOURCE 1
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

extra_step(python)
autoreconf(python)
