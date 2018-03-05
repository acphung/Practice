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
                <a id="navIndex">Home</a>
                <a id="navList">ToDo List</a>
                <a id="navNewTask">New Task Form</a>
            </nav>
            %allchecked  = "checked" if filter=="all" else ""
            %donechecked = "checked" if filter=="done" else ""
            %tbdchecked  = "checked" if filter=="tbd" else ""
            %noneselected = "selected" if sort=="none" else ""
            %ipdselected = "selected" if sort=="inc-post-date" else ""
            %dpdselected = "selected" if sort=="dec-post-date" else ""
            %iddselected = "selected" if sort=="inc-due-date" else ""
            %dddselected = "selected" if sort=="dec-due-date" else ""
            %iudselected = "selected" if sort=="inc-update-date" else ""
            %dudselected = "selected" if sort=="dec-update-date" else ""
            <form id="filnsort" action="" method="POST" hidden>
                <input type="radio" id="showAll" name="filter" value="all" {{allchecked}} />
                <input type="radio" id="showTodo" name="filter" value="tbd" {{tbdchecked}} />
                <input type="radio" id="showDone" name="filter" value="done" {{donechecked}} />
                <select name="sort" size="1">
                    <option value="none" {{noneselected}} >Default: None</option>
                    <option value="inc-post-date" {{ipdselected}} >Sort by Increasing Post Date</option>
                    <option value="dec-post-date" {{dpdselected}} >Sort by Decreasing Post Date</option>
                    <option value="inc-due-date" {{iddselected}} >Sort by Increasing Due Date</option>
                    <option value="dec-due-date" {{dddselected}} >Sort by Decreasing Due Date</option>
                    <option value="inc-update-date" {{iudselected}} >Sort by Increasing Modified Date</option>
                    <option value="dec-update-date" {{dudselected}} >Sort by Decreasing Modified Date</option>
                </select>
                <input id="filnsortBtn" type="submit" value="Filter and Sort">
            </form>
        </header>

        <article>
            <h1>Add Task to the To Do List Form</h1>
            <section>
                <h1>Task Form</h1>
                <form action="/new" method="POST">
                    <input type="radio" id="showAll" name="filter" value="all" {{allchecked}} hidden />
                    <input type="radio" id="showTodo" name="filter" value="tbd" {{tbdchecked}} hidden />
                    <input type="radio" id="showDone" name="filter" value="done" {{donechecked}} hidden />
                    <select name="sort" size="1" hidden>
                        <option value="none" {{noneselected}} >Default: None</option>
                        <option value="inc-post-date" {{ipdselected}} >Sort by Increasing Post Date</option>
                        <option value="dec-post-date" {{dpdselected}} >Sort by Decreasing Post Date</option>
                        <option value="inc-due-date" {{iddselected}} >Sort by Increasing Due Date</option>
                        <option value="dec-due-date" {{dddselected}} >Sort by Decreasing Due Date</option>
                        <option value="inc-update-date" {{iudselected}} >Sort by Increasing Modified Date</option>
                        <option value="dec-update-date" {{dudselected}} >Sort by Decreasing Modified Date</option>
                    </select>    
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
        <script src="scripts/nav.js"></script>
    </body>
</html>
