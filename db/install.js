// drop all indexes

db.users.dropIndexes()
db.lessons.dropIndexes()

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

// insert lesson data

if (lessons)
{
  for(var i in lessons)
  {
    db.lessons.save(lessons[i])
  }
}

// add indexes

db.lessons.ensureIndex({
  title: "text",
  description: "text",
  tags: "text"
}, { name : "title_description_tags"});
