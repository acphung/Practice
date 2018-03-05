document.querySelector('#todoList').addEventListener('click', (event) => {
    var action, taskid;
    if (event.target.closest('LI.task')) {
        taskid = event.target.closest('LI.task').children[0].innerHTML;
    };
    if (event.target.closest('SPAN.deletebtn')) {
        action = "/delete/" + taskid;
    };
    if (event.target.closest('SPAN.editbtn')) {
        action = "/edit/" + taskid;
    };
    if (event.target.closest('INPUT.status')) {
        action = "/status/" + taskid;
    };
    if (action) {
        var filterform = document.querySelector('#filnsort');
        filterform.action = action;
        filterform.method = "post"
        document.querySelector('#filnsortBtn').click();
    };
});
