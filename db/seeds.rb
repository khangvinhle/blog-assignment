paragraph_sample = "
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Felis eget velit aliquet sagittis id consectetur purus ut faucibus. Eget lorem dolor sed viverra ipsum nunc aliquet bibendum. Facilisi morbi tempus iaculis urna id volutpat lacus. Duis ultricies lacus sed turpis tincidunt id aliquet risus. A diam sollicitudin tempor id eu nisl. Et tortor consequat id porta nibh venenatis cras sed felis. Blandit massa enim nec dui nunc mattis enim ut. Tortor at auctor urna nunc id cursus metus. Scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique senectus et. Tellus orci ac auctor augue mauris. Lectus nulla at volutpat diam ut venenatis. Blandit libero volutpat sed cras ornare arcu dui. Cras ornare arcu dui vivamus. Facilisis volutpat est velit egestas dui id. Vestibulum morbi blandit cursus risus at ultrices mi. Odio ut sem nulla pharetra diam sit amet nisl.

Arcu dictum varius duis at consectetur lorem donec massa. Nisi quis eleifend quam adipiscing vitae. Id aliquet risus feugiat in ante metus dictum at. Cras ornare arcu dui vivamus. Tempus iaculis urna id volutpat lacus laoreet non. Metus aliquam eleifend mi in. Mattis rhoncus urna neque viverra justo nec ultrices dui sapien. Est ultricies integer quis auctor. Turpis nunc eget lorem dolor sed viverra ipsum. Montes nascetur ridiculus mus mauris vitae. Vitae auctor eu augue ut lectus arcu bibendum. Libero justo laoreet sit amet cursus sit. Habitasse platea dictumst quisque sagittis purus sit amet volutpat.

Sagittis vitae et leo duis ut diam quam. Pellentesque diam volutpat commodo sed egestas egestas. Scelerisque purus semper eget duis at tellus at urna condimentum. Amet facilisis magna etiam tempor orci. Aenean pharetra magna ac placerat vestibulum lectus mauris. Elit pellentesque habitant morbi tristique senectus et. Sed vulputate odio ut enim blandit. Libero id faucibus nisl tincidunt eget. Urna duis convallis convallis tellus id. Id venenatis a condimentum vitae sapien pellentesque. In nulla posuere sollicitudin aliquam ultrices sagittis orci a scelerisque. Sit amet massa vitae tortor condimentum. At risus viverra adipiscing at in tellus integer feugiat. Pellentesque pulvinar pellentesque habitant morbi tristique senectus et netus et.

Congue quisque egestas diam in arcu cursus euismod quis viverra. Rhoncus aenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Pulvinar elementum integer enim neque. Eget lorem dolor sed viverra ipsum nunc aliquet bibendum enim. Sit amet commodo nulla facilisi nullam vehicula ipsum a. Tincidunt praesent semper feugiat nibh sed pulvinar. Vel elit scelerisque mauris pellentesque. Mi quis hendrerit dolor magna. In hac habitasse platea dictumst quisque. Et ligula ullamcorper malesuada proin.

Etiam non quam lacus suspendisse faucibus interdum. Est sit amet facilisis magna etiam tempor. Etiam erat velit scelerisque in dictum non. Diam vel quam elementum pulvinar etiam non quam. Volutpat diam ut venenatis tellus in. In nisl nisi scelerisque eu ultrices. Magna fringilla urna porttitor rhoncus dolor purus. Faucibus in ornare quam viverra orci sagittis eu volutpat. Arcu dictum varius duis at consectetur. Rhoncus aenean vel elit scelerisque mauris. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae auctor. Ut venenatis tellus in metus vulputate eu. Nunc mattis enim ut tellus. In nibh mauris cursus mattis molestie a. Sit amet consectetur adipiscing elit duis tristique. Libero volutpat sed cras ornare arcu dui. Lorem mollis aliquam ut porttitor leo a diam sollicitudin tempor.
"

comment_sample = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet mauris commodo quis imperdiet massa tincidunt nunc pulvinar. Leo duis ut diam quam nulla porttitor massa id neque. Maecenas volutpat blandit aliquam etiam erat velit. Volutpat blandit aliquam etiam erat velit."

admin = User.create!(email: 'fake@admin.com', password: '111111', password_confirmation: '111111', admin: true)
u2 = User.create!(email: 'fake2@user.com', password: '111111', password_confirmation: '111111')
u3 = User.create!(email: 'fak3@user.com', password: '111111', password_confirmation: '111111')

p1 = Post.create!(title: 'What You Can Learn From Bill Gates About OWEN', body: paragraph_sample, user: u2)
p2 = Post.create!(title: 'The Single Most Important Thing You Need To Know About OWEN', body: paragraph_sample, user: u3)
p3 = Post.create!(title: 'This Study Will Perfect Your OWEN: Read Or Miss Out', body: paragraph_sample, user: admin)
p4 = Post.create!(title: 'Why Most People Will Never Be Great At OWEN', body: paragraph_sample, user: u2)
p5 = Post.create!(title: 'OWEN Is Essential For Your Success. Read This To Find Out Why', body: paragraph_sample, user: admin)
p6 = Post.create!(title: 'How OWEN Made Me A Better Salesperson', body: paragraph_sample, user: u3)
p7 = Post.create!(title: '	Savvy|Smart|Sexy People Do OWEN :)', body: paragraph_sample, user: admin)
p8 = Post.create!(title: 'Little Known Ways to OWEN', body: paragraph_sample, user: u2)

p1.comments.create!(content: comment_sample, user: u3)
p1.comments.create!(content: comment_sample, user: admin)

p2.comments.create!(content: comment_sample, user: u2)
p2.comments.create!(content: comment_sample, user: admin)

p3.comments.create!(content: comment_sample, user: u3)
p3.comments.create!(content: comment_sample, user: u2)

p4.comments.create!(content: comment_sample, user: u3)
p4.comments.create!(content: comment_sample, user: admin)

p5.comments.create!(content: comment_sample, user: u3)
p5.comments.create!(content: comment_sample, user: u2)

p6.comments.create!(content: comment_sample, user: u2)
p6.comments.create!(content: comment_sample, user: admin)

p7.comments.create!(content: comment_sample, user: u3)
p7.comments.create!(content: comment_sample, user: u2)

p8.comments.create!(content: comment_sample, user: u3)
p8.comments.create!(content: comment_sample, user: admin)

