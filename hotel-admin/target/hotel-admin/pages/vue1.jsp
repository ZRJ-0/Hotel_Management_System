<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
    <head>
        <base href="<%=basePath%>">
        <title>vue1</title>
        <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
    </head>
    <body>
        <div id="box1">
            <%--  v-model双向绑定   v-bind(:)单向绑定  --%>
            <input type="text" v-model="bookName">
            <%--插值表达式--%>
            <span>{{bookName}}</span>
            <p v-text="bookName"></p>
            <hr>
            <button v-if="num>0" @click="num--">-</button>
            <span>{{num}}</span>
            <button v-if="num<10" @click="num++">+</button>
            <hr>
            <%--  批量选中  --%>
            <h1>爱好</h1>
            <input type="checkbox" value="1" v-model="hobbies"/>足球<br>
            <input type="checkbox" value="2" v-model="hobbies"/>篮球<br>
            <input type="checkbox" value="3" v-model="hobbies"/>游泳<br>
            <input type="checkbox" value="4" v-model="hobbies"/>跳舞<br>

            <h2>您的爱好为：</h2>
            <span>{{hobbies.join(",")}}</span>
            <hr>
            <span v-text="content"></span>
            <span v-html="content"></span>
            <hr>
            <h1>对单击事件的绑定</h1>
            <button @click="aaa('百度')">百度</button>
            <button @click="aaa('新浪')">新浪</button>
        </div>
        <script type="text/javascript">
            var vue1 = new Vue({
                el: "#box1",
                data: {
                    bookName: "Java从入门到放弃",
                    num: 0,
                    hobbies: [],
                    content: "<h1>v-text&v-html的区别</h1>"
                },
                methods: {
                    aaa(msg) {
                        console.log(msg);
                    }
                }
            });
        </script>
    </body>
</html>
 