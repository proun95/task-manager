admin = Admin.find_or_create_by(first_name: 'admin', last_name: 'admin', email: 'admin@local.host')
admin.password = 'admin'
admin.save

60.times do |i|
  u = [Manager, Developer].sample.new
  u.email = "email#{i}@mail.gen"
  u.first_name = "FN#{i}"
  u.last_name = "LN#{i}"
  u.password = "#{i}"
  u.save
end

5.times do |i|
  t = Task.new
  t.name = "Name#{i}"
  t.description = "Description#{i}"
  t.author = Manager.first
  t.save
end
