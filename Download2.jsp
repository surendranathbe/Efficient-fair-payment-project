<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page
	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page
	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page
	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Download2</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript"
	src="js/droid_sans_400-droid_sans_700.font.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style1 {
	color: #00FF00
}

.style2 {
	color: #0000FF
}
.style4 {	font-size: 24px;
	color: #FF0000;
	font-style: italic;
}
.style5 {color: #FF0000; }
-->
</style>
<script type='text/javascript'>

function saveTextAsFile()
{
	var textToWrite = document.getElementById("textarea").value;
	var textFileAsBlob = new Blob([textToWrite], {type:'text/plain'});
	var fileNameToSaveAs = "File.txt";

	var downloadLink = document.createElement("a");
	downloadLink.download = fileNameToSaveAs;
	downloadLink.innerHTML = "Download File";
	if (window.webkitURL != null)
	{
		// Chrome allows the link to be clicked
		// without actually adding it to the DOM.
		downloadLink.href = window.webkitURL.createObjectURL(textFileAsBlob);
	}
	else
	{
		// Firefox requires the link to be added to the DOM
		// before it can be clicked.
		downloadLink.href = window.URL.createObjectURL(textFileAsBlob);
		downloadLink.onclick = destroyClickedElement;
		downloadLink.style.display = "none";
		document.body.appendChild(downloadLink);
	}

	downloadLink.click();
}

function destroyClickedElement(event)
{
	document.body.removeChild(event.target);
}



</script>
</head>
<body>
<div class="main">
<div class="header">
<div class="header_resize">
<div class="logo">
<h1><a href="index.html"></span></a><a href="index.html" class="style4">EFPB Efficient Fair Payment Based on Blockchain for Outsourcing Services in Cloud Computing</a></h1>
</div>
<div class="clr"></div>
<div class="menu_nav">
<ul>
	<li><a href="index.html"><span>Home Page</span></a></li>
	<li><a href="DataOwner.html"><span>Out Sourcer </span></a></li>
	<li><a href="ProxyServer.html"><span>PSA</span></a></li>
	<li><a href="CloudServer.html"><span>CloudServer</span></a></li>
	<li class="active"><a href="EndUser.html"><span>Worker</span></a></li>
</ul>
</div>
<div class="clr"></div>
<div class="slider">
<div id="coin-slider"><a href="#"><img src="images/slide1.jpg"
	width="960" height="313" alt="" /> </a> <a href="#"><img
	src="images/slide2.jpg" width="960" height="313" alt="" /> </a> <a
	href="#"><img src="images/slide3.jpg" width="960" height="313"
	alt="" /> </a></div>
<div class="clr"></div>
</div>
<div class="clr"></div>
</div>
</div>
<div class="content">
<div class="content_resize">
<div class="mainbar">
<div class="article">
<%String uname=(String) application.getAttribute("ename");
        String cname=(String) application.getAttribute("euc");
        %>
<h5 align="right"><%=new java.util.Date()%></h5>
<h2 align="center"><b>Download File</b></h2>
<p class="infopost"><span class="style3 style1">User</span>&nbsp;&nbsp;|&nbsp;<span
	class="style2">&nbsp;Control Panel </span></p>
<div class="clr"></div>
<div class="img"></div>
<div><br />
<br />

<%
		   	try {
		   		String file = request.getParameter("t1");
		   		String owner = request.getParameter("oname");
		   		String mac = request.getParameter("t12");
		   		String sk = request.getParameter("t13");
		  		String un=(String)application.getAttribute("uename");
		  		
		   		application.setAttribute("file2", file);
		   		application.setAttribute("sk2", sk);
		   		String prcs1="Responsed";
	  			String query25 = "select * from userrequest where username='"+un+"' and fnamereq='"
					+ file+ "' and resstatus='"+prcs1+"'";
			Statement st25 = connection.createStatement();
			ResultSet rs25 = st25.executeQuery(query25);

			if (rs25.next()) {
		   		

		   		String strQuery = "select * from cloudserver where fname='"
		   				+ file
		   				+ "' and ownername='"
		   				+ owner
		   				+ "' and  mac='"
		   				+ mac
		   				+ "' and  sk='" + sk + "'";
		   		String strQuery1 = "select * from cloudserver where fname='"
		   				+ file + "'";

		   		ResultSet rs = connection.createStatement().executeQuery(
		   				strQuery);
		   		{
		   			if (rs.next() == true) {
		   				ResultSet rs1 = connection.createStatement()
		   						.executeQuery(strQuery1);
		   				{
		   					if (rs1.next() == true) {
		   						String rank = rs1.getString(9);
		   					//	int r=Integer.parseInt(rank);
		   %> <%
					int updaterank = Integer.parseInt(rank)+ 1;
						%> <%
												String strQuery2 = "update cloudserver set rank='"
														+ updaterank
														+ "' where fname='"
														+ file+ "' and ownername='"+owner+"' ";
						%> <%
												connection.createStatement().executeUpdate(
														strQuery2);
						%> <%
							String ct = rs.getString(3);

												String keys = "ef50a0ef2c3e3a5f";
												byte[] keyValue1 = keys.getBytes();
												Key key1 = new SecretKeySpec(keyValue1, "AES");
												Cipher c1 = Cipher.getInstance("AES");
												c1.init(Cipher.DECRYPT_MODE, key1);
												String decryptedValue = new String(Base64
														.decode(ct.getBytes()));
						%>

</p>
<p align="center" class="style5">File Contents</p>

<label>
<div align="center"><textarea name="text" id="textarea" cols="45"
	rows="17"><%=decryptedValue%></textarea> <br />
<br />
<td>
<button onClick="saveTextAsFile()">Download</button>
</td>
</div>
</label>
<p align="center">&nbsp;</p>
<p>
<%
		    	} else {
		    %>
</p>
<p>
<h1 class="style5">File Doesn't Exist !!!</h1>
</p>
<br />
<p><a href="Download.jsp">Back</a></p>
<%
		}
					}
				} else {
					SimpleDateFormat sdfDate = new SimpleDateFormat(
							"dd/MM/yyyy");
					SimpleDateFormat sdfTime = new SimpleDateFormat(
							"HH:mm:ss");

					Date now = new Date();

					String strDate = sdfDate.format(now);
					String strTime = sdfTime.format(now);
					String dt = strDate + "   " + strTime;

					String user = (String) application
							.getAttribute("uename");
String type="Wrong Credentials";
					String strQuery2 = "insert into attacker(user,fname,cname,sk,type,dt) values('"
							+ user
							+ "','"
							+ file
							+ "','"+cname+"','"
							+ sk
							+ "','"+type+"','"
							+ dt
							+ "')";
					connection.createStatement().executeUpdate(strQuery2);
	%>
	<p>
<h1 class="style5">Wrong Credential Ur Automatically Blocked in <%=cname %> !!!</h1>
<h2>Please contact Cloud Server Admin</h2>
</p>
<br />
</p>
<p>
<h1 class="style5">MAC / Secret Key Mismatch !!!</h1>
</p>
<br />
<p><a href="Download.jsp">Back</a></p>
<%
		}
			}
			}else{
				SimpleDateFormat sdfDate = new SimpleDateFormat(
				"dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat(
				"HH:mm:ss");

		Date now = new Date();

		String strDate = sdfDate.format(now);
		String strTime = sdfTime.format(now);
		String dt = strDate + "   " + strTime;

		String user = (String) application
				.getAttribute("ename");
String type="Access Denied";
		String strQuery2 = "insert into attacker(user,fname,cname,sk,type,dt) values('"
				+ user
				+ "','"
				+ file
				+ "','"+cname+"','"
				+ sk
				+ "','"+type+"','"
				+ dt
				+ "')";
		connection.createStatement().executeUpdate(strQuery2);
				%>
				<p>
<h1 class="style5">U Dont Have Permission To DownLoad File!!!</h1>
<h2>Please contact Cloud Server Admin</h2>
</p>
<br />
<p><a href="Download.jsp">Back</a></p>
				
				<%
			}
			connection.close();
		} catch (Exception e) {
			out.println(e.getMessage());
			e.printStackTrace();
		}
	%>
	</p>

	
</div>
<div class="clr"></div>
</div>
</div>
<div class="sidebar">
<div class="searchform">
<form id="formsearch" name="formsearch" method="post" action="#">
<span> <input name="editbox_search" class="editbox_search"
	id="editbox_search" maxlength="80" value="Search our ste:" type="text" />
</span> <input name="button_search" src="images/search.gif"
	class="button_search" type="image" /></form>
</div>
<div class="clr"></div>
<div class="gadget">
<h2 class="star"><span>Menu</span></h2>
<div class="clr"></div>
<ul class="sb_menu">
	<li><a href="FileSearch.jsp">Search Files</a></li>
	<li><a href="Reqsk.jsp">Req Secret Key</a></li>
	<li><a href="ViewResponse.jsp">ViewFile Response</a></li>
	<li><a href="Download.jsp">Download</a></li>

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
<div style="clear: both;"></div>
</div>
</div>
</div>
<div align=center></div>
</body>
</html>
