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
<title>Download</title>
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
.style1 {color: #00FF00}
.style2 {color: #0000FF}
.style4 {	font-size: 24px;
	color: #FF0000;
	font-style: italic;
}
.style9 {color: #FFFFFF; font-weight: bold; font-style: italic; }
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
   <h1><a href="index.html"></a><a href="index.html" class="style4">EFPB Efficient Fair Payment Based on Blockchain for Outsourcing Services in Cloud Computing</a></h1>
      </div>
      <div class="clr"></div>
      <div class="menu_nav">
        <ul>
          <li ><a href="index.html"><span>Home Page</span></a></li>
          <li><a href="DataOwner.html"><span>Out Sourcer </span></a></li>
          <li><a href="ProxyServer.html"><span>PSA</span></a></li>
          <li><a href="CloudServer.html"><span>CloudServer</span></a></li>
          <li class="active"><a href="EndUser.html"><span>Worker</span></a></li>
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
        <%String uname=(String) application.getAttribute("ename");
        String cname=(String) application.getAttribute("euc");
        %>
                       <h5 align="right"><%=new java.util.Date()%></h5>
                   <h2 align="center"><b>Download File</b> </h2>
           <p class="infopost"><span class="style3 style1">User</span>&nbsp;&nbsp;|&nbsp;<span class="style2">&nbsp;Control Panel </span></p>
           <div class="clr"></div>
          <div class="img"></div>
          <div>

      <br/>
      <br/>
              
       <%
		  
		    	try 
				{
		  		String file = request.getParameter("t1");

		  		
		        
		  		String a=(String)application.getAttribute("a");
		  		String fn=(String)application.getAttribute("file");
		  		String un=(String)application.getAttribute("uename");
		  		String oname = request.getParameter("oname");
		  		String eu=(String)application.getAttribute("euc");
		  		
		  			String prcs = "Service Processed";

		  		%>
		  		<%		  		
				String mac="";
				String sk="";
				String strQuery = "select * from cloudserver where fname='"+file+"' and ownername='"+oname+"' and cname='"+cname+"' ";
				ResultSet rs = connection.createStatement().executeQuery(strQuery);
				
					if(rs.next()==true)
					{
						mac=rs.getString(7);
						sk=rs.getString(8);
						
					SimpleDateFormat sdfDate = new SimpleDateFormat(
					"dd/MM/yyyy");
					SimpleDateFormat sdfTime = new SimpleDateFormat(
					"HH:mm:ss");

					Date now = new Date();

					String strDate = sdfDate.format(now);
					String strTime = sdfTime.format(now);
					String dt = strDate + "   " + strTime;	
					String task="Download";
					String user=(String) application.getAttribute("uename");
					String strQuery2 = "insert into transaction(user,fname,cname,sk,task,dt) values('"+user+"','"+file+"','"+cname+"','"+sk+"','"+task+"','"+dt+"')";
					connection.createStatement().executeUpdate(strQuery2);
					
			%>
			
			<form action="Download2.jsp" method="post" name="form1" id="form1">
            <table width="478" border="0" align="center">
              <tr>
                <td width="223" bgcolor="#FF0000"><span class="style9">Enter File Name :-</span></td>
                <td width="245"><label>
                  <input required name="t1" type="text" value="<%=file%>" size="40" />
                </label></td>
              </tr>
			   <tr>
            <td width="223" bgcolor="#FF0000"><span class="style9">Owner Name:-</span></td>
             <td>   <select id="s1" name="oname" style="width:150px;" class="text">
                  <option><%= oname%></option>
            	  
                </select></td>
			  </tr>
			    <tr>
            <td width="223" bgcolor="#FF0000"><span class="style9">User Name:-</span></td>
             <td>   <input name="un" type="text"  size="40" value="<%=un %>">
            	  
                </select></td>
			  </tr>
			  
              <tr>
                <td height="34" bgcolor="#FF0000"><span class="style9">MAC :-</span></td>
                <td><input name="t12" type="text"  size="40" value="<%=mac %>"/></td>
              </tr>
              <tr>
                <td bgcolor="#FF0000"><span class="style9">Secret Key :-</span></td>
                <td><input name="t13" type="text"  size="40" /></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td><div align="right"></div></td>
                <td><label>
                  <input type="submit" name="Submit2" value="Download" />
                </label></td>
              </tr>
            </table>
          </form>		
			
			<%	
					}
					else
					{
		
						out.println("File Doesn't Exist or its Not in "+cname+"  !!!");
			%>
						<p><a href="Download.jsp">Back</a></p>
	<%
					}
		  			
				
				
		  					
		  		     
		  				
	 
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%> 		
          </div>
          <div class="clr"></div>
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
           <h2 class="star"><span>Menu</span></h2>
          <div class="clr"></div>
 <ul class="sb_menu">
	<li><strong><a href="FileSearch.jsp">Search Files</a></strong></li>
	<li><strong><a href="Reqsk.jsp">Req Secret Key</a></strong></li>
	<li><strong><a href="ViewResponse.jsp">ViewFile Response</a></strong></li>
	<li><strong><a href="Download.jsp">Download</a></strong></li>

	<li><strong><a href="index.html">Log Out</a></strong></li>
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
