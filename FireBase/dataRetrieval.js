const db = firebase.database();

let user;
let email;
let emailFixed;

let user_data;
let user_name;
let user_city;
let user_about;

function setTempInfo() {
    db.ref('/users/' + emailFixed).set({
        name: "someone", 
        email: "a@a.com", 
        city: "somewhere",
        username: "Hakai",
        type: "finder",
        about: "something ..."
    });
    updateProfile();
}    


// Loads Initial Profile 
window.addEventListener('load', function() {
    getcurrentUser();
    updateProfile();
    displayProfile();
} false);

function getcurrentUser() {
    user = firebase.auth().currentUser;
    email = user.email;
    emailFixed = email.replace('.', '(').toLowerCase();
}

function updateProfile() {
    let promise = db.ref('/users/' + emailFixed).once('value').then(function(snapshot) {
        user_data = snapshot.val();
        user_name = user_data.name;
        user_city = user_data.city;
        user_about = user_data.about;
    
        console.log(user_name);
        console.log(user_city);
        console.log(user_about); 
    }).catch(function(e) {
        console.log(e);
    });
}

function displayProfile() {
    console.log("displaying " + user_name);
    console.log("displaying " + user_city);
    console.log("displaying " + user_about);
}

function updateName() {
    let newName = "temp";
    db.ref('/users/' + emailFixed + '/name').set(newName);
    updateProfile();
    displayProfile();
}

function updateCity() {
    let newCity = "temp";
    db.ref('/users/' + emailFixed + '/city').set(newCity);
    updateProfile();
    displayProfile();
}

function updateAbout() {
    let newAbout = "temp";
    db.ref('/users/' + emailFixed + '/about').set(newAbout);
    updateProfile();
    displayProfile();
}


let ref = db.ref('/users/' + emailFixed).once('value').then(function(snapshot) {
    let obj = snapshot.val();
    Object.keys(obj).forEach(key => {
        console.log(key + ": " + obj[key]);
    });
});

