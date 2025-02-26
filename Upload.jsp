<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Upload</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/droid_sans_400-droid_sans_700.font.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style4 {font-size: 24px;
	color: #FF0000;
	font-style: italic;
}
.style5 {font-weight: bold}
.style15 {font-size: 16; color: #FF0000; font-style: italic; font-family: Georgia, "Times New Roman", Times, serif; }
-->
</style>
    <script language="javascript" type='text/javascript'>
function loadFileAsText()
{
	var fileToLoad = document.getElementById("file").files[0];

	var fileReader = new FileReader();
	fileReader.onload = function(fileLoadedEvent) 
	{
		var textFromFileLoaded = fileLoadedEvent.target.result;
		document.getElementById("textarea").value = textFromFileLoaded;
	};
	fileReader.readAsText(fileToLoad, "UTF-8");
}
</script>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
   <h1><a href="index.html" class="style4">EFPB Efficient Fair Payment Based on Blockchain for Outsourcing Services in Cloud Computing</a><a href="index.html"></a></h1>
      </div>
      <div class="clr"></div>
      <div class="menu_nav">
        <ul>
          <li ><a href="index.html"><span>Home Page</span></a></li>
          <li class="active"><a href="DataOwner.html">Out Sourcer</a></li>
          <li><a href="ProxyServer.html"><span>PSA</span></a></li>
          <li><a href="CloudServer.html"><span>CloudServer</span></a></li>
          <li><a href="EndUser.html"><span>Worker</span></a></li>
        </ul>
      </div>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="313" alt="" /> </a> <a href="#"><img src="images/slide2.jpg" width="960" height="313" alt="" /> </a> <a href="#"><img src="images/slide3.jpg" width="960" height="313" alt="" /> </a> </div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
         <h2>Upload Data </h2>
		
		   <form id="form1" name="form1" method="post" action="Upload1.jsp">
          <table width="598" border="1" align="center">
            <tr>
              <td width="286"><span class="style15">Select File :- </span></td>
              <td width="356"><input required="required" type="file" name="t42" id="file"  onchange="loadFileAsText()" /></td>
            </tr>
            <tr>
              <td class="style15">File Name :- </td>
              <td><input required="required" name="tt" type="text" id="t42" size="50"/></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><textarea name="text" id="textarea" cols="50" rows="15"></textarea></td>
            </tr>
            <tr>
              <td><span class="style15">MAC :- </span></td>
              <td><input name="t4" type="text" id="t4" size="50" value="" readonly="readonly" /></td>
            </tr>
			
            <tr>
              <td><div align="right"></div></td>
              <td><input type="submit" name="Submit" value="Encrypt" /></td>
            </tr>
          </table>
          </form>
        </div>
      </div>
      <div class="sidebar">
        <div class="searchform">
          <form id="formsearch" name="formsearch" method="post" action="#">
            <span>
            <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our ste:" type="text" />
            </span>
            <input name="button_search" src="images/search.gif" class="button_search" type="image" />
          </form>
        </div>
        <div class="clr"></div>
        <div class="gadget">
           <h2 class="star"><span>Owner Menu</span></h2>
           <div class="clr"></div>
      <ul class="sb_menu style5">
           <li><a href="GetCloudCost.jsp">Find Cost and Memory</a></li>
           <li><a href="PurchaseVm.jsp">Purchase VM</a></li>
            <li><a href="Vmdetails.jsp">My VM Details</a></li>
            <li><a href="Upload.jsp">Upload</a></li>
            <li><a href="Verify.jsp">Verify</a></li>
			<li><a href="Migrate.jsp">Migrate</a></li>
			<li><a href="VReq.jsp">View Request</a></li>
            <li><a href="ViewOwnerDetails.jsp">View Owner Files </a></li>
  
            <li><a href="index.html">Log Out</a></li>
          </ul>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg">
    <div class="fbg_resize">
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer">
    <div class="footer_resize">
      <p class="lf"></p>
      <p class="rf"></p>
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center></div></body>
</html>
