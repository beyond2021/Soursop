//
//  Constants.swift
//  Nox
//
//  Created by KEEVIN MITCHELL on 9/15/22.
// MARK: THIS FILE IS FOR THINGS THAT WILL NOT CHANGE

import Firebase

let COLLECTIONS_USERS = Firestore.firestore().collection("users")
let COLLECTIONS_FOLLOWERS = Firestore.firestore().collection("followers")
let COLLECTIONS_FOLLOWING = Firestore.firestore().collection("following")
let COLLECTIONS_POSTS = Firestore.firestore().collection("posts")
let COLLECTIONS_NOTIFICATIONS = Firestore.firestore().collection("notifications")
