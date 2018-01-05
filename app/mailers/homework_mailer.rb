class HomeworkMailer < ApplicationMailer
	 default from: "chris.lam@unt.edu"
  
  	def sample_email(submission_user)
  		@submission_user = submission_user
  	
    	mail(to: submission_user.email, subject: 'An assignment has been graded!')
  end
end

