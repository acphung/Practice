document.querySelector('#navIndex').addEventListener('click', (event) => {
    let filterform = document.querySelector('#filnsort');
    filterform.action = '/index';
    filterform.method = "post";
    document.querySelector('#filnsortBtn').click();
});

document.querySelector('#navList').addEventListener('click', (event) => {
    let filterform = document.querySelector('#filnsort');
    filterform.action = '/list';
    filterform.method = "post";
    document.querySelector('#filnsortBtn').click();
});

document.querySelector('#navNewTask').addEventListener('click', (event) => {
    let filterform = document.querySelector('#filnsort');
    filterform.action = '/new';
    filterform.method = "post";
    document.querySelector('#filnsortBtn').click();
});