namespace :shop_web do
  desc "Import user_infos to users for login."
  task :import_userlogin do
    #import_userlogin
    do_test1
  end
  
  def do_test1
    puts 'ok! test1' + User.count.to_s
  end
  def import_userlogin
    UserInfo.all.each do |ui|
      if ui.emails.length > 0
        u = User.new(:email => ui.email_address)
        u.password = ui.pin
        u.password_confirmation = ui.pin
        u.save!
        puts 'add user loing:' << ui.email_address
      end
    end
  end

end