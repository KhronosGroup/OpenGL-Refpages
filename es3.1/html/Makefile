# Copyright (c) 2013-2017 The Khronos Group Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# XSLT processor - other possibilities like Saxon exist
XSLT	= xsltproc --nonet
SED	= sed

# Location of locally customized stylesheet, which imports
# the Docbook modular stylesheets, and specifically the
# stylesheet to convert Docbook+MathML => XHTML+MathML
DB2XHTML = opengl-man.xsl

.SUFFIXES: .gl .xml .html .xhtml

############################ API pages ############################

API31XML = \
    glActiveShaderProgram.xhtml \
    glBindImageTexture.xhtml \
    glBindProgramPipeline.xhtml \
    glBindVertexBuffer.xhtml \
    glCreateShaderProgram.xhtml \
    glDeleteProgramPipelines.xhtml \
    glDispatchComputeIndirect.xhtml \
    glDispatchCompute.xhtml \
    glDrawArraysIndirect.xhtml \
    glDrawElementsIndirect.xhtml \
    glFramebufferParameteri.xhtml \
    glGenProgramPipelines.xhtml \
    glGetFramebufferParameteriv.xhtml \
    glGetMultisamplefv.xhtml \
    glGetProgramInterface.xhtml \
    glGetProgramPipelineInfoLog.xhtml \
    glGetProgramPipeline.xhtml \
    glGetProgramResourceIndex.xhtml \
    glGetProgramResourceLocation.xhtml \
    glGetProgramResourceName.xhtml \
    glGetProgramResource.xhtml \
    glGetTexLevelParameter.xhtml \
    glIsProgramPipeline.xhtml \
    glMemoryBarrier.xhtml \
    glProgramUniform.xhtml \
    glSampleMaski.xhtml \
    glTexStorage2DMultisample.xhtml \
    glUseProgramStages.xhtml \
    glValidateProgramPipeline.xhtml \
    glVertexAttribBinding.xhtml \
    glVertexAttribFormat.xhtml \
    glVertexBindingDivisor.xhtml

APIXML = \
    $(API31XML) \
    glActiveTexture.xhtml \
    glAttachShader.xhtml \
    glBeginQuery.xhtml \
    glBeginTransformFeedback.xhtml \
    glBindAttribLocation.xhtml \
    glBindBuffer.xhtml \
    glBindBufferBase.xhtml \
    glBindBufferRange.xhtml \
    glBindFramebuffer.xhtml \
    glBindRenderbuffer.xhtml \
    glBindSampler.xhtml \
    glBindTexture.xhtml \
    glBindTransformFeedback.xhtml \
    glBindVertexArray.xhtml \
    glBlendColor.xhtml \
    glBlendEquation.xhtml \
    glBlendEquationSeparate.xhtml \
    glBlendFunc.xhtml \
    glBlendFuncSeparate.xhtml \
    glBlitFramebuffer.xhtml \
    glBufferData.xhtml \
    glBufferSubData.xhtml \
    glCheckFramebufferStatus.xhtml \
    glClear.xhtml \
    glClearColor.xhtml \
    glClearBuffer.xhtml \
    glClearDepthf.xhtml \
    glClearStencil.xhtml \
    glClientWaitSync.xhtml \
    glColorMask.xhtml \
    glCompileShader.xhtml \
    glCompressedTexImage2D.xhtml \
    glCompressedTexImage3D.xhtml \
    glCompressedTexSubImage2D.xhtml \
    glCompressedTexSubImage3D.xhtml \
    glCopyBufferSubData.xhtml \
    glCopyTexImage2D.xhtml \
    glCopyTexSubImage2D.xhtml \
    glCopyTexSubImage3D.xhtml \
    glCreateProgram.xhtml \
    glCreateShader.xhtml \
    glCullFace.xhtml \
    glDeleteBuffers.xhtml \
    glDeleteFramebuffers.xhtml \
    glDeleteProgram.xhtml \
    glDeleteQueries.xhtml \
    glDeleteRenderbuffers.xhtml \
    glDeleteSamplers.xhtml \
    glDeleteShader.xhtml \
    glDeleteSync.xhtml \
    glDeleteTextures.xhtml \
    glDeleteTransformFeedbacks.xhtml \
    glDeleteVertexArrays.xhtml \
    glDepthFunc.xhtml \
    glDepthMask.xhtml \
    glDepthRangef.xhtml \
    glDetachShader.xhtml \
    glDrawArrays.xhtml \
    glDrawArraysInstanced.xhtml \
    glDrawBuffers.xhtml \
    glDrawElements.xhtml \
    glDrawElementsInstanced.xhtml \
    glDrawRangeElements.xhtml \
    glEnable.xhtml \
    glEnableVertexAttribArray.xhtml \
    glFenceSync.xhtml \
    glFinish.xhtml \
    glFlush.xhtml \
    glFlushMappedBufferRange.xhtml \
    glFramebufferRenderbuffer.xhtml \
    glFramebufferTexture2D.xhtml \
    glFramebufferTextureLayer.xhtml \
    glFrontFace.xhtml \
    glGenBuffers.xhtml \
    glGenerateMipmap.xhtml \
    glGenFramebuffers.xhtml \
    glGenQueries.xhtml \
    glGenRenderbuffers.xhtml \
    glGenSamplers.xhtml \
    glGenTextures.xhtml \
    glGenTransformFeedbacks.xhtml \
    glGenVertexArrays.xhtml \
    glGet.xhtml \
    glGetActiveAttrib.xhtml \
    glGetActiveUniform.xhtml \
    glGetActiveUniformBlockiv.xhtml \
    glGetActiveUniformBlockName.xhtml \
    glGetActiveUniformsiv.xhtml \
    glGetAttachedShaders.xhtml \
    glGetAttribLocation.xhtml \
    glGetBufferParameter.xhtml \
    glGetBufferPointerv.xhtml \
    glGetError.xhtml \
    glGetFragDataLocation.xhtml \
    glGetFramebufferAttachmentParameteriv.xhtml \
    glGetInternalformativ.xhtml \
    glGetProgramiv.xhtml \
    glGetProgramBinary.xhtml \
    glGetProgramInfoLog.xhtml \
    glGetQueryObjectuiv.xhtml \
    glGetQueryiv.xhtml \
    glGetRenderbufferParameteriv.xhtml \
    glGetSamplerParameter.xhtml \
    glGetShaderiv.xhtml \
    glGetShaderInfoLog.xhtml \
    glGetShaderPrecisionFormat.xhtml \
    glGetShaderSource.xhtml \
    glGetString.xhtml \
    glGetSynciv.xhtml \
    glGetTexParameter.xhtml \
    glGetTransformFeedbackVarying.xhtml \
    glGetUniform.xhtml \
    glGetUniformBlockIndex.xhtml \
    glGetUniformIndices.xhtml \
    glGetUniformLocation.xhtml \
    glGetVertexAttrib.xhtml \
    glGetVertexAttribPointerv.xhtml \
    glHint.xhtml \
    glInvalidateFramebuffer.xhtml \
    glInvalidateSubFramebuffer.xhtml \
    glIsBuffer.xhtml \
    glIsEnabled.xhtml \
    glIsFramebuffer.xhtml \
    glIsProgram.xhtml \
    glIsRenderbuffer.xhtml \
    glIsQuery.xhtml \
    glIsSampler.xhtml \
    glIsShader.xhtml \
    glIsSync.xhtml \
    glIsTexture.xhtml \
    glIsTransformFeedback.xhtml \
    glIsVertexArray.xhtml \
    glLineWidth.xhtml \
    glLinkProgram.xhtml \
    glMapBufferRange.xhtml \
    glPauseTransformFeedback.xhtml \
    glPixelStorei.xhtml \
    glPolygonOffset.xhtml \
    glProgramBinary.xhtml \
    glProgramParameteri.xhtml \
    glReadBuffer.xhtml \
    glReadPixels.xhtml \
    glReleaseShaderCompiler.xhtml \
    glRenderbufferStorage.xhtml \
    glRenderbufferStorageMultisample.xhtml \
    glResumeTransformFeedback.xhtml \
    glSampleCoverage.xhtml \
    glSamplerParameter.xhtml \
    glScissor.xhtml \
    glShaderBinary.xhtml \
    glShaderSource.xhtml \
    glStencilFunc.xhtml \
    glStencilFuncSeparate.xhtml \
    glStencilMask.xhtml \
    glStencilMaskSeparate.xhtml \
    glStencilOp.xhtml \
    glStencilOpSeparate.xhtml \
    glTexImage2D.xhtml \
    glTexImage3D.xhtml \
    glTexParameter.xhtml \
    glTexStorage2D.xhtml \
    glTexStorage3D.xhtml \
    glTexSubImage2D.xhtml \
    glTexSubImage3D.xhtml \
    glTransformFeedbackVaryings.xhtml \
    glUniform.xhtml \
    glUniformBlockBinding.xhtml \
    glUseProgram.xhtml \
    glValidateProgram.xhtml \
    glVertexAttrib.xhtml \
    glVertexAttribDivisor.xhtml \
    glVertexAttribPointer.xhtml \
    glViewport.xhtml \
    glWaitSync.xhtml

############################ GLSL pages ############################

# GLSLXIFILES are referred to by XInclude directives in man pages
GLSLXIFILES = \
    ../apifunchead.xml \
    ../apiversion.xml \
    ../funchead.xml \
    ../varhead.xml \
    ../version.xml

Angle_and_Trigonometry_Functions = \
    radians.xhtml \
    degrees.xhtml \
    sin.xhtml \
    cos.xhtml \
    tan.xhtml \
    asin.xhtml \
    acos.xhtml \
    atan.xhtml \
    sinh.xhtml \
    cosh.xhtml \
    tanh.xhtml \
    asinh.xhtml \
    acosh.xhtml \
    atanh.xhtml

Exponential_Functions = \
    pow.xhtml \
    exp.xhtml \
    log.xhtml \
    exp2.xhtml \
    log2.xhtml \
    sqrt.xhtml \
    inversesqrt.xhtml

Common_Functions = \
    abs.xhtml \
    sign.xhtml \
    floor.xhtml \
    trunc.xhtml \
    round.xhtml \
    roundEven.xhtml \
    ceil.xhtml \
    fract.xhtml \
    mod.xhtml \
    modf.xhtml \
    min.xhtml \
    max.xhtml \
    clamp.xhtml \
    mix.xhtml \
    step.xhtml \
    smoothstep.xhtml \
    isnan.xhtml \
    isinf.xhtml \
    floatBitsToInt.xhtml \
    intBitsToFloat.xhtml

FloatingPoint_Pack_and_Unpack_Functions = \
    packUnorm.xhtml \
    packHalf2x16.xhtml \
    unpackUnorm.xhtml \
    unpackHalf2x16.xhtml

Geometric_Functions = \
    length.xhtml \
    distance.xhtml \
    dot.xhtml \
    cross.xhtml \
    normalize.xhtml \
    faceforward.xhtml \
    reflect.xhtml \
    refract.xhtml

Matrix_Functions = \
    matrixCompMult.xhtml \
    outerProduct.xhtml \
    transpose.xhtml \
    determinant.xhtml \
    inverse.xhtml

Vector_Relational_Functions = \
    lessThan.xhtml \
    lessThanEqual.xhtml \
    greaterThan.xhtml \
    greaterThanEqual.xhtml \
    equal.xhtml \
    notEqual.xhtml \
    any.xhtml \
    all.xhtml \
    not.xhtml

Texture_Query_Functions = \
    textureSize.xhtml

Texel_Lookup_Functions = \
    texture.xhtml \
    textureProj.xhtml \
    textureLod.xhtml \
    textureOffset.xhtml \
    texelFetch.xhtml \
    texelFetchOffset.xhtml \
    textureProjOffset.xhtml \
    textureLodOffset.xhtml \
    textureProjLod.xhtml \
    textureProjLodOffset.xhtml \
    textureGrad.xhtml \
    textureGradOffset.xhtml \
    textureProjGrad.xhtml \
    textureProjGradOffset.xhtml

Derivative_Functions = \
    dFdx.xhtml \
    fwidth.xhtml

Builtin_Variables = \
    gl_FragCoord.xhtml \
    gl_FragDepth.xhtml \
    gl_FrontFacing.xhtml \
    gl_InstanceID.xhtml \
    gl_PointCoord.xhtml \
    gl_PointSize.xhtml \
    gl_Position.xhtml \
    gl_VertexID.xhtml

GLSL31XML = \
    atomicAdd.xhtml \
    atomicAnd.xhtml \
    atomicCompSwap.xhtml \
    atomicCounterDecrement.xhtml \
    atomicCounterIncrement.xhtml \
    atomicCounter.xhtml \
    atomicExchange.xhtml \
    atomicMax.xhtml \
    atomicMin.xhtml \
    atomicOr.xhtml \
    atomicXor.xhtml \
    barrier.xhtml \
    bitCount.xhtml \
    bitfieldExtract.xhtml \
    bitfieldInsert.xhtml \
    bitfieldReverse.xhtml \
    findLSB.xhtml \
    findMSB.xhtml \
    frexp.xhtml \
    gl_GlobalInvocationID.xhtml \
    gl_LocalInvocationID.xhtml \
    gl_LocalInvocationIndex.xhtml \
    gl_NumWorkGroups.xhtml \
    gl_WorkGroupID.xhtml \
    gl_WorkGroupSize.xhtml \
    groupMemoryBarrier.xhtml \
    imageLoad.xhtml \
    imageSize.xhtml \
    imageStore.xhtml \
    ldexp.xhtml \
    memoryBarrierAtomicCounter.xhtml \
    memoryBarrierBuffer.xhtml \
    memoryBarrierImage.xhtml \
    memoryBarrierShared.xhtml \
    memoryBarrier.xhtml \
    textureGatherOffset.xhtml \
    textureGather.xhtml \
    uaddCarry.xhtml \
    umulExtended.xhtml \
    usubBorrow.xhtml

GLSLXML = \
    $(GLSL31XML) \
    $(Angle_and_Trigonometry_Functions) \
    $(Exponential_Functions) \
    $(Common_Functions) \
    $(FloatingPoint_Pack_and_Unpack_Functions) \
    $(Geometric_Functions) \
    $(Matrix_Functions) \
    $(Vector_Relational_Functions) \
    $(Texture_Query_Functions) \
    $(Texel_Lookup_Functions) \
    $(Derivative_Functions) \
    $(Builtin_Variables)

############################ API and GLSL pages ############################

XML    = $(APIXML) $(GLSLXML)
# Generate just a few files, for testing
#XML = glViewport.xhtml glTexImage2D.xhtml glPixelStore.xhtml

default: $(XML) indices

# Dependencies on XIncluded files

glTexImage2D.xhtml glTexImage3D.xhtml \
    : ../internalformattable.xml ../unsizedformattable.xml

glTexStorage2D.xhtml glTexStorage3D.xhtml \
    : ../internalformattable.xml ../compressedformattable.xml

glCompressedTexImage2D.xhtml glCompressedTexImage3D.xhtml \
    : ../compressedformattable.xml

glRenderbufferStorage.xhtml glRenderbufferStorageMultisample.xhtml \
    : ../renderbufferformattable.xml

# These are very conservative dependencies
$(GLSLXML): $(GLSLXIFILES)

$(XML): %.xhtml: ../%.xml $(DB2XHTML)
	$(XSLT) --xinclude --noout $(DB2XHTML) $<

indices: Makefile makeindex.py $(XML)
	./makeindex.py . .. index.php indexflat.php

clean:
	$(RM) $(XML) index.php indexflat.php
