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
<title>View VMR</title>
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
.style1 {color: #0000FF}
.style2 {color: #00FF00}
.style4 {font-size: 24px;
	color: #FF0000;
	font-style: italic;
}
.style5 {
	color: #FFFF00;
	font-weight: bold;
}
.style6 {color: #FF0000}
.style7 {color: #FF0000; font-weight: bold; }
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
   <h1><a href="index.html" class="style4">EFPB Efficient Fair Payment Based on Blockchain for Outsourcing Services in Cloud Computing</a><a href="index.html"></a><a href="index.html"></a></h1>
      </div>
      <div class="clr"></div>
      <div class="menu_nav">
        <ul>
          <li ><a href="index.html"><span>Home Page</span></a></li>
         
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
        <div class="article">
       
           
 <h1 align="center" class="style1">Get VM Resources </h1>
	 
        
        
            <p class="infopost"><span class="style3 style2">Resources  </span>&nbsp;&nbsp;|<span class="style1">&nbsp;&nbsp;Details</span></p>
            <div class="clr"></div>
          <div class="img"></div>
          <div>
           <form id="form1" name="form1" method="post" action="ViewVMR.jsp">
<table width="598" border="0" align="center">
<p>&nbsp;</p><p>&nbsp;</p>
	<tr>
		<td bgcolor="#FF0000"><span class="style5">Enter Cloud Name :-</span></td>
		<td><select id="s1"	name="cloudn" class="text">
		  <option>--Select Cloud Server--</option>
		    <option>Rackspace</option>
          <option>Amazon S3</option>
          <option>Windows Azure</option>
		<option>Aliyun OSS</option>
        </select></td>
		</tr>
			
		
	<tr>
		<td>&nbsp;</td>
	<tr>
		<td>
		<div align="right"></div>		</td>
		<td><input type="submit" name="Submit" value="Get" /></td>
	</tr>
</table>
</form>
<br/><br/><br/>
<br/><br/><br/>

            <p align="center" class="infopost style6"><span class="style2">Resouce Details </span></p>
            <div class="clr"></div>
            <h2 align="center" class="style1">VM Resource &amp; Price  Details</h2>
            <table width="700" border="1" align="center">
  <tr>
  <td width="293" bgcolor="#FFFF00"><div align="center" class="style7"><span class="style3">Memory Size</span></div></td>     
   <td width="140" height="32" bgcolor="#FFFF00"><div align="center" class="style7"><span class="style3">Cloud Cost in <span class="WebRupee">&#x20B9;</span></span></div></td>
 <td width="293" bgcolor="#FFFF00"><div align="center" class="style7"><span class="style3">Cloud Name </span></div></td>
  </tr>

<%

String clo=request.getParameter("cloudn");


	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;

      	try 
	{
        
          
      		String tbl = "";
      		if (clo.equalsIgnoreCase("Rackspace")) {
      			tbl = "rvmcost";
      		} else if (clo.equalsIgnoreCase("Amazon S3")) {
      			tbl = "Avmcost";
      		} else if (clo.equalsIgnoreCase("Windows Azure")) {
      			tbl = "Wvmcost";
      		} else if (clo.equalsIgnoreCase("Aliyun OSS")) {
      			tbl = "AOvmcost";
      		} 
      		
    
      		String query="select * from "+tbl+" where cname='"+clo+"' "; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);

           while( rs.next() )
	   {
		i=rs.getInt(1);
		s2=rs.getString(2);
		s3=rs.getString(3);
		s4=rs.getString(4);
		
		%>

     

<tr>
	<td height="29">
	<div align="center" class="style7"><%=s2%></div>	</td>
		<td>
	<div align="center" class="style7"><%=s3%></div>	</td>
	<td>
	<div align="center" class="style7"><%=s4%></div>	</td>
	</tr>


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
</table>
<h4><a href="ProxyServerMain.jsp">Back</a></h4>
          </div>
          <div class="clr"></div>
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
