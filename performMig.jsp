<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><%@ include
	file="connect.jsp"%>
<%@page
	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<head>
<title>Owner</title>
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

.style2 {
	color: #0000FF
}

.style3 {
	color: #00FF00
}
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
<h1><a href="index.html"></a><a href="index.html" class="style4">EFPB Efficient Fair Payment Based on Blockchain for Outsourcing Services in Cloud Computing</a></h1>
</div>
<div class="clr"></div>
<div class="menu_nav">
<ul>
	<li><a href="index.html"><span>Home Page</span></a></li>
	<li class="active"><a href="DataOwner.html"><span>Out
	Sourcer </span></a></li>
	<li><a href="ProxyServer.html"><span>PSA</span></a></li>
	<li><a href="CloudServer.html"><span>CloudServer</span></a></li>
	<li><a href="EndUser.html"><span>Worker</span></a></li>
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

<p class="infopost"><span class="style3">Owner </span>&nbsp;&nbsp;|&nbsp;&nbsp;<span
	class="style2">Control Panel </span></p>
<div class="clr"></div>
<div class="img"></div>
<div>
<% String email = request.getParameter("email");
String urn = request.getParameter("name");
	String cloud = request.getParameter("cloud");
	String mcloud = request.getParameter("mcloud");
	String oname=(String)application.getAttribute("onname");
	
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13,s14,s15="",s16,s17="",s18,s22,s23,s24,s25,s26="",s27;
	int i=0,j=0,k=0,i12,i2;
	String query="select * from charm_owner where name='"+urn+"' and email='"+email+"' and cloudname='"+mcloud+"'";
	Statement st=connection.createStatement();
	ResultSet rs= st.executeQuery(query);
	if(rs.next()){

		
		try{
			String query2="select * from charm_cloudserver where ownername='"+oname+"' "; 
	           Statement st2=connection.createStatement();
	           ResultSet rs2=st.executeQuery(query2);
	
	           
	           if ( rs2.next() )
		   {

			i=rs2.getInt(1);
			s2=rs2.getString(2);
			s3=rs2.getString(3);
			s4=rs2.getString(4);
			s5=rs2.getString(5);
			s6=rs2.getString(6);
			s7=rs2.getString(7);
			s8=rs2.getString(8);
			s9=rs2.getString(9);
			s10=rs2.getString(10);
			
			String tbl="";
			if (mcloud.equalsIgnoreCase("Rackspace")) {
				tbl = "charm_rackspacetresh";
			} else if (mcloud.equalsIgnoreCase("Amazon S3")) {
				tbl = "charm_amazons3tresh";
			} else if (mcloud.equalsIgnoreCase("Aliyun OSS")) {
				tbl = "charm_aliyunosstresh";
			} else if (mcloud.equalsIgnoreCase("Windows Azure")) {
				tbl = "charm_windowsazuretresh";
			} 
			
			if(oname.equalsIgnoreCase(s4)){
			String mc="insert into charm_cloudserver (fname,ct,ownername,cname,vm,mac,sk,rank,dt) values ('"+s2+"','"+s3+"','"+urn+"','"+mcloud+"','"+s6+"','"+s7+"','"+s8+"','"+s9+"','"+s10+"')";
			connection.createStatement().executeUpdate(mc);
		
			
			
			
			}
				String ownernam=(String) application.getAttribute("onname");
      		String query4="select * from charm_memcons where ownername='"+urn+"' and cloudname='"+mcloud+"' "; 
           Statement st4=connection.createStatement();
           ResultSet rs5=st4.executeQuery(query4);
           //charm_rackspacetresh
           String query12="select * from "+tbl+" where ownername='"+urn+"' and cloudname='"+mcloud+"' "; 
           Statement st12=connection.createStatement();
           ResultSet rs12=st12.executeQuery(query12);

           while ( rs5.next() )
	   {
  
	           
		i2=rs5.getInt(1);
		s22=rs5.getString(2);
		s23=rs5.getString(3);
		s24=rs5.getString(4);
		s25=rs5.getString(5);
		s26=rs5.getString(6);//
		s27=rs5.getString(7);
		while ( rs12.next() )
		   {
			

			i12=rs12.getInt(1);
			s12=rs12.getString(2);//on
			s13=rs12.getString(3);//cn
			s14=rs12.getString(4);//vm
			s15=rs12.getString(5);//mem
			s16=rs12.getString(6);//cost
			s17=rs12.getString(7);//thre
			s18=rs12.getString(8);//dt
		   }

	   }

       	SimpleDateFormat sdfDate = new SimpleDateFormat(
		"dd/MM/yyyy");
SimpleDateFormat sdfTime = new SimpleDateFormat(
		"HH:mm:ss");
%>
<h2>133</h2>
<%
Date now = new Date();

String strDate = sdfDate.format(now);
String strTime = sdfTime.format(now);
String dt = strDate + "   " + strTime;

           int rem=Integer.parseInt(s26);

           int thre=Integer.parseInt(s17);
           int r=rem-thre;
 
           if(rem>thre)
           {
       
          
        
		  // insert to resource
		 int re=Integer.parseInt(s15);
			int length=s3.length();
		  
		  int rm=rem-length;
		  %><h2><%=length %> <%=re %> <%=rm %> ,<%=r %></h2>
<%

String mig="insert into mig (ownername,fname,cloudname,email,migcloud,newn,dt) values('"+oname+"','"+s2+"','"+cloud+"','"+email+"','"+mcloud+"','"+urn+"','"+dt+"')";
connection.createStatement().executeUpdate(mig);
			
			String memc="insert into memcons (ownername,fname,cloudname,vmused,remvm,dt) values('"+urn+"','"+s2+"','"+mcloud+"','"+length+"','"+rm+"','"+dt+"')";
			connection.createStatement().executeUpdate(memc);//s4,urn
			
			String task="Migrated"; 
			
			String strQueryMT = "insert into transaction(user,fname,cname,sk,task,dt) values('"+urn+"','"+s2+"','"+mcloud+"','"+s8+"','"+task+"','"+dt+"')";
			connection.createStatement().executeUpdate(strQueryMT);
			
		
		      
			
           }else{
        	   %>
<h2>The Upload limit is reached</h2>
<%
           }
			
			String dc="delete from cloudserver where id='"+i+"'";
			connection.createStatement().executeUpdate(dc);
			
			if (cloud.equalsIgnoreCase("Rackspace")) {
				tbl = "rackspacevm";
			} else if (cloud.equalsIgnoreCase("Amazon S3")) {
				tbl = "amazons3vm";
			} else if (cloud.equalsIgnoreCase("Aliyun OSS")) {
				tbl = "aliyunossvm";
			} else if (cloud.equalsIgnoreCase("Windows Azure")) {
				tbl = "windowsazurevm";
			} 
			
			String dv="delete from "+tbl+" where ownername='"+oname+"' and cloudname='"+cloud+"'";
			connection.createStatement().executeUpdate(dv);
			
			 %>
<h2>Migrated Successfully <%=mcloud %> and deleted ur existing vm in <%=cloud %></h2>
<%
			
		   }else {
			   %>
			   <h2>U Doesn't Have any Files in <%=cloud %> cloud</h2>
			   <%
		   }
		}catch(Exception e){
			e.printStackTrace();
			out.print(e.getMessage());
		}
		
		
		String del="delete * from owner where email='"+email+"' and cloudname='"+mcloud+"'";
		connection.createStatement().executeQuery(query);
		
		
		
	}else{
		%>
<h2>Ur Not Registered to this <%=mcloud %> cloud</h2>
<%
	}
	
	
%>
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
<h2 class="star"><span>OS Menu</span></h2>
<div class="clr"></div>
<ul class="sb_menu">
	<li><strong><a href="GetCloudCost.jsp">Find Cost and Memory</a></strong></li>
	<li><strong><a href="PurchaseVm.jsp">Purchase VM</a></strong></li>
	<li><strong><a href="Vmdetails.jsp">My VM Details</a></strong></li>
	<li><strong><a href="Upload.jsp">Upload</a></strong></li>
	<li><strong><a href="Verify.jsp">Verify</a></strong></li>
	<li><strong><a href="Migrate.jsp">Migrate</a></strong></li>
	<li><strong><a href="ViewOwnerDetails.jsp">View Owner Files </a></strong></li>

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
<div style="clear: both;"></div>
</div>
</div>
</div>
<div align=center></div>
</body>
</html>
