<!DOCTYPE html>
<html>
    %# template for editing a task
    %# Params:
    %#     taskid: id of task to be editted
    %#     oldTaskName: the current name of the task
    %#     oldNote: the current note description of the task
    %#     oldPostDate: the postDate
    %#     oldDueDate: the current due Date date of the task
    %#     oldUpdateDate: the current update date of the task
    %#     oldStatus: the current status of the task
    %#     filter
    %#     sort

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>ToDo Form</title>
        <link href="/css/main.css" rel="stylesheet" />
       %# <script>alert("{{sort}}")</script>
    </head>
    <body>
        <header>
            <h1>cmps183: Homework 3</h1>
            <nav>
                <a href="../index">Home</a>
                <a href="../list">ToDo List</a>
                <a href="../new">New Task Form</a>
            </nav>
        </header>

        <article>
            <h1>Editting Task {{taskid}}</h1>
            <section>
                %todoselected = "selected" if oldStatus == 0 else ""
                %doneselected = "selected" if oldStatus == 1 else ""
                <h1>Task Edit Form</h1>
                <form action=/edit/{{taskid}} method="POST">
                    <input name="filter" type="text" value="{{filter}}" hidden>
                    <input name="sort" type="text" value="{{sort}}" hidden>
                    <select name="status">
                        <option {{todoselected}}>Todo</option>
                        <option {{doneselected}}>Done</option>
                    </select>
                    <br><br>            
                    <label for="task">Task Name: </label>
                    <input name="task" type="text" placeholder="Enter your Task" value="{{oldTaskName}}" required />
                    <br />
                    <label for="postDate">Post Date: </label>
                    <input name="postDate" type="date" value="{{oldPostDate}}" disabled />
                    <br />
                    <label for="dueDate">Due Date: </label>
                    <input name="dueDate" type="date" placeholder="Enter Due Date" value="{{oldDueDate}}" min="{{currDate}}" required />
                    <br />
                    <label for="updateDate">Modified Date: </label>
                    <input name="updateDate" type="date" value="{{oldUpdateDate}}" disabled />
                    <br />
                    <label for="note">Notes / Description: </label>
                    <br />
                    <textarea name="note" placeholder="Enter Notes Here" rows="10" cols="50">{{oldNote}}</textarea>
                    <br />
                    <input name="btnCancel" class="negBtn" type="submit" value="Cancel" />
                    <input name="btnSave" class="posBtn" type="submit" value="Save Changes" />
                </form>
            </section>
        </article>

        <aside>
            <h1>Notes or Comments</h1>
            <p> A simple form that updates the task. This was basically copy and paste of my hw2 code and modifying it to 
                work with a server.
            </p>
        </aside>

        <footer>
            <a href="#">About Us</a>
            <a href="#">Contact</a>
            <a href="#">Privacy</a>
            <a href="#">Credits</a>
        </footer>
    </body>
</html>

