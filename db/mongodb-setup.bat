mongod --remove

mongod --config "c:\Program Files\mongodb\mongod.cfg" --setParameter textSearchEnabled=true --install
net start MongoDB

mongo localhost/admin --eval "printjson(db.runCommand({logRotate:1}))"

:: import data

mongo ./install.js --shell
