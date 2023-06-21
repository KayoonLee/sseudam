<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>1. Basic</title>

    <link rel="stylesheet" type="text/css" href="css/tui-example-style.css" />
    <link rel="stylesheet" type="text/css" href="css/tui-grid.css" />
    <script>var errorLogs=[];window.onerror=function(o,r,e,n){errorLogs.push({message:o,source:r,lineno:e,colno:n})};</script>

    <script type="text/javascript" src="js/tui-grid.js"></script>
    <%--<script type="text/javascript" src="js/basic-dummy.js"></script>--%>
    <script src="https://unpkg.com/babel-standalone@6.26.0/babel.min.js"></script>
</head>

<body>
<div class="description">
    게시판 테스트
    <br>
    <strong>게시판 내용</strong>
</div>

<div class="code-html contents">
    <div id="grid">
        <script>
            var gridData = [
                {
                    id: 549731,
                    name: 'Beautiful Lies',
                    artist: 'Birdy',
                    release: '2016.03.26',
                    type: 'Deluxe',
                    typeCode: '1',
                    genre: 'Pop',
                    genreCode: '1',
                    grade: '2',
                    price: 10000,
                    downloadCount: 1000,
                    listenCount: 5000,
                },
                {
                    id: 549731,
                    name: 'Beautiful Lies',
                    artist: 'Birdy',
                    release: '2016.03.26',
                    type: 'Deluxe',
                    typeCode: '1',
                    genre: 'Pop',
                    genreCode: '1',
                    grade: '2',
                    price: 10000,
                    downloadCount: 1000,
                    listenCount: 5000,
                }
            ];

            // JavaScript 반복문을 사용하여 HTML 생성
            for (var i = 0; i < gridData.length; i++) {
                var item = gridData[i];
                // HTML 생성 코드 작성
                document.write('<div>' + item.name + '</div>');
                // ...
            }
        </script>
    </div>
</div>
<%-- js 더미 파일 사용할 경우, 사용할 코드 --%>

<script type="text/babel" class="code-js">
    const grid = new tui.Grid({
        el: document.getElementById('grid'),
        data: gridData,
        scrollX: false,
        scrollY: false,
        columns: [
            {
                header: 'Name',
                name: 'name'
            },
            {
                header: 'Artist',
                name: 'artist'
            },
            {
                header: 'Type',
                name: 'type'
            },
            {
                header: 'Release',
                name: 'release'
            },
            {
                header: 'Genre',
                name: 'genre'
            }
        ]
    });
</script>

</body>
</html>

