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

# Profiling options for xsltproc
# "es1.0;es1.1" includes non-profiled text as well as everything
# profiled with revision="es1.0" or revision="es1.1".
XSLTOPTS = --stringparam profile.revision "es1.0;es1.1;not-OES_matrix_palette"

# Location of locally customized stylesheet, which imports
# the Docbook modular stylesheets, and specifically the
# stylesheet to convert Docbook+MathML => XHTML+MathML
DB2XHTML = opengl-man.xsl

.SUFFIXES: .gl .xml .html .xhtml .ck.xhtml .tex .pdf .3G .tar .tar.gz
.PHONY: man html pdf tex

%.xml: ../%.xml opengl-man.xsl
	$(XSLT) $(XSLTOPTS) --xinclude -o $@.tmp $(DB2XHTML) $<
	$(SED) 's/<?xml-stylesheet/<!-- saved from url=(0013)about:internet -->\n<?xml-stylesheet/g' $@.tmp | \
	    $(SED) 's#http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd#xhtml1-transitional.dtd#g' > $@
	$(RM) $@.tmp

# OpenGL ES 1.1 man pages, derived from SGI OpenGL 1.4 man pages for the
# most part
GLXML = \
    glActiveTexture.xml \
    glAlphaFunc.xml \
    glBindBuffer.xml \
    glBindTexture.xml \
    glBlendFunc.xml \
    glBufferData.xml \
    glBufferSubData.xml \
    glClearColor.xml \
    glClearDepth.xml \
    glClearStencil.xml \
    glClear.xml \
    glClientActiveTexture.xml \
    glClipPlane.xml \
    glColorMask.xml \
    glColorPointer.xml \
    glColor.xml \
    glCompressedTexImage2D.xml \
    glCompressedTexSubImage2D.xml \
    glCopyTexImage2D.xml \
    glCopyTexSubImage2D.xml \
    glCullFace.xml \
    glDeleteBuffers.xml \
    glDeleteTextures.xml \
    glDepthFunc.xml \
    glDepthMask.xml \
    glDepthRange.xml \
    glDrawArrays.xml \
    glDrawElements.xml \
    glEnableClientState.xml \
    glEnable.xml \
    glFinish.xml \
    glFlush.xml \
    glFog.xml \
    glFrontFace.xml \
    glFrustum.xml \
    glGenBuffers.xml \
    glGenTextures.xml \
    glGetBufferParameteriv.xml \
    glGetClipPlane.xml \
    glGetError.xml \
    glGetLight.xml \
    glGetMaterial.xml \
    glGetPointerv.xml \
    glGetString.xml \
    glGetTexEnv.xml \
    glGetTexParameter.xml \
    glGet.xml \
    glHint.xml \
    glIsBuffer.xml \
    glIsEnabled.xml \
    glIsTexture.xml \
    glLightModel.xml \
    glLight.xml \
    glLineWidth.xml \
    glLoadIdentity.xml \
    glLoadMatrix.xml \
    glLogicOp.xml \
    glMaterial.xml \
    glMatrixIndexPointer.xml \
    glMatrixMode.xml \
    glMultiTexCoord.xml \
    glMultMatrix.xml \
    glNormalPointer.xml \
    glNormal.xml \
    glOrtho.xml \
    glPixelStorei.xml \
    glPointParameter.xml \
    glPointSizePointerOES.xml \
    glPointSize.xml \
    glPolygonOffset.xml \
    glPushMatrix.xml \
    glReadPixels.xml \
    glRotate.xml \
    glSampleCoverage.xml \
    glScale.xml \
    glScissor.xml \
    glShadeModel.xml \
    glStencilFunc.xml \
    glStencilMask.xml \
    glStencilOp.xml \
    glTexCoordPointer.xml \
    glTexEnv.xml \
    glTexImage2D.xml \
    glTexParameter.xml \
    glTexSubImage2D.xml \
    glTranslate.xml \
    glVertexPointer.xml \
    glViewport.xml

# XML man page source and XHTML targets
XML    = $(GLXML)

default: $(XML)

clean:
	$(RM) $(XML)
