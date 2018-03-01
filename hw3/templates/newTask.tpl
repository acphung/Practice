<!DOCTYPE html>
<html>
    %# currDate: is the current date in string format 'YYYY-mm-dd'
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>ToDo Form</title>
        <link href="css/main.css" rel="stylesheet" />
    </head>
    <body>
        <header>
            <h1>cmps183: Homework 3</h1>
            <nav>
                <a href="index">Home</a>
                <a href="list">ToDo List</a>
                <a href="new" id="addTask">New Task Form</a>
            </nav>
        </header>

        <article>
            <h1>Add Task to the To Do List Form</h1>
            <section>
                <form id="filnsort" hidden>
                    <input name="filter" type="text" value="{{filter}}" hidden>
                    <input name="sort" type="text" value="{{sort}}" hidden>
                    <input id="filnsortBtn" type="submit" value="Filter and Sort" hidden>
                </form>
                <h1>Task Form</h1>
                <form action="/new" method="POST">
                    <input name="filter" value="{{filter}}" disabled hidden>
                    <input name="sort" value="{{sort}}" disabled hidden>
                    <label for="task">Task Name: </label>
                    <input name="task" type="text" placeholder="Enter your Task" required />
                    <br />
                    <label for="date">Due Date: </label>
                    <input name="date" type="date" placeholder="Enter Due Date" min="{{currDate}}" required />
                    <br />
                    <label for="note">Notes / Description: </label>
                    <br />
                    <textarea name="note" placeholder="Enter Notes Here" rows="10" cols="50"></textarea>
                    <br />
                    <input name="btnSubmit" type="submit" value="Add Task"/>
                </form>
            </section>
        </article>

        <aside>
            <h1>Notes or Comments</h1>
            <p> No real changes made except making the form actually send the data
                to the server to be processed. </p>
        </aside>

        <footer>
            <a href="#">About Us</a>
            <a href="#">Contact</a>
            <a href="#">Privacy</a>
            <a href="#">Credits</a>
        </footer>
    </body>
</html>
