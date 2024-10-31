<html>
<head>
<title>OpenGL ES 3.0 Reference Pages</title>
  <script>
    window.onload = function () {
      try {
        let params = new URL(document.location.toString()).searchParams;
        let subpage = params.get("subpage");
        if (subpage !== null) { 
          let indexflat = document.getElementById("indexflat");
          params.set("subpage", subpage) 
          indexflat.src = indexflat.src + "?" + params.toString(); 
        }
      } catch (error) { }
    }
  </script>
</head>
<frameset cols="280,*">
  <frame id="indexflat" frameborder="0" marginwidth="0" marginheight="0" src="html/indexflat.php">
  <frame name="pagedisplay" frameborder="0" marginwidth="20" marginheight="20" src="html/start.html">
</frameset>
</html>
