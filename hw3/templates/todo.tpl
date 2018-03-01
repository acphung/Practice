<!DOCTYPE html>
<html>
    %# params = [rows, filter]
    %# rows = [(TaskId, TaskName, Note, PostDate, DueDate, UpdateDate, status), ...]
    %# filter = one of ['all', 'done', 'tbd']
    %# sort = one of ['none', 'inc-post-date', 'dec-post-date', 'inc-due-date', 'dec-due-date', 'inc-update-date', 'dec-update-date']

    % rows = params[0]
    % filter = params[1]
    % sort = params[2]

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>ToDo List</title>
        <link href="css/main.css" rel="stylesheet" />
    </head>
    <body>
        <header>
            <h1>cmps183: Homework 3</h1>
            <nav>
                <a href="index">Home</a>
                <a href="list">ToDo List</a>
                <a href="new">New Task Form</a>
            </nav>
        </header>

        <article>
            <h1>To Do List</h1>
            <section>
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
                <form id="filnsort" action="/list" method="GET">
                    <h1>Filter</h1>
                    <input type="radio" id="showAll" name="filter" value="all" {{allchecked}} />
                    <label for="showAll">Show All</label>
                    <input type="radio" id="showTodo" name="filter" value="tbd" {{tbdchecked}} />
                    <label for="showTodo">Show To Do</label>
                    <input type="radio" id="showDone" name="filter" value="done" {{donechecked}} />
                    <label for="showDone">Show Completed</label>
                    <h1>Sort</h1>
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


                <!-- <form action="/list" method="GET"> -->
                    <!-- <input id="sortSubmit" type="submit" value="Sort"> -->
                <!-- </form> -->
                <ul id="todoList">
                    %for row in rows:
                    %statuschecked = "checked" if row[6] else ""
                    <li class="task">
                        <span class=taskid hidden>{{row[0]}}</span>
                        <input type="checkbox" class="status" name=status value="done" {{statuschecked}}/>
                        <b>Task Name:</b> {{row[1]}}
                        <P><b>Task Note:</b> {{row[2]}}</P>
                        <p><b>Post Date:</b> {{row[3]}}</p>
                        <p><b>Due Date:</b> {{row[4]}}</p>
                        <p><b>Update Date:</b> {{row[5]}}</p>
                        <span class="deletebtn">
                            <input class="negBtn" type="button" value="Delete Task"></input>
                        </span>
                        <span class="editbtn">
                            <input class="posBtn" type="button" value="Edit"></input>
                        </span>
                        </li>
                    </li>
                    %end                
                </ul>
            </section>
        </article>

        <aside>
            <h1>Notes or Comments</h1>
            <p> 
                This page really isn't all that hard, it just took a lot of time to understand what is going on. Especially, when I'm not 
                too familiar with python and sql. Some helpful resources were the ones provided in the assignment document and w3school.
            </p>
        </aside>

        <footer>
            <a href="#">About Us</a>
            <a href="#">Contact</a>
            <a href="#">Privacy</a>
            <a href="#">Credits</a>
        </footer>
        <script src="scripts/todo.js"></script>
        <!-- <script src="scripts/dateHelperFcns.js"></script>
        <script src="scripts/todo.js"></script> -->
    </body>
</html>
