# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

dq = User.create(name: "Dan Quan", email: "djquan@gmail.com", password: "123456")
js = User.create(name: "John Smith", email: "johnsmith@example.com", password: "123456")
jd = User.create(name: "Jane Doe", email: "janedoe@example.com", password: "123456")
bm = User.create(name: "Boss Man", email: "boss_man@example.com", password: "123456")
bw = User.create(name: "Boss Woman", email: "boss_woman@example.com", password: "123456")
wb = User.create(name: "WorkerB", email: "workerB@example.com", password: "123456")

aa = Team.create(name: "App Academy")
aa.users << [dq, js, jd]
