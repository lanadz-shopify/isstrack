$ ->

  getPathFromUrl = (url) ->
    url.split("?")[0]

  # change view
  if $('#change_view').length > 0
    $('#change_view').on 'change', ->

      window.location.search = switch $(this).val()
        when 'New Unassigned'
          '?filter=unassigned'
        when 'Opened'
          '?filter=opened'
        when 'Closed'
          '?filter=closed'
        when 'On Hold'
          '?filter=on_hold'
        else
          '?filter=all'
