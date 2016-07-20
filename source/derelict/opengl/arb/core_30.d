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
module derelict.opengl.arb.core_30;

import derelict.opengl.types,
       derelict.opengl.arb.internal;

version(DerelictGL3_Contexts) {}
else version = DerelictGL3_NoContexts;

// ARB_framebuffer_object
enum ARB_framebuffer_object = "GL_ARB_framebuffer_object";
enum arbFramebufferObjectDecls =
q{
enum : uint
{
    GL_INVALID_FRAMEBUFFER_OPERATION  = 0x0506,
    GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING = 0x8210,
    GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE = 0x8211,
    GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE = 0x8212,
    GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE = 0x8213,
    GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE = 0x8214,
    GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE = 0x8215,
    GL_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE = 0x8216,
    GL_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE = 0x8217,
    GL_FRAMEBUFFER_DEFAULT            = 0x8218,
    GL_FRAMEBUFFER_UNDEFINED          = 0x8219,
    GL_DEPTH_STENCIL_ATTACHMENT       = 0x821A,
    GL_MAX_RENDERBUFFER_SIZE          = 0x84E8,
    GL_DEPTH_STENCIL                  = 0x84F9,
    GL_UNSIGNED_INT_24_8              = 0x84FA,
    GL_DEPTH24_STENCIL8               = 0x88F0,
    GL_TEXTURE_STENCIL_SIZE           = 0x88F1,
    GL_TEXTURE_RED_TYPE               = 0x8C10,
    GL_TEXTURE_GREEN_TYPE             = 0x8C11,
    GL_TEXTURE_BLUE_TYPE              = 0x8C12,
    GL_TEXTURE_ALPHA_TYPE             = 0x8C13,
    GL_TEXTURE_DEPTH_TYPE             = 0x8C16,
    GL_UNSIGNED_NORMALIZED            = 0x8C17,
    GL_FRAMEBUFFER_BINDING            = 0x8CA6,
    GL_DRAW_FRAMEBUFFER_BINDING       = GL_FRAMEBUFFER_BINDING,
    GL_RENDERBUFFER_BINDING           = 0x8CA7,
    GL_READ_FRAMEBUFFER               = 0x8CA8,
    GL_DRAW_FRAMEBUFFER               = 0x8CA9,
    GL_READ_FRAMEBUFFER_BINDING       = 0x8CAA,
    GL_RENDERBUFFER_SAMPLES           = 0x8CAB,
    GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE = 0x8CD0,
    GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME = 0x8CD1,
    GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL = 0x8CD2,
    GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE = 0x8CD3,
    GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER = 0x8CD4,
    GL_FRAMEBUFFER_COMPLETE           = 0x8CD5,
    GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT = 0x8CD6,
    GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = 0x8CD7,
    GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER = 0x8CDB,
    GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER = 0x8CDC,
    GL_FRAMEBUFFER_UNSUPPORTED        = 0x8CDD,
    GL_MAX_COLOR_ATTACHMENTS          = 0x8CDF,
    GL_COLOR_ATTACHMENT0              = 0x8CE0,
    GL_COLOR_ATTACHMENT1              = 0x8CE1,
    GL_COLOR_ATTACHMENT2              = 0x8CE2,
    GL_COLOR_ATTACHMENT3              = 0x8CE3,
    GL_COLOR_ATTACHMENT4              = 0x8CE4,
    GL_COLOR_ATTACHMENT5              = 0x8CE5,
    GL_COLOR_ATTACHMENT6              = 0x8CE6,
    GL_COLOR_ATTACHMENT7              = 0x8CE7,
    GL_COLOR_ATTACHMENT8              = 0x8CE8,
    GL_COLOR_ATTACHMENT9              = 0x8CE9,
    GL_COLOR_ATTACHMENT10             = 0x8CEA,
    GL_COLOR_ATTACHMENT11             = 0x8CEB,
    GL_COLOR_ATTACHMENT12             = 0x8CEC,
    GL_COLOR_ATTACHMENT13             = 0x8CED,
    GL_COLOR_ATTACHMENT14             = 0x8CEE,
    GL_COLOR_ATTACHMENT15             = 0x8CEF,
    GL_DEPTH_ATTACHMENT               = 0x8D00,
    GL_STENCIL_ATTACHMENT             = 0x8D20,
    GL_FRAMEBUFFER                    = 0x8D40,
    GL_RENDERBUFFER                   = 0x8D41,
    GL_RENDERBUFFER_WIDTH             = 0x8D42,
    GL_RENDERBUFFER_HEIGHT            = 0x8D43,
    GL_RENDERBUFFER_INTERNAL_FORMAT   = 0x8D44,
    GL_STENCIL_INDEX1                 = 0x8D46,
    GL_STENCIL_INDEX4                 = 0x8D47,
    GL_STENCIL_INDEX8                 = 0x8D48,
    GL_STENCIL_INDEX16                = 0x8D49,
    GL_RENDERBUFFER_RED_SIZE          = 0x8D50,
    GL_RENDERBUFFER_GREEN_SIZE        = 0x8D51,
    GL_RENDERBUFFER_BLUE_SIZE         = 0x8D52,
    GL_RENDERBUFFER_ALPHA_SIZE        = 0x8D53,
    GL_RENDERBUFFER_DEPTH_SIZE        = 0x8D54,
    GL_RENDERBUFFER_STENCIL_SIZE      = 0x8D55,
    GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE = 0x8D56,
    GL_MAX_SAMPLES                    = 0x8D57,
}

extern(System) @nogc nothrow {
    alias da_glIsRenderbuffer = GLboolean function(GLuint);
    alias da_glBindRenderbuffer = void function(GLenum, GLuint);
    alias da_glDeleteRenderbuffers = void function(GLsizei, const(GLuint)*);
    alias da_glGenRenderbuffers = void function(GLsizei, GLuint*);
    alias da_glRenderbufferStorage = void function(GLenum, GLenum, GLsizei, GLsizei);
    alias da_glGetRenderbufferParameteriv = void function(GLenum, GLenum, GLint*);
    alias da_glIsFramebuffer = GLboolean function(GLuint);
    alias da_glBindFramebuffer = void function(GLenum, GLuint);
    alias da_glDeleteFramebuffers = void function(GLsizei, const(GLuint)*);
    alias da_glGenFramebuffers = void function(GLsizei, GLuint*);
    alias da_glCheckFramebufferStatus = GLenum function(GLenum);
    alias da_glFramebufferTexture1D = void function(GLenum, GLenum, GLenum, GLuint, GLint);
    alias da_glFramebufferTexture2D = void function(GLenum, GLenum, GLenum, GLuint, GLint);
    alias da_glFramebufferTexture3D = void function(GLenum, GLenum, GLenum, GLuint, GLint, GLint);
    alias da_glFramebufferRenderbuffer = void function(GLenum, GLenum, GLenum, GLuint);
    alias da_glGetFramebufferAttachmentParameteriv = void function(GLenum, GLenum, GLenum, GLint*);
    alias da_glGenerateMipmap = void function(GLenum);
    alias da_glBlitFramebuffer = void function(GLint, GLint, GLint, GLint, GLint, GLint, GLint, GLint, GLbitfield, GLenum);
    alias da_glRenderbufferStorageMultisample = void function(GLenum, GLsizei, GLenum, GLsizei, GLsizei);
    alias da_glFramebufferTextureLayer = void function(GLenum, GLenum, GLuint, GLint, GLint);
}};

enum arbFramebufferObjectFuncs =
q{
    da_glIsRenderbuffer glIsRenderbuffer;
    da_glBindRenderbuffer glBindRenderbuffer;
    da_glDeleteRenderbuffers glDeleteRenderbuffers;
    da_glGenRenderbuffers glGenRenderbuffers;
    da_glRenderbufferStorage glRenderbufferStorage;
    da_glGetRenderbufferParameteriv glGetRenderbufferParameteriv;
    da_glIsFramebuffer glIsFramebuffer;
    da_glBindFramebuffer glBindFramebuffer;
    da_glDeleteFramebuffers glDeleteFramebuffers;
    da_glGenFramebuffers glGenFramebuffers;
    da_glCheckFramebufferStatus glCheckFramebufferStatus;
    da_glFramebufferTexture1D glFramebufferTexture1D;
    da_glFramebufferTexture2D glFramebufferTexture2D;
    da_glFramebufferTexture3D glFramebufferTexture3D;
    da_glFramebufferRenderbuffer glFramebufferRenderbuffer;
    da_glGetFramebufferAttachmentParameteriv glGetFramebufferAttachmentParameteriv;
    da_glGenerateMipmap glGenerateMipmap;
    da_glBlitFramebuffer glBlitFramebuffer;
    da_glRenderbufferStorageMultisample glRenderbufferStorageMultisample;
    da_glFramebufferTextureLayer glFramebufferTextureLayer;
};

enum arbFramebufferObjectLoaderImpl =
q{
    bindGLFunc(cast(void**)&glIsRenderbuffer, "glIsRenderbuffer");
    bindGLFunc(cast(void**)&glBindRenderbuffer, "glBindRenderbuffer");
    bindGLFunc(cast(void**)&glDeleteRenderbuffers, "glDeleteRenderbuffers");
    bindGLFunc(cast(void**)&glGenRenderbuffers, "glGenRenderbuffers");
    bindGLFunc(cast(void**)&glRenderbufferStorage, "glRenderbufferStorage");
    bindGLFunc(cast(void**)&glGetRenderbufferParameteriv, "glGetRenderbufferParameteriv");
    bindGLFunc(cast(void**)&glIsFramebuffer, "glIsFramebuffer");
    bindGLFunc(cast(void**)&glBindFramebuffer, "glBindFramebuffer");
    bindGLFunc(cast(void**)&glDeleteFramebuffers, "glDeleteFramebuffers");
    bindGLFunc(cast(void**)&glGenFramebuffers, "glGenFramebuffers");
    bindGLFunc(cast(void**)&glCheckFramebufferStatus, "glCheckFramebufferStatus");
    bindGLFunc(cast(void**)&glFramebufferTexture1D, "glFramebufferTexture1D");
    bindGLFunc(cast(void**)&glFramebufferTexture2D, "glFramebufferTexture2D");
    bindGLFunc(cast(void**)&glFramebufferTexture3D, "glFramebufferTexture3D");
    bindGLFunc(cast(void**)&glFramebufferRenderbuffer, "glFramebufferRenderbuffer");
    bindGLFunc(cast(void**)&glGetFramebufferAttachmentParameteriv, "glGetFramebufferAttachmentParameteriv");
    bindGLFunc(cast(void**)&glGenerateMipmap, "glGenerateMipmap");
    bindGLFunc(cast(void**)&glBlitFramebuffer, "glBlitFramebuffer");
    bindGLFunc(cast(void**)&glRenderbufferStorageMultisample, "glRenderbufferStorageMultisample");
    bindGLFunc(cast(void**)&glFramebufferTextureLayer, "glFramebufferTextureLayer");
};

enum arbFramebufferObjectLoader = makeLoader(ARB_framebuffer_object, arbFramebufferObjectLoaderImpl, "gl30");
version(DerelictGL3_NoContexts) enum arbFramebufferObject = arbFramebufferObjectDecls ~ arbFramebufferObjectFuncs ~ arbFramebufferObjectLoader;

// ARB_map_buffer_range
enum ARB_map_buffer_range = "GL_ARB_map_buffer_range";
enum arbMapBufferRangeDecls =
q{
enum : uint
{
    GL_MAP_READ_BIT                   = 0x0001,
    GL_MAP_WRITE_BIT                  = 0x0002,
    GL_MAP_INVALIDATE_RANGE_BIT       = 0x0004,
    GL_MAP_INVALIDATE_BUFFER_BIT      = 0x0008,
    GL_MAP_FLUSH_EXPLICIT_BIT         = 0x0010,
    GL_MAP_UNSYNCHRONIZED_BIT         = 0x0020,
}

extern(System) @nogc nothrow {
    alias da_glMapBufferRange = GLvoid* function(GLenum, GLintptr, GLsizeiptr, GLbitfield);
    alias da_glFlushMappedBufferRange = void function(GLenum, GLintptr, GLsizeiptr);
}};

enum arbMapBufferRangeFuncs =
q{
    da_glMapBufferRange glMapBufferRange;
    da_glFlushMappedBufferRange glFlushMappedBufferRange;
};

enum arbMapBufferRangeLoaderImpl =
q{
    bindGLFunc(cast(void**)&glMapBufferRange, "glMapBufferRange");
    bindGLFunc(cast(void**)&glFlushMappedBufferRange, "glFlushMappedBufferRange");
};

enum arbMapBufferRangeLoader = makeLoader(ARB_map_buffer_range, arbMapBufferRangeLoaderImpl, "gl30");
enum arbMapBufferRange = arbMapBufferRangeDecls ~ arbMapBufferRangeFuncs.makeGShared() ~ arbMapBufferRangeLoader;

// ARB_vertex_array_object
enum ARB_vertex_array_object = "GL_ARB_vertex_array_object";
enum arbVertexArrayObjectDecls =
q{
enum uint GL_VERTEX_ARRAY_BINDING = 0x85B5;

extern(System) @nogc nothrow {
    alias da_glBindVertexArray = void function(GLuint);
    alias da_glDeleteVertexArrays = void function(GLsizei, const(GLuint)*);
    alias da_glGenVertexArrays = void function(GLsizei, GLuint*);
    alias da_glIsVertexArray = GLboolean function(GLuint);
}};

enum arbVertexArrayObjectFuncs =
q{
    da_glBindVertexArray glBindVertexArray;
    da_glDeleteVertexArrays glDeleteVertexArrays;
    da_glGenVertexArrays glGenVertexArrays;
    da_glIsVertexArray glIsVertexArray;
};

enum arbVertexArrayObjectLoaderImpl =
q{
    bindGLFunc(cast(void**)&glBindVertexArray, "glBindVertexArray");
    bindGLFunc(cast(void**)&glDeleteVertexArrays, "glDeleteVertexArrays");
    bindGLFunc(cast(void**)&glGenVertexArrays, "glGenVertexArrays");
    bindGLFunc(cast(void**)&glIsVertexArray, "glIsVertexArray");
};

enum arbVertexArrayObjectLoader = makeLoader(ARB_vertex_array_object, arbVertexArrayObjectLoaderImpl, "gl30");
enum arbVertexArrayObject = arbVertexArrayObjectDecls ~ arbVertexArrayObjectFuncs.makeGShared() ~ arbVertexArrayObjectLoader;

enum corearb30Decls = arbFramebufferObjectDecls ~ arbMapBufferRangeDecls ~ arbVertexArrayObjectDecls;
enum corearb30Funcs = arbFramebufferObjectFuncs ~ arbMapBufferRangeFuncs ~ arbVertexArrayObjectFuncs;
enum corearb30Loader = arbFramebufferObjectLoaderImpl ~ arbMapBufferRangeLoaderImpl ~ arbVertexArrayObjectLoaderImpl;