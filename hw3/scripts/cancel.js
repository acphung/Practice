document.querySelector("#cancelBtnVis").addEventListener('click', (event) => {
    let filterform = document.querySelector('#editTask');
    filterform.dueDate.min = '';
    document.querySelector("#cancelBtn").click();
});
