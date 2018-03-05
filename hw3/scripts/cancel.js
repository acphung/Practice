document.querySelector("#cancelBtn").addEventListener('click', (event) => {
    let filterform = document.querySelector('#editTask');
    filterform.dueDate.min = '';
    document.querySelector("#saveBtn").click();
});