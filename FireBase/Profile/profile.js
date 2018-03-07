const elemEditBtn = document.getElementById('editBtn');

window.addEventListener('load', displayUserProfile);
elemEditBtn.addEventListener('click', editActive);

function displayUserProfile() {
    firebase.database().ref('/users/anon').once('value').then(function (snapshot) {
        let data = snapshot.val();
        let name = data.name;
        let phone = data.phone;
        let email = data.email;
        let bio = data.bio;
        let extra = data.extra || "None";

        document.getElementById('name').value = name;
        document.getElementById('phone').value = phone;
        document.getElementById('email').value = email;
        document.getElementById('bio').value = bio;
        document.getElementById('extra').value = extra;
    });
};

function editActive(event) {
    // alert(event.target);
    let editBtn = event.target;
    let inputs = document.getElementsByName('profile');
    inputs.forEach((input) => {
        input.removeAttribute('disabled');
    });
    elemEditBtn.removeEventListener('click', editActive);
    elemEditBtn.value = "Save Changes";
    elemEditBtn.addEventListener('click', saveEdit);
};

function saveEdit(event) {
    // alert('save');
    let editBtn = event.target;
    let inputs = document.getElementsByName('profile');
    inputs.forEach((input) => {
        input.setAttribute('disabled', '');
    });

    let newExtra = document.getElementById('extra').value;
    newExtra = (newExtra == "None" || newExtra == '') ? null : newExtra;
    let editData = {
        name: document.getElementById('name').value,
        phone: document.getElementById('phone').value,
        email: document.getElementById('email').value,
        bio: document.getElementById('bio').value,
        extra: newExtra
    }
    console.log(editData);
    const userRef = firebase.database().ref('/users/anon');
    userRef.set(editData);
    elemEditBtn.removeEventListener('click', saveEdit);
    elemEditBtn.value = "Edit";
    elemEditBtn.addEventListener('click', editActive);
};
