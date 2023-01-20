FROM dockcross/web-wasm:20230116-670f7f7

WORKDIR /
RUN mkdir VTK-build
RUN git clone https://gitlab.kitware.com/vtk/VTK.git

WORKDIR /VTK
RUN git checkout c0f1da90 && \
    git submodule update --init --recursive

WORKDIR /VTK-build
RUN cmake   -G Ninja                                                            \
            -DCMAKE_BUILD_TYPE:STRING=Release                                   \
            -DBUILD_SHARED_LIBS:BOOL=OFF                                        \
            -DVTK_ENABLE_LOGGING:BOOL=OFF                                       \
            -DVTK_ENABLE_WRAPPING:BOOL=OFF                                      \
            -DVTK_LEGACY_REMOVE:BOOL=DVTK_OPENGL_USE_GLES                       \
            -DVTK_OPENGL_USE_GLES:BOOL=ON                                       \
            -DVTK_USE_SDL2:BOOL=ON                                              \
            -DVTK_NO_PLATFORM_SOCKETS:BOOL=ON                                   \
            -DVTK_MODULE_ENABLE_VTK_hdf5:STRING=NO                              \
            -DVTK_MODULE_ENABLE_VTK_FiltersVerdict:STRING=NO                    \
            -DVTK_MODULE_ENABLE_VTK_RenderingContextOpenGL2:STRING=DONT_WANT    \ 
            -DVTK_MODULE_ENABLE_VTK_RenderingLICOpenGL2:STRING=DONT_WANT        \
            -DVTK_MODULE_ENABLE_VTK_sqlite:STRING=NO                            \
            ../VTK

RUN ninja -j7 &&   find . -name '*.o' -delete &&   cd .. && chmod -R 777 VTK-build
WORKDIR /work