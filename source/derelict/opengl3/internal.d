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
module derelict.opengl3.internal;

import std.array;

import derelict.util.system;
import derelict.opengl3.gl3;

package:
        // Assumes symName is null terminated, i.e. a string literal
        void bindGLFunc(void** ptr, string symName) {
            import derelict.util.exception : SymbolLoadException;

            auto sym = getProcAddress(symName.ptr);
            if(!sym)
                throw new SymbolLoadException("Failed to load OpenGL symbol [" ~ symName ~ "]");
            *ptr = sym;
        }

        /*
        This is called from DerelictGL3.reload to reset the extension name cache,
        since supported extensions can potentially vary from context to context.
        */
        void initExtensionCache(GLVersion glversion) {
            // There's no need to cache extension names using the pre-3.0 glString
            // technique, but the modern style of using glStringi results in a high
            // number of calls when testing for every extension Derelict supports.
            // This causes extreme slowdowns when using GLSL-Debugger. The cache
            // solves that problem. Can't hurt load time, either.
            if(glversion >= GLVersion.GL30) {
                int count;
                glGetIntegerv(GL_NUM_EXTENSIONS, &count);

                _extCache.shrinkTo(0);
                _extCache.reserve(count);

                for(int i=0; i<count; ++i) {
                    _extCache.put(glGetStringi(GL_EXTENSIONS, i));
                }
            }
        }

        void loadInternal() {
            DerelictGL3.bindMixedFunc(cast(void**)&getProcAddress, getProcAddressName);
            DerelictGL3.bindMixedFunc(cast(void**)&getCurrentContext, getCurrentContextName);
        }

        // Assumes that name is null-terminated, i.e. a string literal
        bool isExtSupported(GLVersion glversion, string name) {
            import core.stdc.string : strcmp;

            // If OpenGL 3+ is loaded, use the cache.
            if(glversion >= GLVersion.GL30) {
                foreach(extname; _extCache.data) {
                    if(strcmp(extname, name.ptr) == 0)
                        return true;
                }
                return false;
            }
            // Otherwise use the classic approach.
            else {
                return findEXT(glGetString(GL_EXTENSIONS), name);
            }
        }

        // Assumes that extname is null-terminated, i.e. a string literal
        bool findEXT(const(char)* extstr, string extname) {
            import core.stdc.string : strstr;

            auto res = strstr(extstr, extname.ptr);
            while(res) {
                // It's possible that the extension name is actually a
                // substring of another extension. If not, then the
                // character following the name in the extension string
                // should be a space (or possibly the null character).
                if(res[ extname.length ] == ' ' || res[ extname.length ] == '\0')
                    return true;
                res = strstr(res + extname.length, extname.ptr);
            }

            return false;
        }

        bool hasValidContext() {
            return getCurrentContext() != null;
        }

private:
    Appender!(const(char)*[]) _extCache;

    version(Windows) {
        extern(Windows) @nogc nothrow {
            alias da_getProcAddress = void* function(const(char)*);
            alias da_getCurrentContext = void* function();
        }

        da_getProcAddress getProcAddress;
        da_getCurrentContext getCurrentContext;

        enum getProcAddressName = "wglGetProcAddress";
        enum getCurrentContextName = "wglGetCurrentContext";
    }
