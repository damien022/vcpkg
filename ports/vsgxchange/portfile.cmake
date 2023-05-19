vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO vsg-dev/vsgXchange
    REF "${VERSION}"
    SHA512 52535ccb788950b083752115cd1e64994208286ad937fdd18cfc2b3212b23c0d4320de5f98ed4de429172ffb102bdcf89ed8eade8a8f253dfe9ee77b93e528d3
    HEAD_REF master
    PATCHES
    "fix_dependencies.patch"
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME "vsgxchange" CONFIG_PATH "lib/cmake/vsgXchange")
vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.md")