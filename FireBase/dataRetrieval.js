const db = firebase.database();

let user;
let email;
let emailFixed;

let user_name;
let user_location;
let user_about;

function setTempInfo() {
    db.ref('/users/' + emailFixed).set({
        name: "someone", 
        email: "a@a.com", 
        location: "somewhere",
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
//    displayProfile();
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
        user_location = user_data.location;
        user_about = user_data.about;
    
        console.log("updating name to " + user_name);
        console.log("updating location to " + user_location);
        console.log("updating about to " + user_about); 
        displayProfile();
    }).catch(function(e) {
        console.log(e);
    });
//    return promise;
}

function displayProfile() {
    console.log("displaying name: " + user_name);
    console.log("displaying location: " + user_location);
    console.log("displaying about: " + user_about);
}

function updateName() {
    let newName = "temp";
    db.ref('/users/' + emailFixed).update({name: newName});
    updateProfile();
//    console.log("INBETWEEN");
//    displayProfile();
}

function updateLocation() {
    let newLocation = "temp";
    db.ref('/users/' + emailFixed).update({location: newLocation});
    updateProfile();
//    updateProfile();
//    console.log("INBETWEEN");
//    displayProfile();
}

function updateAbout() {
    let newAbout = "temp";
    db.ref('/users/' + emailFixed).update({about: newAbout});
    updateProfile();
    console.log("INBETWEEN");
//    displayProfile();
}


let ref = db.ref('/users/' + emailFixed).once('value').then(function(snapshot) {
    let obj = snapshot.val();
    Object.keys(obj).forEach(key => {
        console.log(key + ": " + obj[key]);
    });
});

