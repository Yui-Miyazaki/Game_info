<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%String name=(String)session.getAttribute("gameName"); %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <link rel="stylesheet" href="CSS/common/error_page.css">
            <link rel="stylesheet" href="CSS/common/common.css">
            <title>追加エラー画面</title>
        </head>

        <body>
            <div class="main">
                <h1 class="errorMessage">Add Error!</h1>
                <form action="stockAdd" method="get">
                    <input type="submit" class="btn" value="戻る">
                </form>
            </div>
        </body>

        </html>