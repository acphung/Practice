// function addListingtoRecentHistory(idx) {
//     // console.log(idx);
//     // console.log(listings[idx]);
//     // console.log(listings[idx].ref);
//     // console.log(listings[idx].ref.key);
//
//     // Get Reference to User Viewing History
//     // Using a Temporary Path
//     const viewHistoryRef = firebaseApp.database().ref('users/anon/viewHistory');
//
//     // Get the Listing's Key Value in the Database
//     let listingKey = listings[idx].ref.key;
//     // console.log("ListingKey: " + listingKey);
//
//     // Tries to find the Key
//     let keyPromise = keyExists(listingKey);
//
//     // If successful, do nothing
//     // Else, push the listing key to the user's viewing history
//     keyPromise.then((res) => {
//         console.log(res);
//     }).catch((rej) => {
//         console.log(rej + " Adding Key to DB!");
//         viewHistoryRef.push(listingKey);
//     });
// }
//
// function keyExists(listingKey) {
//     return new Promise ((resolve, reject) => {
//         firebaseApp.database().ref('users/anon/viewHistory').once('value', function(snapshot) {
//             snapshot.forEach((key) => {
//                 // console.log('Key: ' + key);
//                 // console.log('Val: ' + key.val());
//                 if (listingKey == key.val()) {
//                     // console.log("Found Key! Stopping Query ...");
//                     resolve("Found Key!");
//                     return true;
//                 }
//             });
//             console.log("End of forEach");
//             reject("Key Doesn't Exist");
//         });
//     });
// }

function addListingtoRecentHistory(idx) {
    // console.log(idx);
    // console.log(listings[idx]);
    // console.log(listings[idx].ref);
    // console.log(listings[idx].ref.key);

    // Get Reference to User Viewing History
    // Using a Temporary Path
    const user = firebaseApp.auth().currentUser;
    const uid = getUID(user);
    const RecentHistoryRef = getUserHistoryRef(uid);
    // console.log(RecentHistoryRef);

    // const RecentHistoryRef = firebaseApp.database().ref('users/' + uid + '/RecentHistory');
    // const RecentHistoryRef = firebaseApp.database().ref('users/anon/RecentHistory');

    // Get the Listing's Key Value in the Database
    let listingKey = listings[idx].ref.key;
    // console.log("ListingKey: " + listingKey);

    // Tries to find the Key
    let keyPromise = keyExists(RecentHistoryRef, listingKey);

    // If successful, do nothing
    // Else, push the listing key to the user's viewing history
    keyPromise.then((res) => {
        console.log(res);
    }).catch((rej) => {
        console.log(rej + " Adding Key to DB!");
        RecentHistoryRef.push(listingKey);
    });

}

function keyExists(ref, listingKey) {
    return new Promise ((resolve, reject) => {
        // firebaseApp.database().ref('users/' + uid + '/RecentHistory').once('value', function(snapshot) {
        // firebaseApp.database().ref('users/anon/RecentHistory').once('value', function(snapshot) {
        ref.once('value', function(snapshot) {
            snapshot.forEach((key) => {
                // console.log('Key: ' + key);
                // console.log('Val: ' + key.val());
                if (listingKey == key.val()) {
                    // console.log("Found Key! Stopping Query ...");
                    resolve("Found Key!");
                    return true;
                }
            });
            // console.log("End of forEach");
            reject("Key Doesn't Exist");
        });
    });
}

const getUID = (user) => {
    if (user) {
        return user.uid;
    } else {
        return false;
    }
};

const getUserHistoryRef = (uid) => {
    if (uid) {
        return firebaseApp.database().ref('users/' + uid + '/RecentHistory');
    } else {
        return firebaseApp.database().ref('users/anon/RecentHistory');
    };
}
