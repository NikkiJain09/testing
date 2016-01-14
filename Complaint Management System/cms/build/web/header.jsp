<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css" />
<title>Complaint management System</title>
</head>

<body>
<div id="container">
		<div id="header">
        	<h1>CMS<span class="off"></span></h1>
            
        </div>   
        
        <div id="menu">
        	<ul>
                    <%
                        //if(s){
                            
                        //}
                        String sa=(String)session.getAttribute("admin_sess_attr");
                        String su=(String)session.getAttribute("user_id");
                        String scr=(String)session.getAttribute("CR_sess_attr");
        if(sa==null && su==null && scr==null){
                        %>
            	<li class="menuitem"><a href="majr_home.jsp">Home</a></li>
                <%
        }
        else if (sa!=null){
            %>
                <li class="menuitem"><a href="admin_home.jsp">Admin Home</a></li>
                
                <%
            }
        else if (su!=null){
            %>
                <li class="menuitem"><a href="features.jsp">User Home</a></li>
                
                <%
            }
        else{%>
            <li class="menuitem"><a href="CR_home.jsp">CR Home</a></li>
            
      <%  }
            %>
                <li class="menuitem"><a href="#">About</a></li>
                <li class="menuitem"><a href="#">Products</a></li>
                <li class="menuitem"><a href="#">Services</a></li>
                <li class="menuitem"><a href="#">Design</a></li>
              <li class="menuitem"><a href="#">Contact</a></li>
            </ul>
        </div>
        
        
    
</div>
</body>
</html>