<%@page import="com.busticket.RegisterDao"%>  

<jsp:useBean id="obj" class="com.busticket.User"/>  
<jsp:setProperty property="*" name="obj"/>  
 
<%  
int status=RegisterDao.register(obj);  
if(status>0)  
out.print("You are successfully registered");  
%>  