const db = firebase.database();

let user = firebase.auth().currentUser;
let email = user.email;
let emailFixed = email.replace('.', '(').toLowerCase();

let ref = db.ref('/users/' + emailFixed).once('value').then(function(snapshot) {
    let obj = snapshot.val();
    Object.keys(obj).forEach(key => {
        console.log(key + ": " + obj[key]);
    });
});
