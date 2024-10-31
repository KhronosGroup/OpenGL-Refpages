<html>
<head>
<title>OpenGL ES 3.0 Reference Pages</title>
  <script>
    window.onload = function () {
      try {
         let params = new URL(document.location.toString()).searchParams;
         let subpage = params.get("subpage");
         if (subpage !== null) { 
           let bottomPage= document.getElementById("bottom");
           params.set("subpage", subpage) 
           bottomPage.src = bottomPage.src + "?" + params.toString();
         }
       } catch (error) { }
     }
  </script>
</head>
<frameset rows="160,*">
  <frame scrolling="no" noresize frameborder="0" marginwidth="0" marginheight="0" src="top.php">
  <frame id="bottom" noresize frameborder="0" marginwidth="0" marginheight="0" src="bottom.php">
</frameset>
</html>
