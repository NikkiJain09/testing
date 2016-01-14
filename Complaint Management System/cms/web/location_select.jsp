<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connection_db.jsp"%>
<%@include file="cache_admin.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>Location Select</title>
    </head>
    
    <body>
        <script type="text/javascript">
            function f(){
                alert("Please select value other than Select");
                window.location.reload();
                return false;
            }
            function valid(){
                //alert("hello");
                var selected_index = oForm.elements["DC"].selectedIndex;
                if(selected_index === 0){
                    alert("Please select value other than select");
                    return false;
                }
                return true;
                //var v=document.getElementsById("DC").value;
                //var strUser = v.options[v.selectedIndex].value;
                //alert("hello");
                //if(strUser==="select"){
                //alert("Please select value other than Select");
                //return false;
            }
            //return true;
    //}
            
            </script>
        <%@include file="header.jsp"%>
        <%@include file="sidepane1.jsp"%>
        <br><br><br><br>
        
        <%
            String s11=request.getParameter("LC");
            if(s11==null){
%>
<h1>LOCATION WISE</h1>
        <br><br><br><br>

            <form method="post" >
            <div name="d1" id="d1">
        <select name="LC">
            <option value="select">Select</option>
            <option value="Department">Department</option>
            <option value="Hostel">Hostel</option>
            <option value="Administration">Administration</option>
        </select>
                <input type="submit" value="submit" id="s1" >
                
            </div>
            </form>
        </br>
        <%
            }
        %>
<form action="view_location.jsp" onsubmit="return valid();" method="post" name="oForm">        
        <% 
            if(s11!=null && !s11.equals("select")){
                if(s11.equals("Department")){%>
                <h1>DEPARTMENT WISE</h1>
        <br><br><br><br>
        <div name="d2" id="d2" >
            <select name="DC" id="DC">
                <option value="select">Select</option>
              <option value="Electrical_Dept">Electrical Department</option>
              <option value="Computer Science Department">Computer Science Department</option>
              <option value="Electronics">Electronics</option>
              <option value="Earthquake">Earthquake</option>
              <option value="Earth_Science">Earth Science</option>
              <option value="Civil">Civil</option>
              <option value="Chemistry">Chemistry</option>
              <option value="Biotechnology">Biotechnology</option>
        </select>
            
             <input type="submit" value="submit" id="s2" ">
        </div>
        </br>
        
        <%
                }
                else if(s11.equals("Hostel")){%>
                <h1>Hostel WISE</h1>
                
        <br><br><br><br>
        <div name="d2" id="d2" >
            <select name="DC" id="DC">
                <option value="select">Select</option>
              <option value="Sarojini Bhawan">Sarojini Bhawan</option>
              <option value="Kasturba Bhawan">Kasturba Bhawan</option>
              <option value="Cautley Bhawan">Cautley Bhawan</option>
              <option value="GP Bhawan">GP Bhawan</option>
              <option value="jawahar Bhawan">Jawahar Bhawan</option>
              <option value="Ravindra Bhawan">Ravindra Bhawan</option>
              <option value="Rajendra Bhawan">Rajendra Bhawan</option>
              <option value="Ganga Bhawan">Ganga Bhawan</option>
              <option value="Azad Bhawan">Azad Bhawan</option>
              
              
        </select>
            
             <input type="submit" value="submit" id="s2" ">
        </div>
        </br>
        
        <%
                }
                else{%>
                    <h1>Administrative offices and others</h1>
        <br><br><br><br>
        <div name="d2" id="d2" >
            <select name="DC" id="DC">
                <option value="select">Select</option>
                <option value="Administrative">Administrative building</option>
              <option value="Hospital">Hospital</option>
              <option value="Centra_Library">Central Library</option>
              <option value="Computer_Centre">Computer Centre</option
              <option value="Admission_Office">Admission Office</option>
              
              
        </select>
            
             <input type="submit" value="submit" id="s2" >
        </div>
        </br>
        
        <%
                }
    }
            else
    {
if(s11!=null && s11.equals("select")){%>

<div onload="return f();">
    <script type="text/javascript">
        f();
        s11=null;
        response.sendRedirect("location_select.jsp");
    </script>
</div>
            <%}}
        %>
        </form> 
    </body>
</html>