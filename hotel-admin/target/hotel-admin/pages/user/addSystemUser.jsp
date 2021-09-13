<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>添加用户界面</title>
        <base href="<%=basePath%>">
        <link href="<%=basePath %>/static/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="<%=basePath %>/static/css/select.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="<%=basePath %>/static/js/jquery.js"></script>
        <script type="text/javascript" src="<%=basePath %>/static/js/jquery.idTabs.min.js"></script>
        <script type="text/javascript" src="<%=basePath %>/static/js/select-ui.min.js"></script>
        <script type="text/javascript" src="<%=basePath %>/editor/kindeditor.js"></script>
        <script type="text/javascript" src="<%=basePath %>/static/js/laydate/laydate.js"></script>
        <script type="text/javascript">
            KE.show({
                id: 'content7',
                cssPath: './index.css'
            });
        </script>
        <script type="text/javascript">

            $(document).ready(function (e) {
                $(".select1").uedSelect({
                    width: 345
                });
                $(".select2").uedSelect({
                    width: 167
                });
                $(".select3").uedSelect({
                    width: 100
                });
            });
        </script>
    </head>

    <body>
        <div class="place"><span>位置：</span>
            <ul class="placeul">
                <li><a href="#">首页</a></li>
                <li><a href="#">系统用户添加</a></li>
                <li><a href="#">用户添加</a></li>
            </ul>
        </div>
        <div class="formbody">
            <div class="formtitle"><span>添加用户</span></div>
            <div id="usual1" class="usual">
                <div id="tab1" class="tabson">
                    <ul class="forminfo">
                        <li style="margin-top:20px;">
                            <label for="username">用户名<b>*</b></label>
                            <div class="vocation">
                                <input name="username" id="username" type="text" class="dfinput" placeholder="客户姓名"
                                       style="width:344px;"/>
                            </div>
                        </li>
                        <br/> <br/>
                        <li style="margin-top:20px;">
                            <label for="pwd" style="cursor:pointer">密码<b>*</b></label>
                            <div class="vocation">
                                <input name="pwd" id="pwd" type="text" class="dfinput" placeholder="密码"
                                       style="width:344px;"/>
                            </div>
                        </li>
                        <br/><br/>
                        <li style="margin-top:20px;">
                            <label style="cursor:pointer;padding-top: 100px">授权<b>*</b></label>
                            <div class="vocation">
                                <table width="800px" border="1px">
                                    <c:forEach items="${sqAuthorityList}" var="oneMenu">
                                        <tr style="padding-top: 10px;display: block">
                                                <%--  一级  --%>
                                            <td style="width:100px;">${oneMenu.oneName}</td>
                                                <%--  二级  --%>
                                            <td>
                                                <c:forEach items="${oneMenu.twoMenuList}" var="twoMenu">
                                                    <label for="twoName_${twoMenu.twoId}"
                                                           style="cursor:pointer;display:inline-block;
                                                    width:100px;"><input oneId="${oneMenu.oneId}" type="checkbox"
                                                                         name="twoId"
                                                                         id="twoName_${twoMenu.twoId}"
                                                                         value="${twoMenu.twoId}">&nbsp;${twoMenu.twoName}
                                                    </label>&nbsp;&nbsp;
                                                </c:forEach>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </li>
                        <li style="padding: 30px 0 0 200px">
                            <input name="" type="submit" class="btn" value="提交"/>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
        <script type="text/javascript">
            $(function () {
                $("#usual1 ul").idTabs();

                $(".btn").click(function () {
                    $(this).attr("disabled", "disabled");
                    $(this).css({"background": "#ccc"});
                    let $cks = $(".vocation input[type=checkbox]:checked");

                    //  定义两个变量分别用于记录一、二级菜单
                    var oneIds = "";
                    var twoIds = "";
                    $cks.each(function (index, dom) {   //  index为索引    dom为获取到的标签  $(dom)  转换为JQuery对象 方便获取内部属性
                        let $c = $(dom);
                        oneIds += $c.attr("oneId") + ",";
                        twoIds += $c.val() + ",";
                    })

                    $.ajax({
                        url: "<%=basePath%>/addSystemUser.do",
                        type: "post",
                        dataType: "json",
                        data: {
                            "username": $("input[name=username]").val(),
                            "pwd": $("input[name=pwd]").val(),
                            "oneIds": oneIds,
                            "twoIds": twoIds
                        },
                        success: function (rs) {
                            if (rs) {       //  添加成功的情况下
                                window.location.href = "<%=basePath %>/getSystemUserByLimit.do";
                            }
                        },
                        error: function () {
                            window.location.href = "<%=basePath %>/pages/error/error.jsp";
                        }
                    })
                });
            })
        </script>
    </body>
</html>
