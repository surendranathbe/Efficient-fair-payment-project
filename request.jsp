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
<title>File Request</title>
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
.style4 {font-size: 24px;
	color: #FF0000;
	font-style: italic;
}
-->
</style>
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
          <li><a href="DataOwner.html">Out Sourcer</a></li>
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
      <%
      String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
  	int i=0,j=0,k=0;
      
      
      try 
	{
    	  String user=(String) application.getAttribute("euname");
      	  String euc=(String) application.getAttribute("euc");
    	  
      		String file=request.getParameter("fr");
      		SimpleDateFormat sdfDate = new SimpleDateFormat(
			"dd/MM/yyyy");
	SimpleDateFormat sdfTime = new SimpleDateFormat(
			"HH:mm:ss");

	Date now = new Date();

	String strDate = sdfDate.format(now);
	String strTime = sdfTime.format(now);
	String reqdt = strDate + "   " + strTime;
	String query="select * from attacker where fname='"+file+"' and user='"+user+"' and cname='"+euc+"' "; 
    Statement st5=connection.createStatement();
    ResultSet rs=st5.executeQuery(query);
	String respdate="Waiting for Response";
	String status="Waiting",attack="No", recover="....",process="Response Service";
	String username=(String)application.getAttribute("uename");
	
if ( !rs.next() )
{
	String owner="";
	String query1="select ownername from cloudserver where cname='"+euc+"' and fname='"+file+"' "; 
    Statement st51=connection.createStatement();
    ResultSet rs1=st51.executeQuery(query1);

if(rs1.next()){
	owner=rs1.getString("ownername");
	
		
}

			String sk="Requested";
			Statement stss=connection.createStatement();
			stss.executeUpdate("insert into  userrequest(username,ownername,userfrm,fnamereq,sk,reqdate,resdate,resstatus) values ('"+username+"','"+owner+"','"+euc+"','"+file+"','"+sk+"','"+reqdt+"','"+respdate+"','"+status+"')"); 
			
	
	%>
<h2>Hi Mr.<%=username %> ur request sent to Data Owner </h2>
<h3><a href="EndUserMain.jsp">Back</a></h3>
 <%
}else{
	
	%>
	<h2>Hi Mr.<%=username %> ur Blocked in Cloud Server </h2>
	<h3>Please Contact the <%=euc %>  Server!!</h3>
	<h3><a href="EndUserMain.jsp">Back</a></h3>
	 <%
	
}
	   

         connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
            e.printStackTrace();
          }
%>
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
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center></div></body>
</html>
