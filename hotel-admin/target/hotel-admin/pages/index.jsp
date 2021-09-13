<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTDXHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>酒店管理系统主页</title>
        <base href="<%=basePath%>">
    </head>

    <frameset rows="88,*,31" cols="*" frameborder="no" border="0" framespacing="0">
        <frame src="<%=basePath %>/pages/top.jsp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame"
               title="topFrame"/>
        <frameset cols="187,*" frameborder="no" border="0" framespacing="0">
            <frame src="<%=basePath %>/pages/left.jsp" name="leftFrame" scrolling="No" noresize="noresize"
                   id="leftFrame" title="leftFrame"/>
            <frame src="<%=basePath %>/pages/main.jsp" name="rightFrame" id="rightFrame" title="rightFrame"/>
        </frameset>
        <frame src="<%=basePath %>/pages/footer.jsp" name="bottomFrame" scrolling="No" noresize="noresize"
               id="bottomFrame"
               title="bottomFrame"/>
    </frameset>
    <noframes>
        <body>
        </body>
    </noframes>
</html>
