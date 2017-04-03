<?php
$static_title = 'Khronos OpenGL&reg; Reference Pages';
$static_breadcrumb = array(
    '/registry/' => 'Registry',
    'NOLINK' => 'OpenGL Reference Pages'
);
include_once("../../assets/static_pages/khr_page_top.php");
?>

<h1 class="pagetitle"> OpenGL&reg; and OpenGL&reg; ES Reference Pages </h1>
<div id="mainformat">


<h1 style="text-align:center"> OpenGL&reg; and OpenGL&reg; ES Reference Pages </h1>

<p> Complete descriptions of API commands and shading language functions are
    provided for the current versions these APIs. </p>

<h2> Current API Versions </h2>

<ul>
<li> <p> <a href="es3/"> OpenGL ES 3.2 and OpenGL ES Shading Language 3.20 </a> </p> </li>
<li> <p> <a href="gl4/"> OpenGL 4.5 and OpenGL Shading Language 4.50 </a></p> </li>
</ul>

<h2> Older API Versions </h2>

<p> Note that each reference page in the Current Versions pages linked above
    includes version support information for older versions, so (for
    example) the OpenGL 3.x reference pages are no longer provided. The
    older OpenGL ES 3.x and 2.x pages linked here are increasingly out of
    date, and may eventually be removed. </p>

<p> he OpenGL 2.1 pages are the only source of reference material for GLX,
    GLU, and the OpenGL Compatibility Profile. They may be retained for that
    reason, even though they are otherwise useless, or we may eventually
    incorporate that material in the OpenGL 4.5 pages instead. </p>

<ul>
<li> <p> <a href="es3.1/"> OpenGL ES 3.1 and OpenGL ES Shading Language 3.10 </a> </p> </li>
<li> <p> <a href="es3.0/"> OpenGL ES 3.0 and OpenGL ES Shading Language 3.00 </a> </p> </li>
<li> <p> <a href="es2.0/"> OpenGL ES 2.0 </a> </p> </li>
<li> <p> <a href="es1.1/xhtml/"> OpenGL ES 1.1 </a> </p> </li>
<li> <p> <a href="gl2.1/"> OpenGL 2.1 </a>
     (ncluding GLX, GLU, and fixed-function GL compatibility profile APIs) </p> </li>
</ul>

<h2> Reference Page Sources </h2>

<p> The Docbook source for the reference pages is available from the <a
    href="https://github.com/KhronosGroup/OpenGL-Refpages"> OpenGL-Refpages
    </a> github repository. </p>


<h1> API Reference Cards </h1>

<p> <a href="https://www.khronos.org/developers/reference-cards"> Quick
    Reference Cards</a> are available in several formats for OpenGL 3.3 -
    4.5 and OpenGL ES 2.0 - 3.2. </p>

<p> Formal Specifications for the OpenGL and OpenGL ES APIs and Shading
    Languages are available from the <a
    href="https://www.khronos.org/registry/OpenGL/"> OpenGL Registry</a>.
    These are the authoritative documents for how the APIs and Shading
    Languages are intended to work. They are also the most difficult to
    read, being written primarily for device driver implementers, not
    developers using OpenGL ES. </p>


<h1> Books </h1>

<p> <a href="http://www.openglsuperbible.com/"> OpenGL SuperBible </a> -
    Definitive programmer's guide, tutorial, reference, and example code for
    OpenGL 4.5. </p>



<h1> Libraries, Tools, and Tutorials </h1>

<p> Khronos used to host &quot;SDK&quot; areas for OpenGL and OpenGL ES,
    primarily composed of links to external projects, with some hosted
    content on behalf of those projects. These areas were not kept up to
    date, and aside from a few Khronos-authored projects, have been retired.
    Projects formerly in the SDK which are still active are linked below.
    </p>


<h2> Libraries </h2>

<p> <a href="https://github.com/Eyescale/Equalizer">Equalizer</a> -
    Middleware to create and deploy parallel OpenGL-based applications. </p>

<p> <a href="https://github.com/nigels-com/glew">GLEW</a> - The OpenGL
    Extension Wrangler Library. </p>

<p> <a href="http://glm.g-truc.net">GLM (OpenGL Mathematics)</a> - - A C++
    mathematics library for graphics programming. </p>

<p> <a href="https://github.com/McNopper/GLUS">GLUS</a> - A modern OpenGL,
    OpenGL ES and OpenVG Utility library. </p>

<p> <a href="http://mesa3d.org/">Mesa 3D</a> - An open-source
    implementation of the OpenGL specification. </p>

<p> <a href="http://www.openscenegraph.org">Open Scene Graph</a> - A high
    performance 3D graphics toolkit widely used in research and industry.
    </p>


<h2> Tools </h2>

<p> <a href="https://github.com/GPUOpen-Tools/CodeXL"> CodeXL </a> - AMD
    tool suite for GPU debugging, profiling, and shader analysis. </p>

<p> <a href="https://github.com/KhronosGroup/KTX"> KTX </a> - lightweight
    file format for OpenGL textures, and <tt> libktx </tt> library for
    reading and writing KTX files. </p>

<p> <a href="https://github.com/dtrebilco/glintercept"> GLIntercept </a> -
    OpenGL function call intercept & logging tool. </p>

<p> <a href="https://github.com/KhronosGroup/glslang"> GLSLang </a> - OpenGL
    Shading Language Reference Compiler. </p>

<p> <a href="http://realtech-vr.com/admin/glview"> GLView </a> - OpenGL
    Extensions Viewer. </p>

<p> <a href="https://developer.nvidia.com/gameworks-tools-overview"> NVIDIA
    Nsight Visual Studio</a> (and other developer tools). </p>


<h2> Tutorials </h2>

<p> <a href="https://github.com/g-truc/ogl-samples"> OpenGL Samples Pack
    </a> - a collection of OpenGL sample code using the OpenGL core profile.
    </p>


<p> <small> Copyright &copy; 2017 Khronos Group. This work is licensed under
    a <a href="http://creativecommons.org/licenses/by/4.0/">Creative Commons
    Attribution 4.0 International License</a>. </small> </p>

<?php include_once("../../assets/static_pages/khr_page_bottom.php"); ?>
</body>
</html>
