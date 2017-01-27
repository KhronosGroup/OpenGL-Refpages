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

# APIXIFILES are XIncludes used by multiple APi pages
APIXIFILES = \
    ../apifunchead.xml \
    ../apiversion.xml

GL_ARB_draw_indirect_entries = \
    glDrawArraysIndirect.xhtml \
    glDrawElementsIndirect.xhtml

GL_ARB_shader_subroutine_entries = \
    glGetActiveSubroutineName.xhtml \
    glGetActiveSubroutineUniform.xhtml \
    glGetActiveSubroutineUniformName.xhtml \
    glGetProgramStage.xhtml \
    glGetSubroutineIndex.xhtml \
    glGetSubroutineUniformLocation.xhtml \
    glGetUniformSubroutine.xhtml \
    glUniformSubroutines.xhtml

GL_ARB_tessellation_shader_entries = \
    glPatchParameter.xhtml

GL_ARB_transform_feedback2_entries = \
    glBindTransformFeedback.xhtml \
    glDeleteTransformFeedbacks.xhtml \
    glGenTransformFeedbacks.xhtml \
    glIsTransformFeedback.xhtml \
    glPauseTransformFeedback.xhtml \
    glResumeTransformFeedback.xhtml \
    glDrawTransformFeedback.xhtml

GL_ARB_transform_feedback3_entries = \
    glDrawTransformFeedbackStream.xhtml \
    glBeginQueryIndexed.xhtml \
    glGetQueryIndexed.xhtml

GL_ARB_viewport_array_entries = \
    glDepthRangeArray.xhtml \
    glDepthRangeIndexed.xhtml \
    glScissorArray.xhtml \
    glScissorIndexed.xhtml \
    glViewportArray.xhtml \
    glViewportIndexed.xhtml

GL_ARB_get_program_binary_entries = \
    glGetProgramBinary.xhtml \
    glProgramBinary.xhtml \
    glProgramParameter.xhtml

GL_ARB_ES2_compatibility_entries = \
    glReleaseShaderCompiler.xhtml \
    glShaderBinary.xhtml \
    glGetShaderPrecisionFormat.xhtml

GL_ARB_separate_shader_objects_entries = \
    glUseProgramStages.xhtml \
    glActiveShaderProgram.xhtml \
    glCreateShaderProgram.xhtml \
    glBindProgramPipeline.xhtml \
    glGenProgramPipelines.xhtml \
    glDeleteProgramPipelines.xhtml \
    glIsProgramPipeline.xhtml \
    glGetProgramPipeline.xhtml \
    glValidateProgramPipeline.xhtml \
    glGetProgramPipelineInfoLog.xhtml \
    glProgramUniform.xhtml

GL_ARB_sample_shading_entries = \
    glMinSampleShading.xhtml

GL_ARB_base_instance_entries = \
    glDrawArraysInstancedBaseInstance.xhtml \
    glDrawElementsInstancedBaseInstance.xhtml \
    glDrawElementsInstancedBaseVertexBaseInstance.xhtml

GL_EXT_texture_storage_entries = \
    glTexStorage1D.xhtml \
    glTexStorage2D.xhtml \
    glTexStorage3D.xhtml

GL_ARB_internal_format_query_entries = \
    glGetInternalformat.xhtml

GL_ARB_transform_feedback_instanced_entries = \
    glDrawTransformFeedbackInstanced.xhtml \
    glDrawTransformFeedbackStreamInstanced.xhtml

GL_ARB_shader_atomic_counters_entries = \
    glGetActiveAtomicCounterBufferiv.xhtml

GL_ARB_shader_image_load_store_entries = \
    glBindImageTexture.xhtml \
    glMemoryBarrier.xhtml

# START OF OPENGL 4.3 EXTENSIONS

# GL_ARB_arrays_of_arrays has no new entry points
GL_ARB_arrays_of_arrays_entries =

GL_ARB_multi_draw_indirect_entries = \
    glMultiDrawArraysIndirect.xhtml \
    glMultiDrawElementsIndirect.xhtml

# ES3_compatibility does not have any new entry points
GL_ARB_ES3_compatibility_enries =

GL_ARB_clear_buffer_object_entries = \
    glClearBufferData.xhtml \
    glClearBufferSubData.xhtml

GL_ARB_compute_shader_entries = \
    glDispatchCompute.xhtml \
    glDispatchComputeIndirect.xhtml

GL_ARB_copy_image_entries = \
    glCopyImageSubData.xhtml

GL_ARB_debug_group_entries = \
    glPushDebugGroup.xhtml \
    glPopDebugGroup.xhtml

GL_ARB_debug_label_entries = \
    glObjectLabel.xhtml \
    glObjectPtrLabel.xhtml \
    glGetObjectLabel.xhtml \
    glGetObjectPtrLabel.xhtml

# GL_ARB_debug_output2 has no new entry points
GL_ARB_debug_output2_entries =

GL_ARB_debug_output_entries = \
    glDebugMessageControl.xhtml \
    glDebugMessageInsert.xhtml \
    glDebugMessageCallback.xhtml \
    glGetDebugMessageLog.xhtml \
    glGetPointerv.xhtml

# GL_ARB_explicit_uniform_location has no new entry points
GL_ARB_explicit_uniform_location_entries =

# GL_ARB_fragment_layer_viewport has no new entry points
GL_ARB_fragment_layer_viewport_entries =

GL_ARB_framebuffer_no_attachments_entries = \
    glFramebufferParameteri.xhtml \
    glGetFramebufferParameter.xhtml

# GL_ARB_internalformat_query2 adds glGetInternalFormati64v to glGetInternalFormativ
GL_ARB_internalformat_query2_entries =

GL_ARB_invalidate_subdata_entries = \
    glInvalidateTexSubImage.xhtml \
    glInvalidateTexImage.xhtml \
    glInvalidateBufferSubData.xhtml \
    glInvalidateBufferData.xhtml \
    glInvalidateFramebuffer.xhtml \
    glInvalidateSubFramebuffer.xhtml

GL_ARB_program_interface_query_entries = \
    glGetProgramInterface.xhtml \
    glGetProgramResourceIndex.xhtml \
    glGetProgramResourceName.xhtml \
    glGetProgramResource.xhtml \
    glGetProgramResourceLocation.xhtml \
    glGetProgramResourceLocationIndex.xhtml

# GL_ARB_robust_buffer_access_behavior does not define any new entry points
GL_ARB_robust_buffer_access_behavior_entries =

# GL_ARB_shader_image_size does not define any new entry points
GL_ARB_shader_image_size_entries =

GL_ARB_shader_storage_buffer_object_entries = \
    glShaderStorageBlockBinding.xhtml

# GL_ARB_stencil_texturing does not define any new entry points
GL_ARB_stencil_texturing_entries =

GL_ARB_texture_buffer_range_entries = \
    glTexBufferRange.xhtml

# GL_ARB_texture_query_levels does not define any new entry points
GL_ARB_texture_query_levels =

GL_ARB_texture_storage_multisample_entries = \
    glTexStorage2DMultisample.xhtml \
    glTexStorage3DMultisample.xhtml

GL_ARB_texture_view_entries = \
    glTextureView.xhtml

GL_ARB_vertex_attrib_binding_entries = \
    glVertexAttribBinding.xhtml \
    glVertexAttribFormat.xhtml \
    glVertexBindingDivisor.xhtml \
    glBindVertexBuffer.xhtml

GL_ARB_buffer_storage_entries = \
    glBufferStorage.xhtml

GL_ARB_clear_texture_entries = \
    glClearTexImage.xhtml \
    glClearTexSubImage.xhtml

GL_ARB_multi_bind_entries = \
    glBindBuffersBase.xhtml \
    glBindBuffersRange.xhtml \
    glBindTextures.xhtml \
    glBindImageTextures.xhtml \
    glBindSamplers.xhtml \
    glBindVertexBuffers.xhtml

MODIFIEDFORGL4XML = \
    glClearDepth.xhtml \
    glCreateShader.xhtml \
    glDepthRange.xhtml \
    glDrawArrays.xhtml \
    glGetVertexAttrib.xhtml \
    glVertexAttrib.xhtml \
    glVertexAttribPointer.xhtml

GL4XML = \
    $(GL_ARB_draw_indirect_entries) \
    $(GL_ARB_shader_subroutine_entries) \
    $(GL_ARB_tessellation_shader_entries) \
    $(GL_ARB_transform_feedback2_entries) \
    $(GL_ARB_transform_feedback3_entries) \
    $(GL_ARB_sample_shading_entries)

GL41XML = \
    $(GL_ARB_viewport_array_entries) \
    $(GL_ARB_get_program_binary_entries) \
    $(GL_ARB_ES2_compatibility_entries) \
    $(GL_ARB_separate_shader_objects_entries)

GL42XML = \
    $(GL_ARB_base_instance_entries) \
    $(GL_EXT_texture_storage_entries) \
    $(GL_ARB_internal_format_query_entries) \
    $(GL_ARB_transform_feedback_instanced_entries) \
    $(GL_ARB_shader_atomic_counters_entries) \
    $(GL_ARB_shader_image_load_store_entries) \
    removedTypes.xhtml

GL43XML = \
    $(GL_ARB_multi_draw_indirect_entries) \
    $(GL_ARB_ES3_compatibility_enries) \
    $(GL_ARB_clear_buffer_object_entries) \
    $(GL_ARB_compute_shader_entries) \
    $(GL_ARB_copy_image_entries) \
    $(GL_ARB_invalidate_subdata_entries) \
    $(GL_ARB_texture_buffer_range_entries) \
    $(GL_ARB_texture_storage_multisample_entries) \
    $(GL_ARB_vertex_attrib_binding_entries) \
    $(GL_ARB_shader_storage_buffer_object_entries) \
    $(GL_ARB_debug_group_entries) \
    $(GL_ARB_debug_label_entries) \
    $(GL_ARB_framebuffer_no_attachments_entries) \
    $(GL_ARB_program_interface_query_entries) \
    $(GL_ARB_debug_output_entries) \
    $(GL_ARB_texture_view_entries)

GL44XML = \
    $(GL_ARB_buffer_storage_entries) \
    $(GL_ARB_clear_texture_entries) \
    $(GL_ARB_multi_bind_entries)

GL45XML = \
    glBindTextureUnit.xhtml \
    glCreateBuffers.xhtml \
    glCreateFramebuffers.xhtml \
    glCreateProgramPipelines.xhtml \
    glCreateQueries.xhtml \
    glCreateRenderbuffers.xhtml \
    glCreateSamplers.xhtml \
    glCreateTextures.xhtml \
    glCreateTransformFeedbacks.xhtml \
    glCreateVertexArrays.xhtml \
    glGetTextureSubImage.xhtml \
    glGetCompressedTextureSubImage.xhtml \
    glGetTransformFeedback.xhtml \
    glGetVertexArrayIndexed.xhtml \
    glGetVertexArrayiv.xhtml \
    glTransformFeedbackBufferBase.xhtml \
    glTransformFeedbackBufferRange.xhtml \
    glVertexArrayElementBuffer.xhtml \
    glClipControl.xhtml \
    glGetGraphicsResetStatus.xhtml \
    glTextureBarrier.xhtml \
    gl_HelperInvocation.xhtml

UNMODIFIEDXML = \
    glActiveTexture.xhtml \
    glAttachShader.xhtml \
    glBeginConditionalRender.xhtml \
    glBeginQuery.xhtml \
    glBeginTransformFeedback.xhtml \
    glBindAttribLocation.xhtml \
    glBindBuffer.xhtml \
    glBindBufferBase.xhtml \
    glBindBufferRange.xhtml \
    glBindFragDataLocation.xhtml \
    glBindFragDataLocationIndexed.xhtml \
    glBindFramebuffer.xhtml \
    glBindRenderbuffer.xhtml \
    glBindSampler.xhtml \
    glBindTexture.xhtml \
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
    glClampColor.xhtml \
    glClear.xhtml \
    glClearColor.xhtml \
    glClearBuffer.xhtml \
    glClearStencil.xhtml \
    glClientWaitSync.xhtml \
    glColorMask.xhtml \
    glCompileShader.xhtml \
    glCompressedTexImage1D.xhtml \
    glCompressedTexImage2D.xhtml \
    glCompressedTexImage3D.xhtml \
    glCompressedTexSubImage1D.xhtml \
    glCompressedTexSubImage2D.xhtml \
    glCompressedTexSubImage3D.xhtml \
    glCopyBufferSubData.xhtml \
    glCopyTexImage1D.xhtml \
    glCopyTexImage2D.xhtml \
    glCopyTexSubImage1D.xhtml \
    glCopyTexSubImage2D.xhtml \
    glCopyTexSubImage3D.xhtml \
    glCreateProgram.xhtml \
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
    glDeleteVertexArrays.xhtml \
    glDepthFunc.xhtml \
    glDepthMask.xhtml \
    glDetachShader.xhtml \
    glDrawArraysInstanced.xhtml \
    glDrawBuffer.xhtml \
    glDrawBuffers.xhtml \
    glDrawElements.xhtml \
    glDrawElementsBaseVertex.xhtml \
    glDrawElementsInstanced.xhtml \
    glDrawElementsInstancedBaseVertex.xhtml \
    glDrawRangeElements.xhtml \
    glDrawRangeElementsBaseVertex.xhtml \
    glEnable.xhtml \
    glEnableVertexAttribArray.xhtml \
    glFenceSync.xhtml \
    glFinish.xhtml \
    glFlush.xhtml \
    glFlushMappedBufferRange.xhtml \
    glFramebufferRenderbuffer.xhtml \
    glFramebufferTexture.xhtml \
    glFramebufferTextureLayer.xhtml \
    glFrontFace.xhtml \
    glGenBuffers.xhtml \
    glGenerateMipmap.xhtml \
    glGenFramebuffers.xhtml \
    glGenQueries.xhtml \
    glGenRenderbuffers.xhtml \
    glGenSamplers.xhtml \
    glGenTextures.xhtml \
    glGenVertexArrays.xhtml \
    glGet.xhtml \
    glGetActiveAttrib.xhtml \
    glGetActiveUniform.xhtml \
    glGetActiveUniformBlock.xhtml \
    glGetActiveUniformBlockName.xhtml \
    glGetActiveUniformName.xhtml \
    glGetActiveUniformsiv.xhtml \
    glGetAttachedShaders.xhtml \
    glGetAttribLocation.xhtml \
    glGetBufferParameter.xhtml \
    glGetBufferPointerv.xhtml \
    glGetBufferSubData.xhtml \
    glGetCompressedTexImage.xhtml \
    glGetError.xhtml \
    glGetFragDataIndex.xhtml \
    glGetFragDataLocation.xhtml \
    glGetFramebufferAttachmentParameter.xhtml \
    glGetMultisample.xhtml \
    glGetProgram.xhtml \
    glGetProgramInfoLog.xhtml \
    glGetQueryObject.xhtml \
    glGetQueryiv.xhtml \
    glGetRenderbufferParameter.xhtml \
    glGetSamplerParameter.xhtml \
    glGetShader.xhtml \
    glGetShaderInfoLog.xhtml \
    glGetShaderSource.xhtml \
    glGetString.xhtml \
    glGetSync.xhtml \
    glGetTexImage.xhtml \
    glGetTexLevelParameter.xhtml \
    glGetTexParameter.xhtml \
    glGetTransformFeedbackVarying.xhtml \
    glGetUniform.xhtml \
    glGetUniformBlockIndex.xhtml \
    glGetUniformIndices.xhtml \
    glGetUniformLocation.xhtml \
    glGetVertexAttribPointerv.xhtml \
    glHint.xhtml \
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
    glIsVertexArray.xhtml \
    glLineWidth.xhtml \
    glLinkProgram.xhtml \
    glLogicOp.xhtml \
    glMapBuffer.xhtml \
    glMapBufferRange.xhtml \
    glMultiDrawArrays.xhtml \
    glMultiDrawElements.xhtml \
    glMultiDrawElementsBaseVertex.xhtml \
    glPixelStore.xhtml \
    glPointParameter.xhtml \
    glPointSize.xhtml \
    glPolygonMode.xhtml \
    glPolygonOffset.xhtml \
    glPrimitiveRestartIndex.xhtml \
    glProvokingVertex.xhtml \
    glQueryCounter.xhtml \
    glReadBuffer.xhtml \
    glReadPixels.xhtml \
    glRenderbufferStorage.xhtml \
    glRenderbufferStorageMultisample.xhtml \
    glSampleCoverage.xhtml \
    glSampleMaski.xhtml \
    glSamplerParameter.xhtml \
    glScissor.xhtml \
    glShaderSource.xhtml \
    glStencilFunc.xhtml \
    glStencilFuncSeparate.xhtml \
    glStencilMask.xhtml \
    glStencilMaskSeparate.xhtml \
    glStencilOp.xhtml \
    glStencilOpSeparate.xhtml \
    glTexBuffer.xhtml \
    glTexImage1D.xhtml \
    glTexImage2D.xhtml \
    glTexImage2DMultisample.xhtml \
    glTexImage3D.xhtml \
    glTexImage3DMultisample.xhtml \
    glTexParameter.xhtml \
    glTexSubImage1D.xhtml \
    glTexSubImage2D.xhtml \
    glTexSubImage3D.xhtml \
    glTransformFeedbackVaryings.xhtml \
    glUniform.xhtml \
    glUniformBlockBinding.xhtml \
    glUnmapBuffer.xhtml \
    glUseProgram.xhtml \
    glValidateProgram.xhtml \
    glVertexAttribDivisor.xhtml \
    glViewport.xhtml \
    glWaitSync.xhtml

MODIFIEDXML = \

APIXML	= $(GL4XML) $(GL41XML) $(GL42XML) $(GL43XML) $(GL44XML) $(GL45XML) $(MODIFIEDFORGL4XML) $(UNMODIFIEDXML)

############################ GLSL pages ############################

# GLSLXIFILES are XIncludes used by multiple GLSL pages
GLSLXIFILES = \
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
    intBitsToFloat.xhtml \
    fma.xhtml \
    frexp.xhtml \
    ldexp.xhtml

FloatingPoint_Pack_and_Unpack_Functions = \
    packUnorm.xhtml \
    unpackUnorm.xhtml \
    packDouble2x32.xhtml \
    unpackDouble2x32.xhtml \
    packHalf2x16.xhtml \
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

Integer_Functions = \
    uaddCarry.xhtml \
    usubBorrow.xhtml \
    umulExtended.xhtml \
    bitfieldExtract.xhtml \
    bitfieldInsert.xhtml \
    bitfieldReverse.xhtml \
    bitCount.xhtml \
    findLSB.xhtml \
    findMSB.xhtml

Texture_Query_Functions = \
    textureSamples.xhtml \
    textureSize.xhtml \
    textureQueryLod.xhtml \
    textureQueryLevels.xhtml

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

Texture_Gather_Functions = \
    textureGather.xhtml \
    textureGatherOffset.xhtml \
    textureGatherOffsets.xhtml

Derivative_Functions = \
    dFdx.xhtml \
    fwidth.xhtml

Interpolation_Functions = \
    interpolateAtCentroid.xhtml \
    interpolateAtSample.xhtml \
    interpolateAtOffset.xhtml

Noise_Functions = \
    noise.xhtml

Geometry_Shader_Functions = \
    EmitStreamVertex.xhtml \
    EmitVertex.xhtml \
    EndStreamPrimitive.xhtml \
    EndPrimitive.xhtml

Invocation_Control_Functions = \
    barrier.xhtml

Atomic_Counter_Functions = \
    atomicCounterIncrement.xhtml \
    atomicCounterDecrement.xhtml \
    atomicCounter.xhtml

Image_Functions = \
    imageLoad.xhtml \
    imageStore.xhtml \
    imageAtomicAdd.xhtml \
    imageAtomicAnd.xhtml \
    imageAtomicOr.xhtml \
    imageAtomicXor.xhtml \
    imageAtomicMin.xhtml \
    imageAtomicMax.xhtml \
    imageAtomicExchange.xhtml \
    imageAtomicCompSwap.xhtml \
    imageSamples.xhtml \
    imageSize.xhtml

Barrier_Functions =\
    memoryBarrier.xhtml \
    memoryBarrierAtomicCounter.xhtml \
    memoryBarrierBuffer.xhtml \
    memoryBarrierImage.xhtml \
    memoryBarrierShared.xhtml \
    groupMemoryBarrier.xhtml

Atomic_Memory_Functions = \
    atomicAdd.xhtml \
    atomicMin.xhtml \
    atomicMax.xhtml \
    atomicAnd.xhtml \
    atomicOr.xhtml \
    atomicXor.xhtml \
    atomicExchange.xhtml \
    atomicCompSwap.xhtml

Builtin_Variables = \
    gl_ClipDistance.xhtml \
    gl_CullDistance.xhtml \
    gl_FragCoord.xhtml \
    gl_FragDepth.xhtml \
    gl_FrontFacing.xhtml \
    gl_GlobalInvocationID.xhtml \
    gl_InstanceID.xhtml \
    gl_InvocationID.xhtml \
    gl_Layer.xhtml \
    gl_LocalInvocationID.xhtml \
    gl_LocalInvocationIndex.xhtml \
    gl_NumSamples.xhtml \
    gl_NumWorkGroups.xhtml \
    gl_PatchVerticesIn.xhtml \
    gl_PointCoord.xhtml \
    gl_PointSize.xhtml \
    gl_Position.xhtml \
    gl_PrimitiveID.xhtml \
    gl_PrimitiveIDIn.xhtml \
    gl_SampleID.xhtml \
    gl_SampleMask.xhtml \
    gl_SampleMaskIn.xhtml \
    gl_SamplePosition.xhtml \
    gl_TessCoord.xhtml \
    gl_TessLevelInner.xhtml \
    gl_TessLevelOuter.xhtml \
    gl_VertexID.xhtml \
    gl_ViewportIndex.xhtml \
    gl_WorkGroupID.xhtml \
    gl_WorkGroupSize.xhtml

GLSLXML = \
    $(Angle_and_Trigonometry_Functions) \
    $(Exponential_Functions) \
    $(Common_Functions) \
    $(FloatingPoint_Pack_and_Unpack_Functions) \
    $(Geometric_Functions) \
    $(Matrix_Functions) \
    $(Vector_Relational_Functions) \
    $(Integer_Functions) \
    $(Texture_Query_Functions) \
    $(Texel_Lookup_Functions) \
    $(Texture_Gather_Functions) \
    $(Derivative_Functions) \
    $(Interpolation_Functions) \
    $(Noise_Functions) \
    $(Geometry_Shader_Functions) \
    $(Invocation_Control_Functions) \
    $(Atomic_Counter_Functions) \
    $(Image_Functions) \
    $(Barrier_Functions) \
    $(Atomic_Memory_Functions) \
    \
    $(Builtin_Variables)

############################ API and GLSL pages ############################

XML    = $(APIXML) $(GLSLXML)
# Generate just a few files, for testing
#XML = glViewport.xhtml glTexImage2D.xhtml glPixelStore.xhtml

default: $(XML) indices

# Dependencies on XIncluded files

glTexImage1D.xhtml \
glTexImage2D.xhtml \
glTexImage3D.xhtml \
glTexStorage1D.xhtml \
glTexStorage2D.xhtml \
glTexStorage3D.xhtml \
    : ../internalformattable.xml ../baseformattable.xml ../compressedformattable.xml

glTexBuffer.xhtml glTexBufferRange.xhtml: ../texboformattable.xml

glBindBuffer.xml \
glBufferData.xhtml \
glBufferStorage.xhtml \
glBufferSubData.xhtml \
glClearBufferData.xhtml \
glClearBufferSubData.xhtml \
glCopyBufferSubData.xhtml \
glFlushMappedBufferRange.xhtml \
glGetBufferParameter.xhtml \
glGetBufferPointerv.xhtml \
glGetBufferSubData.xhtml \
glMapBufferRange.xhtml \
glMapBuffer.xhtml \
    : ../bufferbindings.xml

# These are very conservative dependencies
$(APIXML): $(APIXIFILES)

$(GLSLXML): $(GLSLXIFILES)

# OLINKARGS = --stringparam collect.xref.targets "only"

$(XML): %.xhtml: ../%.xml $(DB2XHTML)
	$(XSLT) $(OLINKARGS) --xinclude --noout $(DB2XHTML) $<

indices: Makefile makeindex.py $(XML)
	./makeindex.py . .. index.php indexflat.php

clean:
	$(RM) $(XML) index.php indexflat.php

clobber: clean
