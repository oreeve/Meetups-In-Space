# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')

pamalamadingdong = User.create(provider: "provider1", uid: "2", username: "Pamalamadingdong", email: "pama@lama.com", avatar_url: "https://secure.static.tumblr.com/a0d41ff2b45d63e104a338cd028ed82f/uid9iux/TvNnk0w5l/tumblr_static_tumblr_static__640.jpg")
jarlax = User.create(provider: "github", uid: "1", username: "jarlax1", email: "jarlax1@launchacademy.com", avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400")

soccer = Meetup.create(name: "Soccer Game", description: "kick the round thing", location: "iah's house", creator_id: pamalamadingdong.id)
launchparty = Meetup.create(name: "Launch Party", description: "it is a party", location: "Mission Control", creator_id: jarlax.id)

Membership.create(user: pamalamadingdong, meetup: soccer)
Membership.create(user: pamalamadingdong, meetup: launchparty)
Membership.create(user: jarlax, meetup: launchparty)
