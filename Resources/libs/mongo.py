from pymongo import MongoClient

client = MongoClient('mongodb+srv://LeonardoArantes:<password>@cluster0.avtr6sg.mongodb.net/')

db = client['markdb']

def remove_user_by_email(user_email):
       users = db['users']
       users.delete_many({'email': user_email}) 