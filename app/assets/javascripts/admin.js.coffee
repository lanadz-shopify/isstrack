$ ->

  getPathFromUrl = (url) ->
    url.split("?")[0]

  # change view
  if $('#change_view').length > 0
    $('#change_view').on 'change', ->

      window.location.search = "?filter="+$(this).val()
