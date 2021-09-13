<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
    <head>
        <base href="<%=basePath%>">
        <title>vue(if、for)</title>
        <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
    </head>
    <body>
        <div id="box1">
            <h1>v-for 打印 1-10</h1>
            <ul>
                <li v-for="i in 10" v-if="i % 2 == 0" style="color: #6BC0E4">{{i}}</li>
                <li v-else style="color: #8B743F;list-style: none;">{{i}}</li>
            </ul>
            <hr>
            <h1>遍历list集合</h1>
            <table border="1px" width="600px" cellpadding="0" cellspacing="0" style="text-align: center">
                <tr>
                    <th>索引</th>
                    <th>书名</th>
                    <th>单价</th>
                    <th>数量</th>
                </tr>
                <tr v-for="(book, index) in books">
                    <td>{{index}}</td>
                    <td>{{book.bName}}</td>
                    <td>{{book.price}}</td>
                    <td v-if="book.num <= 20" bgcolor="red">{{book.num}}</td>
                    <td v-else>{{book.num}}</tdv-else>
                </tr>
            </table>
            <hr>
            <h1>遍历Map集合或JavaBean</h1>
            <ul>
                <li v-for="(v, k, i) in user">
                    {{i}} ----- {{k}} ----- {{v}}
                </li>
            </ul>
            <hr>
            <h1>演示v-show、v-if的区别</h1>
            <span v-if="username=='admin'">v-if: 此用户为超级管理员</span><br>
            <span v-show="username=='admin'">v-show: 此用户为超级管理员</span>
        </div>
        <script>
            const vue1 = new Vue({
                el: "#box1",
                data: {
                    books: [
                        {"bName": "Java从入门到放弃", "price": 999, "num": 10},
                        {"bName": "Spring", "price": 59, "num": 50},
                        {"bName": "Vue从入门到放弃", "price": 14, "num": 20}
                    ],
                    user: {"uName": "张三", "gender": "1", "age": 18},
                    username: "admin"
                }
            });
        </script>
    </body>
</html>
 