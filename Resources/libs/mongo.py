#!/usr/local/bin/python3.9
# -*- coding: utf-8 -*-
from pymongo import MongoClient

client = MongoClient('mongodb+srv://LeonardoArantes:LeonardoArantes@cluster0.avtr6sg.mongodb.net/?retryWrites=true&w=majority')

db = client['markdb']

def remove_user_by_email(user_email):
    users = db['users']
    users.delete_many({'email': user_email})
    print ('remove email '+user_email)