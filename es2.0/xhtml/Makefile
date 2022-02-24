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

.SUFFIXES: .gl .xml .html .xhtml .ck.xhtml .tex .pdf .3G .tar .tar.gz
.PHONY: man html pdf tex

%.xml: ../%.xml opengl-man.xsl
	$(XSLT) --xinclude -o $@.tmp $(DB2XHTML) $<
	$(SED) 's/<?xml-stylesheet/\n<!-- saved from url=(0013)about:internet -->\n<?xml-stylesheet/g' $@.tmp | \
	    $(SED) 's#http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd#xhtml1-transitional.dtd#g' > $@
	$(RM) $@.tmp

# XML man page source and XHTML targets
XML = \
    glActiveTexture.xml \
    glAttachShader.xml \
    glBindAttribLocation.xml \
    glBindBuffer.xml \
    glBindFramebuffer.xml \
    glBindRenderbuffer.xml \
    glBindTexture.xml \
    glBlendColor.xml \
    glBlendEquation.xml \
    glBlendEquationSeparate.xml \
    glBlendFuncSeparate.xml \
    glBlendFunc.xml \
    glBufferData.xml \
    glBufferSubData.xml \
    glCheckFramebufferStatus.xml \
    glClearColor.xml \
    glClearDepthf.xml \
    glClearStencil.xml \
    glClear.xml \
    glColorMask.xml \
    glCompileShader.xml \
    glCompressedTexImage2D.xml \
    glCompressedTexSubImage2D.xml \
    glCopyTexImage2D.xml \
    glCopyTexSubImage2D.xml \
    glCreateProgram.xml \
    glCreateShader.xml \
    glCullFace.xml \
    glDeleteBuffers.xml \
    glDeleteFramebuffers.xml \
    glDeleteProgram.xml \
    glDeleteRenderbuffers.xml \
    glDeleteShader.xml \
    glDeleteTextures.xml \
    glDepthFunc.xml \
    glDepthMask.xml \
    glDepthRangef.xml \
    glDetachShader.xml \
    glDrawArrays.xml \
    glDrawElements.xml \
    glEnable.xml \
    glEnableVertexAttribArray.xml \
    glFinish.xml \
    glFlush.xml \
    glFramebufferRenderbuffer.xml \
    glFramebufferTexture2D.xml \
    glFrontFace.xml \
    glGenerateMipmap.xml \
    glGetActiveAttrib.xml \
    glGetActiveUniform.xml \
    glGetAttachedShaders.xml \
    glGetAttribLocation.xml \
    glGenBuffers.xml \
    glGenFramebuffers.xml \
    glGenRenderbuffers.xml \
    glGenTextures.xml \
    glGet.xml \
    glGetBufferParameteriv.xml \
    glGetError.xml \
    glGetFramebufferAttachmentParameteriv.xml \
    glGetProgramiv.xml \
    glGetProgramInfoLog.xml \
    glGetRenderbufferParameteriv.xml \
    glGetShaderiv.xml \
    glGetShaderInfoLog.xml \
    glGetShaderPrecisionFormat.xml \
    glGetShaderSource.xml \
    glGetString.xml \
    glGetTexParameter.xml \
    glGetUniform.xml \
    glGetUniformLocation.xml \
    glGetVertexAttrib.xml \
    glGetVertexAttribPointerv.xml \
    glHint.xml \
    glIsBuffer.xml \
    glIsEnabled.xml \
    glIsFramebuffer.xml \
    glIsProgram.xml \
    glIsRenderbuffer.xml \
    glIsShader.xml \
    glIsTexture.xml \
    glLineWidth.xml \
    glLinkProgram.xml \
    glPixelStorei.xml \
    glPolygonOffset.xml \
    glReadPixels.xml \
    glReleaseShaderCompiler.xml \
    glRenderbufferStorage.xml \
    glSampleCoverage.xml \
    glScissor.xml \
    glShaderBinary.xml \
    glShaderSource.xml \
    glStencilFunc.xml \
    glStencilFuncSeparate.xml \
    glStencilMask.xml \
    glStencilMaskSeparate.xml \
    glStencilOp.xml \
    glStencilOpSeparate.xml \
    glTexImage2D.xml \
    glTexParameter.xml \
    glTexSubImage2D.xml \
    glUniform.xml \
    glUseProgram.xml \
    glValidateProgram.xml \
    glVertexAttrib.xml \
    glVertexAttribPointer.xml \
    glViewport.xml

default: $(XML)

clean:
	$(RM) $(XML)

index.html: makeindex.pl
	makeindex.pl . .. > index.html
