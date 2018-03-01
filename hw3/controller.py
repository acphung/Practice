import sqlite3
from bottle import route, run, debug, template, request, static_file, redirect
from datetime import datetime

@route('/')
@route('/home')
@route('/index')
def index():
    return static_file('index.html', root = '')

@route('/list')
def list():
    """ show all tasks with status passing filter """
    conn = sqlite3.connect('todo.db')
    c = conn.cursor()
    query = "SELECT TaskId, TaskName, Note, PostDate, DueDate, UpdateDate, status FROM todo "
    filter = request.GET.filter
    if filter == "tbd":
        query += "WHERE status=0"
    elif filter == "done":
        query += "WHERE status=1"
    else:
        filter = "all"

    sort = request.GET.sort
    if sort == "inc-post-date":
        query += " ORDER BY PostDate"
    elif sort == "dec-post-date":
        query += " ORDER BY PostDate DESC"
    elif sort == "inc-due-date":
        query += " ORDER BY DueDate"
    elif sort == "dec-due-date":
        query += " ORDER BY DueDate DESC"
    elif sort == "inc-update-date":
        query += " ORDER BY UpdateDate"
    elif sort == "dec-update-date":
        query += " ORDER BY UpdateDate DESC"
    else:
        query += ""

    c.execute(query)
    rows = c.fetchall()
    c.close()
    output = template('templates/todo.tpl', params=[rows, filter, sort])
    return output

@route('/new', method='GET')
@route('/new', method='POST')
def newTask():
    if not request.POST.btnSubmit:
        # filter = request.GET.filter
        # if not filter:
        #     filter = "all"
        # sort = request.GET.sort
        # if not sort:
        #     sort = "none"
        return template('templates/newTask', currDate = datetime.today().strftime('%Y-%m-%d'))
    # filter = request.POST.filter.strip()
    # sort = request.POST.sort.strip()
    taskName = request.POST.task.strip()
    dueDate = request.POST.date.strip()
    postDate = datetime.today().strftime('%Y-%m-%d')
    note = request.POST.note.strip()

    conn = sqlite3.connect('todo.db')
    c = conn.cursor()
    c.execute("INSERT INTO todo (TaskName, Note, PostDate, DueDate, UpdateDate, status) VALUES (?,?,?,?,?,?)", (taskName, note, dueDate, postDate, postDate, 0))
    conn.commit()
    conn.close()
#    return template('<script>alert("{{ test }}")</script>', test = note)
    redirect("/list")

    
@route('/edit/<taskid:int>', method='GET')
@route('/edit/<taskid:int>', method='POST')
def edit(taskid):
    """ Edit existing ToDo list item """

    if  request.POST.btnCancel:
        filter = request.POST.filter.strip()
        sort = request.POST.sort.strip()
        redirect("/list?filter=" + filter + "&sort=" + sort)


    if not request.POST.btnSave:

        # initial request to edit list item
        # retrieve current task data from DB
        currDate = datetime.today().strftime('%Y-%m-%d')
        conn = sqlite3.connect('todo.db')
        c = conn.cursor()
        c.execute("SELECT TaskName, Note, PostDate, DueDate, UpdateDate, status FROM todo WHERE TaskId LIKE ?", (str(taskid)))
        cur_data = c.fetchone()
        if cur_data:
            return (template('templates/taskedit.tpl', taskid = taskid, oldTaskName = cur_data[0], oldNote = cur_data[1], 
                    oldPostDate = cur_data[2], oldDueDate = cur_data[3], oldUpdateDate = cur_data[4], oldStatus = cur_data[5], 
                    filter = request.params.filter, sort = request.params.sort, currDate = currDate)
            )
        else:
             return '<script>alert("No such item")</script>'
    
    # attempt to post new task data after edit
    new_task = request.POST.task.strip()
    new_note = request.POST.note.strip()
    new_dueDate = request.POST.dueDate.strip()
    new_updateDate = datetime.today().strftime('%Y-%m-%d')
    new_status = request.POST.status.strip()
    filter = request.POST.filter.strip()
    sort = request.POST.sort.strip()
    
    # convert status to DB representation
    new_status = (1 if new_status == 'Done' else 0)

    # update DB   
    conn = sqlite3.connect('todo.db')
    c = conn.cursor()
    c.execute(
        "UPDATE todo SET TaskName = ?, Note = ?, DueDate = ?, UpdateDate = ?, status = ? WHERE TaskId LIKE ?", (new_task, new_note, new_dueDate, new_updateDate, new_status, taskid))
    conn.commit()
    c.close

    redirect("/list?filter=" + filter + "&sort=" + sort)

    # return template('Task "{{ taskid }}" is being edited.', taskid = taskid)

@route('/status/<taskid:int>', method='POST')
def updateStatus(taskid):
    filter = request.POST.filter.strip()
    sort = request.POST.sort.strip()
    conn = sqlite3.connect('todo.db')
    c = conn.cursor()
    c.execute("SELECT status FROM todo WHERE TaskId LIKE ?", (str(taskid)))
    curr_status = c.fetchone()[0]
    if curr_status == 0:
        new_status = 1
    else:
        new_status = 0
    # return template('The Tasks OLD status is "{{curr_status}}" and NEW status is "{{new_status}}"', curr_status = curr_status, new_status = new_status)
    c.execute("UPDATE todo SET status = ? WHERE TaskId LIKE ?", (new_status, taskid))
    conn.commit()
    c.close()
    redirect("/list?filter=" + filter + "&sort=" + sort)    

@route('/delete/<taskid:int>', method='POST')
def delete(taskid):
    conn = sqlite3.connect('todo.db')
    c = conn.cursor()
    query = "DELETE FROM todo WHERE TaskId = " + str(taskid)
    c.execute(query)
    conn.commit()
    conn.close()
    filter = request.POST.filter.strip()
    sort = request.POST.sort.strip()
    redirect("/list?filter=" + filter + "&sort=" + sort)

    # return template('Task "{{ taskid }}" is deleted.', taskid = taskid)

# Routes to handle serving static files
@route('/css/<filename:re:.*\.css>')
def getCSS(filename):
    if filename:
        return static_file(filename, root = 'css')

@route('/images/<filename:re:.*\.jpg>')
def getImage(filename):
    if filename:
        return static_file(filename, root = 'images')

@route('/scripts/<filename:re:.*\.js>')
def getScript(filename):
    if filename:
        return static_file(filename, root = 'scripts')

@route('/templates/<filename:re:.*\.tpl>')
def getTemplate(filename):
    if filename:
        return static_file(filename, root = 'templates')


@route('/<filename:re:.*\.html>')
def getStatic(filename):
    if filename:
        return static_file(filename, root = '')


# during development (not in production)
debug(True)

# start bottle webserve on localhost:8080
# reload script after change (w/o restarting server)
run(reloader=True)