class UserNotifier < ActionMailer::Base
  default from: 'dglunz@lukes-circle.herokuapp.com'

  def send_signup_email(_user)
    @user = 'test'
    mail(to: 'dannyglunz@gmail.com',
         subject: 'Thanks for signing up for our amazing app')
  end
end
