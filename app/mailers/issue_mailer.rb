class IssueMailer < ActionMailer::Base
  default from: "notification@isstracker.com"

  def status_changed(issue)
    @issue = issue
    if @issue.assignee.present?
      mail(to: [@issue.customer_email, @issue.assignee.email], subject: 'IssTracker: Status Changed')
    else
      mail(to: [@issue.customer_email, User.pluck(:email)], subject: 'IssTracker: Status Changed')
    end
  end

  def new_issue_arrived(issue)
    @issue = issue
    mail(to: User.pluck(:email), subject: 'IssTracker: New Issue')
  end

end
