class PagesController < ApplicationController

  def about
  end

  def policies
  end
  def graded 
   @submissions = Submission.all
  end 


  def gradebook
    if user_signed_in?
  	   @submissions = current_user.submissions.order(created_at: :desc)
        @assignments = Assignment.all
     
  	else 
  	redirect_to lessons_url, alert: "You don't have permission to do that! Nice try though :)"
  end

  end
end