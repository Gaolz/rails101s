# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Hello World!"
puts "这个种子文档会自动建立一个账号，并且创建10个 groups，每个 groups 各20个 posts"

create_account = User.create([email: 'foo@bar.com', password: '12345678', password_confirmation: '12345678', name: "测试账号"])
create_groups =  (1..10).to_a.each do |i|
	create_account[0].groups.create!(title: "Group no.#{i}", description: "这是用种子建立的第#{i}个讨论版")
	(1..20).to_a.each do |j|
		create_account[0].posts.create!(group_id: "#{i}", content: "这是用种子建立的第#{j}个留言")
	end
end