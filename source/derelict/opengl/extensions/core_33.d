/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.opengl.extensions.core_33;

import derelict.opengl.extensions.arb_b : arbBlendFuncExtendedDecls, arbBlendFuncExtendedFuncs, arbBlendFuncExtendedLoaderImpl;
import derelict.opengl.extensions.arb_o : arbOcclusionQuery2Decls;
import derelict.opengl.extensions.arb_s : arbSamplerObjectsDecls, arbSamplerObjectsFuncs, arbSamplerObjectsLoaderImpl;
import derelict.opengl.extensions.arb_t : arbTextureSwizzleDecls,
                                          arbTimerQueryDecls, arbTimerQueryFuncs, arbTimerQueryLoaderImpl;
import derelict.opengl.extensions.arb_v : arbVertexType2101010RevDecls, arbVertexType2101010RevFuncs, arbVertexType2101010RevLoaderImpl;

enum corearb33Decls = arbBlendFuncExtendedDecls
                    ~ arbOcclusionQuery2Decls
                    ~ arbSamplerObjectsDecls
                    ~ arbTextureSwizzleDecls
                    ~ arbTimerQueryDecls
                    ~ arbVertexType2101010RevDecls;
enum corearb33Funcs = arbBlendFuncExtendedFuncs
                    ~ arbSamplerObjectsFuncs
                    ~ arbTimerQueryFuncs
                    ~ arbVertexType2101010RevFuncs;
enum corearb33Loader = arbBlendFuncExtendedLoaderImpl
                     ~ arbSamplerObjectsLoaderImpl
                     ~ arbTimerQueryLoaderImpl
                     ~ arbVertexType2101010RevLoaderImpl;
