# alert('ownership')
$("#assignee_<%= @issue.id %>").text('<%= current_user.email %>')
