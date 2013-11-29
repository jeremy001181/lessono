// drop collections

db.users.drop()
db.tags.drop()

// load all test data into in-memory object from test-data directory

load("test-data");

// insert user data

if (users)
{
  for(var i in users)
  {
    db.users.save(users[i])
  }
}

// insert session data

if (sessions)
{
  for(var i in sessions)
  {
    db.sessions.save(sessions[i])
  }
}

// insert session data

if (tags)
{
  for(var i in tags)
  {
    db.tags.save(tags[i])
  }
}


// add indexes

db.users.ensureIndex({
  "first_name": "text",
  "last_name": "text",
  "lessons.title": "text",
  "lessons.description": "text",
  "lessons.tags": "text"
}, { name : "name_title_description_tags"});

db.users.ensureIndex(
  {
    "lessons._id": 1
  }, 
  { 
    unique : true
  }
);

db.tags.ensureIndex(
  {
    name: 1
  }, 
  { 
    unique : true
  }
);
