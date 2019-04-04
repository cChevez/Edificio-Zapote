<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="EPIC.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reservaciones EPIc</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link href="../styles/styles.css" rel="stylesheet" type="text/css" media="all">
</head>
<body id="top">
    <div class="wrapper row0">
      <div id="topbar" class="hoc clear"> 
        <!-- ################################################################################################ -->
        <div class="fl_left">
          <ul>
            <li><i class="fa fa-phone"></i> +00 (123) 456 7890</li>
            <li><i class="fa fa-envelope-o"></i> info@domain.com</li>
          </ul>
        </div>
        <div class="fl_right">
          <ul>
            <li><a href="#"><i class="fa fa-lg fa-home"></i></a></li>
            <li><a href="#">Login</a></li>
            <li><a href="#">Register</a></li>
          </ul>
        </div>
        <!-- ################################################################################################ -->
      </div>
    </div>
    <!-- ################################################################################################ -->
    <!-- ################################################################################################ -->
    <!-- ################################################################################################ -->
    <div class="wrapper row1">
      <header id="header" class="hoc clear"> 
        <!-- ################################################################################################ -->
        <div id="logo" class="fl_left">
          <h1><a href="index.aspx">Reservaciones EPIC</a></h1>
        </div>
        <nav id="mainav" class="fl_right">
          <ul class="clear">
            <li class="active"><a href="index.aspx">Home</a></li>
            <li><a class="drop" href="#">Solicitar</a>
              <ul>
                <li><a href="alquiler.aspx">Alquiler de espacio</a></li>
                <li><a href="">Préstamo de espacio</a></li>
              </ul>
            </li>
            <li><a href="comprobante.aspx">Subir comprobante</a></li>
            <li><a class="drop" href="#">Dropdown</a>
              <ul>
                <li><a href="#">Level 2</a></li>
                <li><a class="drop" href="#">Level 2 + Drop</a>
                  <ul>
                    <li><a href="#">Level 3</a></li>
                    <li><a href="#">Level 3</a></li>
                    <li><a href="#">Level 3</a></li>
                  </ul>
                </li>
                <li><a href="#">Level 2</a></li>
              </ul>
            </li>
            <li><a href="#">Link Text</a></li>
          </ul>
        </nav>
        <!-- ################################################################################################ -->
      </header>
    </div>
    <!-- ################################################################################################ -->
    <!-- ################################################################################################ -->
    <!-- ################################################################################################ -->
    <div class="bgded overlay" style="background-image:url('images/demo/backgrounds/01.png');">
      <div id="pageintro" class="hoc clear"> 
        <!-- ################################################################################################ -->
        <div class="flexslider basicslider">
          <ul class="slides">
            <li>
              <article>
                <h3 class="heading">Aliquam vestibulum egestas</h3>
                <p>Fusce rutrum laoreet magna eleifend lorem in euismod sodales commodo mauris sit amet lorem metus donec pharetra</p>
                <p class="font-x1 uppercase bold">Lobortis phasellus in nisl arcu</p>
                <footer>
                  <ul class="nospace inline pushright">
                    <li><a class="btn" href="#">Feugiat tellus</a></li>
                    <li><a class="btn inverse" href="#">Tristique ornare</a></li>
                  </ul>
                </footer>
              </article>
            </li>
            <li>
              <article>
                <h3 class="heading">Efficitur etiam consectetur</h3>
                <p>Tempus purus ac dignissim augue in vivamus luctus tempor odio et dapibus diam mauris id magna vulputate velit quis</p>
                <p class="font-x1 uppercase bold">Felis nam elementum risus nibh</p>
                <footer>
                  <ul class="nospace inline pushright">
                    <li><a class="btn" href="#">Orci venenatis</a></li>
                    <li><a class="btn inverse" href="#">Hendrerit quam</a></li>
                  </ul>
                </footer>
              </article>
            </li>
            <li>
              <article>
                <h3 class="heading">Facilisis nullam ornare</h3>
                <p>Et tortor non tincidunt sed vitae enim eget dolor aliquet sodales auctor diam nullam luctus massa mollis accumsan</p>
                <p class="font-x1 uppercase bold">Vestibulum mi vehicula lacinia</p>
                <footer>
                  <ul class="nospace inline pushright">
                    <li><a class="btn" href="#">Turpis curabitur</a></li>
                    <li><a class="btn inverse" href="#">Hendrerit feugiat</a></li>
                  </ul>
                </footer>
              </article>
            </li>
          </ul>
        </div>
        <!-- ################################################################################################ -->
      </div>
    </div>
    <!-- ################################################################################################ -->
    <!-- ################################################################################################ -->
    <!-- ################################################################################################ -->
    <div class="wrapper row5">
      <div id="copyright" class="hoc clear"> 
        <!-- ################################################################################################ -->
        <p class="fl_left">Copyright &copy; 2016 - All Rights Reserved - <a href="#">Domain Name</a></p>
        <p class="fl_right">Template by <a target="_blank" href="http://www.os-templates.com/" title="Free Website Templates">OS Templates</a></p>
        <!-- ################################################################################################ -->
      </div>
    </div>
    <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
</body>
</html>
