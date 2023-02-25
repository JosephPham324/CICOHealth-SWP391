<%-- 
    Document   : addAnswer
    Created on : Feb 23, 2023, 3:51:04 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <h4>Add new Answer</h4>
             
            <form class="form-horizontal" action="/CICOHealth/faq/answers" method="post">
                <div class="form-group">
                    <label class="control-label col-sm-2">Please select an option:</label>
                    <div class="col-sm-10">
                        <select id="topic" name="questionTopic">
                            <option value="optionA">Option A</option>
                            <option value="optionB">Option B</option>
                            <option value="optionC">Option C</option>
                            <option value="optionD">Option D</option>
                            <option value="optionE">Option E</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" >Question Content</label>
                    <div class="col-sm-10">          
                        <input type="text" class="form-control"  name="questionContent">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" >Answer Content</label>
                    <div class="col-sm-10">          
                        <input type="text" class="form-control"  name="answerContent">
                    </div>
                </div>
                <div class="form-group">        
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">Submit</button>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
