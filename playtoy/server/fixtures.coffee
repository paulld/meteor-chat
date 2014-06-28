# // Fixture data
if Posts.find().count() is 0
  now = new Date().getTime();
  
  # // create two users
  paulId = Meteor.users.insert
    profile: { name: 'Paul' }
  paul = Meteor.users.findOne(paulId)
  
  bobId = Meteor.users.insert
    profile: { name: 'Bob' }
  bob = Meteor.users.findOne(bobId)

  playbookId = Posts.insert
    title: 'Introducing the Playbook'
    userId: bob._id
    author: bob.profile.name
    url: 'http://great.com/introducing-playbook/'
    submitted: now - 7 * 3600 * 1000
    flag: false
    commentsCount: 2


  Comments.insert
    postId: playbookId
    userId: paul._id
    author: paul.profile.name
    submitted: now - 5 * 3600 * 1000
    body: 'Interesting project bob, can I get involved?'

  Comments.insert
    postId: playbookId
    userId: bob._id
    author: bob.profile.name
    submitted: now - 3 * 3600 * 1000
    body: 'You sure can Paul!'

  Posts.insert
    title: 'Portfolio'
    userId: paul._id
    author: paul.profile.name
    url: 'http://www.paulld.com'
    submitted: now - 10 * 3600 * 1000
    flag: false
    commentsCount: 0
  
  Posts.insert
    title: 'Linkeding profile'
    userId: paul._id
    author: paul.profile.name
    url: 'http://hk.linkedin.com/in/paullugagnedelpon/'
    submitted: now - 12 * 3600 * 1000
    flag: false
    commentsCount: 0
  
